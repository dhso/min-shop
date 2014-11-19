<?php
class ControllerServiceJsonRPC extends Controller {
	public function index() {		//获取客户端 JSON 请求
		$request_json_str = $GLOBALS['HTTP_RAW_POST_DATA'];		//得到JSONRPC 请求对象
		$jsondecode = json_decode($request_json_str);		//验证请求的method是否合法
		if ($jsondecode->method  && $this->validation($jsondecode->method)) {
			eval('$this->'.$jsondecode->method.'($jsondecode);');
		}
	}
	/**
	* 公共方法 创建JSON RPC 响应对象
	*/
	private function createJSONObject($error_code, $error_msg, $obj) {
		$jsonResponseArray = array();
		$jsonResponseArray['id'] = "1";
		$jsonResponseArray['result'] = array(
			"errorMessage"=>$error_msg,
			"errorCode"=>$error_code,
			"response"=>$obj);
		return json_encode($jsonResponseArray);
	}

	/**	 
	* 获得商品分类
	* $reqParams[0] = 父分类ID
	* 请求JSON样例 {"id":"4","jsonrpc":"2.0","method":"getCategory","params":["18"]}
	*/
	private function getCategory($jsondecode) {
		$this->load->model('catalog/category');
		$reqParams = $jsondecode->params;
		$category_info = $this->model_catalog_category->getCategory($reqParams[0]);
		echo $this->createJSONObject("0000", "ok", $category_info);	}
		private function validation($methodName) {
			$methodArray = array();
			$methodArray[] = "getCategory";
			$methodArray[] = "getProduct";
			if (in_array($methodName, $methodArray)) {
				return true;
			} else {
				return false;
			}
		}
	}
?>