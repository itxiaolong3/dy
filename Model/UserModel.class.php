<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/1/8
 * Time: 22:39
 */
namespace Model;
use Think\Model;

class UserModel extends Model{
    //是否批量显示错误信息
    protected  $patchValidate=true;

    //自定义验证规则
    protected  $_validate =array(
        //array(字段，验证规则，信息提示[，验证条件，附加规则，验证时间])
        //用户名验证，不可为空，且唯一
        array('phone','require','手机不可为空'),
        array('name','require','姓名不可为空'),
        array('phone','','手机号已被占用',0,'unique'),
        //密码验证
        array('password','require','密码不可为空'),
    );
    public  function checkPwName($phone,$psw){
        //先查用户名是否存在再配对密码是否一致
       $info=$this->where("phone=".$phone)->find();
       if ($info){
           if ($info['password']===$psw){
               //登录成功
               return $info;
           }
       }else{
           return "";
       }
    }

}