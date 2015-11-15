//
//  photoVC.swift
//  EyeLink_Client
//
//  Created by 赵磊 on 15/11/14.
//  Copyright © 2015年 赵磊. All rights reserved.
//

import UIKit
import SwiftyJSON

class photoVC: UIViewController,UITableViewDelegate,UITableViewDataSource,APIDelegate,EasyTimelineDelegate{

    
    @IBOutlet var table: UITableView!
    
    var api = YoYoAPI()
    
    var timeline = EasyTimeline()
    
    var sectionCount:Int = 0
    
    var time:String = ""
    
    var date = NSDate()
    
    var format:NSDateFormatter = NSDateFormatter()
    
    var times:[String] = []
    
    var images:[NSURL] = []
    
    var photosJSON:[JSON] = []
    
    var shootURL:String = ""
    
    var photoURL:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.setUpNavigationBar()
        self.setUpInitialLooking()
        self.setUpActions()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        super.viewWillDisappear(animated)
    }

    func setUpNavigationBar(){
        Consts.setUpNavigationBarWithBackButton(self, title: "照片", backTitle: "<")
    }
    
    func setUpInitialLooking(){

        let btn3 = BTRippleButtton(image:UIImage.init(named: "webcam-icon"), andFrame: CGRectMake(135, 420, 60, 60), andTarget: "btnClicked", andID: self)
        btn3.setRippeEffectEnabled(true)
        btn3.setRippleEffectWithColor(UIColor(colorLiteralRed: 204/255, green: 270/255, blue: 12/255, alpha: 1))
        self.view.addSubview(btn3)
        
        
        self.view.backgroundColor = Consts.grayView
        self.table.backgroundColor = Consts.grayView
//        总时长timeline
//        timeline.duration = 3600.0
//        接收图片间隔(s)
//        timeline.tickPeriod = 3.0
//        是否循环
//        timeline.willLoop = false
        self.format.dateFormat = "HH:mm:ss"
        
        if(photosJSON.count == 0){
            self.table.separatorStyle =  UITableViewCellSeparatorStyle.None
        }
        setUpOnlineData("photo")
        
//        let btnView = ButtonAnimations(frame: CGRectMake(10,350,self.view.bounds.size.width, 80))
//        self.view.addSubview(btnView)
//        
//        btnView.setNeedsDisplay(["3","5","10"] as! [String]!)
//        btnView.sendCar { (sendType, sendPrice) -> Void in
//            
//        }
    }
    
    func setUpActions(){
        self.api.delegate = self
//        timeline.delegate = self
        
        let nib = UINib(nibName: "photoCell", bundle: nil)
        self.table.registerNib(nib, forCellReuseIdentifier: "photoCell")
    }
    
    func setUpOnlineData(tag:String){
        if(tag == "photo"){
            self.photoURL = "\(Consts.mainUrl)photo/history?page=1"
//            self.photoURL = "http://wwww.baidu.com"
            api.httpRequest("GET", url: self.photoURL, params: nil, tag: "photo")
            
        }else{
            self.shootURL = "\(Consts.mainUrl)photo/capture"
            api.httpRequest("POST", url: self.shootURL, params: nil, tag: "shoot")
        }
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return photosJSON.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.table.dequeueReusableCellWithIdentifier("photoCell", forIndexPath: indexPath) as! photoCell
        self.setuUpCell(cell, atIndexPath: indexPath)
        
        return cell
    }

    func setuUpCell(cell:photoCell,atIndexPath indexPath:NSIndexPath){
        let photoJSON = photosJSON[indexPath.section]
        cell.photoImgView.sd_setImageWithURL(photoJSON["url"].URL!, placeholderImage: nil)
        cell.timeLabel?.text = photoJSON["time"].string!
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.table.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func didReceiveJsonResults(json: JSON, tag: String) {
        
        if(tag == "photo"){
            self.photosJSON = json.array!
            print(json)
            self.table.reloadData()
        }else{
            photosJSON.append(json)
        }
        
        self.table.reloadData()

//        let indexPath = NSIndexPath(forRow: 0, inSection: photosJSON.count-1)
//        self.table.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Top, animated: true)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 195
    }
    
//    达到时间间隔后执行事件
//    func tickAt(time: NSTimeInterval, forTimeline timeline: EasyTimeline!) {
//        sectionCount++
//        setUpOnlineData("photo")
//    }

    func btnClicked(sender: UIButton) {
//            开始拍照并接收图片

        setUpOnlineData("shoot")
        
        
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
