//
//  GenresViewController.swift
//  AlcoApp
//
//  Created by Surgeont on 16.08.2021.
//

import UIKit

class CathegoriesViewController: UIViewController {
    
    let cathegories: [String] = [
        "Пиво",
        "Сидр",
        "Вино",
        "Вермут",
        "Водка",
        "Шампанское",
        "Коньяк",
        "Виски"
    ]

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 10, height: 10)
        shadowView.layer.shadowOpacity = 0.8
        shadowView.layer.shadowRadius = 20
        
    }
    
    
    

    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension CathegoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CathegoriesTableViewCell {
            
            cell.cathegoryNameLabel.text = cathegories[indexPath.row]
            return cell
            
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cathegories.count
    }
    
}
