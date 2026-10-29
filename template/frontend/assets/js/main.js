/**
 * TRUNG TÂM Y TẾ KHU VỰC ĐĂK HÀ
 * Main JavaScript — slider, scroll animations, mobile menu, count-up, form validate
 * Version: 1.0.0
 */

(function () {
  'use strict';

  /* ============================================================
     1. HERO BANNER SLIDER
     ============================================================ */
  const Slider = (() => {
    const wrapper  = document.querySelector('.slider-wrapper');
    if (!wrapper) return;

    const allSlides = Array.from(wrapper.querySelectorAll('.slide'));
    const allDots = Array.from(wrapper.querySelectorAll('.slider-dot'));
    const mobileScreen = window.matchMedia('(max-width: 768px)');
    let slides = [];
    let dots = [];
    const prevBtn  = wrapper.querySelector('.slider-prev');
    const nextBtn  = wrapper.querySelector('.slider-next');

    let current    = 0;
    let autoTimer  = null;
    const INTERVAL = 5500;

    function goTo(index) {
      if (!slides.length) return;
      slides[current].classList.remove('active');
      dots[current]?.classList.remove('active');
      dots[current]?.setAttribute('aria-selected', 'false');
      current = (index + slides.length) % slides.length;
      slides[current].classList.add('active');
      dots[current]?.classList.add('active');
      dots[current]?.setAttribute('aria-selected', 'true');
    }

    function startAuto() {
      stopAuto();
      if (slides.length < 2 || matchMedia('(prefers-reduced-motion: reduce)').matches) return;
      autoTimer = setInterval(() => goTo(current + 1), INTERVAL);
    }

    function stopAuto() {
      clearInterval(autoTimer);
    }

    if (prevBtn) prevBtn.addEventListener('click', () => { goTo(current - 1); startAuto(); });
    if (nextBtn) nextBtn.addEventListener('click', () => { goTo(current + 1); startAuto(); });

    allDots.forEach(dot => {
      dot.addEventListener('click', () => { const index = dots.indexOf(dot); if (index >= 0) goTo(index); startAuto(); });
    });

    matchMedia('(prefers-reduced-motion: reduce)').addEventListener('change', event => {
      if (event.matches) stopAuto(); else startAuto();
    });

    // Pause on hover
    wrapper.addEventListener('mouseenter', stopAuto);
    wrapper.addEventListener('mouseleave', startAuto);

    // Touch / Swipe support
    let touchStartX = 0;
    wrapper.addEventListener('touchstart', e => {
      touchStartX = e.changedTouches[0].clientX;
    }, { passive: true });

    wrapper.addEventListener('touchend', e => {
      const diff = touchStartX - e.changedTouches[0].clientX;
      if (Math.abs(diff) > 50) {
        diff > 0 ? goTo(current + 1) : goTo(current - 1);
        startAuto();
      }
    }, { passive: true });

    // Keyboard accessibility
    wrapper.setAttribute('tabindex', '0');
    wrapper.addEventListener('keydown', e => {
      if (e.key === 'ArrowRight') { goTo(current + 1); startAuto(); }
      if (e.key === 'ArrowLeft')  { goTo(current - 1); startAuto(); }
    });

    function configureDevice() {
      stopAuto();
      const device = mobileScreen.matches ? 'mobile' : 'pc';
      slides = allSlides.filter(slide => slide.dataset.device === 'all' || slide.dataset.device === device);
      dots = allDots.filter(dot => slides.some(slide => slide.id === dot.getAttribute('aria-controls')));
      allSlides.forEach(slide => {
        slide.classList.remove('active');
        slide.hidden = !slides.includes(slide);
        const background = slide.querySelector('.slide-bg');
        if (!slide.hidden && background?.dataset.image) {
          background.style.backgroundImage = 'url(' + JSON.stringify(background.dataset.image) + ')';
        } else if (background) {
          background.style.backgroundImage = '';
        }
      });
      allDots.forEach(dot => {
        dot.hidden = !dots.includes(dot);
        dot.classList.remove('active');
        dot.setAttribute('aria-selected', 'false');
      });
      wrapper.closest('.hero').hidden = slides.length === 0;
      [prevBtn, nextBtn, wrapper.querySelector('.slider-dots')].forEach(control => {
        if (control) control.hidden = slides.length < 2;
      });
      slides.forEach((slide, index) => slide.setAttribute('aria-label', 'Slide ' + (index + 1) + ' / ' + slides.length));
      dots.forEach((dot, index) => dot.setAttribute('aria-label', 'Slide ' + (index + 1)));
      current = 0;
      goTo(0);
      startAuto();
    }
    mobileScreen.addEventListener('change', configureDevice);
    configureDevice();
  })();


  /* ============================================================
     2. MOBILE NAVIGATION
     ============================================================ */
  const MobileNav = (() => {
    const hamburger  = document.querySelector('.hamburger');
    const mobileNav  = document.querySelector('.mobile-nav');
    const overlay    = document.querySelector('.nav-overlay');
    const closeBtn   = document.querySelector('.mobile-nav-close') || document.querySelector('.mobile-close');
    const expandBtns = document.querySelectorAll('.mobile-nav-link[data-submenu]');

    if (!hamburger || !mobileNav) return;

    function openNav() {
      mobileNav.classList.add('open');
      mobileNav.setAttribute('aria-hidden', 'false');
      overlay.classList.add('show');
      hamburger.classList.add('open');
      hamburger.setAttribute('aria-expanded', 'true');
      document.body.style.overflow = 'hidden'; window.SiteUI?.stop();
    }

    function closeNav() {
      mobileNav.classList.remove('open');
      mobileNav.setAttribute('aria-hidden', 'true');
      overlay?.classList.remove('show');
      hamburger.classList.remove('open');
      hamburger.setAttribute('aria-expanded', 'false');
      document.body.style.overflow = ''; window.SiteUI?.start();
    }

    window.closeMobileNav = closeNav;

    hamburger.addEventListener('click', () => {
      mobileNav.classList.contains('open') ? closeNav() : openNav();
    });

    overlay?.addEventListener('click', closeNav);
    closeBtn?.addEventListener('click', closeNav);

    // Submenu accordion
    expandBtns.forEach(btn => {
      btn.addEventListener('click', e => {
        e.preventDefault();
        const subId  = btn.dataset.submenu;
        const sub    = document.getElementById(subId);
        if (!sub) return;

        const isOpen = btn.classList.contains('expanded');
        // Close all
        expandBtns.forEach(b => {
          b.classList.remove('expanded');
          const s = document.getElementById(b.dataset.submenu);
          s?.classList.remove('open');
        });
        // Toggle clicked
        if (!isOpen) {
          btn.classList.add('expanded');
          sub.classList.add('open');
        }
      });
    });

    // Escape key
    document.addEventListener('keydown', e => {
      if (e.key === 'Escape') closeNav();
    });
  })();


  /* ============================================================
     3. SCROLL-BASED BEHAVIORS
     ============================================================ */
  const ScrollEffects = (() => {
    const header    = document.querySelector('.site-header');
    const scrollTop = document.querySelector('.scroll-top');
    let framePending = false;
    let fixed = false;
    let headerHeight = header?.offsetHeight || 0;
    const placeholder = document.createElement('div');
    placeholder.className = 'site-header-placeholder';
    placeholder.setAttribute('aria-hidden', 'true');
    header?.before(placeholder);

    function measureHeader() {
      headerHeight = header?.offsetHeight || 0;
      if (fixed) placeholder.style.height = headerHeight + 'px';
      scheduleScroll();
    }

    function scheduleScroll() {
      if (framePending) return;
      framePending = true;
      requestAnimationFrame(onScroll);
    }

    function onScroll() {
      const y = window.scrollY;
      framePending = false;
      const origin = placeholder.getBoundingClientRect().top + y;
      const shouldFix = y > origin + headerHeight + 24;
      if (header && shouldFix !== fixed) {
        fixed = shouldFix;
        placeholder.style.height = fixed ? headerHeight + 'px' : '0px';
        header.classList.toggle('is-fixed', fixed);
      }
      header?.classList.toggle('scrolled', fixed);
      // Scroll to top button
      scrollTop?.classList.toggle('show', y > 400);

    }

    window.addEventListener('scroll', scheduleScroll, { passive: true });
    window.addEventListener('resize', measureHeader, { passive: true });
    if (header && 'ResizeObserver' in window) new ResizeObserver(measureHeader).observe(header);
    onScroll();

    scrollTop?.addEventListener('click', () => {
      if (window.SiteUI) window.SiteUI.scrollTo(0);
      else window.scrollTo({ top: 0, behavior: 'auto' });
    });
  })();


  /* ============================================================
     4. SCROLL ANIMATIONS (Intersection Observer)
     ============================================================ */
  // Shared progressive reveal also handles legacy data-animate components.
  window.SiteUI?.register(document);


  /* ============================================================
     5. COUNT-UP ANIMATION (Statistics)
     ============================================================ */
  const CountUp = (() => {
    const counters = document.querySelectorAll('[data-count]');
    if (!counters.length || !('IntersectionObserver' in window) || matchMedia('(prefers-reduced-motion: reduce)').matches) return;

    function animateCounter(el) {
      const target    = parseInt(el.dataset.count, 10);
      const suffix    = el.dataset.suffix || '';
      const duration  = 2000;
      const step      = 16;
      const increment = target / (duration / step);
      let   current   = 0;

      const timer = setInterval(() => {
        current += increment;
        if (current >= target) {
          current = target;
          clearInterval(timer);
        }
        el.textContent = Math.round(current).toLocaleString('vi-VN') + suffix;
      }, step);
    }

    const observer = new IntersectionObserver(
      entries => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            animateCounter(entry.target);
            observer.unobserve(entry.target);
          }
        });
      },
      { threshold: 0.5 }
    );

    counters.forEach(el => observer.observe(el));
  })();


  /* ============================================================
     6. FAQ ACCORDION
     ============================================================ */
  const FAQ = (() => {
    const items = document.querySelectorAll('.faq-item');
    if (!items.length) return;

    items.forEach(item => {
      const btn = item.querySelector('.faq-question');
      btn?.addEventListener('click', () => {
        const isOpen = item.classList.contains('open');
        // Close all
        items.forEach(i => i.classList.remove('open'));
        // Toggle clicked
        if (!isOpen) item.classList.add('open');
      });
    });
  })();


  /* ============================================================
     7. CONTACT FORM VALIDATION
     ============================================================ */
  const FormValidate = (() => {
    const form = document.getElementById('contact-form');
    if (!form) return;

    const rules = {
      'contact-name'    : { required: true, label: 'Họ và tên' },
      'contact-phone'   : { required: true, pattern: /^(0[3-9])\d{8}$/, label: 'Số điện thoại' },
      'contact-email'   : { required: false, pattern: /^[^\s@]+@[^\s@]+\.[^\s@]+$/, label: 'Email' },
      'contact-subject' : { required: true, label: 'Tiêu đề' },
      'contact-message' : { required: true, label: 'Nội dung góp ý' },
    };

    const errorBox = document.getElementById('contact-form-error');
    const submitButton = document.getElementById('submit-contact');

    function showToast(icon, message) {
      if (window.Swal && typeof window.Swal.fire === 'function') {
        window.Swal.fire({
          toast: true,
          position: 'top-end',
          icon,
          title: message,
          showConfirmButton: false,
          timer: icon === 'success' ? 3500 : 5000,
          timerProgressBar: true,
          width: '22rem'
        });
      } else {
        errorBox.textContent = message;
        errorBox.style.display = 'block';
      }
    }

    function validateField(id) {
      const input = document.getElementById(id);
      const rule = rules[id];
      const error = input?.nextElementSibling;
      if (!input || !rule) return true;

      const val = input.value.trim();
      const checkVal = id === 'contact-phone' ? val.replace(/\D/g, '').replace(/^84(?=\d{9}$)/, '0') : val;
      let message = '';
      if (rule.required && !val) {
        message = rule.label + ' không được để trống.';
      } else if (val && rule.pattern && !rule.pattern.test(checkVal)) {
        message = rule.label + ' không hợp lệ.';
      }
      input.classList.toggle('error', !!message);
      if (error?.classList.contains('form-error')) {
        error.textContent = message;
        error.style.display = message ? 'block' : 'none';
      }
      return !message;
    }

    Object.keys(rules).forEach(id => {
      const input = document.getElementById(id);
      input?.addEventListener('blur', () => validateField(id));
      input?.addEventListener('input', () => {
        if (input.classList.contains('error')) validateField(id);
      });
    });

    form.addEventListener('submit', async event => {
      event.preventDefault();
      errorBox.style.display = 'none';
      let valid = true;
      Object.keys(rules).forEach(id => {
        if (!validateField(id)) valid = false;
      });
      if (!valid) {
        showToast('warning', 'Vui lòng kiểm tra các trường bắt buộc.');
        return;
      }

      submitButton.disabled = true;
      try {
        const response = await fetch(form.action, {
          method: 'POST',
          body: new FormData(form),
          credentials: 'same-origin',
          headers: { 'Accept': 'application/json' }
        });
        const result = await response.json();
        if (!response.ok || result.status !== 200) {
          throw new Error(result.message || 'Không thể gửi góp ý. Vui lòng thử lại.');
        }
        form.reset();
        showToast('success', 'Góp ý của bạn đã được gửi thành công.');
      } catch (error) {
        showToast('error', error.message || 'Không thể gửi góp ý. Vui lòng thử lại.');
      } finally {
        submitButton.disabled = false;
      }
    });
  })();

  /* ============================================================
     8. READING PROGRESS BAR (for news detail pages)
     ============================================================ */
  const ReadingProgress = (() => {
    const bar = document.getElementById('reading-progress');
    if (!bar) return;

    window.addEventListener('scroll', () => {
      const total   = document.documentElement.scrollHeight - window.innerHeight;
      const progress = total > 0 ? (window.scrollY / total) * 100 : 0;
      bar.style.width = Math.min(progress, 100) + '%';
    }, { passive: true });
  })();


  /* ============================================================
     9. LAZY LOAD MAPS (iframe)
     ============================================================ */
  const LazyMap = (() => {
    const mapWrap = document.querySelector('.map-lazy-wrap');
    if (!mapWrap) return;
    if (!('IntersectionObserver' in window)) {
      if (mapWrap.dataset.src) mapWrap.innerHTML = '<iframe src="' + mapWrap.dataset.src.replace(/"/g, '&quot;') + '" title="Bản đồ" loading="lazy"></iframe>';
      return;
    }

    const observer = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const src = mapWrap.dataset.src;
          if (src) {
            const iframe = document.createElement('iframe');
            iframe.src          = src;
            iframe.width        = '100%';
            iframe.height       = '100%';
            iframe.style.border = '0';
            iframe.allowFullscreen = true;
            iframe.loading      = 'lazy';
            iframe.referrerPolicy = 'no-referrer-when-downgrade';
            mapWrap.innerHTML   = '';
            mapWrap.appendChild(iframe);
          }
          observer.disconnect();
        }
      });
    }, { threshold: 0.1 });

    observer.observe(mapWrap);
  })();


  /* ============================================================
     10. ACTIVE NAV LINK HIGHLIGHT
     ============================================================ */
  (() => {
    const links   = document.querySelectorAll('.nav-link, .mobile-nav-link');
    const current = window.location.pathname.toLowerCase();

    links.forEach(link => {
      const href = link.getAttribute('href');
      if (!href || href === '#' || href.startsWith('javascript:')) return;
      
      try {
        const linkPath = new URL(href, window.location.origin).pathname.toLowerCase();
        if (linkPath !== '/' && current.endsWith(linkPath)) {
          link.classList.add('active');
        }
      } catch(e) {}
    });

    // Home page check
    const isHome = current === '/' || current.endsWith('/bvdkdakha.vn/') || current.endsWith('/index') || current.endsWith('/index.php') || current.endsWith('/index.html');
    if (isHome) {
      links.forEach(link => {
        const href = link.getAttribute('href');
        if (href && (href.endsWith('/') || href.endsWith('index.html'))) {
          link.classList.add('active');
        }
      });
    }
  })();


  /* ============================================================
     11. ANNOUNCEMENT MARQUEE (seamless loop with 1 announcement)
     ============================================================ */
  (() => {
    const track = document.querySelector('.marquee-track');
    const content = document.querySelector('.marquee-content');
    if (!track || !content) return;

    // Clean up any extra sibling containers from older implementations
    const siblingContents = track.querySelectorAll('.marquee-content');
    for (let i = 1; i < siblingContents.length; i++) {
      siblingContents[i].remove();
    }

    const items = content.querySelectorAll('.marquee-item');
    if (items.length === 1) {
      // Clone 3 more items inside content for mathematically seamless 50% loop
      for (let i = 0; i < 3; i++) {
        const clone = items[0].cloneNode(true);
        clone.setAttribute('aria-hidden', 'true');
        content.appendChild(clone);
      }
    }
  })();


  /* ============================================================
     12. SMOOTH ANCHOR SCROLL with offset
     ============================================================ */
  // Shared ui-effects.js owns anchor handling, including sticky offsets and focus.

})();
