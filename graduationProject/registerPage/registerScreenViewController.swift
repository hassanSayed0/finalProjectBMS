//
//  registerScreenViewController.swift
//  navigator1
//
//  Created by hassan sayed on 8/8/22.
//

import UIKit

class registerScreenViewController: UIViewController,UITextFieldDelegate {

   // var users: [User] = []
   var isAgree = false

    @IBOutlet weak var btSignUpOut: UIButton!
    @IBOutlet weak var btSignInFromHere: UIButton!
    @IBOutlet weak var lblCreateAccount: UILabel!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblHaveAccount: UILabel!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtPassConfirm: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addpohtoLeft(txtName)
        addpohtoLeft(txtEmail)
        addpohtoLeft(txtPass)
        txtPass.isSecureTextEntry = true
        addpohtoLeft(txtPassConfirm)
        txtPassConfirm.isSecureTextEntry = true
        //btSignUpOut.layer.cornerRadius = (btSignUpOut.frame.height/2)
        btSignUpOut.layer.cornerRadius = btSignUpOut.frame.height/2
        txtName.delegate = self
        txtEmail.delegate = self
        txtPass.delegate = self
        txtPassConfirm.delegate = self
        
        
    }
    ////////////////////////////////
    override func viewWillAppear(_ animated: Bool) {
            animateItems2()
        }

        func animateItems2()
        {
            
            imgFood.layer.transform = CATransform3DMakeScale(0, 0, 1)
            lblCreateAccount.layer.transform = CATransform3DMakeScale(0.2, 0.2, 1)
            txtName.layer.transform = CATransform3DMakeScale(0.3, 0.3, 1)
            txtEmail.layer.transform = CATransform3DMakeScale(0.4, 0.4, 1)
            txtPass.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1)
            txtPassConfirm.layer.transform = CATransform3DMakeScale(0.6, 0.6, 1)
            btSignUpOut.layer.transform = CATransform3DMakeScale(0.7, 0.7, 1)
            lblHaveAccount.layer.transform = CATransform3DMakeScale(0.8, 0.8, 1)
            btSignInFromHere.layer.transform = CATransform3DMakeScale(0.9, 0.9, 1)
 
            UIView.animate(withDuration: 0.6) {
                self.imgFood.layer.transform = CATransform3DMakeScale(1, 1, 1)
                self.lblCreateAccount.layer.transform = CATransform3DMakeScale(1, 1, 1)
                self.txtName.layer.transform = CATransform3DMakeScale(1, 1, 1)
                self.txtEmail.layer.transform = CATransform3DMakeScale(1, 1, 1)
                self.txtPass.layer.transform = CATransform3DMakeScale(1, 1, 1)
                self.txtPassConfirm.layer.transform = CATransform3DMakeScale(1, 1, 1)
                self.btSignUpOut.layer.transform = CATransform3DMakeScale(1, 1, 1)
                self.lblCreateAccount.layer.transform = CATransform3DMakeScale(1, 1, 1)
                self.btSignInFromHere.layer.transform = CATransform3DMakeScale(1, 1, 1)
            }
        }
    ///////////////////////////////
    
    func addpohtoLeft(_ textField: UITextField){
       textField.layer.cornerRadius = 10
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.9973980784, green: 0.3564944267, blue: 0, alpha: 1)
    }
    @IBAction func addUserToCoreData(_ sender: UIButton) {
        let istrue = addUser(name: txtName.text!, email: txtEmail.text!, password: txtPass.text!, passconfirm: txtPassConfirm.text!)
        switch istrue {
        case 0:
            alart(title: "Done", message: "successful registration", atitle: "OK")
            
        case 1:
            alart(title: "Wrong", message: "Cofirm Password is't correct", atitle: "OK")
        case 2:
            alart(title: "Required", message: "plz.enter your password", atitle: "OK")
        case 3:
            alart(title: "Required", message: "plz.enter your email", atitle: "OK")
        case 4:
            alart(title: "Required", message: "plz.enter your name", atitle: "OK")
        
        default:
            alart(title: "Wrong", message: "Wrong!", atitle: "OK")
        }
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case txtName:
            txtEmail.becomeFirstResponder()
        case txtEmail:
            txtPass.becomeFirstResponder()
        case txtPass:
            txtPassConfirm.becomeFirstResponder()
        case txtPassConfirm:
            view.endEditing(true)
        default:
            view.endEditing(true)
        }
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    func alart(title:String,message:String,atitle:String){
        let alert = UIAlertController(title: title, message:message , preferredStyle: .alert)
        let action = UIAlertAction(title:atitle , style: .cancel, handler: {
            action in
        })
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func btSignInback(_ sender: UIButton) {
      //  dismiss(animated: true, completion: nil)
        let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "loginScreenViewController") as! loginScreenViewController
       self.present(vc, animated: true, completion: nil)
    }
   

}
