//
//  menuPageViewController.swift
//  graduationProject
//
//  Created by hassan sayed on 8/13/22.
//

import UIKit

class menuPageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,isClickGoToCart {
    var listofproduct = getAllProduct()
    var idCurrentCell = 0
    var idLastCell = 0
    var theProduct : Product?
   
  
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var imgContainterView: UIView!
    @IBOutlet weak var imgDeshLast: UIImageView!
    @IBOutlet weak var imgDesh: UIImageView!
    
    @IBOutlet weak var lbldescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btGoToCart: UIButton!
    @IBOutlet weak var btAddToCart: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        btGoToCart.layer.cornerRadius = 40
        btGoToCart.layer.maskedCorners = [CACornerMask.layerMinXMinYCorner]
        btAddToCart.layer.cornerRadius = btAddToCart.frame.height/2
        btAddToCart.semanticContentAttribute = .forceRightToLeft
        btGoToCart.semanticContentAttribute = .forceRightToLeft
        btAddToCart.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        btAddToCart.layer.borderWidth = 1
        
      
        theProduct = listofproduct[idCurrentCell]
        lblName.text = theProduct!.name
        lbldescription.text = theProduct!.descript
        lblPrice.text = "\((theProduct!.price))$"
        imgDesh.image = UIImage(named: theProduct!.image!)
        imgDeshLast.alpha = 0
       
    }
    
    @IBAction func btGoToProfile(_ sender: UIButton) {
        let sb = UIStoryboard(name: "ProfileStoryboard", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
        
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btGoToCart(_ sender: UIButton) {
        let sb = UIStoryboard(name: "CartStoryboard", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "CartViewController") as! CartViewController
       self.present(vc, animated: true, completion: nil)
    }
    func GotoCartAndAdd (){
        let sb = UIStoryboard(name: "CartStoryboard", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "CartViewController") as! CartViewController
      // dismiss(animated: true)
       self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func btAddToCart(_ sender: UIButton) {
        
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "containerView") as? ContainerPageViewController
        secondViewController?.theproduct = theProduct
        self.present(secondViewController!, animated: true)

        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countProduct()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! photoTableViewCell
       // print(indexPath.row)
        let theProduct1 = listofproduct[indexPath.row]
        if(indexPath.row == idCurrentCell){
        cell.setupPhoto(img: theProduct1.image!,color: #colorLiteral(red: 0.9932870269, green: 0.8774980903, blue: 0.8304708004, alpha: 1))
        }
        else
        {
            cell.setupPhoto(img: theProduct1.image!,color: .systemGray6)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
        idCurrentCell = indexPath.row
        theProduct = listofproduct[idCurrentCell]
        lblName.text = theProduct!.name
        lbldescription.text = theProduct!.descript
        lblPrice.text = "\((theProduct!.price)) $"
        
        imgDesh.image = UIImage(named: theProduct!.image!)
        viewRotationAnimation()
        changeHeightAndWidth()
        changeHeightAndWidth1()
        idLastCell=idCurrentCell
        tableView.reloadData()
    }
    
    func viewRotationAnimation()
    {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = CGFloat.pi*2
        animation.toValue = 0
        animation.isAdditive = true
        animation.duration = 2
        let animation2 = CABasicAnimation(keyPath: "transform.rotation")
        animation2.fromValue = 0
        animation2.toValue = CGFloat.pi*2
        animation2.isAdditive = true
        animation2.duration = 2
        imgDesh.layer.add(animation2, forKey: nil)
        imgDesh.transform = CGAffineTransform(rotationAngle: -(CGFloat.pi))
        imgDeshLast.layer.add(animation, forKey: nil)
        imgDeshLast.transform = CGAffineTransform(rotationAngle: -(CGFloat.pi))
    }
    
    func changeHeightAndWidth()
    {
        let imgProduct = listofproduct[idLastCell]
        let lastImg = UIImage(named: imgProduct.image!)
        imgDeshLast.image = lastImg
        self.imgDeshLast.transform = CGAffineTransform(scaleX: 1, y: 1)
        self.imgDeshLast.alpha = 1
        UIView.animate(withDuration: 2){
            self.imgDeshLast.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.imgDeshLast.alpha = 0
        }
    }
    func changeHeightAndWidth1()
    {
        self.imgDesh.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        self.imgDesh.alpha = 0
        UIView.animate(withDuration: 2){
            self.imgDesh.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.imgDesh.alpha = 1

        }
    }
    
    
}
