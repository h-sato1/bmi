//
//  HistoryItem.swift
//  MyBMIApp
//
//  Created by 佐藤秀樹 on 2020/05/18.
//  Copyright © 2020 佐藤秀樹. All rights reserved.
//

import UIKit

class HistoryItem: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
