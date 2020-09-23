//
//  TableDataModel.swift
//  OBSKaiserComponent-for-IOS
//
//  Created by MAC-OBS- on 14/09/20.
//  Copyright © 2020 MAC-OBS-. All rights reserved.
//

import Foundation
import UIKit

struct TableDataModel {
    var topic = String()
    var subOptions = [String]()
    var isExpanded = Bool()
    
    init(topic : String, subOptions : [String], isExpanded : Bool) {
        self.topic = topic
        self.subOptions = subOptions
        self.isExpanded = isExpanded
    }
}
