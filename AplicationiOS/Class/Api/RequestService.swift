//
//  RequestService.swift
//
//  Created by Dong Nguyen on 9/14/16.
//  Copyright © 2016 TVT25. All rights reserved.
//

import UIKit
import AFNetworking


typealias CompletionHandler = (_ success: Bool, _ data: NSDictionary?, _ error: NSError?)->()

class RequestService: NSObject {
    
    static let shareInstance = RequestService()
    
    let headers: [String: String] = [:]
    
    
    fileprivate override init() {}
    
    //MARK: GET Request
    func getRequest(_ url: String, completion: @escaping CompletionHandler) {
        
        print("URL" + url)
        print("METHOD: GET")
        
        let manager = AFHTTPSessionManager()
        manager.get(url, parameters: nil, progress: { (Progress) in
            
            }, success: { (task, responseObject) in
                
                print("RESULT" + "%@",responseObject)
                
                if responseObject != nil {
                    
                    completion(true, responseObject as! NSDictionary?, nil)
                    
                }else {
                    
                    let error: NSError! = NSError()
                    completion(false,nil,error)
                    
                }
                
                
                
        }) { (operation, error) in
            
            completion(false, nil, error as NSError?)
            
        }
        
    }
    
    
    //MARK: POST Request
    func postRequest(_ url: String, parameters: NSDictionary!, completion: @escaping CompletionHandler) {
        
        print("URL" + url)
        print("METHOD: POST")
        print(parameters)
        
        
        let manager = AFHTTPSessionManager()
        manager.requestSerializer = AFJSONRequestSerializer()
        
        manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Accept")
        manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")

        //manager.post(url_, parameters: parameter, progress: { (Progress) in
        manager.post(url, parameters: parameters, progress: { (Progress) in


            }, success: { (task, responseObject) in
                
                print("RESULT" + "%@",responseObject)
                
                if responseObject != nil {
                    
                    completion(true, responseObject as! NSDictionary?, nil)
                    
                }else {
                    
                    let error: NSError! = NSError()
                    completion(false,nil,error)
                    
                }
                
                
                
        }) { (operation, error) in
            
            completion(false, nil, error as NSError?)
            
        }
        
    }
    
    func jsonFromDictionary(jsonObj: NSDictionary) ->String{
        var jsonString: String? = nil
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonObj, options: JSONSerialization.WritingOptions.prettyPrinted)
            jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
        } catch let error as NSError {
            print(error)
        }
        
        return jsonString!
        
    }
    
    func returnParameter(url: String, parameter: [String: AnyObject]? = nil) -> String {
        
        var newUrl = url
        if parameter == nil {
            return newUrl
        }
        else {
            if parameter!.count != 0 {
                newUrl += "?"
                var i = 0
                for (key ,value) in parameter! {
                    if i != 0 {
                        newUrl += "&"
                    }
                    newUrl += "\(key)=\(value)"
                    i += 1
                }
            }
        }
        return newUrl
    }
    
}
