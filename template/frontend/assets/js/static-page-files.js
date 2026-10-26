/* The name link is the single source for both preview and download actions. */
(function () {
  'use strict';
  document.querySelectorAll('.static-article .static-file-links').forEach(function (source) {
    const box = document.createElement('section');
    box.className = 'attachments-box static-content-attachments';
    box.setAttribute('aria-label', 'Tài liệu đính kèm');
    const heading = document.createElement('div');
    heading.className = 'attachments-heading';
    heading.innerHTML = '<h2>Tài liệu đính kèm</h2><span>Thao tác</span>';
    const list = document.createElement('div');
    list.className = 'attachment-list';

    source.querySelectorAll('a[href]').forEach(function (link) {
      let url;
      try { url = new URL(link.getAttribute('href'), window.location.href); } catch (error) { return; }
      if (!['http:', 'https:'].includes(url.protocol)) return;
      const name = link.textContent.trim() || decodeURIComponent(url.pathname.split('/').pop());
      const ext = (url.pathname.split('.').pop() || '').toLowerCase();
      const row = document.createElement('div');
      row.className = 'attachment-item';
      const info = document.createElement('div');
      info.className = 'attachment-info';
      const icon = document.createElement('span');
      icon.className = 'attachment-file-icon';
      icon.setAttribute('aria-hidden', 'true');
      const iconTypes = { pdf: 'pdf', doc: 'word', docx: 'word', xls: 'excel', xlsx: 'excel', ppt: 'powerpoint', pptx: 'powerpoint', jpg: 'image', jpeg: 'image', png: 'image', webp: 'image', zip: 'zipper', rar: 'zipper' };
      icon.innerHTML = '<i class="fa-solid fa-file' + (iconTypes[ext] ? '-' + iconTypes[ext] : '') + '"></i>';
      const details = document.createElement('div');
      details.className = 'attachment-name-wrap';
      const label = document.createElement('strong');
      label.textContent = name;
      label.title = name;
      details.appendChild(label);
      const size = link.parentElement.querySelector('.static-file-size');
      if (size && size.textContent.trim()) {
        const badge = document.createElement('span');
        badge.className = 'attachment-size';
        badge.textContent = size.textContent.trim();
        details.appendChild(badge);
      }
      info.append(icon, details);
      const actions = document.createElement('div');
      actions.className = 'attachment-actions';
      const view = document.createElement('button');
      view.type = 'button';
      view.className = 'attachment-view-btn';
      view.dataset.url = url.href;
      view.dataset.name = name;
      view.dataset.ext = ext;
      view.setAttribute('aria-label', 'Xem ' + name);
      view.innerHTML = '<i class="fa-regular fa-eye" aria-hidden="true"></i><span>Xem</span>';
      view.addEventListener('click', function () {
        const viewer = document.getElementById('inlineDocumentViewer');
        box.appendChild(viewer);
        showInlineAttachment(view);
      });
      const download = document.createElement('a');
      download.className = 'attachment-download-btn';
      download.href = url.href;
      download.download = name;
      download.setAttribute('aria-label', 'Tải về ' + name);
      download.innerHTML = '<i class="fa-solid fa-download" aria-hidden="true"></i><span>Tải về</span>';
      actions.append(view, download);
      row.append(info, actions);
      list.appendChild(row);
    });
    if (list.childElementCount) {
      box.append(heading, list);
      source.replaceWith(box);
    }
  });
})();
