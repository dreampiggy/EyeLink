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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpNavigationBar()
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
        Consts.setUpNavigationBarWithBackButton(self, title: "照片", backTitle: "")
    }
    
    func setUpInitialLooking(){
        self.view.backgroundColor = Consts.grayView
//        总时长timeline
        timeline.duration = 3600.0
//        接收图片间隔(s)
        timeline.tickPeriod = 5.0
//        是否循环
//        timeline.willLoop = false
        self.format.dateFormat = "HH:mm:ss"
        
    }
    
    func setUpActions(){
        self.api.delegate = self
        timeline.delegate = self
        
        let nib = UINib(nibName: "photoCell", bundle: nil)
        self.table.registerNib(nib, forCellReuseIdentifier: "photoCell")
    }
    
    func setUpOnlineData(tag:String){
        if(tag == "photo"){
            
        }
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.sectionCount
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
        cell.photoImgView.sd_setImageWithURL(images[indexPath.section], placeholderImage: nil)
        cell.timeLabel?.text = times[indexPath.section]
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.table.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func didReceiveJsonResults(json: JSON, tag: String) {
        if(tag == "photo"){
            
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 179
    }
    
//    达到时间间隔后执行事件
    func tickAt(time: NSTimeInterval, forTimeline timeline: EasyTimeline!) {
        sectionCount++
        self.date = NSDate()
        self.times.append(format.stringFromDate(date))
        
        self.images.append(NSURL(string: "http://7xnm33.com1.z0.glb.clouddn.com/5636187190c49063a04cab8e?imageView2/1/w/138/h/138/q/75")!)
        
        self.table.reloadData()
        let indexPath = NSIndexPath(forRow: 0, inSection: sectionCount-1)
        self.table.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Top, animated: true)

    }

    @IBAction func btnClicked(sender: UIButton) {
        if(sender.tag == 0){
//            开始拍照并接收图片
            timeline.start()
            sender.setTitle("停       止", forState: .Normal)
            sender.tag = 1
        }else{
//            结束拍照
            timeline.stop()
            sender.setTitle("开       始", forState: .Normal)
            sender.tag = 0
        }
        
    }
    
    @IBAction func gotoVideo(sender: AnyObject) {
        let path = "rtsp://192.168.1.102:8080/"
        let vc = KxMovieViewController.movieViewControllerWithContentPath(path, parameters: nil) as! KxMovieViewController
        self.navigationController?.navigationBarHidden = true
        self.navigationController?.pushViewController(vc, animated: true)
       
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
