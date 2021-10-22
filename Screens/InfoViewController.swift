//
//  InfoViewController.swift
//  AlcoApp
//
//  Created by Surgeont on 16.08.2021.
//

import UIKit
import CoreData

class InfoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return starsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? StarsCollectionViewCell {
            
            cell.starButton.setTitle("", for: .normal)
            cell.starButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
            return cell
            
        }
        return UICollectionViewCell()
    }
    
    
    var drinks: Drink?
    var starsCount: Int!
    
    @IBOutlet weak var starsCollectionView: UICollectionView!
    @IBOutlet weak var nameOfDrink: UILabel!
    @IBOutlet weak var shopLabel: UILabel!
    @IBOutlet weak var imageOfCathegory: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starsCollectionView.dataSource = self
        starsCollectionView.delegate = self
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        nameOfDrink.text = drinks?.name
        shopLabel.text = "Где купить: \(drinks?.shop ?? "Нет данных")"
        descriptionLabel.text = "О напитке: \(drinks?.descrip ?? "No Info")"
        
        
        

        switch drinks?.cathegory {
        case "Пиво":
            imageOfCathegory.image = UIImage(named: "пиво")
        case "Сидр":
            imageOfCathegory.image = UIImage(named: "сидр")
        case "Вино":
            imageOfCathegory.image = UIImage(named: "вино")
        case "Вермут":
            imageOfCathegory.image = UIImage(named: "вермут")
        case "Водка":
            imageOfCathegory.image = UIImage(named: "водка")
        case "Шампанское":
            imageOfCathegory.image = UIImage(named: "шампанское")
        case "Коньяк":
            imageOfCathegory.image = UIImage(named: "коньяк")
        case "Виски":
            imageOfCathegory.image = UIImage(named: "виски")
        default:
            imageOfCathegory.image = UIImage(named: "404")
        }
        
        switch drinks?.rate {
        case "1":
            starsCount = 1
        case "2":
            starsCount = 2
        case "3":
            starsCount = 3
        case "4":
            starsCount = 4
        case "5":
            starsCount = 5
        default:
            starsCount = 0
        }
        
        
        
    }
    

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}


