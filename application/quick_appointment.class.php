<?php
class QuickAppointment
{
    public static function today()
    {
        return (new DateTimeImmutable('now', new DateTimeZone('Asia/Ho_Chi_Minh')))->format('Y-m-d');
    }

    public static function validate($input, $allowPast = false)
    {
        $data = array(); $errors = array();
        foreach (array('full_name','citizen_id','phone','exam_date') as $field) {
            $data[$field] = isset($input[$field]) && is_string($input[$field]) ? trim($input[$field]) : '';
            if (isset($input[$field]) && is_string($input[$field]) && preg_match('/[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]/', $input[$field])) $data[$field] = '';
        }
        $data['full_name'] = preg_replace('/\s+/u', ' ', $data['full_name']) ?? '';
        if (mb_strlen($data['full_name']) < 2 || mb_strlen($data['full_name']) > 120
            || !preg_match("/^[\p{L}\p{M} .'-]+$/u", $data['full_name'])
            || preg_match_all('/\p{L}/u', $data['full_name']) < 2) {
            $errors['full_name'] = 'Họ và tên phải có từ 2 đến 120 ký tự, chỉ gồm chữ, khoảng trắng, dấu chấm, nháy đơn hoặc gạch nối.';
        }
        if (!preg_match('/^[0-9]{12}$/D', $data['citizen_id'])) {
            $errors['citizen_id'] = 'Căn cước công dân phải gồm đúng 12 chữ số.';
        }
        if (preg_match('/^(?:\+84|84)([0-9]{9,10})$/D', $data['phone'], $match)) $data['phone'] = '0'.$match[1];
        if (!preg_match('/^(?:0[35789][0-9]{8}|02[0-9]{9})$/D', $data['phone'])) {
            $errors['phone'] = 'Nhập số điện thoại Việt Nam hợp lệ: di động 10 số hoặc cố định 11 số (đầu 02).';
        }
        $date = preg_match('/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/D', $data['exam_date'])
            ? DateTimeImmutable::createFromFormat('!Y-m-d', $data['exam_date'], new DateTimeZone('Asia/Ho_Chi_Minh')) : false;
        if (!$date || $date->format('Y-m-d') !== $data['exam_date'] || substr($data['exam_date'],0,4) < '1000') {
            $errors['exam_date'] = 'Vui lòng chọn ngày khám hợp lệ.';
        } elseif (!$allowPast && $data['exam_date'] < self::today()) {
            $errors['exam_date'] = 'Ngày khám phải từ hôm nay trở đi.';
        }
        return array('data'=>$data, 'errors'=>$errors);
    }

    public static function duplicate($db, $data, $exceptId = 0)
    {
        $db->query("SELECT id FROM hicrm_quick_appointments WHERE status <> 99 AND citizen_id='".$db->escapestring($data['citizen_id'])."' AND exam_date='".$db->escapestring($data['exam_date'])."' AND id <> ".(int)$exceptId.' LIMIT 1');
        return (bool)$db->fetch_object(true);
    }

    public static function save($db, $data, $id = 0)
    {
        $fields = array();
        foreach (array('full_name','citizen_id','phone','exam_date') as $field) $fields[] = $field."='".$db->escapestring($data[$field])."'";
        return $db->tryQuery(($id ? 'UPDATE hicrm_quick_appointments SET ' : 'INSERT INTO hicrm_quick_appointments SET ').implode(',', $fields).($id ? ' WHERE id='.(int)$id : ''));
    }
}
