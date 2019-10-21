//
//  customTableViewCell.swift
//  AssignmentEngineeringAI
//
//  Created by Rakesh-Ojas on 21/10/19.
//  Copyright © 2019 Rakesh-Ojas. All rights reserved.
//

import UIKit

class customTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCreatedDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
