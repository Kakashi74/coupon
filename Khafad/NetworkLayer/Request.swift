//
//  Request.swift
//  Sallah
//
//  Created by Ahmed on 12/18/19.
//  Copyright © 2019 AhmedDev. All rights reserved.
//

import Foundation

import UIKit
import Alamofire

class Service {
    
    class func request<T: Codable>(url: String, dateFormate: String?, method: HTTPMethod, parameters: Parameters?, headers: HTTPHeaders?,
                                   callBack:@escaping (T) -> Void,
                                   failureHandler:@escaping (Error) -> Void) {
        
        let jsonDecodeer = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormate
        
        jsonDecodeer.dateDecodingStrategy = .formatted(dateFormatter)
        
        
//        print(url)
//        print(parameters)
//        print(headers)
        

        Alamofire.request(url, method: method, parameters: parameters, headers: headers).validate().responseJSON { (response) in
            
      //    print(response.result.value)
            
            switch response.result {
            case .success:
                
                if let _ = response.result.value {
                    
                    guard let resultData = response.data else { fatalError() }
                    
                    do {
                        let basicResponse = try jsonDecodeer.decode(T.self, from: resultData)
                        callBack(basicResponse)
                        
                    }
                    catch(let error) {
                        
                        failureHandler(error)
                    }
                }
                
            case .failure(let error):
                failureHandler(error)
            }
        }
        
    }
  
}

