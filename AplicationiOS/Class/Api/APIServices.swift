//
//  APIServices.swift
//
//  Created by Dong Nguyen on 9/14/16.
//  Copyright © 2016 TVT25. All rights reserved.
//

import UIKit
typealias Handler = (_ success: Bool?, _ data: AnyObject?, _ error: NSError?)->()



class APIServices: NSObject {
    
    static let shareInstance = APIServices()
    
    let requestService = RequestService.shareInstance
    
    
    //MARK: API METHOD
    
    let BASE_URL = "https://itunes.apple.com/search?media=music"
    
    let API_REGISTER = "register"
    
    func search(keyword : String, completion: @escaping Handler) {
        let url = BASE_URL + "&term=" + keyword
        
        requestService.getRequest(url) { (success, datas, error) in
            if success {
                do {
                    let data = try SearchJSONModel.init(dictionary: datas as! [AnyHashable : Any]!)
                    completion(true, data, nil)
                } catch let parseError as NSError {
                    completion(false, nil, parseError)
                }
            } else {
                completion(false, nil, error)
            }
            
        }
    }

}
