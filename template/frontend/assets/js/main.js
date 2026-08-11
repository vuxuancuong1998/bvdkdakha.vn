/**
 * TRUNG TÂM Y TẾ KHU VỰC ĐẮK HÀ
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

    const slides   = wrapper.querySelectorAll('.slide');
    const dots     = wrapper.querySelectorAll('.slider-dot');
    const prevBtn  = wrapper.querySelector('.slider-prev');
    const nextBtn  = wrapper.querySelector('.slider-next');

    let current    = 0;
    let autoTimer  = null;
    const INTERVAL = 5500;

    function goTo(index) {
      slides[current].classList.remove('active');
      dots[current]?.classList.remove('active');
      current = (index + slides.length) % slides.length;
      slides[current].classList.add('active');
      dots[current]?.classList.add('active');
    }

    function startAuto() {
      stopAuto();
      autoTimer = setInterval(() => goTo(current + 1), INTERVAL);
    }

    function stopAuto() {
      clearInterval(autoTimer);
    }

    if (prevBtn) prevBtn.addEventListener('click', () => { goTo(current - 1); startAuto(); });
    if (nextBtn) nextBtn.addEventListener('click', () => { goTo(current + 1); startAuto(); });

    dots.forEach((dot, i) => {
      dot.addEventListener('click', () => { goTo(i); startAuto(); });
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

    startAuto();
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
      overlay.classList.add('show');
      hamburger.classList.add('open');
      hamburger.setAttribute('aria-expanded', 'true');
      document.body.style.overflow = 'hidden';
    }

    function closeNav() {
      mobileNav.classList.remove('open');
      overlay?.classList.remove('show');
      hamburger.classList.remove('open');
      hamburger.setAttribute('aria-expanded', 'false');
      document.body.style.overflow = '';
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
    let   lastScroll = 0;

    function onScroll() {
      const y = window.scrollY;
      // Sticky header shadow
      header?.classList.toggle('scrolled', y > 40);
      // Scroll to top button
      scrollTop?.classList.toggle('show', y > 400);
      lastScroll = y;
    }

    window.addEventListener('scroll', onScroll, { passive: true });

    scrollTop?.addEventListener('click', () => {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });
  })();


  /* ============================================================
     4. SCROLL ANIMATIONS (Intersection Observer)
     ============================================================ */
  const ScrollAnimate = (() => {
    const elements = document.querySelectorAll('[data-animate]');
    if (!elements.length) return;

    const observer = new IntersectionObserver(
      entries => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            entry.target.classList.add('in-view');
            observer.unobserve(entry.target);
          }
        });
      },
      { threshold: 0.12, rootMargin: '0px 0px -40px 0px' }
    );

    elements.forEach(el => observer.observe(el));
  })();


  /* ============================================================
     5. COUNT-UP ANIMATION (Statistics)
     ============================================================ */
  const CountUp = (() => {
    const counters = document.querySelectorAll('[data-count]');
    if (!counters.length) return;

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
      'contact-name'    : { required: true, minLength: 2, label: 'Họ và tên' },
      'contact-phone'   : { required: true, pattern: /^(0[3-9])\d{8}$/, label: 'Số điện thoại' },
      'contact-email'   : { required: false, pattern: /^[^\s@]+@[^\s@]+\.[^\s@]+$/, label: 'Email' },
      'contact-subject' : { required: true, minLength: 5, label: 'Tiêu đề' },
      'contact-message' : { required: true, minLength: 20, label: 'Nội dung' },
    };

    function validateField(id) {
      const input  = document.getElementById(id);
      const rule   = rules[id];
      const error  = input?.nextElementSibling;
      if (!input || !rule) return true;

      let msg = '';
      const val = input.value.trim();

      if (rule.required && !val) {
        msg = `${rule.label} không được để trống.`;
      } else if (val && rule.minLength && val.length < rule.minLength) {
        msg = `${rule.label} phải có ít nhất ${rule.minLength} ký tự.`;
      } else if (val && rule.pattern && !rule.pattern.test(val)) {
        msg = `${rule.label} không hợp lệ.`;
      }

      input.classList.toggle('error', !!msg);
      if (error?.classList.contains('form-error')) {
        error.textContent = msg;
        error.style.display = msg ? 'block' : 'none';
      }
      return !msg;
    }

    // Real-time validate on blur
    Object.keys(rules).forEach(id => {
      const input = document.getElementById(id);
      input?.addEventListener('blur', () => validateField(id));
      input?.addEventListener('input', () => {
        if (input.classList.contains('error')) validateField(id);
      });
    });

    form.addEventListener('submit', e => {
      e.preventDefault();
      let valid = true;
      Object.keys(rules).forEach(id => {
        if (!validateField(id)) valid = false;
      });

      if (valid) {
        const successMsg = document.getElementById('form-success');
        successMsg?.classList.add('show');
        form.reset();
        setTimeout(() => successMsg?.classList.remove('show'), 6000);
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
      const progress = (window.scrollY / total) * 100;
      bar.style.width = Math.min(progress, 100) + '%';
    }, { passive: true });
  })();


  /* ============================================================
     9. LAZY LOAD MAPS (iframe)
     ============================================================ */
  const LazyMap = (() => {
    const mapWrap = document.querySelector('.map-lazy-wrap');
    if (!mapWrap) return;

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
     11. ANNOUNCEMENT MARQUEE (duplicate for seamless loop)
     ============================================================ */
  (() => {
    const content = document.querySelector('.marquee-content');
    if (!content) return;

    // Clone for seamless loop
    const clone = content.cloneNode(true);
    content.parentElement.appendChild(clone);
  })();


  /* ============================================================
     12. SMOOTH ANCHOR SCROLL with offset
     ============================================================ */
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      const target = document.querySelector(this.getAttribute('href'));
      if (!target) return;
      e.preventDefault();
      const offset = 80; // header height offset
      const top    = target.getBoundingClientRect().top + window.scrollY - offset;
      window.scrollTo({ top, behavior: 'smooth' });
    });
  });

})();
