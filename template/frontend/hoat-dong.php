<?php require_once 'header.php'; $groups=is_array($activity_groups??null)?$activity_groups:array( 'work_schedule'=>array(),'training_plan'=>array(),'medical_campaign'=>array()); $scheduleMap=is_array($activity_schedule_items??null)?$activity_schedule_items:array();$attachmentMap=is_array($activity_attachments??null)?$activity_attachments:array(); function actH($v){return htmlspecialchars((string)$v,ENT_QUOTES,'UTF-8');} function actFileUrl($f){return XC_URL.'/uploads/activities/'.rawurlencode($f->file_path);} function actIsPdf($f){return strtolower(pathinfo($f->file_path,PATHINFO_EXTENSION))==='pdf';} function actDate($v,$format='d/m/Y'){return $v&&strtotime($v)?date($format,strtotime($v)):'Chưa cập nhật';} ?>
<style>
    #activity-page {
        --act-blue: #1760a5;
        --act-orange: #e36928;
        --act-text: #1e293b;
        --act-muted: #64748b;
        background: #f8fafc;
        color: var(--act-text);
        padding: 28px 0 46px;
        font-family: var(--font-primary)
    }
    
    #activity-page * {
        box-sizing: border-box
    }
    
    #activity-page .act-container {
        width: min(1240px, calc(100% - 30px));
        margin: auto
    }
    
    #activity-page .act-hero,
    #activity-page .act-tabs,
    #activity-page .act-panel,
    #activity-page .act-card {
        background: #fff;
        border: 1px solid #e2e8f0;
        border-radius: 18px;
        box-shadow: 0 3px 14px rgba(15, 23, 42, .05)
    }
    
    #activity-page .act-hero {
        padding: 25px;
        margin-bottom: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 20px
    }
    
    #activity-page .act-kicker {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        color: var(--act-blue);
        font-size: 12px;
        font-weight: 700;
        text-transform: uppercase;
        background: #eff6ff;
        border: 1px solid #bfdbfe;
        border-radius: 99px;
        padding: 6px 11px
    }
    
    #activity-page .act-kicker:before {
        content: "";
        width: 8px;
        height: 8px;
        background: var(--act-blue);
        border-radius: 50%
    }
    
    #activity-page h1 {
        font-size: 25px;
        line-height: 1.3;
        margin: 10px 0 5px;
        font-weight: 800;
        color: #0f172a
    }
    
    #activity-page .act-hero p {
        margin: 0;
        color: var(--act-muted);
        font-size: 14px
    }
    
    #activity-page .act-print {
        border: 0;
        border-radius: 11px;
        background: var(--act-blue);
        color: #fff;
        padding: 10px 15px;
        font-weight: 700;
        white-space: nowrap
    }
    
    #activity-page .act-tabs {
        padding: 7px;
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 7px;
    }
    
    #activity-page .act-tab {
        border: 0;
        border-radius: 12px;
        padding: 13px 10px;
        background: #f1f5f9;
        color: #475569;
        font-weight: 700;
        cursor: pointer;
        transition: .2s
    }
    
    #activity-page .act-tab.active {
        background: var(--act-blue);
        color: #fff;
        box-shadow: 0 5px 13px rgba(23, 96, 165, .2)
    }
    
    #activity-page .act-module {
        display: none
    }
    
    #activity-page .act-module.active {
        display: block
    }
    
    #activity-page .act-panel {
        overflow: hidden;
        margin-bottom: 18px
    }
    
    #activity-page .act-panel-head {
        padding: 17px 20px;
        border-bottom: 1px solid #e2e8f0;
        display: flex;
        justify-content: space-between;
        gap: 14px;
        align-items: flex-start;
        background: #f8fafc
    }
    
    #activity-page .act-panel-head h2 {
        font-size: 17px;
        line-height: 1.4;
        margin: 0 0 5px;
        color: #0f172a
    }
    
    #activity-page .act-meta {
        display: flex;
        gap: 13px;
        flex-wrap: wrap;
        color: var(--act-muted);
        font-size: 12px
    }
    
    #activity-page .act-content {
        padding: 20px;
        font-size: 14px;
        line-height: 1.7
    }
    
    #activity-page .act-summary {
        margin: 0 0 14px;
        color: #475569
    }
    
    #activity-page .act-rich img {
        max-width: 100%;
        height: auto
    }
    
    #activity-page .act-rich table {
        max-width: 100%
    }
    
    #activity-page .act-badge {
        display: inline-block;
        background: #ecfdf5;
        color: #047857;
        border: 1px solid #a7f3d0;
        border-radius: 99px;
        padding: 5px 9px;
        font-size: 11px;
        font-weight: 700;
        white-space: nowrap
    }
    
    #activity-page .act-schedule-wrap {
        overflow-x: auto
    }
    
    #activity-page .act-schedule {
        width: 100%;
        border-collapse: collapse;
        font-size: 13px;
        min-width: 850px
    }
    
    #activity-page .act-schedule th {
        background: #eff6ff;
        color: #174c79;
        text-align: left;
        padding: 12px;
        border: 1px solid #dbeafe
    }
    
    #activity-page .act-schedule td {
        padding: 12px;
        border: 1px solid #e2e8f0;
        vertical-align: top
    }
    
    #activity-page .act-time {
        font-weight: 700;
        color: var(--act-blue);
        white-space: nowrap
    }
    
    #activity-page .act-files {
        border-top: 1px solid #e2e8f0
    }
    
    #activity-page .act-file {
        padding: 13px 18px;
        background: #f8fafc;
        border-bottom: 1px solid #e2e8f0
    }
    
    #activity-page .act-file:last-child {
        border-bottom: 0
    }
    
    #activity-page .act-file-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 15px
    }
    
    #activity-page .act-file-name {
        font-size: 13px;
        font-weight: 700;
        color: #334155;
        min-width: 0;
        overflow-wrap: anywhere
    }
    
    #activity-page .act-file-name i {
        color: #dc2626;
        margin-right: 7px
    }
    
    #activity-page .act-file-actions {
        display: flex;
        gap: 7px;
        flex: none
    }
    
    #activity-page .act-file-actions button,
    #activity-page .act-file-actions a {
        border: 0;
        border-radius: 9px;
        color: #fff;
        padding: 8px 12px;
        text-decoration: none;
        font-size: 12px;
        font-weight: 700
    }
    
    #activity-page .act-view {
        background: var(--act-blue)
    }
    
    #activity-page .act-download {
        background: var(--act-orange)
    }
    
    #activity-page .act-pdf {
        display: none;
        height: 650px;
        margin-top: 12px;
        border: 1px solid #334155;
        border-radius: 10px;
        overflow: hidden;
        background: #0f172a
    }
    
    #activity-page .act-pdf.open {
        display: block
    }
    
    #activity-page .act-pdf iframe {
        width: 100%;
        height: 100%;
        border: 0;
        background: #fff
    }
    
    #activity-page .act-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 18px
    }
    
    #activity-page .act-card {
        overflow: hidden
    }
    
    #activity-page .act-thumb {
        height: 210px;
        background: #e2e8f0
    }
    
    #activity-page .act-thumb img {
        width: 100%;
        height: 100%;
        object-fit: cover
    }
    
    #activity-page .act-card-body {
        padding: 18px
    }
    
    #activity-page .act-card h2 {
        font-size: 18px;
        line-height: 1.4;
        margin: 8px 0;
        color: #0f172a
    }
    
    #activity-page .act-contact {
        padding: 10px 12px;
        border-radius: 10px;
        background: #fff7ed;
        color: #9a3412;
        font-size: 13px;
        margin-top: 13px
    }
    
    #activity-page .act-empty {
        text-align: center;
        padding: 55px 20px;
        background: #fff;
        border: 1px dashed #cbd5e1;
        border-radius: 16px;
        color: #64748b
    }
    
    #activity-page .act-mobile-schedule {
        display: none
    }
    
    @media(max-width:767px) {
        #activity-page {
            padding-top: 16px
        }
        #activity-page .act-container {
            width: min(100% - 20px, 1240px)
        }
        #activity-page .act-hero {
            padding: 18px;
            display: block
        }
        #activity-page h1 {
            font-size: 20px
        }
        #activity-page .act-print {
            margin-top: 14px;
            width: 100%
        }
        #activity-page .act-tabs {
            grid-template-columns: 1fr
        }
        #activity-page .act-tab {
            text-align: left
        }
        #activity-page .act-panel-head {
            display: block;
            padding: 15px
        }
        #activity-page .act-badge {
            margin-top: 10px
        }
        #activity-page .act-content {
            padding: 15px
        }
        #activity-page .act-grid {
            grid-template-columns: 1fr
        }
        #activity-page .act-thumb {
            height: 185px
        }
        #activity-page .act-file-row {
            display: block
        }
        #activity-page .act-file-actions {
            margin-top: 10px
        }
        #activity-page .act-file-actions button,
        #activity-page .act-file-actions a {
            flex: 1;
            text-align: center
        }
        #activity-page .act-pdf {
            height: 70vh;
            min-height: 430px
        }
        #activity-page .act-schedule-wrap {
            display: none
        }
        #activity-page .act-mobile-schedule {
            display: grid;
            gap: 10px
        }
        #activity-page .act-schedule-item {
            border: 1px solid #e2e8f0;
            border-left: 4px solid var(--act-blue);
            border-radius: 10px;
            padding: 12px
        }
        #activity-page .act-schedule-item strong {
            display: block;
            margin: 5px 0
        }
        #activity-page .act-schedule-item small {
            display: block;
            color: #64748b;
            margin-top: 4px
        }
    }
    
    @media print {
        header,
        footer,
        #activity-page .act-tabs,
        #activity-page .act-print,
        #activity-page .act-file-actions {
            display: none!important
        }
        #activity-page .act-module {
            display: block!important
        }
        #activity-page {
            background: #fff;
            padding: 0
        }
        #activity-page .act-panel,
        #activity-page .act-card {
            box-shadow: none;
            break-inside: avoid
        }
    }
</style>
<style>
    #activity-page .electronic-schedule {
        border: 1px solid #e2e8f0;
        background: #fff;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 4px 18px rgba(15, 23, 42, .05)
    }
    
    #activity-page .electronic-schedule-title {
        display: flex;
        align-items: center;
        gap: 12px;
        background: #fff;
        color: #163b60;
        padding: 20px 24px 12px;
        font-size: 20px;
        font-weight: 700
    }
    
    #activity-page .electronic-schedule-icon {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 38px;
        height: 38px;
        background: #eaf3fb;
        color: #1760a5;
        border-radius: 9px;
        font-size: 17px
    }
    
    #activity-page .electronic-schedule-icon i {
        transform: none
    }
    
    #activity-page .electronic-schedule-picker {
        display: grid;
        grid-template-columns: 78px minmax(0, 1fr) 105px;
        gap: 12px;
        align-items: center;
        padding: 12px 24px 20px;
        background: #fff;
        border-bottom: 1px solid #e2e8f0
    }
    
    #activity-page .electronic-schedule-picker label {
        font-size: 13px;
        font-weight: 800;
        text-transform: uppercase;
        margin: 0
    }
    
    #activity-page .electronic-schedule-picker select {
        width: 100%;
        height: 46px;
        border: 1px solid #cbd5e1;
        border-radius: 8px;
        background: #fff;
        padding: 0 12px;
        color: #263648
    }
    
    #activity-page .electronic-schedule-picker button {
        height: 47px;
        border: 0;
        border-radius: 8px;
        background: #1760a5;
        color: #fff;
        font-size: 13px;
        font-weight: 800;
        text-transform: uppercase;
        cursor: pointer
    }
    
    #activity-page .electronic-schedule-toolbar {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 15px;
        padding: 13px 24px;
        color: #475569;
        font-size: 14px;
        font-weight: 800;
        text-transform: none;
        border-bottom: 1px solid #d7dee8
    }
    
    #activity-page .electronic-schedule-toolbar a {
        display: none;
        background: #1760a5;
        color: #fff!important;
        text-decoration: none;
        padding: 9px 14px;
        border-radius: 8px;
        font-size: 12px;
        white-space: nowrap
    }
    
    #activity-page .electronic-schedule-notice {
        padding: 16px 14px;
        background: #53585c;
        color: #fff;
        font-size: 16px;
        font-weight: 700
    }
    
    #activity-page .electronic-schedule-viewer {
        display: none;
        height: 760px;
        background: #3f4448;
        border-top: 1px solid #cbd5e1
    }
    
    #activity-page .electronic-schedule-viewer.is-visible {
        display: block
    }
    
    #activity-page .electronic-schedule-viewer iframe {
        display: block;
        width: 100%;
        height: 100%;
        border: 0;
        background: #fff
    }
    
    #activity-page .electronic-schedule-error {
        display: none;
        padding: 18px 20px;
        background: #53585c;
        color: #fff;
        font-weight: 700
    }
    
    #activity-page .electronic-schedule-error.is-visible {
        display: block
    }
    
    @media(max-width:767px) {
        #activity-page .electronic-schedule-title {
            padding: 18px;
            font-size: 19px
        }
        #activity-page .electronic-schedule-icon {
            width: 44px;
            height: 38px;
            font-size: 20px
        }
        #activity-page .electronic-schedule-picker {
            grid-template-columns: 1fr;
            padding: 15px
        }
        #activity-page .electronic-schedule-picker label {
            display: block
        }
        #activity-page .electronic-schedule-picker button {
            width: 100%
        }
        #activity-page .electronic-schedule-toolbar {
            align-items: flex-start;
            flex-direction: column;
            padding: 12px 15px
        }
        #activity-page .electronic-schedule-toolbar a {
            width: 100%;
            text-align: center
        }
        #activity-page .electronic-schedule-viewer {
            height: 72vh;
            min-height: 480px
        }
    }
</style>
<main id="activity-page">
    <div class="act-container">
        
        <!-- <nav class="act-tabs" aria-label="Phân loại hoạt động">
            <button class="act-tab active" data-tab="schedule">1. Lịch công tác đơn vị</button>
            <button class="act-tab" data-tab="training">2. Đào tạo & tập huấn</button>
            <button class="act-tab" data-tab="campaign">3. Khám nhân đạo & truyền thông</button>
        </nav> -->
        <section class="act-module active" id="act-module-schedule">
            <div class="electronic-schedule" id="lich-cong-tac">
                <div class="electronic-schedule-title"><span class="electronic-schedule-icon"><i class="fa-solid fa-calendar-check"></i></span><span>Lịch công tác điện tử</span>
                </div>
                <div class="electronic-schedule-picker">
                    <label for="activity-schedule-select">Chọn lịch:</label>
                    <select id="activity-schedule-select">
                        <option value="">-- Vui lòng chọn tuần công tác --</option>
                        <?php foreach($groups[ 'work_schedule'] as $a):$files=$attachmentMap[intval($a->id)]??array();$pdfUrl='';foreach($files as $f){if(actIsPdf($f)){$pdfUrl=actFileUrl($f);break;}}?>
                        <option value="<?php echo intval($a->id);?>" data-pdf="<?php echo actH($pdfUrl);?>">
                            <?php echo actH(($a->work_week?$a->work_week.' - ':'').$a->title.' - '.(($a->organization_block??'')==='leadership'?'Ban lãnh đạo':'Các khoa phòng'));?></option>
                        <?php endforeach;?>
                    </select>
                    <button type="button" id="activity-schedule-view">Xem lịch</button>
                </div>
                <div class="electronic-schedule-toolbar"><span id="activity-schedule-message">Vui lòng chọn tuần công tác</span><a id="activity-schedule-download" href="#" download><i class="fa-solid fa-download me-1"></i>Tải PDF</a>
                </div>
                <?php if(empty($groups[ 'work_schedule'])):?>
                <div class="electronic-schedule-notice">Hiện tại không có lịch công tác nào!</div>
                <?php endif;?>
                <div class="electronic-schedule-error" id="activity-schedule-error">Lịch công tác này chưa có file PDF.</div>
                <div class="electronic-schedule-viewer" id="activity-schedule-viewer">
                    <iframe id="activity-schedule-pdf" title="Xem lịch công tác PDF"></iframe>
                </div>
            </div>
        </section>
    </div>
</main>
<?php function activityFrontendFiles($files){ob_start();if($files):?>
<div class="act-files">
    <?php foreach($files as $f):$url=actFileUrl($f);$pdf=actIsPdf($f);$viewer='activity-pdf-' .intval($f->id);?>
    <div class="act-file">
        <div class="act-file-row">
            <div class="act-file-name"><i class="fa-solid fa-file-pdf"></i>
                <?php echo actH($f->file_name);?></div>
            <div class="act-file-actions">
                <?php if($pdf):?>
                <button type="button" class="act-view" data-pdf-target="<?php echo $viewer;?>">Xem PDF</button>
                <?php endif;?><a class="act-download" href="<?php echo $url;?>" download>Tải về</a>
            </div>
        </div>
        <?php if($pdf):?>
        <div class="act-pdf" id="<?php echo $viewer;?>">
            <iframe loading="lazy" data-src="<?php echo $url;?>#toolbar=1&navpanes=0" title="<?php echo actH($f->file_name);?>"></iframe>
        </div>
        <?php endif;?>
    </div>
    <?php endforeach;?>
</div>
<?php endif;return ob_get_clean();} function activityFrontendCard($a,$files,$badge){ob_start();?>
<article class="act-card">
    <?php if($a->thumbnail):?>
    <div class="act-thumb"><img loading="lazy" src="<?php echo XC_URL.'/uploads/activities/'.rawurlencode($a->thumbnail);?>" alt="<?php echo actH($a->title);?>">
    </div>
    <?php endif;?>
    <div class="act-card-body"><span class="act-badge"><?php echo $badge;?></span>
        <h2><?php echo actH($a->title);?></h2>
        <div class="act-meta"><span><?php echo actDate($a->start_at,'d/m/Y H:i');?></span><span><?php echo actH($a->location);?></span>
        </div>
        <?php if($a->summary):?>
        <p class="act-summary">
            <?php echo nl2br(actH($a->summary));?></p>
        <?php endif;?>
        <?php if($a->content):?>
        <div class="act-rich">
            <?php echo $a->content;?></div>
        <?php endif;?>
        <?php if($a->contact_info):?>
        <div class="act-contact"><strong>Liên hệ/đăng ký:</strong>
            <?php echo nl2br(actH($a->contact_info));?></div>
        <?php endif;?>
    </div>
    <?php echo activityFrontendFiles($files);?>
</article>
<?php return ob_get_clean();} ?>
<script>
    (function() {
        var root = document.getElementById('activity-page');
        if (!root) return;
        root.querySelectorAll('.act-tab').forEach(function(btn) {
            btn.addEventListener('click', function() {
                root.querySelectorAll('.act-tab').forEach(function(x) {
                    x.classList.remove('active')
                });
                root.querySelectorAll('.act-module').forEach(function(x) {
                    x.classList.remove('active')
                });
                btn.classList.add('active');
                var panel = document.getElementById('act-module-' + btn.dataset.tab);
                if (panel) panel.classList.add('active')
            })
        });
        var scheduleSelect = document.getElementById('activity-schedule-select'),
            scheduleView = document.getElementById('activity-schedule-view'),
            scheduleMessage = document.getElementById('activity-schedule-message'),
            scheduleDownload = document.getElementById('activity-schedule-download'),
            scheduleViewer = document.getElementById('activity-schedule-viewer'),
            schedulePdf = document.getElementById('activity-schedule-pdf'),
            scheduleError = document.getElementById('activity-schedule-error');

        function showSchedule() {
            var id = scheduleSelect ? scheduleSelect.value : '',
                option = scheduleSelect && scheduleSelect.selectedIndex >= 0 ? scheduleSelect.options[scheduleSelect.selectedIndex] : null,
                pdf = option ? option.dataset.pdf : '';
            if (scheduleViewer) scheduleViewer.classList.remove('is-visible');
            if (scheduleError) scheduleError.classList.remove('is-visible');
            if (!id) {
                if (scheduleMessage) scheduleMessage.textContent = 'Vui lòng chọn tuần công tác';
                if (scheduleDownload) scheduleDownload.style.display = 'none';
                if (schedulePdf) schedulePdf.removeAttribute('src');
                return;
            }
            if (scheduleMessage) scheduleMessage.textContent = option.textContent || 'Lịch công tác đã chọn';
            if (pdf) {
                if (schedulePdf) schedulePdf.src = pdf + '#toolbar=1&navpanes=0&view=FitH';
                if (scheduleViewer) scheduleViewer.classList.add('is-visible');
                if (scheduleDownload) {
                    scheduleDownload.href = pdf;
                    scheduleDownload.style.display = 'inline-block'
                }
            } else {
                if (schedulePdf) schedulePdf.removeAttribute('src');
                if (scheduleError) scheduleError.classList.add('is-visible');
                if (scheduleDownload) {
                    scheduleDownload.removeAttribute('href');
                    scheduleDownload.style.display = 'none'
                }
            }
        }
        if (scheduleView) scheduleView.addEventListener('click', showSchedule);
        if (scheduleSelect) scheduleSelect.addEventListener('change', function() {
            if (scheduleDownload) scheduleDownload.style.display = 'none';
            if (scheduleViewer) scheduleViewer.classList.remove('is-visible');
            if (scheduleError) scheduleError.classList.remove('is-visible')
        });
        var requested = new URLSearchParams(window.location.search).get('activity');
        if (requested && scheduleSelect && scheduleSelect.querySelector('option[value="' + requested.replace(/[^0-9]/g, '') + '"]')) {
            scheduleSelect.value = requested.replace(/[^0-9]/g, '');
            showSchedule();
            var anchor = document.getElementById('lich-cong-tac');
            if (anchor) setTimeout(function() {
                anchor.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                })
            }, 100)
        }
        root.querySelectorAll('[data-pdf-target]').forEach(function(btn) {
            btn.addEventListener('click', function() {
                var box = document.getElementById(btn.dataset.pdfTarget);
                if (!box) return;
                var frame = box.querySelector('iframe');
                if (!frame.src) frame.src = frame.dataset.src;
                box.classList.toggle('open');
                btn.textContent = box.classList.contains('open') ? 'Đóng PDF' : 'Xem PDF'
            })
        });
    })();
</script>
<?php require_once 'footer.php';?>
