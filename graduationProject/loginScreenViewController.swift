//
//  loginScreenViewController.swift
//  graduationProject
//
//  Created by hassan sayed on 8/8/22.
//

import UIKit

class loginScreenViewController: UIViewController,UIViewControllerTransitioningDelegate {
   // var items: [User] = []
    var isRemember = false
    var isIcon = false
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var btSignInOut: UIButton!
    @IBOutlet weak var btRememberMe: UIButton!
    @IBOutlet weak var txtPass: UITextField!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
       
       addpohto(txtName, UIImage(systemName: "person.fill")!)
        addpohto(txtPass, UIImage(systemName: "lock.fill")!)
        txtName.layer.cornerRadius = (txtName.frame.height/2)
        txtName.layer.borderWidth = 1
        txtName.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        txtName.layer.masksToBounds = true
        txtPass.layer.cornerRadius = (txtPass.frame.height/2)
        txtPass.layer.borderWidth = 1
        txtPass.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        txtPass.layer.masksToBounds = true
        txtPass.isSecureTextEntry = true
        btSignInOut.layer.cornerRadius = (btSignInOut.frame.height/2)
        
        let rigthImagView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width:30, height: txtPass.frame.height))
        rigthImagView.image = UIImage(systemName: "eye.slash")
        txtPass.rightView = rigthImagView
        txtPass.rightViewMode = .always
        let tapGesturRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGesturRecognizer:)))
        rigthImagView.isUserInteractionEnabled = true
        rigthImagView.addGestureRecognizer(tapGesturRecognizer)
        
    }
    
    @objc func imageTapped(tapGesturRecognizer:UITapGestureRecognizer){
        let tappedImage = tapGesturRecognizer.view as! UIImageView
        isIcon = !isIcon
        if isIcon{
            tappedImage.image = UIImage(systemName: "eye")
            txtPass.isSecureTextEntry = false
        }
        else{
            tappedImage.image = UIImage(systemName: "eye.slash")
            txtPass.isSecureTextEntry = true
        }
    }
    func addpohto(_ textField: UITextField , _ img: UIImage){
        let leftImagView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width:30, height: textField.frame.height))
        leftImagView.image = img
        textField.leftView = leftImagView
        textField.leftViewMode = .always
    }

    @IBAction func btRemember(_ sender: UIButton) {
        isRemember = !isRemember
        if isRemember {
            btRememberMe.setImage( UIImage(systemName: "checkmark.square.fill"), for: .normal)
        }
        if !isRemember {
            btRememberMe.setImage( UIImage(systemName: "square"), for: .normal)
        }
      /*  do {
        items = try
        context.fetch(User.fetchRequest())  } catch { }
        
        context.delete(items[0])
        do {
        try context.save() } catch {
        }*/

    }
    @IBAction func BTSignIn(_ sender: UIButton) {
        var iswrong = true
       /*
           do {
         //   items = try  context.fetch(User.fetchRequest())
         //   print("devices count = \(devices.count)")
            
            for item in items{
                
                if let name = item.name,let pass = item.password
                {
                    if(name == txtName.text && pass == txtPass.text)
                    {
                        let sb = UIStoryboard(name: "Main", bundle: nil)
                        var vc = sb.instantiateViewController(identifier: "homePageViewController") as! homePageViewController
                       vc.msg = "user name : \(name)"
                        
                        if isRemember {
                        UserDefaults.standard.set(true, forKey: "user")
                        }
                        else{
                        UserDefaults.standard.set(false, forKey: "user")
                        }
                        print("conected")
                        self.present(vc, animated: true, completion: nil)
                       // self.navigationController?.in(vc, animated: true, completion: nil)
                        iswrong = false
                       
                    }
                    
                }
            }
            print(iswrong)
            if iswrong {
                print(iswrong)
                let alert = UIAlertController(title: "Alert", message: "UserName or Password is wrong", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .cancel, handler: {
                    action in
                    print("tapped")
                })
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
            
        } catch  {
            
        }*/
         
    }
    
    @IBAction func btSignUp(_ sender: UIButton) {
       // let sb = UIStoryboard(name: "Main", bundle: nil)
      //  var vc = sb.instantiateViewController(identifier: "registerScreenViewController") as! registerScreenViewController
       
      //  self.present(vc, animated: true, completion: nil)
    }
    
}
