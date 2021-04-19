//
//  OrderTableViewCell.swift
//  
//
//  Created by Александр Майко on 07.03.2021.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var orderTableViewCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    func configure(data: String){
        orderTableViewCellLabel.text = data
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
