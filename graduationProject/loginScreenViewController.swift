
import UIKit

class loginScreenViewController: UIViewController,UIViewControllerTransitioningDelegate,UITextFieldDelegate {
    var isRemember = false
    var isIcon = false
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lblHaveAccount: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblSignIn: UILabel!
    @IBOutlet weak var btRegisterFromHere: UIButton!
    @IBOutlet weak var btSignInOut: UIButton!
    @IBOutlet weak var txtPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtName.delegate = self
        txtPass.delegate = self
        txtName.layer.cornerRadius = 10
        txtName.layer.borderWidth = 1
        txtName.layer.borderColor = #colorLiteral(red: 0.9973980784, green: 0.3564944267, blue: 0, alpha: 1)
        txtName.layer.masksToBounds = true
        txtPass.layer.cornerRadius = 10
        txtPass.layer.borderWidth = 1
        txtPass.layer.borderColor = #colorLiteral(red: 0.9973980784, green: 0.3564944267, blue: 0, alpha: 1)
        txtPass.layer.masksToBounds = true
        txtPass.isSecureTextEntry = true
        btSignInOut.layer.cornerRadius = (btSignInOut.frame.height/2)
        
        
        addProduct(image: "sushi", name: "Sushi", description: "Sushi is a Japanese dish of prepared vinegared rice, usually with some sugar and salt, accompanied by a variety of ingredients" ,  price: 14.10)
        
        addProduct(image: "shrimps", name: "Shrimps", description: "Shrimp is a famous seafood dish, and it is a rich source of proteins",  price: 21.15)
        
        addProduct(image: "pizz", name: "Pizza", description: "pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various", price: 17.35)
        
        addProduct(image: "pasta", name: "Pasta", description: "Pasta is a type of food typically made from an unleavened dough of wheat flour mixed with water or eggs, and formed into sheets or other shapes", price: 10.5)
        
        addProduct(image: "omelette", name: "Omelette", description: "an omelette (also spelled omelet) is a dish made from beaten eggs, fried with butter or oil in a frying pan , without stirring as in scrambled",  price: 25.65)
        
        addProduct(image: "noodle", name: "Noodle", description: "noodles are a type of food made from unleavened dough which is rolled flat and cut, stretched or extruded, into long strips or strings",  price: 11.90)
        
        addProduct(image: "fries", name: "Fries", description: "french fries (North American English), chips (British English), finger chips (Indian English), french-fried potatoes, or simply fries",  price: 16.95)
        
        addProduct(image: "barbecue2", name: "Barbecue2", description: "Roast chicken consists of grilled.",  price: 23.40)
        
        addProduct(image: "barbecue", name: "Barbecue", description: "Roast chicken consists of grilled, grilled, or smoked whole chicken or chicken parts. Barbecue chicken is often seasoned or covered with seasoning sauce, barbecue sauce, or both.", price: 21.55)
        
        // print(getAllProduct())
        
    }
    
    ////////////////////////
    override func viewWillAppear(_ animated: Bool) {
        animateItems2()
    }
    
    
    func animateItems2()
    {
        
        imgLogo.layer.transform = CATransform3DMakeScale(0, 0, 1)
        lblSignIn.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        txtName.layer.transform = CATransform3DMakeScale(0.2, 0.2, 1)
        txtPass.layer.transform = CATransform3DMakeScale(0.3, 0.3, 1)
        btSignInOut.layer.transform = CATransform3DMakeScale(0.4, 0.4, 1)
        lblHaveAccount.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1)
        btRegisterFromHere.layer.transform = CATransform3DMakeScale(0.6, 0.6, 1)
        
        /*
         imgLogo.layer.transform = CATransform3DMakeScale(0.7, 0.7, 1)
         lblSignIn.layer.transform = CATransform3DMakeScale(0.6, 0.6, 1)
         txtName.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1)
         txtPass.layer.transform = CATransform3DMakeScale(0.4, 0.4, 1)
         btSignInOut.layer.transform = CATransform3DMakeScale(0.3, 0.3, 1)
         lblHaveAccount.layer.transform = CATransform3DMakeScale(0.2, 0.2, 1)
         btRegisterFromHere.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
         */
        UIView.animate(withDuration: 0.6) {
            self.imgLogo.layer.transform = CATransform3DMakeScale(1, 1, 1)
            self.lblSignIn.layer.transform = CATransform3DMakeScale(1, 1, 1)
            self.txtName.layer.transform = CATransform3DMakeScale(1, 1, 1)
            self.txtPass.layer.transform = CATransform3DMakeScale(1, 1, 1)
            self.btSignInOut.layer.transform = CATransform3DMakeScale(1, 1, 1)
            self.lblHaveAccount.layer.transform = CATransform3DMakeScale(1, 1, 1)
            self.btRegisterFromHere.layer.transform = CATransform3DMakeScale(1, 1, 1)
            
            
        }
    }
    ///////////////////////
    
    
    @IBAction func BTSignIn(_ sender: UIButton) {
        let istrue = getUser(email: txtName.text!, pass: txtPass.text!)
        if(istrue){
            let sb = UIStoryboard(name: "menuPage", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "menuPageViewController") as! menuPageViewController
            
            self.present(vc, animated: true, completion: nil)
        }
        else{
            
            let alert = UIAlertController(title: "Alert", message: "Email or Password is wrong", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: {
                action in
                print("tapped")
            })
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case txtName:
            txtPass.becomeFirstResponder()
        case txtPass:
            view.endEditing(true)
        default:
            view.endEditing(true)
        }
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    @IBAction func btSignUp(_ sender: UIButton) {
        let sb = UIStoryboard(name: "registerPage", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "registerScreenViewController") as! registerScreenViewController
        
        self.present(vc, animated: true, completion: nil)
    }
    
}
