//
//  CartViewController.swift
//  Cart
//
//  Created by Mayar Adel on 8/13/22.
//

import UIKit

class CartViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    var arrFroods = getproductOfCart()
    @IBOutlet weak var tableViewCart: UITableView!
    @IBOutlet weak var lblSubTotal: UILabel!
    @IBOutlet weak var lblShipping: UILabel!
    @IBOutlet weak var lblTotalPrice: UILabel!
    @IBOutlet weak var btCheckout: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewCart.delegate = self
        tableViewCart.dataSource = self
        btCheckout.layer.cornerRadius = btCheckout.frame.height/2
        lblSubTotal.text = "\(totalPriceInCart().rounded())"
        lblTotalPrice.text = "\((totalPriceInCart() + 4.49).rounded())"
        lblShipping.text = "4.49 $"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getCountproductOfCart()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewCart.dequeueReusableCell(withIdentifier: "CartCell") as! Cart2TableViewCell
        let data = arrFroods[indexPath.row]
        cell.setupCell(photo: data.image!, name: data.name!, price: data.price, boughtItem: String(data.boughtItem))
        cell.OnActionPressedPlus = {
            ()->() in
            plusboughtItem(index: data.id)
            tableView.reloadData()
            self.lblSubTotal.text = "\(totalPriceInCart().rounded())"
            self.lblTotalPrice.text = "\((totalPriceInCart() + 4.49).rounded())"

        }
        cell.OnActionPressedMinus = {
            ()->() in
            minusboughtItem(index: data.id)
            tableView.reloadData()
            self.lblSubTotal.text = "\((totalPriceInCart()).rounded())"
            self.lblTotalPrice.text = "\((totalPriceInCart() + 4.49).rounded())"

        }
        return cell
    }
    func btAddBoughtItem()->(){
    }
    @IBAction func btCheckout(_ sender: Any) {
        deleteProductBoughtItem()
        let sb = UIStoryboard(name: "menuPage", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "menuPageViewController") as! menuPageViewController
       
       self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func btBackToMenu(_ sender: UIButton) {
        let sb = UIStoryboard(name: "menuPage", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "menuPageViewController") as! menuPageViewController
       
       self.present(vc, animated: true, completion: nil)
    }
}

struct Foods {
    let photo : UIImage
    let name : String
    let price : Double
    let size : String
    
}



