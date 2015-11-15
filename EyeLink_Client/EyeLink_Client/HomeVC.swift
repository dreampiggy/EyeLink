//
//  HomeVC.swift
//  EyeLink_Client
//
//  Created by 赵磊 on 15/11/15.
//  Copyright © 2015年 赵磊. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let back = UIImageView(image: UIImage.init(named: "tutorial_background_02"))
        self.view.addSubview(back)
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        
        let btn1 = BTRippleButtton(image:UIImage.init(named: "pin"), andFrame: CGRectMake(144, 80, 40, 40), andTarget: "home", andID: self)
        btn1.setRippeEffectEnabled(true)
        btn1.setRippleEffectWithColor(UIColor(colorLiteralRed: 240/255, green: 159/255, blue: 10/255, alpha: 1))
        self.view.addSubview(btn1)
        
        let btn2 = BTRippleButtton(image:UIImage.init(named: "clapboard"), andFrame: CGRectMake(124, 200, 75, 75), andTarget: "video", andID: self)
        btn2.setRippeEffectEnabled(true)
        btn2.setRippleEffectWithColor(UIColor(colorLiteralRed: 240/255, green: 159/255, blue: 254/255, alpha: 1))
        self.view.addSubview(btn2)
        
        let btn3 = BTRippleButtton(image:UIImage.init(named: "camera"), andFrame: CGRectMake(110, 360, 99, 99), andTarget: "photo", andID: self)
        btn3.setRippeEffectEnabled(true)
        btn3.setRippleEffectWithColor(UIColor(colorLiteralRed: 204/255, green: 270/255, blue: 12/255, alpha: 1))
        self.view.addSubview(btn3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func home(){
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func video(){
        let path = "rtsp://223.3.117.17:8554/"
        let vc = KxMovieViewController.movieViewControllerWithContentPath(path, parameters: nil) as! KxMovieViewController
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.presentViewController(vc, animated: true, completion: nil)
    }

    func photo(){
        let vc = photoVC()
        self.navigationController?.pushViewController(vc, animated: true)
//        self.navigationController?.presentViewController(vc, animated: true, completion: nil)
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
