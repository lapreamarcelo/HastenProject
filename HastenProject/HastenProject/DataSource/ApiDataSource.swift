//
//  ApiDataSource.swift
//  HastenProject
//
//  Created by Marcelo Laprea on 1/21/18.
//  Copyright © 2018 Marcelo. All rights reserved.
//

import Foundation
import Moya

enum ApiService{
    case getSports
}

extension ApiService: TargetType{
    
    var headers: [String : String]? {
        return nil
    }

    var baseURL: URL {
        return URL(string: "https://api.myjson.com/bins/66851")!
    }
    
    var path: String {
        switch self {
        case .getSports:
            return "/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getSports:
            return .get
        }
    }
        
    var parameterEncoding: ParameterEncoding{
        return URLEncoding.queryString
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
}
