function localDate(date){return date.getFullYear()+'-'+String(date.getMonth()+1).padStart(2,'0')+'-'+String(date.getDate()).padStart(2,'0');}

    // 1. Khởi tạo ngày mặc định cho form đặt lịch & Scroll-To-Top
    document.addEventListener('DOMContentLoaded', () => {
      const dateInput = document.getElementById('booking-date');
      if (dateInput) {
        dateInput.min = window.homeBookingToday || localDate(new Date());
      }

      initScrollRevealAndLazyLoad();
      initScrollTopVisibility();

    });

    // 2. Hiệu ứng Load dữ liệu & Hiển thị mượt mà theo Scroll (IntersectionObserver)
    function initScrollRevealAndLazyLoad() {
      // Reveal and native image loading are managed once by ui-effects.js.
      window.SiteUI?.register(document);
      if (!('IntersectionObserver' in window) || matchMedia('(prefers-reduced-motion: reduce)').matches) return;

      // Hiệu ứng đếm số mượt mà cho thống kê truy cập ở Footer khi cuộn tới
      const statsContainer = document.getElementById('visit-stats-counter');
      if (statsContainer) {
        const statsObserver = new IntersectionObserver((entries, obs) => {
          entries.forEach(entry => {
            if (entry.isIntersecting) {
              statsContainer.querySelectorAll('strong[data-count]').forEach(counter => {
                const target = parseInt(counter.getAttribute('data-count'), 10);
                const duration = 1200;
                const startTime = performance.now();

                function updateCount(now) {
                  const progress = Math.min((now - startTime) / duration, 1);
                  const eased = 1 - Math.pow(1 - progress, 3);
                  const current = Math.floor(eased * target);
                  counter.textContent = current.toLocaleString('vi-VN');
                  if (progress < 1) requestAnimationFrame(updateCount);
                }
                requestAnimationFrame(updateCount);
              });
              obs.unobserve(statsContainer);
            }
          });
        }, { threshold: 0.25 });
        statsObserver.observe(statsContainer);
      }

      // Hiệu ứng đếm số tự động cho phần Giới thiệu bệnh viện khi cuộn tới
      const aboutStats = document.getElementById('about-stats-counter');
      if (aboutStats) {
        const aboutObserver = new IntersectionObserver((entries, obs) => {
          entries.forEach(entry => {
            if (entry.isIntersecting) {
              aboutStats.querySelectorAll('span[data-about-count]').forEach(counter => {
                const target = parseInt(counter.getAttribute('data-about-count'), 10);
                const duration = 1300;
                const startTime = performance.now();

                function updateAboutCount(now) {
                  const progress = Math.min((now - startTime) / duration, 1);
                  const eased = 1 - Math.pow(1 - progress, 3);
                  counter.textContent = Math.floor(eased * target).toLocaleString('vi-VN');
                  if (progress < 1) requestAnimationFrame(updateAboutCount);
                }
                requestAnimationFrame(updateAboutCount);
              });
              obs.unobserve(aboutStats);
            }
          });
        }, { threshold: 0.25 });
        aboutObserver.observe(aboutStats);
      }
    }

    // ============================================================
    // 2.5. LOGIC VÒNG QUAY QUẠT GIÓ & ĐƯỜNG KẾT NỐI SMART HUB TURBINE
    // ============================================================
    const milestones = [
      {
        id: 0,
        code: "HIS",
        title: "HỆ THỐNG HIS THÔNG MINH",
        shortTitle: "HỆ THỐNG HIS",
        metric: "100% Quy trình số",
        summary: "Tự động hóa quy trình tiếp đón, khám bệnh và điều trị nội trú.",
        fullDesc: "Hệ thống quản lý bệnh viện thông minh (HIS) đóng vai trò xương sống, kết nối trực tiếp vào Smart Hub để đồng bộ dữ liệu bệnh nhân từ lúc đăng ký đến khi xuất viện.",
        icon: "fa-hospital-user",
        highlights: [
          "Giảm 60% thời gian làm thủ tục",
          "Liên thông 100% khoa phòng",
          "Cảnh báo tương tác thuốc tự động",
          "Tích hợp chữ ký số y bác sĩ"
        ]
      },
      {
        id: 1,
        code: "EMR",
        title: "BỆNH ÁN ĐIỆN TỬ EMR",
        shortTitle: "BỆNH ÁN ĐIỆN TỬ",
        metric: "Không giấy tờ 100%",
        summary: "Số hóa hoàn toàn hồ sơ bệnh án, lưu trữ bảo mật và tra cứu tức thì.",
        fullDesc: "Thay thế hoàn toàn bệnh án giấy truyền thống bằng Bệnh án điện tử (EMR) chuẩn HL7/FHIR, giúp bác sĩ truy xuất lịch sử điều trị xuyên suốt chỉ với 1 chạm.",
        icon: "fa-file-medical",
        highlights: [
          "100% biểu mẫu y tế số hóa",
          "Tra cứu lịch sử khám < 0.5 giây",
          "Bảo mật đa lớp chuẩn quốc tế",
          "Tiết kiệm hàng tỷ đồng chi phí in ấn"
        ]
      },
      {
        id: 2,
        code: "RIS/PACS",
        title: "TRUNG TÂM ĐIỀU HÀNH IOC",
        shortTitle: "CHẨN ĐOÁN HÌNH ẢNH",
        metric: "",
        summary: "Lưu trữ và truyền tải ảnh DICOM sắc nét,không cần in phim.",
        fullDesc: "",
        icon: "fa-chart-pie",
        highlights: [
          
        ]
      },
      {
        id: 3,
        code: "LIS",
        title: "XÉT NGHIỆM",
        shortTitle: "HỆ THỐNG XÉT NGHIỆM",
        metric: "",
        summary: "Tự động hóa – Nhanh chóng – Chính xác tuyệt đối.",
        fullDesc: "",
        icon: "fa-x-ray",
        highlights: [
        
        ]
      },
      {
        id: 4,
        code: "TT25/BYT",
        title: "NHẬN CHẾ ĐỘ BHXH ONLINE",
        shortTitle: "KIOSK Y TẾ SỐ",
        metric: "",
        summary: "Nhận các loại giấy chế độ BHXH Online",
        fullDesc: "Hệ thống Kiosk tự phục vụ thông minh tại sảnh giúp người dân chủ động đăng ký khám bằng CCCD gắn chip hoặc nhận diện khuôn mặt mà không phải xếp hàng chờ đợi.",
        icon: "fa-id-card-clip",
        highlights: [
        
        ]
      },
      {
        id: 5,
        code: "THANH TOÁN",
        title: "THANH TOÁN KHÔNG TIỀN MẶT",
        shortTitle: "THANH TOÁN SỐ",
        metric: "QR Động 1 chạm",
        summary: "Tích hợp thanh toán qua quét mã QRcode",
        fullDesc: "Mỗi chỉ định cận lâm sàng hoặc đơn thuốc đều được Smart Hub sinh mã QR động định danh riêng, giúp bệnh nhân thanh toán tức thì ngay tại phòng khám.",
        icon: "fa-qrcode",
        highlights: [
          "Gạch nợ viện phí tự động 100%",
          "Hỗ trợ đa kênh ngân hàng & Ví",
          "Xuất hóa đơn điện tử tức thời",
          "Minh bạch và đối soát tự động"
        ]
      },
      {
        id: 6,
        code: "ONLINE",
        title: "Đặt lịch online",
        shortTitle: "Đặt lịch online",
        metric: "",
        summary: "Giảm bớt thời gian chờ đợi, số hóa quy trình tiếp nhận",
        fullDesc: "Tích hợp thuật toán Trí tuệ nhân tạo (AI) phân tích dữ liệu y khoa trên Smart Hub, đồng thời kết nối 2 chiều với hệ thống máy xét nghiệm tự động (LIS).",
        icon: "fa-brain",
        highlights: [
          
        ]
      },
      {
        id: 7,
        code: "LIÊN THÔNG",
        title: "TRỤC LIÊN THÔNG & APP Y TẾ",
        shortTitle: "LIÊN THÔNG QUỐC GIA",
        metric: "Kết nối đa tuyến",
        summary: "Liên thông cổng BHXH, Hồ sơ sức khỏe điện tử và Ứng dụng đặt lịch trên di động.",
        fullDesc: "Kết nối đồng bộ dữ liệu với Cổng giám định BHYT, Sổ sức khỏe điện tử VNeID và ứng dụng di động giúp người dân theo dõi sức khỏe trọn đời.",
        icon: "fa-mobile-screen-button",
        highlights: [
          "Liên thông chuẩn XML Bộ Y Tế",
          "Đặt lịch khám trực tuyến từ xa",
          "Tra cứu hồ sơ sức khỏe trên điện thoại",
          "Nhắc lịch tái khám & uống thuốc tự động"
        ]
      }
    ];

    const CENTER_X = 480;
    const CENTER_Y = 440;
    const ORBIT_RADIUS = 335;
    const HUB_RADIUS = 118;

    let currentRotationAngle = 0;
    let rotationSpeed = 0.22;
    //dừng không quay cánh quạt dấu ấn chuyển đổi số: Muốn quay đổi isSpinning = true
    let isSpinning = false;
    let isHoverPaused = false;
    let activeNodeIndex = 0;
    let pulseProgress = 0;

    function polarToCartesian(cx, cy, r, angleDeg) {
      const rad = (angleDeg * Math.PI) / 180;
      return {
        x: cx + r * Math.cos(rad),
        y: cy + r * Math.sin(rad)
      };
    }

    function initTurbineSystem() {
      const bladesGroup = document.getElementById('turbineBladesGroup');
      const spokesGroup = document.getElementById('spokesGroup');
      const pulsesGroup = document.getElementById('pulsesGroup');
      const outerPolygon = document.getElementById('outerWebPolygon');
      const nodesContainer = document.getElementById('nodesContainer');

      if (!bladesGroup || !spokesGroup || !pulsesGroup || !outerPolygon || !nodesContainer) return;

      bladesGroup.innerHTML = '';
      spokesGroup.innerHTML = '';
      pulsesGroup.innerHTML = '';
      nodesContainer.innerHTML = '';

      const polygonPoints = [];

      milestones.forEach((item, index) => {
        const baseAngle = index * 45 - 90;
        const nodePos = polarToCartesian(CENTER_X, CENTER_Y, ORBIT_RADIUS, baseAngle);
        const hubEdgePos = polarToCartesian(CENTER_X, CENTER_Y, HUB_RADIUS - 4, baseAngle);

        polygonPoints.push(`${nodePos.x.toFixed(1)},${nodePos.y.toFixed(1)}`);

        // 1. Vẽ Cánh Quạt Gió Khí Động Học Mờ (Turbine Blade)
        const bladeSpanAngle = 22;
        const pInner1 = polarToCartesian(CENTER_X, CENTER_Y, HUB_RADIUS, baseAngle - 4);
        const pOuter1 = polarToCartesian(CENTER_X, CENTER_Y, ORBIT_RADIUS - 20, baseAngle - 2);
        const pOuter2 = polarToCartesian(CENTER_X, CENTER_Y, ORBIT_RADIUS - 45, baseAngle + bladeSpanAngle);
        const pInner2 = polarToCartesian(CENTER_X, CENTER_Y, HUB_RADIUS, baseAngle + 10);

        const bladePathData = `
          M ${pInner1.x.toFixed(1)} ${pInner1.y.toFixed(1)}
          Q ${(CENTER_X + pOuter1.x) / 2} ${(CENTER_Y + pOuter1.y) / 2} ${pOuter1.x.toFixed(1)} ${pOuter1.y.toFixed(1)}
          A ${ORBIT_RADIUS - 25} ${ORBIT_RADIUS - 25} 0 0 1 ${pOuter2.x.toFixed(1)} ${pOuter2.y.toFixed(1)}
          Q ${(CENTER_X + pOuter2.x) / 2} ${(CENTER_Y + pOuter2.y) / 2} ${pInner2.x.toFixed(1)} ${pInner2.y.toFixed(1)}
          Z
        `;

        const bladePath = document.createElementNS("http://www.w3.org/2000/svg", "path");
        bladePath.setAttribute("d", bladePathData);
        bladePath.setAttribute("id", `blade-${index}`);
        bladePath.setAttribute("fill", "url(#spokeGrad)");
        bladePath.setAttribute("fill-opacity", index === activeNodeIndex ? "0.18" : "0.06");
        bladePath.setAttribute("stroke", "#38bdf8");
        bladePath.setAttribute("stroke-opacity", "0.2");
        bladePath.setAttribute("stroke-width", "1");
        bladePath.style.transition = "fill-opacity 0.35s ease, stroke-opacity 0.35s ease";
        bladesGroup.appendChild(bladePath);

        // 2. Vẽ Đường Kết Nối Chính (Solid Spoke + Animated Dashed Data Line)
        const spokeGroup = document.createElementNS("http://www.w3.org/2000/svg", "g");
        spokeGroup.setAttribute("id", `spoke-group-${index}`);

        const baseLine = document.createElementNS("http://www.w3.org/2000/svg", "line");
        baseLine.setAttribute("id", `spoke-base-${index}`);
        baseLine.setAttribute("x1", hubEdgePos.x.toFixed(1));
        baseLine.setAttribute("y1", hubEdgePos.y.toFixed(1));
        baseLine.setAttribute("x2", nodePos.x.toFixed(1));
        baseLine.setAttribute("y2", nodePos.y.toFixed(1));
        baseLine.setAttribute("stroke", index === activeNodeIndex ? "#e36928" : "#0284c7");
        baseLine.setAttribute("stroke-width", index === activeNodeIndex ? "3.2" : "2");
        baseLine.setAttribute("stroke-opacity", index === activeNodeIndex ? "0.95" : "0.45");
        baseLine.style.transition = "all 0.3s ease";
        spokeGroup.appendChild(baseLine);

        const dashLine = document.createElementNS("http://www.w3.org/2000/svg", "line");
        dashLine.setAttribute("x1", hubEdgePos.x.toFixed(1));
        dashLine.setAttribute("y1", hubEdgePos.y.toFixed(1));
        dashLine.setAttribute("x2", nodePos.x.toFixed(1));
        dashLine.setAttribute("y2", nodePos.y.toFixed(1));
        dashLine.setAttribute("stroke", "#38bdf8");
        dashLine.setAttribute("stroke-width", "2");
        dashLine.setAttribute("class", "animated-data-line");
        spokeGroup.appendChild(dashLine);

        const hubJoint = document.createElementNS("http://www.w3.org/2000/svg", "circle");
        hubJoint.setAttribute("cx", hubEdgePos.x.toFixed(1));
        hubJoint.setAttribute("cy", hubEdgePos.y.toFixed(1));
        hubJoint.setAttribute("r", "4.5");
        hubJoint.setAttribute("fill", "#ffffff");
        hubJoint.setAttribute("stroke", "#0284c7");
        hubJoint.setAttribute("stroke-width", "2.5");
        spokeGroup.appendChild(hubJoint);

        spokesGroup.appendChild(spokeGroup);

        // 3. Hạt ánh sáng dữ liệu (Data Pulse Particle)
        const pulseCircle = document.createElementNS("http://www.w3.org/2000/svg", "circle");
        pulseCircle.setAttribute("id", `pulse-dot-${index}`);
        pulseCircle.setAttribute("r", index === activeNodeIndex ? "5.5" : "4");
        pulseCircle.setAttribute("fill", index === activeNodeIndex ? "#e36928" : "#0284c7");
        pulseCircle.setAttribute("stroke", "#ffffff");
        pulseCircle.setAttribute("stroke-width", "1.5");
        pulseCircle.setAttribute("filter", "url(#glowLine)");
        pulsesGroup.appendChild(pulseCircle);

        // 4. Tạo Box Dấu Ấn (Pearl White + Sapphire Blue Card)
        const nodeEl = document.createElement('div');
        nodeEl.id = `orbit-node-${index}`;
        nodeEl.className = `pearl-card pointer-events-auto cursor-pointer rounded-2xl p-3 w-[205px] absolute top-0 left-0 select-none group ${index === activeNodeIndex ? 'active-node' : ''}`;
        nodeEl.style.marginLeft = "-102.5px";
        nodeEl.style.marginTop = "-58px";
        nodeEl.style.willChange = "transform";

        nodeEl.innerHTML = `
          <div class="flex items-center justify-between gap-1.5 mb-1.5">
            <span class="node-badge text-[10px] font-extrabold uppercase tracking-wider px-2 py-0.5 rounded-md bg-sapphire-50 text-sapphire border border-sapphire-200/80 transition-colors">
              ${item.code}
            </span>
            <span class="text-[10px] font-bold text-cyber flex items-center gap-1">
              <span class="w-1.5 h-1.5 rounded-full bg-cyber animate-ping"></span>
              ${item.metric}
            </span>
          </div>
          <div class="flex items-start gap-2.5">
            
            <div class="min-w-0 flex-1">
              <h4 class="text-xs font-extrabold text-sapphire-dark uppercase leading-snug group-hover:text-cyber transition-colors line-clamp-1">
                ${item.shortTitle}
              </h4>
              <p class="text-[11px] text-slate-600 leading-tight mt-0.5 line-clamp-2 font-normal">
                ${item.summary}
              </p>
            </div>
          </div>
        `;

        nodeEl.addEventListener('mouseenter', () => {
          isHoverPaused = true;
          setActiveMilestone(index);
          updateStatusBanner(true);
        });

        nodeEl.addEventListener('mouseleave', () => {
          isHoverPaused = false;
          updateStatusBanner(false);
        });

        nodeEl.addEventListener('click', () => {
          setActiveMilestone(index);
          openMilestoneModal(index);
        });

        nodesContainer.appendChild(nodeEl);
      });

      outerPolygon.setAttribute("points", polygonPoints.join(" "));
      renderMobileTimeline();
    }

    function renderMobileTimeline() {
      const mobileContainer = document.getElementById('mobileNodesContainer');
      if (!mobileContainer) return;

      mobileContainer.innerHTML = milestones.map((item, idx) => `
        <div onclick="openMilestoneModal(${idx})" class="pearl-card rounded-2xl p-4 relative cursor-pointer">
          <span class="absolute -left-[25px] sm:-left-[29px] top-6 w-4 h-4 rounded-full bg-white border-4 border-sapphire shadow"></span>
          <div class="flex items-start gap-3.5">
            <div class="w-11 h-11 rounded-xl bg-gradient-to-br from-sapphire to-cyber text-white flex items-center justify-center shadow-md shrink-0">
              <i class="fa-solid ${item.icon} text-base"></i>
            </div>
            <div class="flex-1 min-w-0">
              <div class="flex flex-wrap items-center justify-between gap-2 mb-1">
                <span class="text-[10px] font-extrabold uppercase px-2 py-0.5 rounded bg-sapphire-50 text-sapphire border border-sapphire-200">
                  Dấu ấn #${item.code}
                </span>
                <span class="text-[11px] font-bold text-cyber">${item.metric}</span>
              </div>
              <h4 class="text-sm font-extrabold text-sapphire-dark uppercase">${item.title}</h4>
              <p class="text-xs text-slate-600 mt-1 leading-relaxed">${item.summary}</p>
            </div>
          </div>
        </div>
      `).join('');
    }
    //code quay cánh quạt dấu ấn chuyển đổi số
    const homeMotion = matchMedia('(prefers-reduced-motion: reduce)');
    let turbineFrame = 0;
    homeMotion.addEventListener('change', () => {
      cancelAnimationFrame(turbineFrame);
      turbineFrame = requestAnimationFrame(animateTurbineWheel);
    });
    function animateTurbineWheel() {
      if (isSpinning && !isHoverPaused && !homeMotion.matches) {
        currentRotationAngle = (currentRotationAngle + rotationSpeed) % 360;
      }

      const svgGroup = document.getElementById('svgRotatingGroup');
      if (svgGroup) {
        svgGroup.setAttribute('transform', `rotate(${currentRotationAngle.toFixed(2)} ${CENTER_X} ${CENTER_Y})`);
      }

      if (!homeMotion.matches) pulseProgress = (pulseProgress + 0.012) % 1;

      milestones.forEach((item, index) => {
        const baseAngle = index * 45 - 90;
        const currentAngle = baseAngle + currentRotationAngle;
        const pos = polarToCartesian(CENTER_X, CENTER_Y, ORBIT_RADIUS, currentAngle);

        const nodeEl = document.getElementById(`orbit-node-${index}`);
        if (nodeEl) {
          const scaleVal = index === activeNodeIndex ? 1.07 : 1;
          nodeEl.style.transform = `translate3d(${pos.x.toFixed(1)}px, ${pos.y.toFixed(1)}px, 0) scale(${scaleVal})`;
          nodeEl.style.zIndex = index === activeNodeIndex ? "35" : "20";
        }

        const pulseDot = document.getElementById(`pulse-dot-${index}`);
        if (pulseDot) {
          const offsetPhase = (pulseProgress + index * 0.125) % 1;
          const currentR = HUB_RADIUS + (ORBIT_RADIUS - 85 - HUB_RADIUS) * offsetPhase;
          const dotPos = polarToCartesian(CENTER_X, CENTER_Y, currentR, baseAngle);
          pulseDot.setAttribute('cx', dotPos.x.toFixed(1));
          pulseDot.setAttribute('cy', dotPos.y.toFixed(1));
        }
      });

      turbineFrame = homeMotion.matches ? 0 : requestAnimationFrame(animateTurbineWheel);
    }

    function setActiveMilestone(index) {
      activeNodeIndex = index;
      const selected = milestones[index];

      milestones.forEach((_, i) => {
        const nodeEl = document.getElementById(`orbit-node-${i}`);
        const spokeBase = document.getElementById(`spoke-base-${i}`);
        const bladeEl = document.getElementById(`blade-${i}`);
        const pulseDot = document.getElementById(`pulse-dot-${i}`);

        const isCurrent = i === index;

        if (nodeEl) nodeEl.classList.toggle('active-node', isCurrent);
        if (spokeBase) {
          spokeBase.setAttribute("stroke", isCurrent ? "#e36928" : "#0284c7");
          spokeBase.setAttribute("stroke-width", isCurrent ? "3.5" : "2");
          spokeBase.setAttribute("stroke-opacity", isCurrent ? "1" : "0.45");
        }
        if (bladeEl) {
          bladeEl.setAttribute("fill-opacity", isCurrent ? "0.22" : "0.06");
          bladeEl.setAttribute("stroke", isCurrent ? "#e36928" : "#38bdf8");
          bladeEl.setAttribute("stroke-opacity", isCurrent ? "0.55" : "0.2");
        }
        if (pulseDot) {
          pulseDot.setAttribute("r", isCurrent ? "6" : "4");
          pulseDot.setAttribute("fill", isCurrent ? "#e36928" : "#0284c7");
        }
      });

      const liveIcon = document.getElementById('liveBarIcon');
      const liveCode = document.getElementById('liveBarCode');
      const liveTitle = document.getElementById('liveBarTitle');
      const liveDesc = document.getElementById('liveBarDesc');

      if (liveIcon) liveIcon.className = `fa-solid ${selected.icon} text-lg`;
      if (liveCode) liveCode.textContent = `DẤU ẤN #${selected.code}`;
      if (liveTitle) liveTitle.textContent = selected.title;
      if (liveDesc) liveDesc.textContent = selected.fullDesc;

      const centerIcon = document.getElementById('centerHubIcon');
      const centerSub = document.getElementById('centerHubSub');
      if (centerIcon && centerSub) {
        centerIcon.className = `fa-solid ${selected.icon} text-2xl text-sky-100`;
        centerSub.textContent = `Kết nối: Dấu ấn #${selected.code}`;
      }
    }

    function updateStatusBanner(pausedByHover) {
      const statusText = document.getElementById('hubStatusText');
      if (!statusText) return;
      if (!isSpinning) {
        statusText.textContent = "Đã tạm dừng cố định";
        statusText.className = "text-xs font-semibold text-amber-700 bg-amber-50 px-2.5 py-0.5 rounded-full border border-amber-200";
      } else if (pausedByHover) {
        statusText.textContent = "Đang giữ vị trí để đọc chi tiết";
        statusText.className = "text-xs font-semibold text-accent bg-accent-soft px-2.5 py-0.5 rounded-full border border-orange-200";
      } else {
        statusText.textContent = "Đang xoay đồng bộ 360°";
        statusText.className = "text-xs font-semibold text-cyber bg-sapphire-50 px-2.5 py-0.5 rounded-full border border-sapphire-200";
      }
    }

    function toggleWheelSpin() {
      isSpinning = !isSpinning;
      const btnIcon = document.getElementById('spinBtnIcon');
      const btnText = document.getElementById('spinBtnText');

      if (isSpinning) {
        btnIcon.className = "fa-solid fa-pause text-accent";
        btnText.textContent = "Tạm dừng xoay";
      } else {
        btnIcon.className = "fa-solid fa-play text-emerald-600";
        btnText.textContent = "Tiếp tục xoay";
      }
      updateStatusBanner(false);
    }

    function setRotationSpeed(speed, label) {
      rotationSpeed = speed;
      if (!isSpinning) {
        toggleWheelSpin();
      }

      document.querySelectorAll('.speed-btn').forEach(btn => {
        btn.className = "speed-btn px-2.5 py-1 rounded-full font-semibold transition-all text-slate-600 hover:text-sapphire";
      });

      if (label === 'Chậm') {
        document.getElementById('speedSlow').className = "speed-btn px-2.5 py-1 rounded-full font-semibold transition-all bg-sapphire text-white shadow-sm";
      } else if (label === 'Chuẩn') {
        document.getElementById('speedNormal').className = "speed-btn px-2.5 py-1 rounded-full font-semibold transition-all bg-sapphire text-white shadow-sm";
      } else {
        document.getElementById('speedFast').className = "speed-btn px-2.5 py-1 rounded-full font-semibold transition-all bg-sapphire text-white shadow-sm";
      }
    }

    function openMilestoneModal(index) {
      const item = milestones[index]; if (!item || !document.getElementById('milestoneModal')) return;
      document.getElementById('modalIcon').className = `fa-solid ${item.icon} text-xl`;
      document.getElementById('modalCodeBadge').textContent = `DẤU ẤN #${item.code} • ${item.metric}`;
      document.getElementById('modalTitle').textContent = item.title;
      document.getElementById('modalDescription').textContent = item.fullDesc;

      const metricsContainer = document.getElementById('modalMetricsList');
      metricsContainer.innerHTML = item.highlights.map(point => `
        <div class="flex items-center gap-2 bg-white p-2.5 rounded-xl border border-sapphire-100 shadow-sm">
          <i class="fa-solid fa-circle-check text-cyber shrink-0"></i>
          <span class="text-xs font-semibold text-slate-700">${point}</span>
        </div>
      `).join('');

      const modal = document.getElementById('milestoneModal'); if (!modal) return;
      modal.classList.remove('hidden');
      modal.classList.add('flex');
    }

    function openCurrentActiveModal() {
      openMilestoneModal(activeNodeIndex);
    }

    function openHubOverviewModal() { if (!document.getElementById('milestoneModal')) return;
      document.getElementById('modalIcon').className = "fa-solid fa-globe text-xl";
      document.getElementById('modalCodeBadge').textContent = "TRỤC LÕI ĐIỀU HÀNH • SMART HUB";
      document.getElementById('modalTitle').textContent = "TRUNG TÂM ĐIỀU HÀNH & LIÊN THÔNG DỮ LIỆU SỐ";
      document.getElementById('modalDescription').textContent = "Smart Hub là trái tim của hệ sinh thái chuyển đổi số tại Bệnh viện đa khoa khu vực Đăk Hà, kết nối trực tiếp 8 phân hệ trọng yếu theo kiến trúc trục tích hợp (Enterprise Service Bus), đảm bảo mọi luồng dữ liệu y tế được xử lý tức thời, chính xác và bảo mật tuyệt đối.";

      const metricsContainer = document.getElementById('modalMetricsList');
      metricsContainer.innerHTML = `
        <div class="flex items-center gap-2 bg-white p-2.5 rounded-xl border border-sapphire-100 shadow-sm">
          <i class="fa-solid fa-bolt text-accent shrink-0"></i>
          <span class="text-xs font-semibold text-slate-700">Độ trễ đồng bộ < 50ms</span>
        </div>
        <div class="flex items-center gap-2 bg-white p-2.5 rounded-xl border border-sapphire-100 shadow-sm">
          <i class="fa-solid fa-server text-cyber shrink-0"></i>
          <span class="text-xs font-semibold text-slate-700">Uptime hệ thống đạt 99.99%</span>
        </div>
        <div class="flex items-center gap-2 bg-white p-2.5 rounded-xl border border-sapphire-100 shadow-sm">
          <i class="fa-solid fa-shield-halved text-sapphire shrink-0"></i>
          <span class="text-xs font-semibold text-slate-700">Mã hóa đầu cuối chuẩn AES-256</span>
        </div>
        <div class="flex items-center gap-2 bg-white p-2.5 rounded-xl border border-sapphire-100 shadow-sm">
          <i class="fa-solid fa-diagram-project text-emerald-600 shrink-0"></i>
          <span class="text-xs font-semibold text-slate-700">Liên thông 100% chuẩn HL7/XML</span>
        </div>
      `;

      const modal = document.getElementById('milestoneModal'); if (!modal) return;
      modal.classList.remove('hidden');
      modal.classList.add('flex');
    }

    function closeModal() {
      const modal = document.getElementById('milestoneModal'); if (!modal) return;
      modal.classList.add('hidden');
      modal.classList.remove('flex');
    }

    window.addEventListener('DOMContentLoaded', () => {
      initTurbineSystem();
      setActiveMilestone(0);
      turbineFrame = homeMotion.matches ? 0 : requestAnimationFrame(animateTurbineWheel);
    });

    // 3. Hiển thị nút cuộn lên đầu trang khi cuộn
    function initScrollTopVisibility() {
      const btn = document.getElementById('scroll-top-btn'); if (!btn) return;
      window.addEventListener('scroll', () => {
        if (window.scrollY > 400) {
          btn.classList.add('show');
        } else {
          btn.classList.remove('show');
        }
      }, { passive: true });
    }

    // 5. Điều hướng Carousel Trang thiết bị (.container-fluid)
    function scrollEquipment(direction) {
      const track = document.getElementById('equipment-track');
      if (!track) return;
      const card = track.querySelector('.equip-card');
      const distance = card ? (card.offsetWidth + 20) * direction : 320 * direction;
      track.scrollBy({ left: distance, behavior: 'smooth' });
    }

    // 6. Lọc Gói khám nổi bật
    function filterPackages(category) {
      document.querySelectorAll('.pkg-btn').forEach(btn => {
        btn.className = 'pkg-btn px-4 py-2 rounded-xl text-xs sm:text-sm font-semibold bg-white text-slate-700 hover:bg-medical-50 border border-medical-100 transition';
      });
      const activeBtn = document.getElementById('tab-pkg-' + category);
      if (activeBtn) {
        activeBtn.className = 'pkg-btn px-4 py-2 rounded-xl text-xs sm:text-sm font-bold bg-medical-700 text-white shadow-sm transition';
      }
      document.querySelectorAll('.pkg-card').forEach(card => {
        if (category === 'all' || card.getAttribute('data-pkg') === category) {
          card.classList.remove('hidden');
        } else {
          card.classList.add('hidden');
        }
      });
    }

    // 7. Chọn nhanh dịch vụ & Đặt lịch khám
    function selectServiceForBooking(serviceName) {
      window.SiteUI?.scrollTo(document.getElementById('dat-lich-nhanh'), { onComplete: () => document.getElementById('booking-name')?.focus() });

    }

    async function submitQuickBooking(e) {
      e.preventDefault();
      const form = e.target;
      const button = form.querySelector('[type="submit"]');
      if (button.disabled) return;
      const data = new FormData(form);
      const validation = window.QuickAppointmentValidation;
      const name = validation.normalize('full_name', data.get('full_name'));
      const citizenId = validation.normalize('citizen_id', data.get('citizen_id'));
      const phone = validation.normalize('phone', data.get('phone'));
      const errors = validation.errors(form);
      const showErrors = fields => {
        ['full_name', 'citizen_id', 'phone', 'exam_date'].forEach(field => {
          validation.showField(form, field, fields[field]);
        });
        const first = Object.keys(fields)[0];
        if (first) form.elements.namedItem(first)?.focus();
      };
      const summary = document.getElementById('booking-error-summary');
      summary.textContent = '';
      showErrors(errors);
      if (Object.keys(errors).length) return;
      data.set('full_name', name); data.set('citizen_id', citizenId); data.set('phone', phone);
      data.set('csrf_token', window.homeBookingToken);
      button.disabled = true;
      form.setAttribute('aria-busy', 'true');
      try {
        const response = await fetch(form.action, { method: 'POST', body: data });
        const result = await response.json();
        if (!response.ok || result.status !== 200) {
          showErrors(result.errors || {});
          summary.textContent = result.message || 'Không thể gửi đăng ký. Vui lòng thử lại.';
          return;
        }
        document.getElementById('booking-summary').textContent = result.message;
        document.getElementById('booking-modal').classList.remove('hidden');
        form.reset();
      } catch (error) {
        summary.textContent = 'Không thể kết nối máy chủ. Vui lòng thử lại.';
      } finally {
        button.disabled = false;
        form.removeAttribute('aria-busy');
      }
    }

    // ============================================================
    // 10. SLIDER ĐỘI NGŨ BÁC SĨ (tự chuyển 5s, kéo sang trái, thêm 1 bác sĩ bên phải)
    // ============================================================
    const DOCTOR_UNIT = 'Bệnh viện Đa khoa khu vực Đăk Hà';
    const NA = 'Đang cập nhật';
    // Dữ liệu bác sĩ công khai được cung cấp bởi template PHP.
    const DOCTORS = window.homeDoctors || [];

    const docState = { idx: 0, per: 2, timer: null, busy: false, hoverPause: false, modalOpen: false, dragged: false };
    const docTrack = () => document.getElementById('doctor-track');
    const docPerView = () => (window.innerWidth >= 1024 ? 4 : (window.innerWidth >= 640 ? 3 : 2));
    const docFallback = (n) => 'https://placehold.co/500x600/0056b3/ffffff?text=' + encodeURIComponent(n);

    function doctorCardHTML(d, i) {
 d = Object.fromEntries(Object.entries(d).map(([k,v])=>[k, String(v ?? "").replace(/[&<>"']/g,c=>({"&":"&amp;","<":"&lt;",">":"&gt;","\"":"&quot;","'":"&#39;"}[c]))]));
      return `
        <div class="doc-item">
          <article class="doc-card bg-white rounded-3xl overflow-hidden text-slate-800 shadow-floating flex flex-col">
            <div class="relative h-48 sm:h-64 bg-medical-50 overflow-hidden">
              <img src="${d.img}" srcset="${d.srcset || ''}" sizes="(max-width: 639px) 42vw, (max-width: 1023px) 28vw, 300px" decoding="async" loading="lazy" onerror="this.onerror=null;this.src='${docFallback(d.name)}'" alt="${d.name}" class="w-full h-full object-contain object-center" />
            </div>
            <div class="p-3 sm:p-5 flex-1 flex flex-col justify-between gap-3">
              <div>
                <h3 class="font-bold text-[12px] sm:text-base leading-snug text-medical-900">${d.name}</h3>
                <p class="text-[11px] sm:text-sm text-medical-700 font-semibold mt-2">${d.role}</p>
                <p class="text-[11px] sm:text-sm text-slate-600 line-clamp-doc mt-2">${d.dept}</p>
              </div>
              <button type="button" data-doc="${i}" aria-haspopup="dialog" aria-controls="doctor-modal" aria-label="Xem thêm về ${d.name}" class="w-full py-2 sm:py-2.5 rounded-xl bg-medical-700 hover:bg-medical-800 text-white font-bold text-[11px] sm:text-xs transition">
                <span>XEM THÊM</span>
              </button>
            </div>
          </article>
        </div>`;
    }

    function docSetX(animate) {
      const t = docTrack();
      t.style.transition = animate ? 'transform .9s cubic-bezier(.65,0,.35,1)' : 'none';
      t.style.transform = `translateX(${-docState.idx * 100 / docState.per}%)`;
    }

    function buildDoctorSlider() {
      const t = docTrack(); if (!t) return;
      docState.per = docPerView();
      t.style.setProperty('--per', docState.per);
      if(!DOCTORS.length){t.innerHTML='<p class="empty-doctors">Thông tin bác sĩ đang được cập nhật.</p>';return;}
      const head = DOCTORS.map(doctorCardHTML);
      const clones = DOCTORS.slice(0, docState.per).map((d, i) => doctorCardHTML(d, i));
      t.innerHTML = head.concat(clones).join('');
      docState.idx = 0; docState.busy = false;
      docSetX(false);
    }

    function doctorSlide(dir) {
      const t = docTrack(); if (!t || docState.busy || DOCTORS.length <= docState.per) return;
      docState.busy = true;
      const n = DOCTORS.length;
      if (dir > 0) {
        docState.idx += 1; docSetX(true);
        setTimeout(() => { if (docState.idx >= n) { docState.idx = 0; docSetX(false); } docState.busy = false; }, 950);
      } else {
        if (docState.idx === 0) { docState.idx = n; docSetX(false); void t.offsetWidth; }
        docState.idx -= 1; docSetX(true);
        setTimeout(() => { docState.busy = false; }, 950);
      }
      restartDoctorAutoplay();
    }

    function restartDoctorAutoplay() {
      clearInterval(docState.timer);
      if (DOCTORS.length <= docState.per) return;
      if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) return;
      docState.timer = setInterval(() => {
        if (docState.hoverPause || docState.modalOpen || document.hidden || matchMedia('(prefers-reduced-motion: reduce)').matches) return;
        doctorSlide(1);
      }, 5000);
    }

    let doctorModalTrigger = null;
    let doctorBodyOverflow = '';
    function openDoctorModal(i) {
      const d = DOCTORS[i]; if (!d) return;
      const set = (id, v) => { document.getElementById(id).textContent = v; };
      const img = document.getElementById('dm-photo');
      img.onerror = () => { img.onerror = null; img.src = docFallback(d.name); };
      img.src = d.img.replace('w=600', 'w=900'); img.alt = d.name;
      set('dm-name', d.name); set('dm-role', d.role);
      set('dm-dept', d.dept); set('dm-unit', d.unit || DOCTOR_UNIT);
      set('dm-dob', d.dob || NA); set('dm-home', d.hometown || NA); set('dm-code', d.code || NA);
      set('dm-status-text', d.status || 'Đang công tác');
      doctorModalTrigger = document.activeElement;
      doctorBodyOverflow = document.body.style.overflow;
      document.getElementById('doctor-modal').classList.add('open');
      document.getElementById('doctor-modal').classList.remove('hidden');
      document.body.style.overflow = 'hidden'; window.SiteUI?.stop();
      docState.modalOpen = true;
      document.querySelector('#doctor-modal button').focus();
    }
    function closeDoctorModal() {
      const m = document.getElementById('doctor-modal');
      m.classList.remove('open'); m.classList.add('hidden');
      document.body.style.overflow = doctorBodyOverflow; window.SiteUI?.start();
      docState.modalOpen = false;
      if (doctorModalTrigger && doctorModalTrigger.isConnected) doctorModalTrigger.focus();
    }

    document.addEventListener('DOMContentLoaded', () => {
      const vp = document.getElementById('doctor-slider'); if (!vp) return;
      buildDoctorSlider(); restartDoctorAutoplay();

      // Chỉ nút Xem thêm mở modal; nút HTML hỗ trợ Enter/Space mặc định.
      vp.addEventListener('click', (e) => {
        if (docState.dragged) { docState.dragged = false; return; }
        const button = e.target.closest('button[data-doc]');
        if (button) openDoctorModal(+button.dataset.doc);
      });

      // Tạm dừng khi rê chuột / chạm
      vp.addEventListener('mouseenter', () => docState.hoverPause = true);
      vp.addEventListener('mouseleave', () => docState.hoverPause = false);

      // Vuốt trái/phải trên điện thoại
      let sx = 0, sy = 0, down = false;
      vp.addEventListener('pointerdown', (e) => { down = true; sx = e.clientX; sy = e.clientY; docState.dragged = false; docState.hoverPause = true; });
      const end = (e) => {
        if (!down) return; down = false;
        const dx = e.clientX - sx, dy = e.clientY - sy;
        if (Math.abs(dx) > 40 && Math.abs(dx) > Math.abs(dy)) { docState.dragged = true; doctorSlide(dx < 0 ? 1 : -1); }
        if (e.pointerType !== 'mouse') setTimeout(() => docState.hoverPause = false, 1500); else docState.hoverPause = false;
      };
      vp.addEventListener('pointerup', end);
      vp.addEventListener('pointercancel', () => { down = false; docState.hoverPause = false; });

      document.addEventListener('keydown', (e) => {
        if (!docState.modalOpen) return;
        if (e.key === 'Escape') closeDoctorModal();
        if (e.key === 'Tab') {
          const buttons = document.querySelectorAll('#doctor-modal button');
          const first = buttons[0], last = buttons[buttons.length - 1];
          if (e.shiftKey && document.activeElement === first) { e.preventDefault(); last.focus(); }
          else if (!e.shiftKey && document.activeElement === last) { e.preventDefault(); first.focus(); }
        }
      });

      let rz; window.addEventListener('resize', () => {
        clearTimeout(rz);
        rz = setTimeout(() => { if (docPerView() !== docState.per) buildDoctorSlider(); }, 200);
      });
    });
  
document.querySelectorAll('#home-design [data-service]').forEach(button=>button.addEventListener('click',()=>selectServiceForBooking(button.dataset.service)));
