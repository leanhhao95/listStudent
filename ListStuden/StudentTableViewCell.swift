//
//  StudentTableViewCell.swift
//  ListStuden
//
//  Created by thang on 8/14/17.
//  Copyright © 2017 thang. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var listnameLabel: UILabel!
    @IBOutlet weak var listageLabel: UILabel!
    @IBOutlet weak var listPhoneLabel: UILabel!
 

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
