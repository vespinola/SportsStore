//
//  ProductTableViewCell.swift
//  SportsStore
//
//  Created by Vladimir Espinola on 11/3/16.
//  Copyright © 2016 Apress. All rights reserved.
//

import UIKit

protocol ProductTableViewCellDelegate {
    func updateStockLevel(stockLevel:Double?) -> Void
}

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stockStepper: UIStepper!
    @IBOutlet weak var stockTextField: UITextField!
    
    var stockTextFieldDidChange : (() -> Void )? = nil
    var stockStepperDidChange : (() -> Void)? = nil
    
    var delegate:ProductTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    @IBAction func stockTextFieldDidChange(sender: AnyObject) {
        var stockLevel:Double?
        
        if let stepper = sender as? UIStepper {
            stockLevel = stepper.value
            stockTextField.text = Int(stockLevel!).description
        }else if let textfield = sender as? UITextView{
            stockLevel = Double((textfield.text)!)
            stockStepper.value = stockLevel!
        }
        
        delegate?.updateStockLevel(stockLevel)
        
 
    }
    
    
}
