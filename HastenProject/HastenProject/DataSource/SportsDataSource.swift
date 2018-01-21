//
//  SportsDataSource.swift
//  HastenProject
//
//  Created by Marcelo Laprea on 1/21/18.
//  Copyright © 2018 Marcelo. All rights reserved.
//

import Foundation
import Moya

class SportsDataSource{
    static let provider = MoyaProvider<ApiService>()
    
    static func getSports(completion: @escaping ([Sport]) ->()){
        provider.request(.getSports) { (result) in
            switch result{
            case let .success(response):
                do{
                    let results = try JSONDecoder().decode([Sport].self, from: response.data)
                    completion(results)
                } catch {
                    print("ERROR DECODING")
                }
            case let .failure(error):
                print("ERROR: \(error)")
            }
        }
    }
}
