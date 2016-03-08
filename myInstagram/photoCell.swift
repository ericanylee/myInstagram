//
//  photoCell.swift
//  myInstagram
//
//  Created by Erica Lee on 3/6/16.
//  Copyright © 2016 Erica Lee. All rights reserved.
//

import UIKit

class photoCell: UITableViewCell {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
