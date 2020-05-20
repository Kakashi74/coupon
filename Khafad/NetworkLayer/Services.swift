//
//  Services.swift
//  Sallah
//
//  Created by Ahmed on 12/18/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//
import UIKit
import Alamofire
import SwiftyJSON

class Services {
    
    class func login(email: String, password: String, callback: @escaping (LoginModel) -> Void, failureHandler: @escaping (Error) -> Void) {
        
        let url = URLs.loginURL
       let parameters = ["email": email, "password": password]
    
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers: nil, callBack: { (response: LoginModel ) in
           
            callback(response)
            
       }) { (error) in
            
            failureHandler(error)
       }
        
    }
    
    class func Register(fullname: String , email: String, password: String, callback: @escaping (RegisterModel) -> Void, failureHandler: @escaping (Error) -> Void) {
           
           let url = URLs.registerURL
           let parameters = ["fullname": fullname , "email": email, "password": password]
       
           Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers: nil, callBack: { (response: RegisterModel ) in
            
              
               callback(response)
               
          }) { (error) in
               
               failureHandler(error)
          }
           
       }
    
    class func Search(from: Int , password: String, q: String, callback: @escaping (SearchModel) -> Void, failureHandler: @escaping (Error) -> Void) {
        
        let url = URLs.searchURL
        let parameters : [String: Any] = ["from" : from , "pass": password , "q" : q]
    
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers: nil, callBack: { (response: SearchModel ) in
         
           
            callback(response)
            
       }) { (error) in
            
            failureHandler(error)
       }
        
    }
    
    
    
    class func Menu(from: Int , password: String, callback: @escaping (MenuModel) -> Void, failureHandler: @escaping (Error) -> Void) {
          
          let url = URLs.menuURL
          let parameters : [String: Any] = ["from" : from , "pass": password ]
      
          Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers: nil, callBack: { (response: MenuModel) in
            
              callback(response)
              
         }) { (error) in
              
              failureHandler(error)
         }
          
      }
    class func UpdateUserInfo(name: String , address: String , phone: String , from: Int , password: String, callback: @escaping (UpdateUserInfo) -> Void, failureHandler: @escaping (Error) -> Void) {
            
        let url = URLs.updateUserInfo
        let parameters : [String: Any] = [ "name": name , "address": address , "phone": phone,"from" : from , "pass": password ]
        
            Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers: nil, callBack: { (response: UpdateUserInfo) in
              
                callback(response)
                
           }) { (error) in
                
                failureHandler(error)
           }
            
        }
 
    class func UpdatePassword(oldPass: String, newPass: String , newPass2: String ,from: Int , callback: @escaping (UpdatePassword) -> Void, failureHandler: @escaping (Error) -> Void) {
            
            let url = URLs.menuURL
        let parameters : [String: Any] = ["oldpass":oldPass , "newpass": newPass , "newpass2": newPass2 , "from" : from]
        
            Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers: nil, callBack: { (response: UpdatePassword) in
              
                callback(response)
                
           }) { (error) in
                
                failureHandler(error)
           }
            
        }
    
    class func Oder(from: Int , pass: String ,products: Int , quantities: Int  , callback: @escaping (OrderModel) -> Void, failureHandler: @escaping (Error) -> Void) {
               
        let url = URLs.orderURL
        let parameters : [String: Any] = ["from" : from , "pass":pass , "products": products , "quantities": quantities]
           
               Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers: nil, callBack: { (response: OrderModel) in
                 
                   callback(response)
                   
              }) { (error) in
                   
                   failureHandler(error)
              }
               
           }
    
}
