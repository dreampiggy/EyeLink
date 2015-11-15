//
//  photoCell.swift
//  EyeLink_Client
//
//  Created by 赵磊 on 15/11/14.
//  Copyright © 2015年 赵磊. All rights reserved.
//

import UIKit

class photoCell: UITableViewCell {

    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var photoImgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
