//
//  ProfileViewController.swift
//  Profile Screen
//
//  Created by Mayar Adel on 8/12/22.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var btLogout: UIButton!
    @IBOutlet weak var ViewMain: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgProfile.alpha = 0
        lblUsername.alpha = 0
        lblEmail.alpha = 0
        btLogout.alpha = 0
        ViewMain.layer.cornerRadius = 50
        ViewMain.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        btLogout.layer.cornerRadius = btLogout.frame.height/2
        lblUsername.text = (UserDefaults.standard.value(forKey: "user") as! String)
        lblEmail.text = (UserDefaults.standard.value(forKey: "email") as! String)
        
    }
     override func viewDidAppear(_ animated: Bool) {
               animateItems()
               animateItems2()
               animateItems3()
               animateItems4()
           }
            func animateItems()
           {
            UIView.animate(withDuration: 1) {
                   self.imgProfile.alpha = 1
               }
               
           }
            func animateItems2()
           {
            UIView.animate(withDuration: 1.5) {
                   self.lblUsername.alpha = 1
               }
               
           }
            func animateItems3(){
        UIView.animate(withDuration: 1.5) {
                self.lblEmail.alpha = 1
            }
            
        }
            func animateItems4(){
    UIView.animate(withDuration: 1.5) {
        self.btLogout.alpha = 1
    }
    
}
    @IBAction func btLogout(_ sender: Any) {
        deleteProduct()
        deleteProductBoughtItem()
        let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "loginScreenViewController") as! loginScreenViewController
       self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btBack(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
