/* Shared frontend UI effects: Lenis smooth scrolling & progressive IntersectionObserver reveal. */
(() => {
  'use strict';
  if (window.SiteUI) return;

  document.documentElement.classList.add('ui-ready');
  const motion = window.matchMedia('(prefers-reduced-motion: reduce)');
  const easeOutCubic = t => 1 - Math.pow(1 - t, 3);

  /* ============================================================
     MODULE 1: LENIS SMOOTH SCROLL & NAVIGATION
     ============================================================ */
  let lenis = null;
  let rafId = 0;
  let manualLocked = false;

  const PREVENT_SELECTOR = [
    'textarea',
    '[role="dialog"]',
    'dialog',
    '.mobile-nav',
    '.mobile-nav-body',
    '.dropdown',
    '.user-dropdown-menu',
    '.dm-panel',
    '.doctor-modal-dialog',
    '.custom-modal-dialog',
    '#milestoneModal',
    '#booking-modal',
    '#modalCreateRequest .modal-box',
    '#modalViewDetail .modal-box'
  ].join(', ');

  function markPreventNodes(root = document) {
    if (!root || typeof root.querySelectorAll !== 'function') return;
    const nodes = [
      ...(root.matches?.(PREVENT_SELECTOR) ? [root] : []),
      ...root.querySelectorAll(PREVENT_SELECTOR)
    ];
    nodes.forEach(node => {
      if (!node.hasAttribute('data-lenis-prevent') && !node.hasAttribute('data-lenis-prevent-wheel') && !node.hasAttribute('data-lenis-prevent-touch')) {
        node.setAttribute('data-lenis-prevent', '');
      }
    });
  }

  function isScrollLocked() {
    if (manualLocked) return true;
    const body = document.body;
    if (!body) return false;
    if (body.style.overflow === 'hidden' || document.documentElement.style.overflow === 'hidden') return true;
    return Boolean(
      document.querySelector(
        '.mobile-nav.open, #modalLogin.show, #doctor-modal.open, #doctorDetailModal.active, #milestoneModal.flex, #booking-modal:not(.hidden), #modalCreateRequest.show, #modalViewDetail.show'
      )
    );
  }

  function syncScrollLock() {
    if (!lenis) return;
    if (isScrollLocked()) {
      lenis.stop();
    } else {
      lenis.start();
    }
  }

  function raf(time) {
    if (!lenis) {
      rafId = 0;
      return;
    }
    lenis.raf(time);
    rafId = requestAnimationFrame(raf);
  }

  function destroyLenis() {
    if (rafId) {
      cancelAnimationFrame(rafId);
      rafId = 0;
    }
    if (lenis) {
      try { lenis.destroy(); } catch (_) {}
      lenis = null;
    }
    document.documentElement.classList.remove('lenis', 'lenis-smooth', 'lenis-stopped', 'lenis-scrolling');
  }

  function initLenis() {
    if (motion.matches || typeof window.Lenis !== 'function') {
      destroyLenis();
      return;
    }
    if (lenis) return;
    try {
      markPreventNodes(document);
      lenis = new window.Lenis({
        duration: 1.15,
        easing: easeOutCubic,
        smoothWheel: true,
        syncTouch: false,
        autoRaf: false
      });
      syncScrollLock();
      if (!rafId) {
        rafId = requestAnimationFrame(raf);
      }
    } catch (_) {
      destroyLenis();
    }
  }

  const header = document.getElementById('site-header');
  function getAnchorOffset() {
    if (header) {
      const h = header.getBoundingClientRect().height;
      if (h > 0) return Math.round(h + 16);
    }
    const cssOffset = parseFloat(getComputedStyle(document.documentElement).scrollPaddingTop || '0');
    return Number.isFinite(cssOffset) && cssOffset > 0 ? cssOffset : 88;
  }

  function updateOffset() {
    if (!header) return;
    const h = header.getBoundingClientRect().height;
    if (h > 0) {
      document.documentElement.style.setProperty('--ui-anchor-offset', Math.round(h + 16) + 'px');
    }
  }

  updateOffset();
  if (header && 'ResizeObserver' in window) {
    new ResizeObserver(updateOffset).observe(header);
  } else {
    window.addEventListener('resize', updateOffset, { passive: true });
  }

  /* ============================================================
     MODULE 2: PROGRESSIVE INTERSECTION OBSERVER REVEAL
     ============================================================ */
  const REVEAL_SELECTOR = [
    '.reveal',
    '[data-reveal]',
    '[data-animate]',
    'main .news-card',
    'main .post-card',
    'main .service-card',
    'main .service-box-card',
    'main .doctor-card',
    'main .cp-card',
    'main .act-card',
    'main .equip-card',
    'main .pkg-card',
    'main .home-news-item',
    'main .faq-item'
  ].join(', ');

  const STAGGER_CONTAINER_SELECTOR = [
    '[data-stagger-group]',
    '.grid',
    '.news-grid',
    '.posts-grid',
    '.doctors-page-grid',
    '.services-grid',
    '.stats-grid',
    '#equipment-track',
    '.home-news-grid'
  ].join(', ');

  const EXCLUDE_ANCESTOR_SELECTOR = [
    '.hero',
    '.slider-wrapper',
    '.site-header',
    '.breadcrumb-bar',
    '.announcements-bar',
    '[role="dialog"]',
    'dialog',
    '#doctor-modal',
    '#doctorDetailModal',
    '#booking-modal',
    '#modalLogin',
    '#milestoneModal'
  ].join(', ');

  const registered = new WeakSet();
  const pending = new Set();
  const timers = new WeakMap();

  function clearNodeTimer(node) {
    const id = timers.get(node);
    if (id) {
      clearTimeout(id);
      timers.delete(node);
    }
  }

  function show(node, animate = false) {
    if (!node || node.nodeType !== 1) return;
    clearNodeTimer(node);
    if (!animate || motion.matches) {
      node.style.removeProperty('--ui-stagger-delay');
    } else if (node.style.getPropertyValue('--ui-stagger-delay')) {
      const cleanupDelay = setTimeout(() => {
        node.style.removeProperty('--ui-stagger-delay');
      }, 950);
      timers.set(node, cleanupDelay);
    }
    node.classList.remove('is-pending');
    node.classList.add('is-visible', 'in-view');
    pending.delete(node);
    observer?.unobserve(node);
  }

  function waitForNodeMedia(node, done) {
    let finished = false;
    const finish = () => {
      if (finished) return;
      finished = true;
      done();
    };

    const imgs = node.tagName === 'IMG' ? [node] : Array.from(node.querySelectorAll('img'));
    imgs.forEach(img => {
      if (img.loading === 'lazy') img.loading = 'eager';
    });

    const primaryImg = imgs.find(img => {
      const src = img.getAttribute('src');
      return src && src.trim() !== '';
    });

    if (!primaryImg) {
      finish();
      return;
    }

    const decodeAndFinish = () => {
      if (typeof primaryImg.decode === 'function') {
        const timer = setTimeout(finish, 180);
        primaryImg.decode().then(() => {
          clearTimeout(timer);
          finish();
        }).catch(() => {
          clearTimeout(timer);
          finish();
        });
      } else {
        finish();
      }
    };

    if (primaryImg.complete) {
      decodeAndFinish();
      return;
    }

    const fallbackTimer = setTimeout(finish, 850);
    timers.set(node, fallbackTimer);
    const onSettled = () => {
      clearTimeout(fallbackTimer);
      decodeAndFinish();
    };
    primaryImg.addEventListener('load', onSettled, { once: true });
    primaryImg.addEventListener('error', onSettled, { once: true });
  }

  const observer = 'IntersectionObserver' in window
    ? new IntersectionObserver(entries => {
        entries.forEach(entry => {
          if (!entry.isIntersecting) return;
          const node = entry.target;
          observer.unobserve(node);
          if (motion.matches) {
            show(node, false);
            return;
          }
          waitForNodeMedia(node, () => show(node, true));
        });
      }, { threshold: 0.08, rootMargin: '0px 0px -24px 0px' })
    : null;

  function assignStaggerDelay(node) {
    const explicitDelay = parseInt(node.getAttribute('data-animate-delay') || '', 10);
    if (Number.isFinite(explicitDelay) && explicitDelay > 0) {
      node.style.setProperty('--ui-stagger-delay', Math.min(explicitDelay, 300) + 'ms');
      return;
    }
    const group = node.parentElement?.closest(STAGGER_CONTAINER_SELECTOR);
    if (!group) return;
    const children = Array.from(group.children).filter(child =>
      child === node || child.contains(node) || child.matches?.(REVEAL_SELECTOR)
    );
    const item = children.find(child => child === node || child.contains(node));
    const idx = item ? children.indexOf(item) : -1;
    if (idx > 0) {
      const stepMs = 75;
      const delayMs = Math.min((idx % 5) * stepMs, 300);
      if (delayMs > 0) {
        node.style.setProperty('--ui-stagger-delay', delayMs + 'ms');
      }
    }
  }

  function register(root = document) {
    if (!root || (root !== document && root.nodeType !== 1)) return;
    markPreventNodes(root);

    const nodes = [
      ...(root.nodeType === 1 && root.matches?.(REVEAL_SELECTOR) ? [root] : []),
      ...(typeof root.querySelectorAll === 'function' ? root.querySelectorAll(REVEAL_SELECTOR) : [])
    ];

    const viewportFold = (window.innerHeight || document.documentElement.clientHeight || 800) * 0.92;

    nodes.forEach(node => {
      if (registered.has(node)) return;
      registered.add(node);

      if (node.closest(EXCLUDE_ANCESTOR_SELECTOR) || node.parentElement?.closest('.ui-reveal, .reveal')) {
        show(node, false);
        return;
      }

      node.classList.add('reveal', 'ui-reveal');

      if (!observer || motion.matches) {
        show(node, false);
        return;
      }

      const rect = node.getBoundingClientRect();
      if (!rect.width || !rect.height || rect.top < viewportFold) {
        show(node, false);
        return;
      }

      assignStaggerDelay(node);
      try {
        node.classList.add('is-pending');
        pending.add(node);
        observer.observe(node);
        const safetyTimer = setTimeout(() => {
          if (pending.has(node)) show(node, false);
        }, 6500);
        timers.set(node, safetyTimer);
      } catch (_) {
        show(node, false);
      }
    });
  }

  function resolveTarget(target) {
    if (typeof target === 'number') return target;
    if (typeof target === 'string') {
      if (target === '#top' || target === '#') return 0;
      const id = target.startsWith('#') ? target.slice(1) : target;
      try {
        return document.getElementById(decodeURIComponent(id)) || document.querySelector(target);
      } catch (_) {
        return null;
      }
    }
    return target instanceof Element ? target : null;
  }

  function revealAncestorsAndSelf(element) {
    if (!(element instanceof Element)) return;
    const pendingAncestor = element.closest('.is-pending');
    if (pendingAncestor) show(pendingAncestor, false);
    element.querySelectorAll('.is-pending').forEach(child => show(child, false));
  }

  function focusTargetElement(element) {
    if (!(element instanceof Element)) return;
    const temporary = !element.hasAttribute('tabindex');
    if (temporary) element.setAttribute('tabindex', '-1');
    element.focus({ preventScroll: true });
    if (temporary) {
      element.addEventListener('blur', () => element.removeAttribute('tabindex'), { once: true });
    }
  }

  function scrollTo(target, options = {}) {
    const resolved = resolveTarget(target);
    if (resolved === null || resolved === undefined) return;

    if (resolved instanceof Element) {
      revealAncestorsAndSelf(resolved);
    }

    const offset = typeof resolved === 'number'
      ? 0
      : (typeof options.offset === 'number' ? options.offset : -getAnchorOffset());

    const immediate = Boolean(options.immediate || motion.matches);

    if (lenis && !immediate) {
      lenis.scrollTo(resolved, {
        offset,
        duration: options.duration ?? 1.15,
        easing: options.easing || easeOutCubic,
        onComplete: () => options.onComplete?.()
      });
      return;
    }

    const top = typeof resolved === 'number'
      ? resolved
      : Math.max(0, resolved.getBoundingClientRect().top + window.scrollY + offset);

    window.scrollTo({
      top,
      behavior: immediate ? 'auto' : 'smooth'
    });
    options.onComplete?.();
  }

  function destroy() {
    destroyLenis();
    [...pending].forEach(node => show(node, false));
  }

  window.SiteUI = {
    register,
    scrollTo,
    reveal: node => show(node, false),
    stop: () => {
      manualLocked = true;
      syncScrollLock();
    },
    start: () => {
      manualLocked = false;
      syncScrollLock();
    },
    destroy,
    get lenis() {
      return lenis;
    }
  };

  /* ============================================================
     INITIALIZATION & LIFECYCLE LISTENERS
     ============================================================ */
  initLenis();
  register(document);

  motion.addEventListener('change', () => {
    if (motion.matches) {
      destroyLenis();
      [...pending].forEach(node => show(node, false));
    } else {
      initLenis();
    }
  });

  document.addEventListener('focusin', event => {
    const node = event.target?.closest?.('.is-pending');
    if (node) show(node, false);
  });

  if (document.body && 'MutationObserver' in window) {
    new MutationObserver(records => {
      let shouldSyncLock = false;
      records.forEach(record => {
        if (record.type === 'attributes') {
          shouldSyncLock = true;
          return;
        }
        record.addedNodes.forEach(node => {
          if (node.nodeType === 1) {
            register(node);
            shouldSyncLock = true;
          }
        });
      });
      if (shouldSyncLock) syncScrollLock();
      pending.forEach(node => {
        if (!node.isConnected) {
          clearNodeTimer(node);
          observer?.unobserve(node);
          pending.delete(node);
        }
      });
    }).observe(document.body, {
      childList: true,
      subtree: true,
      attributes: true,
      attributeFilter: ['style', 'class', 'hidden', 'aria-hidden']
    });
  }

  window.addEventListener('pagehide', () => {
    [...pending].forEach(node => show(node, false));
  });

  document.addEventListener('click', event => {
    const link = event.target?.closest?.('a[href]');
    if (!link || event.defaultPrevented || event.button !== 0 || event.metaKey || event.ctrlKey || event.shiftKey || event.altKey || link.target === '_blank' || link.hasAttribute('download')) {
      return;
    }
    const rawHref = link.getAttribute('href') || '';
    if (rawHref === '#' || rawHref.startsWith('javascript:')) return;

    let url;
    try {
      url = new URL(link.href, location.href);
    } catch (_) {
      return;
    }
    if (url.origin !== location.origin || url.pathname !== location.pathname || url.search !== location.search || !url.hash || url.hash === '#') {
      return;
    }

    const hashId = decodeURIComponent(url.hash.slice(1));
    const target = hashId === 'top' ? 0 : document.getElementById(hashId);
    if (target === null || target === undefined) return;

    event.preventDefault();
    if (typeof window.closeMobileNav === 'function') {
      window.closeMobileNav();
    }
    if (location.hash !== url.hash) {
      history.pushState(null, '', url.hash);
    }
    scrollTo(target, {
      onComplete: () => {
        if (target instanceof Element) focusTargetElement(target);
      }
    });
  });

  window.addEventListener('popstate', () => {
    if (!location.hash || location.hash === '#') return;
    try {
      const target = document.getElementById(decodeURIComponent(location.hash.slice(1)));
      if (target) scrollTo(target);
    } catch (_) {}
  });
})();
