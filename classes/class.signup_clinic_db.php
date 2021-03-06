<?php 
include_once('class.database.php');

class Sign_up_clinic_DB{
    private $db;
    public function __construct(){  

    $this->db = new Database();
    }
    public function col_exists($where){
        $ret = $this->db->col_exists('fd_clinic_user','CLINIC_USER_MAIL="'.$where.'"');
        return $ret;
    }

    public function create($arr_values){

        if($this->col_exists($arr_values["CLINIC_USER_MAIL"])){
            return 2;
        };

        foreach($arr_values as $k=>$v){
            if($k == "CLINIC_USER_PWD"){
                $arr_values[$k] = md5($v);
                // base64_encode base64_decode
                // $arr_values[$k] = base64_encode($v);
            }
            if($k == "STATE_ID"){
                $arr_values[$k] = intval($v);
            }
        }

        unset($arr_values['CONFIME_PWD']);

        $ret = $this->db->insertData('fd_clinic_user', $arr_values);
        return $ret;
    }

    public function update($arr_values){
        $func_code = $arr_values['func_code'];
        unset($arr_values['func_code']);  

        $ret = $this->db->updateData('qr_func', $arr_values, 'func_code="'.$func_code.'"');
        return $ret;
        // $this->db->updateData('qr_role',array('role_name'=>$role_name,
        //                                         'funcion_id'=>$funcion_id,
        //                                         'note'=>$note,
        //                                       ),'func_code='.$func_code);
    }
     

    public function view(){
        $ret = $this->db->fetchAll('qr_func');
        
        return $ret;
    }
   
    public function viewAll($arr_values){
        $search_con = $arr_values['search_con'];
        $sql = "SELECT concat('role_', @rownum:=@rownum+1) AS DT_RowId, qr_role.*, GROUP_CONCAT(qr_func.FUNC_NAME) AS FUNC_NAME FROM (SELECT @rownum:=0) r, qr_role, qr_func where qr_role.func_id = qr_func.func_id and (role_code like '%". $search_con ."%' or role_name like '%".$search_con ."%') group by qr_role.role_code";

        $ret = $this->db->fetchAll_sql($sql,null);
        
        return $ret;
    }
    
    public function remove($arr_values){
        $arrlength=count($arr_values);
        for($i = 0; $i < $arrlength; $i++)
        $ret = $this->db->deleteData('qr_func',"func_code='".$arr_values[$i]."'");
        return $ret;
    }
}
?>