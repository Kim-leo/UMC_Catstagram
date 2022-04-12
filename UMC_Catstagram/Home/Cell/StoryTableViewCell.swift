//
//  StoryTableViewCell.swift
//  UMC_Catstagram
//
//  Created by 김승현 on 2022/04/08.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "StoryTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .green
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
