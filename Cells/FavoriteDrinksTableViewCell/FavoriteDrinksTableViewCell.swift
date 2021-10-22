//
//  TableViewCell.swift
//  AlcoApp
//
//  Created by Surgeont on 22.10.2021.
//

import UIKit

class FavoriteDrinksTableViewCell: UITableViewCell {

    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var shopLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var starImageView: UIImageView!
    
    func setupCell(drink: Drink) {
        let name = drink.name ?? ""
        let shop = drink.shop ?? ""
        let rate = drink.rate ?? "-"
        
        self.nameLabel?.text = name
        self.shopLabel?.text = shop
        self.rateLabel?.text = rate
        self.starImageView.image = UIImage(systemName: "star.fill")
    }
    
}
