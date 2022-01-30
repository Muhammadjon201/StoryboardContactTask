//
//  Network.swift
//  StoryboardContactTask
//
//  Created by Muhammadjon Mamarasulov on 1/29/22.
//

import Foundation
import Alamofire

private let IS_TESTER = true
private let DEP_SER = "https://61f563c462f1e300173c4140.mockapi.io/"
private let DEV_SER = "https://61f563c462f1e300173c4140.mockapi.io/"

let headers: HTTPHeaders = [
    "Accept": "application/json",
]

class AFHttp {
    
    // MARK : - AFHttp Requests
    
    class func get(url:String,params: Parameters,handler: @escaping (AFDataResponse<Any>) -> Void){
        AF.request(server(url: url), method: .get, parameters: params,headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    class func post(url:String,params: Parameters,handler: @escaping (AFDataResponse<Any>) -> Void){
        AF.request(server(url: url), method: .post, parameters: params,headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    class func put(url:String,params: Parameters,handler: @escaping (AFDataResponse<Any>) -> Void){
        AF.request(server(url: url), method: .put, parameters: params,headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    class func del(url:String,params: Parameters,handler: @escaping (AFDataResponse<Any>) -> Void){
        AF.request(server(url: url), method: .delete, parameters: params,headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    // MARK : - AFHttp Methods
    class func server(url: String) -> URL{
        if(IS_TESTER){
            return URL(string: DEV_SER + url)!
        }
        return URL(string: DEP_SER + url)!
    }
    
    // MARK : - AFHttp Apis
    static let API_POST_LIST = "api/contacts"
    static let API_POST_SINGLE = "api/contacts/" //id
    static let API_POST_CREATE = "api/contacts"
    static let API_POST_UPDATE = "api/contacts/" //id
    static let API_POST_DELETE = "api/contacts/" //id
    
    
    // MARK : - AFHttp Params
    class func paramsEmpty() -> Parameters {
        let parameters: Parameters = [
            :]
        return parameters
    }
    
    class func paramsPostCreate(post: Contact) -> Parameters {
        let parameters: Parameters = [
            "title": post.title!,
            "body": post.body!,
        ]
        return parameters
    }
    
    class func paramsPostUpdate(post: Contact) -> Parameters {
        let parameters: Parameters = [
            "id": post.id!,
            "title": post.title!,
            "body": post.body!,
        ]
        return parameters
    }
    
}
