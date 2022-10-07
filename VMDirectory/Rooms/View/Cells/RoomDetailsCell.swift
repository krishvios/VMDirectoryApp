//
//  RoomDetailsCell.swift
//  VMDirectory
//
//  Created by Krishna Vivek on 07/10/22.
//

import UIKit

class RoomDetailsCell: UITableViewCell {

    @IBOutlet weak var roomNumber: UILabel?
    @IBOutlet weak var createdAt: UILabel?
    @IBOutlet weak var maxOccupancy: UILabel?
    @IBOutlet weak var isOccupied: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
