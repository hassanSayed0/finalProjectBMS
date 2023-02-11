//
//  ContainerPageViewController.swift
//  graduationProject
//
//  Created by K7alid on 13/08/2022.
//

import UIKit
protocol isClickGoToCart {
    func GotoCartAndAdd()
}
class ContainerPageViewController: UIViewController {
  
    @IBOutlet weak var mainViewContainer: UIView!
    var theproduct : Product?
    var protocolProduct : isClickGoToCart?
    
    @IBOutlet weak var btnExit: UIButton!
    @IBOutlet weak var btnContinueOrder: UIButton!
    @IBOutlet weak var btnGoToCart: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var lblCountFood: UILabel!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblFood: UILabel!
    @IBOutlet weak var towBtnStack: UIStackView!
    @IBOutlet weak var imgFood: UIImageView!
   
    @IBOutlet weak var imgFood1: UIImageView!
    var count: Int = 0
    
    @IBOutlet weak var imgFood2: UIImageView!
    
    @IBOutlet weak var imgFood3: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        btnGoToCart.semanticContentAttribute = .forceRightToLeft
        towBtnStack.layer.cornerRadius = 25
        towBtnStack.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        mainViewContainer.layer.cornerRadius = 50
        mainViewContainer.layer.maskedCorners = .layerMinXMinYCorner
        //rightImgConstrante.constant += 200
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        count = Int(theproduct!.boughtItem)
       // print(theproduct!.id)
        lblCountFood.text = String(count)
        lblPrice.text = "\((theproduct!.price * Double( lblCountFood.text! )!).rounded()) $"
        lblFood.text = theproduct!.name
        lblCountFood.text = "\(theproduct!.boughtItem)"
        imgFood.image = UIImage(named: theproduct!.image!)
        imgFood1.image = UIImage(named: theproduct!.image!)
        imgFood2.image = UIImage(named: theproduct!.image!)
        imgFood3.image = UIImage(named: theproduct!.image!)
        if(count==1){
            apperFromLeftToRight(img: imgFood)
        }
        if(count==2){
            apperFromLeftToRight(img: imgFood)
            apperFromLeftToRight(img: imgFood1)
        }
        if(count==3){
            apperFromLeftToRight(img: imgFood)
            apperFromLeftToRight(img: imgFood1)
            apperFromLeftToRight(img: imgFood2)
        }
        if(count>3){
            apperFromLeftToRight(img: imgFood)
            apperFromLeftToRight(img: imgFood1)
            apperFromLeftToRight(img: imgFood2)
            apperFromLeftToRight(img: imgFood3)
        }
    }
    @IBAction func btnExitFunc(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btPlusProduct(_ sender: UIButton) {
        count = count + 1
        lblCountFood.text = String(count)
       
        let temp = theproduct!.price
        lblPrice.text = "\( (temp * Double( lblCountFood.text! )!).rounded() ) $"
        if(count==1)
        {
            apperFromLeftToRight(img: imgFood)
        }
        if(count==2){
            apperFromLeftToRight(img: imgFood1)
        }
        if(count==3){
            apperFromLeftToRight(img: imgFood2)
        }
        if(count==4){
            apperFromLeftToRight(img: imgFood3)
        }
    }
    func apperFromLeftToRight(img:UIImageView)
    {
        UIView.animate(withDuration: 2) {
            img.transform = CGAffineTransform(translationX: 250, y: 0)
        }
    }
    
    @IBAction func btMinusProduct(_ sender: UIButton) {
        if(count != 0){
            count = count - 1
            if(count>=0){
                lblCountFood.text = String(count)
                
                let temp = theproduct!.price
                lblPrice.text = "\( (temp * Double( lblCountFood.text! )!).rounded() ) $"
            }
            if(count==0)
            {
                apperFromRightToLeft(img: imgFood)
            }
            if(count==1){
                apperFromRightToLeft(img: imgFood1)
            }
            if(count==2){
                apperFromRightToLeft(img: imgFood2)
            }
            if(count==3){
                apperFromRightToLeft(img: imgFood3)
            }
        }
    }
    func apperFromRightToLeft(img:UIImageView)
    {
        UIView.animate(withDuration: 2) {
            img.transform = CGAffineTransform(translationX: 0, y: 0)
        }
    }
    @IBAction func btContinueOrder(_ sender: UIButton) {
       
        upDateProductBoughtItem(index: theproduct!.id, count: Int(lblCountFood.text!)!)
        self.dismiss(animated: true)
    }
    
    @IBAction func btGoToCart(_ sender: UIButton) {
        upDateProductBoughtItem(index: theproduct!.id, count: Int(lblCountFood.text!)!)
        let sb = UIStoryboard(name: "CartStoryboard", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "CartViewController") as! CartViewController
       
       self.present(vc, animated: true, completion: nil)
        
    }
    
}

