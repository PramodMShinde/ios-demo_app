//
//  CallListTableViewCustomCellTableViewCell.swift
//  demo
//
//  Created by Websym Solutions on 10/26/17.
//  Copyright © 2017 Websym Solutions. All rights reserved.
//

import UIKit

class CallListTableViewCustomCellTableViewCell: UITableViewCell {

    @IBOutlet weak var column1: UILabel!
    @IBOutlet weak var column2: UILabel!
    @IBOutlet weak var column3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
