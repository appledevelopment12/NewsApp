//
//  newsTableViewCell.swift
//  NewsApp
//
//  Created by Rajeev on 06/08/23.
//

import UIKit

class newsViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLbll: UILabel!
    @IBOutlet weak var autherlbl: UILabel!
    @IBOutlet weak var newimg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        newimg.image = nil
    }
}
