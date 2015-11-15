//
//  LoginViewController.swift
//  yoyoCampus_Zhaolei
//
//  Created by 赵磊 on 15/9/22.
//  Copyright © 2015年 赵磊. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class LoginViewController: UIViewController,APIDelegate{
    
    var img = UIImageView()
    
    var phoneView = UIView()
    
    var pwdView = UIView()
    
    var phoneImg = UIImageView()
    
    var pwdImg = UIImageView()
    
    var phoneTextField = UITextField()
    
    var pwdTextField = UITextField()
    
    var loginBtn = UIButton()
    
    var fogetPwdBtn = UIButton()
    
    var registerBtn = UIButton()
    
    var api = YoYoAPI()
    
    var loginURL:String = ""
    
    var infoURL:String = ""
    
    var params = ["":""]
    
    var plistDict = NSMutableDictionary()
    
    //测试btn，进入其他页面
    var gerenxianzhiBtn = UIButton()
    
    var shangpinxiangqingBtn = UIButton()
    
//    微信登录url
    var wechatLoginURL:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.setUpNavigationBar()
        self.setUpInitialLooking()
        self.setUpActions()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpNavigationBar(){
//        Consts.setUpNavigationBarWithBackButton(self, title: "登  录", backTitle:"<")
    }

    func setUpInitialLooking(){
        let newWidth = self.view.frame.width
        
        //self.plistDict = NSMutableDictionary(contentsOfFile: AppDelegate.filePath)!
        
        self.view.backgroundColor = Consts.grayView
        
        //头像
        self.img.frame = CGRect(x: 260 * Consts.ratio, y: 130 * Consts.ratio, width: 200 * Consts.ratio, height: 200 * Consts.ratio)
        self.img.contentMode = .ScaleAspectFit
        self.img.layer.cornerRadius = self.img.frame.width / 2   //圆角半径＝width/2，形成原型
        self.img.layer.masksToBounds = true
        self.img.image = UIImage(named: "eye")
        self.view.addSubview(self.img)
        
        //手机号背景
        self.phoneView.frame = CGRect(x: 37 * Consts.ratio, y: 410 * Consts.ratio, width: 650 * Consts.ratio, height: 90 * Consts.ratio)
        self.phoneView.layer.cornerRadius = 7
        self.phoneView.layer.masksToBounds = true
        self.phoneView.backgroundColor = Consts.white
        self.view.addSubview(self.phoneView)
        
        //手机号图标
        self.phoneImg.frame = CGRect(x: 40 * Consts.ratio, y: 24 * Consts.ratio, width: 30 * Consts.ratio, height: 42 * Consts.ratio)
        self.phoneImg.image = UIImage.init(named: "register_button_phone")
        self.phoneView.addSubview(self.phoneImg)
        
        //手机号输入框
        self.phoneTextField.frame = CGRect(x: 0, y: 0, width: self.phoneView.frame.width - self.phoneImg.frame.width, height: 90 * Consts.ratio)
        self.phoneTextField.frame.origin.x = self.phoneImg.frame.maxX + 22 * Consts.ratio
        self.phoneTextField.font = Consts.ft15
        self.phoneTextField.textColor = Consts.lightGray
        self.phoneTextField.placeholder = "请输入手机号"
        self.phoneView.addSubview(self.phoneTextField)
        
        //密码框背景
        self.pwdView.frame = CGRect(x: 37 * Consts.ratio, y: 530 * Consts.ratio, width: 650 * Consts.ratio, height: 90 * Consts.ratio)
        self.pwdView.layer.cornerRadius = 7
        self.pwdView.layer.masksToBounds = true
        self.pwdView.backgroundColor = Consts.white
        self.view.addSubview(self.pwdView)
        
        //密码图标
        self.pwdImg.frame = CGRect(x: 40 * Consts.ratio, y: 24 * Consts.ratio, width: 30 * Consts.ratio, height: 35 * Consts.ratio)
        self.pwdImg.image = UIImage.init(named: "register_button_password")
        self.pwdView.addSubview(self.pwdImg)
        
        //密码输入框 
        self.pwdTextField.frame = CGRect(x: 0, y: 0, width: 550 * Consts.ratio, height: 90 * Consts.ratio)
        self.pwdTextField.frame.origin.x = self.pwdImg.frame.maxX + 22 * Consts.ratio
        self.pwdTextField.font = Consts.ft15
        self.pwdTextField.textColor = Consts.lightGray
        self.pwdTextField.secureTextEntry = true
        self.pwdTextField.placeholder = "请输入密码"
        self.pwdView.addSubview(self.pwdTextField)
        
        //登录按钮
        self.loginBtn = Consts.setUpButton("登  录", frame: CGRect(x: 52 * Consts.ratio, y: 680 * Consts.ratio, width: 600 * Consts.ratio, height: 94 * Consts.ratio), font: Consts.ft24, radius: 7)
        self.loginBtn.center.x = self.view.center.x
        self.view.addSubview(self.loginBtn)
        
        //忘记按钮
        self.fogetPwdBtn = UIButton(type: .System)
        self.fogetPwdBtn.frame = CGRect(x: 0, y: 810 * Consts.ratio, width: 150 * Consts.ratio, height: 45 * Consts.ratio)
        self.fogetPwdBtn.center.x = self.view.center.x/2
        self.fogetPwdBtn.setTitle("忘记密码", forState: .Normal)
        self.fogetPwdBtn.tintColor = Consts.lightGray
        self.fogetPwdBtn.titleLabel?.font = Consts.ft14
        self.view.addSubview(self.fogetPwdBtn)
        
        //马上注册
        self.registerBtn = UIButton(type: .System)
        self.registerBtn.frame = CGRect(x: 0, y: 810 * Consts.ratio, width: 150 * Consts.ratio, height: 45 * Consts.ratio)
        self.registerBtn.center.x = self.view.center.x * 1.5
        self.registerBtn.setTitle("马上注册", forState: .Normal)
        self.registerBtn.tintColor = Consts.lightGray
        self.registerBtn.titleLabel?.font = Consts.ft14
        self.view.addSubview(self.registerBtn)
        
    }
    
    func setUpActions(){
        self.loginBtn.addTarget(self, action: "login:", forControlEvents: .TouchUpInside)
        self.fogetPwdBtn.addTarget(self, action: "foget:", forControlEvents: .TouchUpInside)
        self.registerBtn.addTarget(self, action: "register:", forControlEvents: .TouchUpInside)
        self.api.delegate = self
    }
    
    func setUpOnlineData(tag:String){
        switch(tag){
            case "login":
//                api.httpRequest("GET", url: "\(Consts.mainUrl)login", params:["phone":"123","pass":"123"], tag: "login")
                Alamofire.request(.GET,"\(Consts.mainUrl)login?phone=123&pass=123",parameters:nil)
                    .responseJSON{  response in
                        if response.result.error == nil{
                            Tool.showSuccessHUD("登录成功!")
                            self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
                        }else{
                            //                        输出失败信息
                            print("get请求失败!error ——> \(response.result.error)")
                }
            }
            break

            default:
            break
        }
    }
    
    func didReceiveJsonResults(json: JSON, tag: String) {
        switch(tag){
            
            case "login":
                self.goBack()
            break

        default:
            break
        }
    }
    
    func login(sender:UIButton){
        //检查手机号码、密码格式
        let phoneNum:String = self.phoneTextField.text!
        let pwd:String = self.pwdTextField.text!
        if !Consts.checkPhoneNum(phoneNum){
            Tool.showErrorHUD("请输入正确的手机号码!")
        }
        else if !Consts.checkPassword(pwd){
            Tool.showErrorHUD("密码至少6位!")
        }else{
            setUpOnlineData("login")
        }
    }
    
    func foget(sender:UIButton){
//        let findPwdVC = FindPwdViewController()
//        self.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(findPwdVC, animated: true)
    }
    
    func register(sender:UIButton){
//        let registerVC = RegisterViewController()
//        self.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(registerVC, animated: true)
        let vc = RegViewController()
        self.presentViewController(vc, animated: true, completion: nil)
    }

    ///实现点击UIView内部关闭键盘
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func goBack(){
        self.navigationController?.popViewControllerAnimated(true)
    }
}
