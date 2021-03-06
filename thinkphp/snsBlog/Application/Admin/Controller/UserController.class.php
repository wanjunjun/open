<?php
namespace Admin\Controller;
use Think\Controller;
class UserController extends Controller {	

    public function index(){
        $this->show('<style type="text/css">*{ padding: 0; margin: 0; } div{ padding: 4px 48px;} body{ background: #fff; font-family: "微软雅黑"; color: #333;font-size:24px} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.8em; font-size: 36px }</style><div style="padding: 24px 48px;"> <h1>:)</h1><p>欢迎使用 <b>ThinkPHP</b>！</p><br/>[ 您现在访问的是Admin模块的User控制器 ]</div><script type="text/javascript" src="http://tajs.qq.com/stats?sId=9347272" charset="UTF-8"></script>','utf-8');
    }

    public function addUser(){
    	$this->display('add');    
    }

    public function saveAdd(){
    	//echo $mail;
    	//表单参数自动映射，必须用D方法实例化，原因未知
    	$User = D("Users");
		$User->create();
		$User->add();
		$this->success('操作完成','getUser.shtml');
    }

    public function getUser(){
    	$User = M("Users");
    	$data = $User->where('')->select();

    	//dump($data);
    	//echo $data;
    	//跳转到当前控制器的index方法
    	//$this->success('操作完成','index.shtml');

		//渲染模板
		//$this->display();
    	//$this->display(T('user/getUser2'));
    	$this->assign("list", $data);
    	$this->assign('name', "wanjunjun");
    	$this->display('getUser2');
    }

    public function login($username,$password){
            
            $ajax['success'] = false;
        
            $User = M("Users");
            $map['username']=$username;
            $map['password']=$password;
            $map['state']=2;
            $user = $User->where($map)->find(); //查询出来的是数组,一条数据库数据的数组。
            //print_r($user) ;
            //echo 'user login:'.$user['username'].'<br>';           
            if($user){
                $ajax['success'] = true;
                session('__user__',$user);             
            }
            $this->ajaxReturn($ajax);       
    }

    public function logout(){
        session(null);
        $this->redirect('/');
    }

    public function reg($code='', $username=''){
        $ajax['success'] = false;
        
        $map['username']=$username;
        /*$verify = new \Think\Verify();
        if($verify->check($code)){
            $ajax['success'] = true; 
            $User = M("Users");
            $data['username'] = $username;
            $data['password'] = '123';
            $data['state'] = '2';
            $data['reg_type'] = '1';
            $data['create_date'] = date("Y-m-d H:i:s");
            $User->add($data);

        }else{
            $ajax['msg']  = "err_code";
            $ajax['success'] = false;
        }*/
        $this->ajaxReturn($ajax);   
    }

    public function setUser(){
        $user = session('__user__');

        $User = M("Users");
        $map['id'] = $user["id"];
        $data = $User->where($map)->find();
        $this->assign("user", $data);
        $this->display('setUser');      
        
    }

    public function saveUser(){
        $user = session('__user__');
        
        $upload = new \Think\Upload();// 实例化上传类
        $upload->maxSize = 1024000 ;// 设置附件上传大小
        $upload->exts = array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
        $upload->rootPath = './Public/';
        $upload->savePath = './Uploads/'.$user["username"].'/'; // 设置附件上传目录
        $upload->saveName = array('uniqid',''); 
        $upload->subName = ''; 

        $User = M("Users");
        $User->create($_POST);  

         // 上传文件
        $info = $upload->upload();
        if(!$info) {// 上传错误提示错误信息
            // $this->error($upload->getError());
        }else{// 上传成功
                        
            //图片处理，生成缩略图
            $image = new \Think\Image(); 
            $image->open($upload->rootPath.$upload->savePath.$info["img"]["savename"]);
            $width = $image->width(); // 返回图片的宽度
            $height = $image->height(); // 返回图片的高度
            
            if($width > 500 && $height > 500){
                //图片尺寸大于规定标准，栽剪为100*100大小    
                //$image->crop(100, 100)->save($upload->rootPath.$upload->savePath.$info["img"]["savename"]);

                // 按照原图的比例生成一个最大为100*100的缩略图,相对于上面的处理，该图片是压缩处理，可以保证图片完整性
                $image->thumb(150, 150)->save($upload->rootPath.$upload->savePath.$info["img"]["savename"]);
            }

            $User->header_img = $info["img"]["savepath"].$info["img"]["savename"];    
        }
                        
        
        $User->save();

        //flush session
        $map['id'] = $user["id"];
        $newUser = $User->where($map)->find();
        session('__user__',$newUser);

        //$this->success('操作完成','setUser2.shtml',1);
        $this->redirect('/admin/user/setUser');
    }

    public function regMailCheck($mailname=''){
        $User = M("Users");
        $map['username'] = $mailname;
        $data = $User->where($map)->find();
        
        $msg = "邮箱已占用";
        if(isset($data["id"])){
            $ajax['error']  = $msg;
        }else{
            $ajax['ok']  = " ";
        }
        $this->ajaxReturn($ajax); 
    }

    public function regCheck($regname=''){
        $User = M("Users");
        $map['username'] = $regname;
        $data = $User->where($map)->find();
        
        $msg = "用户名已占用";
        if(isset($data["id"])){
            $ajax['error']  = $msg;
        }else{
            $ajax['ok']  = " ";
        }
        $this->ajaxReturn($ajax); 
    }

    public function findPWD($key){
        $arr = explode("+", base64_decode($key));
       
        $ids = base64_decode($arr[1]);
       
        $a2 = explode(".", base64_decode($arr[1]));
       

        $User = M("Users");
        $map['id']=$a2[0];
        $data = $User->where($map)->find();
               
        $updateDate = new \Org\Util\Date($data["update_date"]);
        $date = new \Org\Util\Date();
        $dd = $updateDate->dateDiff($date, 'h');
        if($dd > 2){
            $this->assign('msg', "url已过期");
            return $this->display('findPWD_err');
        }
               
        $this->assign('user', $data);
        $this->display('setPWD');
    }

    public function setPWD(){
        $User = M("Users");
        $User->create($_POST);
        $User->update_date = date("Y-m-d H:i:s");
        $User->save();

        $this->display('setPWD_tip');
    }

}