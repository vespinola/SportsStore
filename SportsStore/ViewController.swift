//
//  ViewController.swift
//  SportsStore
//
//  Created by Vladimir Espinola on 11/3/16.
//  Copyright © 2016 Apress. All rights reserved.
//

import UIKit

class ProductTableCell : UITableViewCell {
    
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ProductTableViewCellDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalStockLabel: UILabel!
    
    var products = [
        Product(name:"Kayak", description:"A boat for one person",
            category:"Watersports", price:275.0, stockLevel:10),
        Product(name:"Lifejacket", description:"Protective and fashionable",
            category:"Watersports", price:48.95, stockLevel:14),
        Product(name:"Soccer Ball", description:"FIFA-approved size and weight",
            category:"Soccer", price:19.5, stockLevel:32),
        Product(name:"Corner Flags",
            description:"Give your playing field a professional touch",
            category:"Soccer", price:34.95, stockLevel:1),
        Product(name:"Stadium", description:"Flat-packed 35,000-seat stadium",
            category:"Soccer", price:79500.0, stockLevel:4),
        Product(name:"Thinking Cap",
            description:"Improve your brain efficiency by 75%",
            category:"Chess", price:16.0, stockLevel:8),
        Product(name:"Unsteady Chair",
            description:"Secretly give your opponent a disadvantage",
            category: "Chess", price: 29.95, stockLevel:3),
        Product(name:"Human Chess Board",
            description:"A fun game for the family", category:"Chess",
            price:75.0, stockLevel:2),
        Product(name:"Bling-Bling King",
            description:"Gold-plated, diamond-studded King",
            category:"Chess", price:1200.0, stockLevel:4)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerNib(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductCellReuseId")
        
        self.tableView.delegate = self
        
        displayStockTotal()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayStockTotal(){
        let stockTotal = products.reduce(0, combine: {(total, product) -> Int in
            return total + product.stockLevel
        })
        
        totalStockLabel.text = "\(stockTotal) products in stock"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var product = products[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductCellReuseId")! as! ProductTableViewCell
        
        cell.delegate = self
        
        cell.nameLabel.text = product.name
        cell.descriptionLabel.text = product.description
        cell.stockStepper.value = Double(product.stockLevel)
        cell.stockTextField.text = String(product.stockLevel)
        
        cell.stockStepperDidChange = {
            product.stockLevel = Int(cell.stockStepper.value)
            
            cell.stockTextField.text = product.stockLevel.description
            
        }
        
        cell.stockTextFieldDidChange = {
            product.stockLevel = Int(cell.stockTextField.text!)!
            
            cell.stockStepper.value = Double(product.stockLevel)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func updateStockLevel(stockLevel:Double?){
        //actualizar manhana
    }
}

