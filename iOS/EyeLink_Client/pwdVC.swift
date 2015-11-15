//
//  pwdVC.swift
//  EyeLink_Client
//
//  Created by 赵磊 on 15/11/15.
//  Copyright © 2015年 赵磊. All rights reserved.
//

import UIKit

class pwdVC: UIViewController {

    @IBOutlet var pwdField: UITextField!
    
    @IBOutlet var pwdFieldAgain: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        // Do any additional setup after loading the view.
    }

    func setUpNavigationBar(){
        Consts.setUpNavigationBarWithBackButton(self, title: "设置密码", backTitle: "")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func submit(sender: UIButton) {
        let pwd:String = self.pwdField.text!
        let pwdAgain:String = self.pwdFieldAgain.text!
        if !Consts.checkPassword(pwd){
            Tool.showErrorHUD("密码至少6位!")
        }else if pwd != pwdAgain{
            Tool.showErrorHUD("两次输入的密码不一致!")
        }else{
            let vc = photoVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
