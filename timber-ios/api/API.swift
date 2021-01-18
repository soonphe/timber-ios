//
//  API.swift
//  timber-ios
//
//  Created by 罗晓胜 on 2021/1/14.
//

import Foundation
import Moya

/*
 网络请求API（一个遵循TargetType协议的enum，每个case代表各个API）
 */
public enum API {
    
    case getSearch(search: String, page: Int)
    case getMovieDetail(id: String)
    
}

/*
 extension为拓展API请求类（定义moyaProvider的协议，一共6个方法）
 */
extension API: TargetType {
    
    public var baseURL: URL {
        return URL(string: "http://omdbapi.com")!
    }
    
    /*
     // 对应的不同API path
     */
    public var path: String {
        switch self {
        case .getSearch:
            return ""
        case .getMovieDetail:
            return ""
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getSearch:
            return .get
        case .getMovieDetail:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    // parameters，upload or download
    public var task: Task {
        switch self {
        case .getSearch(let search, let page):
            return .requestParameters(parameters: ["s": search, "page": page, "apikey": "682d8365"], encoding: URLEncoding.default)
        case .getMovieDetail(let id):
            return .requestParameters(parameters: ["i": id, "apikey": "682d8365"], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String: String]? {
        switch self {
        case .getSearch:
            return nil
        case .getMovieDetail:
            return nil
        }
    }
    
    // 通过statuscode过滤返回内容
//    public var validationType: ValidationType {
//        switch self {
//        case .getSearch:
//            return .successCodes
//        default:
//            return .none
//        }
//    }
}
