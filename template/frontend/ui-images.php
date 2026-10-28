<?php
// Only serve pre-generated local derivatives; do not modify original uploads.
function site_image_url($url) {
    $url = html_entity_decode((string)$url, ENT_QUOTES, 'UTF-8');
    $path = ltrim((string)parse_url($url, PHP_URL_PATH), '/');
    $base = trim((string)parse_url(XC_URL, PHP_URL_PATH), '/');
    if ($base !== '' && strpos($path, $base.'/') === 0) $path = substr($path, strlen($base) + 1);
    $host = parse_url($url, PHP_URL_HOST);
    $local = !$host || strcasecmp($host, (string)parse_url(XC_URL, PHP_URL_HOST)) === 0;
    if ($local && strpos($path, 'assets/images/') === 0 && strpos($path, '..') === false
        && !is_file(__SITE_PATH.'/'.$path) && is_file(__DIR__.'/'.$path)) {
        return XC_URL.'/template/frontend/'.$path;
    }
    return $url;
}

function site_image_data($url) {
    static $manifest = null;
    if ($manifest === null) {
        $file = __DIR__.'/assets/images/optimized/manifest.json';
        $manifest = is_file($file) ? json_decode(file_get_contents($file), true) : array();
        if (!is_array($manifest)) $manifest = array();
    }
    $url = site_image_url($url);
    $basePath = rtrim((string)parse_url(XC_URL, PHP_URL_PATH), '/');
    $host = parse_url($url, PHP_URL_HOST);
    if ($host && strcasecmp($host, (string)parse_url(XC_URL, PHP_URL_HOST)) !== 0) return null;
    $path = rawurldecode((string)parse_url($url, PHP_URL_PATH));
    if ($basePath !== '' && strpos($path, $basePath.'/') === 0) $path = substr($path, strlen($basePath));
    $path = ltrim($path, '/');
    if (!isset($manifest[$path]) || strpos($path, '..') !== false) return null;
    $data = $manifest[$path];
    $source = __SITE_PATH.'/'.$path;
    if (!is_file($source) || filesize($source) !== $data['bytes'] || filemtime($source) !== $data['mtime']) return null;
    $data['variants'] = array_values(array_filter($data['variants'], function($variant) {
        return is_file(__SITE_PATH.'/'.$variant['path']);
    }));
    return $data;
}

function site_image_srcset($url) {
    $data = site_image_data($url);
    if (!$data || !$data['variants']) return '';
    return implode(', ', array_map(function($variant) {
        return XC_URL.'/'.$variant['path'].' '.$variant['width'].'w';
    }, $data['variants']));
}

function site_image_attributes($url, $sizes = '100vw', $priority = false, $dimensions = true) {
    $escape = function($value) { return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8'); };
    $url = site_image_url($url);
    $data = site_image_data($url);
    $attributes = '';
    if ($data) {
        if ($dimensions) $attributes .= ' width="'.(int)$data['width'].'" height="'.(int)$data['height'].'"';
        if ($data['variants']) {
            $variants = $data['variants'];
            $default = $variants[count($variants) - 1];
            foreach ($variants as $variant) { if ($variant['width'] >= 800) { $default = $variant; break; } }
            $url = XC_URL.'/'.$default['path'];
            $sources = array_map(function($variant) { return XC_URL.'/'.$variant['path'].' '.$variant['width'].'w'; }, $variants);
            $attributes .= ' srcset="'.$escape(implode(', ', $sources)).'" sizes="'.$escape($sizes).'"';
        }
    }
    return 'src="'.$escape($url).'"'.$attributes.' decoding="async"'.($priority ? ' loading="eager"'.($priority === true ? ' fetchpriority="high"' : '') : ' loading="lazy"');
}

// Enrich existing rich-text image markup only when rendering; CMS data is intact.
function site_content_images($html, $firstIsPrimary = false) {
    $index = 0;
    return preg_replace_callback('~<img\b(?:"[^"]*"|\x27[^\x27]*\x27|[^\x27">])*>~is', function($match) use (&$index, $firstIsPrimary) {
        $tag = $match[0];
        if (!preg_match('~\bsrc\s*=\s*(["\x27])(.*?)\1~is', $tag, $src)) return $tag;
        if (preg_match('~\bsrcset\s*=~i', $tag)) return $tag;
        $primary = $firstIsPrimary && $index++ === 0;
        $dimensions = !preg_match('~\b(?:width|height)\s*=~i', $tag);
        $tag = str_replace($src[0], '', $tag);
        $tag = preg_replace('~\s+(?:loading|decoding|fetchpriority|sizes)\s*=\s*(["\x27]).*?\1~is', '', $tag);
        $attributes = site_image_attributes($src[2], '(max-width: 767px) calc(100vw - 80px), (max-width: 1023px) 65vw, 860px', $primary, $dimensions);
        return preg_replace('~<img\b~i', '<img '.$attributes, $tag, 1);
    }, (string)$html);
}
