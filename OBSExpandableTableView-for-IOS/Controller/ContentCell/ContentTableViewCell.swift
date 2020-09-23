//
//  ContentTableViewCell.swift
//  OBSExpandableTableView-for-IOS
//
//  Created by MAC-OBS- on 23/09/20.
//  Copyright © 2020 MAC-OBS-. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentDescriptionLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentDescriptionLabel.layer.cornerRadius = 5.0
        self.contentDescriptionLabel.layer.masksToBounds = true
        contentDescriptionLabel.layer.borderColor = UIColor.systemGray.cgColor
        contentDescriptionLabel.layer.borderWidth = 1
        contentDescriptionLabel.textColor = .systemBlue
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
