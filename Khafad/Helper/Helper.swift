//
//  Helper.swift
//  Sallah
//
//  Created by Ahmed on 12/18/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import Foundation

import UIKit
import SystemConfiguration
import RappleProgressHUD


class Helper {
    
    

    
    class func fromStringToNum(str : String?) -> Double?{
        let formatter = NumberFormatter()
        formatter.locale = Locale.current // USA: Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        let number = formatter.number(from: str ?? "")
        return number as? Double
    }
    class func getStringValue(of date: Date, by format: String) -> String? {
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        let stringDate = formatter.string(from: date)
        return stringDate
    }
    
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
        
    }
    
    
//    class func gotoHomePage(viewcontroller: UIViewController, user: UserInfo) {
//
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
//
//        viewcontroller.navigationController?.pushViewController(vc, animated: true)
//    }
//
    class func getUserLang() -> String? {
        
        return UserDefaults.standard.object(forKey: "lang") as? String
    }
    
    class func getUserToken() -> String? {
        
        let token = UserDefaults.standard.object(forKey: "userToken") as? String
        
        return token
    }
    
    class func getUserID() -> Int? {
        
        let id = UserDefaults.standard.object(forKey: "id") as? Int
        
        return id
    }
    class func getUserName() -> String? {
        
        let UserName = UserDefaults.standard.object(forKey: "userName") as? String
        
        return UserName
    }
    class func getUserEmail() -> String? {
        
        let UserEmail = UserDefaults.standard.object(forKey: "email") as? String
        
        return UserEmail
    }
    class func getUserPhone() -> String? {
        
        let UserPhone = UserDefaults.standard.object(forKey: "userPhone") as? String
        
        return UserPhone
    }
    class func getUserProfilePicture() -> String? {
        
        let ProfilePicture = UserDefaults.standard.object(forKey: "profilePicture") as? String
        
        return ProfilePicture
    }
    class func getUserRate() -> Int? {
        
        let UserRate = UserDefaults.standard.object(forKey: "rate") as? Int
        
        return UserRate
    }
    class func getUserBalance() -> Int? {
        
        let UserBalance = UserDefaults.standard.object(forKey: "balance") as? Int
        
        return UserBalance
    }
    
//    class func getUserData() -> UserInfo? {
//        
//        let UserData : UserInfo = UserDefaults.standard.get(key: "userData")!
//        return UserData
//        
//        
//    }
    
    class func isTwoPasswordsMatched(newPassword: String, confirmPassword: String) -> Bool {
        
        return newPassword == confirmPassword
    }
    
    class func isNumeric(a: String) -> Bool {
        return Double(a) != nil
    }
    
    class func removeCashedData() {
        
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject(forKey: "id")
        UserDefaults.standard.removeObject(forKey: "userName")
        UserDefaults.standard.removeObject(forKey: "userPhone")
        UserDefaults.standard.removeObject(forKey: "profilePicture")
        UserDefaults.standard.removeObject(forKey: "rate")
        UserDefaults.standard.removeObject(forKey: "balance")
        UserDefaults.standard.removeObject(forKey: "userData")
    }
    
    class func isLoggedIn() -> Bool {
        
        if let _ = UserDefaults.standard.object(forKey: "email") {
           
            return true
        }
            
        else {
            
            return false
        }
        
    }
    // ana 3amlt comment le di le7d ma a3dlha
//    class func goToAppRoot() {
//
//        let viewController = UIStoryboard.init(name: "MainPage", bundle: nil).instantiateViewController(withIdentifier: "HomeTabBar") as! HomeTabBar
//        let nav = UINavigationController(rootViewController: viewController)
//        let app = UIApplication.shared.delegate
//        app?.window!!.rootViewController = nav
//    }
    
    class func showLoading(_ title: String) {
        
        let attributes = RappleActivityIndicatorView.attribute(style: .circle, tintColor: .white, screenBG: UIColor(white: 0.0, alpha: 0.2), progressBG: UIColor(white: 0.0, alpha: 0.4), progressBarBG: .lightGray, progreeBarFill: .white, thickness: 4)
        
        RappleActivityIndicatorView.startAnimatingWithLabel(title, attributes: attributes)
    }
    
    
    class func getApiToken(key : String) -> String?{
        
        let def = UserDefaults.standard
        return def.object(forKey: key) as? String
        
    }
    
    
    class func hideLoading() {
        
        RappleActivityIndicatorView.stopAnimation()
    }
}
