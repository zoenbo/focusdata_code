<?php
include_once ('class.searchDoctor_db.php');
include_once ('GoogleMap/service/DistanceMatrixService.php');
// define _DBUG_LOG 1;
class SearchDoctor
{
	private $searchdoctor;
	private $arr_values = array();
	private $request;
	private $draw;
	private $start;
	private $length;
	private $_dbug;
	private $requesttype;
	
	private $customer_user_id;
	private $distance_range;

	public function __construct()
	{
		session_start ();
		$this->searchdoctor = new SearchDoctor_DB();
		
		
		$this->_dbug = false;
		// $this->user_name = $_SESSION ['fd_user_name'];
		// $this->user_pwd = $_SESSION ['fd_user_pwd'];
		$this->date = date("Y-m-d H:i:s",time());
		if (isset ( $_POST ['request'] )){
			$this->request = $_POST ['request'];
		}
		if (isset ( $_POST ['draw'])){
			$this->draw = $_POST ['draw'];
		}
		if (isset ( $_POST ['start'])){
			$this->start = $_POST ['start'];
		}
		if (isset ( $_POST ['length'])){
			$this->length = $_POST ['length'];
		}
		//加载类型 第一次加载 还是点击按钮

		$this->requesttype = $this->request["requesttype"];

        if($this->_dbug){
            echo "[---searchDoctor---requesttype]";
            echo $this->requesttype;
        }

		// echo "-------start:".$this->start;
		// echo "-------length:".$this->length;
		// echo "----------searchdoctor:";
		// print_r($this->request);


		$this->arr_values = $this->request["para"];

		if($this->_dbug){
	        echo "[---searchDoctor.php---__construct---arr_values]";
	        print_r($this->arr_values);
	    }
	    if (isset ( $this->arr_values["action_type"] )){
			$action_type = $this->arr_values["action_type"];
			unset($this->arr_values["action_type"]);
		}else
		{
			$action_type = "";
		}
		
		$this->customer_user_id=$this->arr_values["CUSTOMER_USER_ID"];
		
		if($this->customer_user_id!=null)
		{
			if($this->arr_values["DISTANCE"]=="20km")
				$this->distance_range=20000;
			else if($this->arr_values["DISTANCE"]=="10km")
				$this->distance_range=10000;
			else if($this->arr_values["DISTANCE"]=="5km")
				$this->distance_range=5000;
			else
				$this->distance_range=100000000; //10万公里
		}

		
		unset($this->arr_values["CUSTOMER_USER_ID"]);

		$this->action = $action_type;
		$this->action_type ();
	}
	private function action_type()
	{
		switch ($this->action)
		{
			case 'create' :
				$this->create ();
				break;
			case 'save' :
				$this->save ();
				break;
			case 'update' :
				$this->update ();
				break;
			case 'remove' :
				$this->remove ();
				break;	
			case 'index_search' :
				$this->index_search_view ();
				break;
			default :
// 				$this->viewAll ();
				//$this->getDataTime();
				break;
		}
	}

	public function response_const(){
		$response  = array();
		$response["serviceid "] = $this->request["serviceid"]; //功能编号 300003
		$response["sequ"] = $this->request["sequ"]; //时序号 随机4位数
		$response["systemid"] = $this->request["systemid"];   //focusdata 系统ID 黄页 100
		$response["projectid"] = $this->request["projectid"]; //focusdata项目ID 10001
		return $response;
	}

	
	public function make_json($arr)
	{
		
		$json = json_encode ($arr);
		echo $json;
		return;
		$r1 = array();
		foreach ($arr as $data) {
			$x = $data['appointment_date'];
			if (isset($r1[$x])) {
				$r1[$x][] = $data;
			} else {
				$r1[$x] = array($data);
			}
		}
		//print_r($r1);
		
		
		foreach ($r1 as $k1=>$e1) {
			$r2 = array();
			foreach ($e1 as $e2) {
				$x = $e2['doctor_id'];
				if (isset($r2[$x])) {
					$r2[$x][] = $e2;
				} else {
					$r2[$x] = array($e2);
				}
			}
			foreach ($r2 as $k2=>$e3) {
				foreach ($r2[$k2] as $e4)
				{
					$y = $e4['doctor_id'];
				}
			}
			
			$date=$r1[$k1][0]['appointment_date'];
			unset($r1[$k1]);
			$r1[$k1]['date']=$date;
			$r1[$k1]['doctors']=array($r2);
			
		}
		
		$json = json_encode ($r1);
		echo $json;
		
	}
	
	public function index_search_view()
	{
		$distance=0;
		$response["response"]  = array();
		$success = true;
		$ret_msg = "";
		$ret_code = "S00000"; //成功
		
		
		
		//print_r( $this->searchdoctor->index_search_sp($this->arr_values) );
		$this->make_json($this->searchdoctor->index_search_sp($this->arr_values));
		return;

		// echo "-------start:".$this->start;
		// echo "-------length:".$this->length;

		$records = $this->searchdoctor->index_search_view_count($this->arr_values,$this->requesttype);

		$ret["data"] = $this->searchdoctor->index_search_view ($this->arr_values,$this->requesttype,$this->start,$this->length);
		
		
		
		//distance calculation Added by Alex 2016.9.24
		if($this->customer_user_id!=null)
		{
			$ret["my_address"] = $this->searchdoctor->get_address($this->customer_user_id);
			
			$my_address=$ret["my_address"][0]["CUSTOMER_ADDR"].", ".
					$ret["my_address"][0]["CUSTOMER_SUBURB"].", ".
					$ret["my_address"][0]["STATE_NAME"].", Australia";
			
			$arrLength=count($ret["data"]);
			for($x = 0; $x < $arrLength; $x++)
			{
				$doctor_addr= $ret["data"][$x]["CLINIC_ADDR"].", ".
						$ret["data"][$x]["CLINIC_SUBURB"].", ".
						$ret["data"][$x]["STATE_NAME"].", Australia";
				
				$request = new GoogleMapAPI\Service\DistanceMatrixService();
				$request->addOrigin($my_address);
				$request->addDestination($doctor_addr);
				$responseMAP = $request->fetchJSON();
				
				$json = json_decode($responseMAP);
				if ($json->status == 'OK') {
					if ($json->rows[0]->elements[0]->status == 'OK') {
						$distance = $json->rows[0]->elements[0]->distance->value; //单位：米
					}
				}
				if($distance>$this->distance_range)//距离大于要求范围，踢出数据集！
				{
					unset($ret["data"][$x]);
				}
	
			}
			$resetArray = array_values($ret["data"]);
			$records=count($resetArray);
		}
		else
			$resetArray = $ret["data"];
		//distance calculation end

		
		
		
		if($records>0){
			$success = true;
			$ret_msg="查询成功";
			$ret_code = "S00000";
		}else if($records==0){
			$success = true;
			$ret_msg="无符合条件数据";
			$ret_code = "S00001";
		}else{
			$success = false;
			$ret_msg="失败,请联系管理员";
			$ret_code = "999999";
		}

		$status  = array();
		$status["ret_msg"] = $ret_msg;	
		$status["ret_code"] = $ret_code;
		// print_r($status);

		//服务器模式data
		$data  = array();
		$data["draw"] = $this->draw;
		$data["recordsTotal"] = $records;
		$data["recordsFiltered"] = $records;
		$data["data"]=$resetArray;
		
		// echo $ret;
		$response["response"] = $this->response_const();  //固定参数返回
		$response["response"]["success"] = $success;  //固定参数返回	
		$response["response"]["status"] = $status;  //固定参数返回	
		$response["response"]["data"] = $data;

		// print_r($response);
		echo json_encode ( $response );
	}

	public function viewAll()
	{
		$response["response"]  = array();
		$success = true;
		$ret_msg = "";
		$ret_code = "S00000"; //成功

		// echo "-------start:".$this->start;
		// echo "-------length:".$this->length;

		$records = $this->searchdoctor->col_exists_sql($this->arr_values,$this->requesttype);

		$ret["data"] = $this->searchdoctor->viewAll ($this->arr_values,$this->requesttype,$this->start,$this->length);
		
		
		
		
		//distance calculation Added by Alex 2016.9.24
		if($this->customer_user_id!=null)
		{
			$ret["my_address"] = $this->searchdoctor->get_address($this->customer_user_id);
			
			$my_address=$ret["my_address"][0]["CUSTOMER_ADDR"].", ".
					$ret["my_address"][0]["CUSTOMER_SUBURB"].", ".
					$ret["my_address"][0]["STATE_NAME"].", Australia";
			
			$arrLength=count($ret["data"]);
			for($x = 0; $x < $arrLength; $x++)
			{
				$doctor_addr= $ret["data"][$x]["CLINIC_ADDR"].", ".
						$ret["data"][$x]["CLINIC_SUBURB"].", ".
						$ret["data"][$x]["STATE_NAME"].", Australia";
							
						$request = new GoogleMapAPI\Service\DistanceMatrixService();
						$request->addOrigin($my_address);
						$request->addDestination($doctor_addr);
						$responseMAP = $request->fetchJSON();
							
						$json = json_decode($responseMAP);
						if ($json->status == 'OK') {
							if ($json->rows[0]->elements[0]->status == 'OK') {
								$distance = $json->rows[0]->elements[0]->distance->value; //单位：米
							}
						}
						if($distance>$this->distance_range)//距离大于要求范围，踢出数据集！
						{
							unset($ret["data"][$x]);
						}
	
			}
			$resetArray = array_values($ret["data"]);
			$records=count($resetArray);
		}
		else
			$resetArray = $ret["data"];
		//distance calculation end
				
				
		if($records>0){
			$success = true;
			$ret_msg="查询成功";
			$ret_code = "S00000";
		}else if($records==0){
			$success = true;
			$ret_msg="无符合条件数据";
			$ret_code = "S00001";
		}else{
			$success = false;
			$ret_msg="失败,请联系管理员";
			$ret_code = "999999";
		}

		$status  = array();
		$status["ret_msg"] = $ret_msg;	
		$status["ret_code"] = $ret_code;
		// print_r($status);

		//服务器模式data
		$data  = array();
		$data["draw"] = $this->draw;
		$data["recordsTotal"] = $records;
		$data["recordsFiltered"] = $records;
		$data["data"]=$resetArray;
		
		// echo $ret;
		$response["response"] = $this->response_const();  //固定参数返回
		$response["response"]["success"] = $success;  //固定参数返回	
		$response["response"]["status"] = $status;  //固定参数返回	
		$response["response"]["data"] = $data;

		// print_r($response);
		echo json_encode ( $response );
	}
}

$SearchDoctor = new SearchDoctor();
?>