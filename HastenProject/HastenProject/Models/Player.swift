//
//  Player.swift
//  HastenProject
//
//  Created by Marcelo Laprea on 1/21/18.
//  Copyright © 2018 Marcelo. All rights reserved.
//

import Foundation
import Gloss

struct Player: Decodable{
    let name:String?
    let surname:String?
    let imageURL:String?
    
    init?(json: JSON) {
        self.name = "name" <~~ json ?? ""
        self.surname = "surname" <~~ json ?? ""
        self.imageURL = "image" <~~ json ?? ""
    }
}
