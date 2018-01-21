//
//  Sport.swift
//  HastenProject
//
//  Created by Marcelo Laprea on 1/21/18.
//  Copyright © 2018 Marcelo. All rights reserved.
//

import Foundation
import Gloss

struct Sport: Decodable{
    let type:String?
    let title:String?
    var players:[Player]?
    
    init?(json: JSON) {
        self.type = "type" <~~ json ?? ""
        self.title = "title" <~~ json ?? ""
        self.players = "players" <~~ json ?? []
    }
}
