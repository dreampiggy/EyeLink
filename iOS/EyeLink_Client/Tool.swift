//
//  Tool.swift
//  EyeLink_Client
//
//  Created by 赵磊 on 15/11/14.
//  Copyright © 2015年 赵磊. All rights reserved.
//

import Foundation

class Tool:NSObject
{
    class func dismissHUD()
    {
        ProgressHUD.dismiss()
    }
    
    
    class func showProgressHUD(text:String)
    {
        ProgressHUD.show(text)
    }
    
    class func showSuccessHUD(text:String)
    {
        ProgressHUD.showSuccess(text)
    }
    
    class func showErrorHUD(text:String)
    {
        ProgressHUD.showError(text)
    }
    
    
    
    
    
    
}