//
//  SportsViewController.swift
//  HastenProject
//
//  Created by Marcelo Laprea on 1/21/18.
//  Copyright © 2018 Marcelo. All rights reserved.
//

import UIKit
import Moya

class SportsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    var sports:[Sport] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "PlayerCell", bundle: nil), forCellReuseIdentifier: "cell")
        loader.startAnimating()
        fetchSports()
    }
    
    func fetchSports(){
        SportsDataSource.getSports(completion: { sports in
            self.loader.stopAnimating()
            self.sports = sports
            self.tableView.reloadData()
        })
    }
}

extension SportsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sports[section].players?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlayerCell
        if let players = sports[indexPath.section].players{
            cell.setupCell(player: players[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sports[section].title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sports.count
    }
}
