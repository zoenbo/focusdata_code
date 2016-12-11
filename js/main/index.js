var json_form,json_str;
var requesttype = 0;
var func_code,result;


$(function(){
	
	
	
	var options = {
		    url: "classes/AutoComplete/suburb.php",

		    getValue: "Suburb",


		    list: {
		        match: {
		            enabled: true
		        }
		    },
		    placeholder: "Suburb, State or Postcode",

		    theme: "plate-dark"
		};

		$("#CLINIC_SUBURB").easyAutocomplete(options);
	

	$('#li_home').addClass("active");
	
	//游客隐藏距离选择
	if($.cookie("ilogin") == 1){
		
		$('#DISTANCE').prop('disabled', false);
		
	}
	else
		$('#DISTANCE').prop('disabled', true);

	$('#btn_search').click(function (){
///////////////////////////////////组织ajax 请求参数 begin///////////////////////////////
		requesttype = 1;
		func_code="SD02";
		//form序列化成json
		json_form = $("#searchdoctor_form").serializeObject();

///////////////////////////////////组织ajax 请求参数 end///////////////////////////////
	    
		console.log(json_form);
		var str = JSON.stringify(json_form);
	    sessionStorage.setItem("search_index",str);

      	window.location.href="searchDoctor.php"; 
	});

	$('#txt_search').keypress(function(e){ 
		if(e.keyCode==13){ 
			var search = $.trim($('#txt_search').val());

			var data = {
          		search: search,
          		from_index: "1"
        	};
    		var str = JSON.stringify(data);

    		sessionStorage.setItem("search_con",str);

			window.location.href="searchDoctor.php"; 
		} 
	}); 

	//填充州
	func_code = "SSTE";
	para="";

	json_str = request_const(para,func_code,0);

	// console.log(json_str);
	//请求
	result=true;
	$.ajax({
	type: "POST",
	url: "classes/class.getState.php",
	dataType: "json",
	async:false,
	data: {
	  request:json_str
	},
	success: function (msg) {
	    // console.log(msg);
	    var ret = msg.response;
	    if(ret.success){
	      if(json_str.sequ != ret.sequ){
	        alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
	        result=false;
	      }
	      // var data = ret.data[0];
	      $.each(ret.data, function(i, item) {
	          $("#STATE_ID").append("<option value='"+ item.STATE_ID +"'>" + item.STATE_NAME + "</option>");
	      });
	      // console.log(data);
	    }else{
	      alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
	      result=false;
	    }
	    
	},
	error: function(XMLHttpRequest, textStatus, errorThrown){
	    //请求失败之后的操作
	    var ret_code = "999999";
	    var ret_msg = "失败,请联系管理员!";
	    alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
	    result=false;
	}
	});
	if(!result){
	return result;
	}


	//填充医生类别
	func_code = "SDTY";
	para="";

	json_str = request_const(para,func_code,0);

	// console.log(json_str);
	//请求
	result=true;
	$.ajax({
	type: "POST",
	url: "classes/class.getDoctorType.php",
	dataType: "json",
	async:false,
	data: {
	  request:json_str
	},
	success: function (msg) {
	    // console.log(msg);
	    var ret = msg.response;
	    if(ret.success){
	      if(json_str.sequ != ret.sequ){
	        alert(func_code+":时序号错误,请联系管理员ret.sequ"+ret.sequ+" json_str.sequ:"+json_str.sequ);
	        result=false;
	      }
	      // var data = ret.data[0];
	      $.each(ret.data, function(i, item) {
	          $("#DOCTOR_TYPE").append("<option value='"+ item.DOCTOR_TYPE +"'>" + item.DOCTOR_TYPE + "</option>");
	      });
	      // console.log(data);
	    }else{
	      alert(func_code+":"+ret.status.ret_code + " " + ret.status.ret_msg);
	      result=false;
	    }
	    
	},
	error: function(XMLHttpRequest, textStatus, errorThrown){
	    //请求失败之后的操作
	    var ret_code = "999999";
	    var ret_msg = "失败,请联系管理员!";
	    alert(func_code + ":" + ret_code + ":" + ret_msg +" textStatus:"+ textStatus);
	    result=false;
	}
	});
	if(!result){
		return result;
	}

	var d = new Date()
	var vYear = d.getFullYear()
	var vMon = d.getMonth() + 1
	var vDay = d.getDate()
	var h = d.getHours(); 
	var m = d.getMinutes(); 
	var se = d.getSeconds(); 
	var date_time=vYear+'-'+(vMon<10 ? "0" + vMon : vMon)+'-'+(vDay<10 ? "0"+ vDay : vDay)+' '+(h<10 ? "0"+ h : h)+':'+(m<10 ? "0" + m : m)+':'+(se<10 ? "0" +se : se);
	var vDate_F= vYear+'-'+(vMon<10 ? "0" + vMon : vMon)+'-'+(vDay<10 ? "0"+ vDay : vDay)+' 00:00';
	var vDate_T= vYear+'-'+(vMon<10 ? "0" + vMon : vMon)+'-'+(vDay<10 ? "0"+ vDay : vDay)+' 23:59';
	var vDate_Today= (vDay<10 ? "0"+ vDay : vDay)+'-'+(vMon<10 ? "0" + vMon : vMon)+'-'+vYear;

	$("#APPOINTMENT_DATE_BEGIN").val(vDate_Today);
	$("#APPOINTMENT_DATE_END").val(vDate_Today);
	
	$('.form_datetime').datetimepicker({
	    language:  'en',
	    format: "dd-mm-yyyy",
	    todayBtn:  1,
	    autoclose: 1,
	    todayHighlight: 1,
	    startView: 2,
	    minView: "month"
  	});

	
	$('.eac-plate-dark').css("width", "890px");


});