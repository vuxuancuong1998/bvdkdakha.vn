  <?php
  $crumbPath = trim(parse_url($_SERVER['REQUEST_URI'] ?? '/', PHP_URL_PATH), '/');
  $crumbPath = preg_replace('~^bvdkdakha\.vn/?~', '', $crumbPath);
  $crumbLabels = array(
    'hoat-dong/lich-cong-tac.html' => 'Lịch công tác',
    'hoat-dong/dao-tao-tap-huan.html' => 'Đào tạo và tập huấn',
    'hoat-dong/chien-dich-y-te.html' => 'Chiến dịch y tế',
    'tin-tuc.html' => 'Tin tức',
    'tin-tuc-su-kien.html' => 'Tin tức',
    'dich-vu-y-te.html' => 'Dịch vụ y tế',
    'dich-vu.html' => 'Dịch vụ y tế',
    'doi-ngu-bac-si.html' => 'Đội ngũ bác sĩ',
    'bac-si.html' => 'Đội ngũ bác sĩ',
    'lien-he.html' => 'Liên hệ'
  );
  $crumbSegments = array_values(array_filter(explode('/', $crumbPath)));
  $crumbSlug = end($crumbSegments);
  $crumbTitle = $crumbLabels[$crumbPath] ?? ($page->page_title ?? $news_detail->event_name ?? $news_detail->title ?? $service['title'] ?? $medical_campaign->title ?? null);
  if ($crumbPath === '' || $crumbPath === 'index.html') $crumbTitle = 'Trang chủ';
  if (!$crumbTitle && $crumbSlug) {
    $crumbTitle = ucwords(str_replace('-', ' ', preg_replace('/\.html$/', '', $crumbSlug)));
  }
  $crumbParent = null;
  if (strpos($crumbPath, 'chi-tiet-tin-tuc/') === 0 || strpos($crumbPath, 'tin-tuc/') === 0) {
    $crumbParent = array('Tin tức', XC_URL . '/tin-tuc.html');
  } elseif (strpos($crumbPath, 'dich-vu/') === 0 || strpos($crumbPath, 'dich-vu-y-te/') === 0) {
    $crumbParent = array('Dịch vụ y tế', XC_URL . '/dich-vu-y-te.html');
  } elseif (strpos($crumbPath, 'hoat-dong/chien-dich-y-te/') === 0) {
    $crumbParent = array('Chiến dịch y tế', XC_URL . '/hoat-dong/chien-dich-y-te.html');
  }
  if ($crumbPath !== '' && $crumbPath !== 'index.html' && strpos($crumbPath, 'lay-giay-tt25') !== 0):
  ?>
  <nav class="breadcrumb" aria-label="breadcrumb">
    <div class="container"><ol class="breadcrumb-list" itemscope itemtype="https://schema.org/BreadcrumbList">
      <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><?php if ($crumbPath !== '' && $crumbPath !== 'index.html'): ?><a href="<?php echo XC_URL; ?>/" itemprop="item"><span itemprop="name">Trang chủ</span></a><?php else: ?><span itemprop="name">Trang chủ</span><?php endif; ?><meta itemprop="position" content="1" /></li>
      <?php if ($crumbParent): ?><li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><a href="<?php echo htmlspecialchars($crumbParent[1], ENT_QUOTES, 'UTF-8'); ?>" itemprop="item"><span itemprop="name"><?php echo htmlspecialchars($crumbParent[0], ENT_QUOTES, 'UTF-8'); ?></span></a><meta itemprop="position" content="2" /></li><?php endif; ?>
      <?php if ($crumbPath !== '' && $crumbPath !== 'index.html'): ?><li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem"><span itemprop="name"><?php echo htmlspecialchars((string)$crumbTitle, ENT_QUOTES, 'UTF-8'); ?></span><meta itemprop="position" content="<?php echo $crumbParent ? 3 : 2; ?>" /></li><?php endif; ?>
    </ol></div>
  </nav>
  <?php endif; ?>

