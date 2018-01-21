//
//  PlayerCell.swift
//  HastenProject
//
//  Created by Marcelo Laprea on 1/21/18.
//  Copyright © 2018 Marcelo. All rights reserved.
//

import UIKit
import Kingfisher

class PlayerCell: UITableViewCell {
    
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerSurename: UILabel!
    @IBOutlet weak var playerDate: UILabel!
    
    func setupCell(player:Player){
        let imageURL = player.image

        if let url = URL(string:imageURL!){
            playerImage.kf.setImage(with: url)
        }else{
            playerImage.kf.cancelDownloadTask()
        }
        
        playerName.text = player.name
        playerSurename.text = player.surname
        playerDate.text = player.date
    }
}
