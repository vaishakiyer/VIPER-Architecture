//
//  NewsTableViewCell.swift
//  ViperModelDemo
//
//  Created by Vaishak Iyer on 19/06/19.
//  Copyright © 2019 Vaishak Iyer. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var content: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        //thumbnail.layer.cornerRadius = thumbnail.frame.width / 2
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
