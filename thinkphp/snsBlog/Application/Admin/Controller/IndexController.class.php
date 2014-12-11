<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        $this->show('<style type="text/css">*{ padding: 0; margin: 0; } div{ padding: 4px 48px;} body{ background: #fff; font-family: "微软雅黑"; color: #333;font-size:24px} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.8em; font-size: 36px }</style><div style="padding: 24px 48px;"> <h1>:)</h1><p>欢迎使用 <b>ThinkPHP</b>！</p><br/>[ 您现在访问的是Admin模块的Index控制器 ]</div><script type="text/javascript" src="http://tajs.qq.com/stats?sId=9347272" charset="UTF-8"></script>','utf-8');
    }

    public function test(){
    	echo base64_encode("1"."id");
    	echo "test";
    }

    public function capture($url=""){
    	$user = session('__user__');
    	if($user){
    		$this->assign('url', $url);
    		return $this->display('capture');
    	}else{
    		return $this->display('capture_login');
    	}
    }

    public function captureSave($url=""){    
		//echo $results;
		$suffix = substr($url, strrpos($url,"."));
		$fp = fopen('./Public/Uploads/a'.$suffix, 'w');
		$hander = curl_init();
		curl_setopt($hander,CURLOPT_URL, $url);
		curl_setopt($hander,CURLOPT_FILE,$fp);
		curl_setopt($hander,CURLOPT_HEADER,0);
		curl_setopt($hander,CURLOPT_FOLLOWLOCATION,1);
		curl_setopt($hander,CURLOPT_TIMEOUT,60);
		curl_exec($hander);
		curl_close($hander);
		fclose($fp);
        return $this->display('capture_success');
    }
}