//
//  UserTableViewCell.swift
//  RxSwift MVVM
//
//  Created by Yossan Sandi Rahmadi on 28/07/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
