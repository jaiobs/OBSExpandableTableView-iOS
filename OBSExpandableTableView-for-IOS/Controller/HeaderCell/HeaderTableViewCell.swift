//
//  HeaderTableViewCell.swift
//  OBSExpandableTableView-for-IOS
//
//  Created by MAC-OBS- on 23/09/20.
//  Copyright © 2020 MAC-OBS-. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var outerView : UIView!
    @IBOutlet weak var dropDown : UIImageView!
    @IBOutlet weak var headerDescription : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outerView.layer.cornerRadius = 5.0
        outerView.layer.masksToBounds = true
        outerView.layer.borderWidth = 1.0
        outerView.layer.borderColor = UIColor.systemGray.cgColor
        headerDescription.textColor = .systemBlue  }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
