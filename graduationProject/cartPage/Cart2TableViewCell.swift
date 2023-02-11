//
//  Cart2TableViewCell.swift
//  Cart
//
//  Created by Mayar Adel on 8/13/22.
//

import UIKit

class Cart2TableViewCell: UITableViewCell {

    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblNameFood: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblCounter: UILabel!
    @IBOutlet weak var lblBoughtItem: UILabel!
    var OnActionPressedPlus:(()->())?
    var OnActionPressedMinus:(()->())?
   
    
    @IBAction func btMinus(_ sender: Any) {
                 OnActionPressedMinus!()
        }
    
    @IBAction func btPlus(_ sender: Any) {
        OnActionPressedPlus!()
    }
    
    func setupCell(photo : String , name : String , price : Double,boughtItem: String  )
    {
        imgFood.image = UIImage(named: photo)
        lblNameFood.text = name
        lblPrice.text = "$ \(price)"
        lblBoughtItem.text = boughtItem
        
    }

}
