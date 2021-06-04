//
//  TripsTableViewCell.swift
//  Maps_code
//
//  Created by adrià gonzález fernández on 04/06/2021.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleCellLabel: UILabel!
    
    @IBOutlet weak var originTitleLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    
    @IBOutlet weak var destinationTitleLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    
    @IBOutlet weak var statusTitleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
