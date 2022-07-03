//
//  ForecastTableViewCell.swift
//  TechnicalTest
//
//  Created by Patchar Promtha on 3/7/2565 BE.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {
    
    static let identifier = "ForecastTableViewCell"
    static let nib = UINib.init(nibName: ForecastTableViewCell.identifier, bundle: nil)

    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


