import Foundation
import UIKit
var id = 0
let contextUser = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
var users: [Users] = []
let contextproduct = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
var products: [Product] = []
func getUser(email: String ,pass: String)->Bool{
   
    do {
        users = try  contextUser.fetch(Users.fetchRequest())
        
        for item in users{
            
            if let nameuser = item.email,let password = item.pass
            {
                if(nameuser == email && password == pass)
                {
                    
                    UserDefaults.standard.set(item.name, forKey: "user")
                    UserDefaults.standard.set(email, forKey: "email")
                    
                    return true
                    
                    
                }
                
            }
        }
        
        
    } catch  {
        
    }
    return false
}
func addUser (name: String?,email: String?,password: String?,passconfirm: String?) -> Int{
    let item = Users(context: contextUser)
    if let nameuser = name , name != ""
    {
        item.name = nameuser
        if let emailuser = email , email != ""
        {
            item.email = emailuser
            if let pass = password , password != ""
            {
                if  pass == passconfirm
                {
                    item.pass = pass
                    do {
                        try contextUser.save()
                        return 0
                    } catch  { }
                }else{
                    return 1
                }
            }else{
                return 2
            }
        }
        else{
            return 3
        }
    }
    return 4
}
func countProduct() -> Int {
   
    do {
        products = try contextproduct.fetch(Product.fetchRequest())
        
        //products = products.filter({$0.isValid == true})
        return products.count
        
    } catch { }
    return 0
}
func addProduct (image: String , name:String,description: String ,price: Double ){
    let item = Product(context: contextproduct)
    item.image = image
    item.descript = description
    item.id = Int32(id)
    id+=1
    item.price = price
    item.name = name
    item.boughtItem = 0
    item.isAdd = false
    item.isValid = true
    do {
        try contextUser.save()
        
    } catch  { }
    
    
}
func getAllProduct() -> [Product] {
    products = []
    
    do {
        products = try
            contextproduct.fetch(Product.fetchRequest())
        products = products.filter({$0.isValid == true})
       // products = products.sort(by: $0.id)
    } catch { }
    return products
}
func getproduct(index: Int32)-> Product{
    var theProduct = Product()
    do {
        products = try contextproduct.fetch(Product.fetchRequest())
        products = products.filter({$0.id == index})
        theProduct = products[0]
        return theProduct
    } catch { }
    return products[0]
}
func deleteProduct(){
    
    do {
        products = try contextproduct.fetch(Product.fetchRequest())
       // products = products.filter({$0.id == index})
        for product in products{
            contextproduct.delete(product)
        }
        
        do {
        try contextproduct.save() } catch {
        }
    } catch { }
    
    
}
func upDateProduct(index:Int32,name:String){
    do {
        products = try contextproduct.fetch(Product.fetchRequest())
        products = products.filter({$0.id == index})
        let item = products[0]
        item.name = name
        do {
            try contextproduct.save() } catch {
            }
    }
    catch { }
    
}
func upDateProductBoughtItem(index: Int32,count:Int){
    
    
    do {
        
        
        products = try contextproduct.fetch(Product.fetchRequest())
        products = products.filter({$0.id == index})
        if(count==0){
            products[0].isAdd = false
            products[0].boughtItem = 0
        }
        else{
            products[0].isAdd = true
            products[0].boughtItem = Int32(count)
        }
        do {
            try contextproduct.save() } catch {
            }
    } catch { }
    
}
func deleteProductBoughtItem(){
    
    
        products = getproductOfCart()
       // products = products.filter({$0.id == index})
        for product in products{
            product.boughtItem=0
            product.isAdd=false
        }
        
        do {
        try contextproduct.save() } catch {
        }
    
    
}
func getproductOfCart()-> [Product]{
    
    do {
        products = try contextproduct.fetch(Product.fetchRequest())
        products = products.filter({$0.isAdd == true})
        return products
    } catch { }
    return products
}
func getCountproductOfCart()-> Int{
    
    do {
        products = try contextproduct.fetch(Product.fetchRequest())
        products = products.filter({$0.isAdd == true})
        return products.count
    } catch { }
    return 0
}
func plusboughtItem(index:Int32){
    do {
        products = try contextproduct.fetch(Product.fetchRequest())
        products = products.filter({$0.id == index})
        let item = products[0]
        item.boughtItem = item.boughtItem + 1
        do {
            try contextproduct.save() } catch {
            }
    }
    catch { }
}
func minusboughtItem(index:Int32){
    do {
        products = try contextproduct.fetch(Product.fetchRequest())
        products = products.filter({$0.id == index})
        let data = products[0]
      
        if(data.boughtItem>0){
        data.boughtItem = data.boughtItem - 1
            }
        if(data.boughtItem==0){
            data.isAdd = false
        }
        do {
            try contextproduct.save() } catch {
            }
    }
    catch { }
}
func totalPriceInCart()->Double{
    var TPrice : Double = 0.0
    for prodect in getproductOfCart(){
        TPrice += prodect.price*Double(prodect.boughtItem)
    }
    return TPrice
}
