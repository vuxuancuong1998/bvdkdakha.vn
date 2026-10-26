<?php
global $db;
$homeEquipment = array();
$db->query("SHOW TABLES LIKE 'hicrm_equipment'");
if ($db->num_row() > 0) {
 $db->query('SELECT name,manufacturer,origin,description,image_path FROM hicrm_equipment WHERE status=1 ORDER BY sort_order ASC,id ASC');
 $homeEquipment = $db->fetch_object();
}
?>
<?php if (!empty($homeEquipment)): ?>
    <section id="thiet-bi-hien-dai" class="py-16 sm:py-24 section-mist">
      <div class="container-fluid">
        <div class="text-center max-w-3xl mx-auto mb-12" data-reveal>
          <span class="text-xs font-bold uppercase tracking-widest text-medical-700 bg-medical-50 px-4 py-1.5 rounded-full border border-medical-200">
            Công Nghệ Chẩn Đoán Đỉnh Cao
          </span>
          <h2 class="font-extrabold text-2xl sm:text-3xl lg:text-4xl text-medical-900 mt-3">
            HỆ THỐNG TRANG THIẾT BỊ Y TẾ HIỆN ĐẠI
          </h2>
          <p class="text-slate-500 text-sm sm:text-base mt-2">
            Trang thiết bị phục vụ công tác khám, chẩn đoán và điều trị tại bệnh viện.
          </p>
        </div>

        <div class="relative">
          <!-- Nút điều hướng tròn nổi bên trái (Chuẩn vị trí hình mẫu) -->
          <button onclick="scrollEquipment(-1)" aria-label="Thiết bị trước"
            class="flex absolute left-2 sm:left-2 xl:-left-3 top-[44%] -translate-y-1/2 z-30 w-11 h-11 rounded-full bg-white hover:bg-medical-700 text-medical-800 hover:text-white border border-medical-700/60 shadow-lg items-center justify-center transition">
            <i class="fa-solid fa-arrow-left text-sm"></i>
          </button>

          <!-- Nút điều hướng tròn nổi bên phải (Chuẩn vị trí hình mẫu) -->
          <button onclick="scrollEquipment(1)" aria-label="Thiết bị tiếp theo"
            class="flex absolute right-2 sm:right-2 xl:-right-3 top-[44%] -translate-y-1/2 z-30 w-11 h-11 rounded-full bg-white hover:bg-medical-700 text-medical-800 hover:text-white border border-medical-700/60 shadow-lg items-center justify-center transition">
            <i class="fa-solid fa-arrow-right text-sm"></i>
          </button>

          <!-- Dải 6 Thẻ Thiết Bị -->
          <div id="equipment-track" data-stagger-group
            class="grid grid-flow-col auto-cols-[86%] sm:auto-cols-[46%] md:auto-cols-[31.5%] xl:auto-cols-[calc((100%-5*1.25rem)/6)] gap-5 overflow-x-auto scroll-smooth no-scrollbar py-3 px-1">

            <!-- Thiết bị 1: MAMMOMAT INSPIRATION -->
            <?php foreach ($homeEquipment as $equipment): ?>
<article data-reveal class="equip-card bg-white rounded-2xl p-4 sm:p-5 border border-slate-100 shadow-pearl flex flex-col h-full">
 <div class="h-56 sm:h-60 rounded-xl bg-[#f6f7f9] flex items-center justify-center p-4 overflow-hidden">
  <img class="w-full h-full object-contain" src="<?php echo $siteEsc($homeAsset($equipment->image_path)); ?>" alt="<?php echo $siteEsc($equipment->name); ?>" loading="lazy" width="240" height="240">
 </div>
 <h3 class="font-bold text-[15px] text-slate-800 leading-snug mt-4 mb-3 min-h-[62px]"><?php echo $siteEsc($equipment->name); ?></h3>
 <div class="bg-[#f0f7ff] border border-medical-100 rounded-lg py-2.5 px-3 mb-3.5 grid grid-cols-2 items-center">
  <div class="pr-2.5 border-r border-medical-300"><span class="block text-[11px] text-medical-700">Hãng</span><span class="block text-xs sm:text-[13px] font-bold text-medical-900"><?php echo $siteEsc($equipment->manufacturer); ?></span></div>
  <div class="pl-3"><span class="block text-[11px] text-medical-700">Xuất xứ</span><span class="block text-xs sm:text-[13px] font-bold text-medical-900"><?php echo $siteEsc($equipment->origin); ?></span></div>
 </div>
 <p class="text-[13px] text-slate-600 leading-relaxed"><?php echo nl2br($siteEsc($equipment->description)); ?></p>
</article>
<?php endforeach; ?>

          </div>
        </div>
      </div>
    </section>
<?php endif; ?>
