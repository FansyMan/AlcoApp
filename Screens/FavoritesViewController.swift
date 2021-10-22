//
//  FavoritesViewController.swift
//  AlcoApp
//
//  Created by Surgeont on 16.08.2021.
//

import UIKit
import CoreData

class FavoritesViewController: UIViewController {
    
    var drinks: [Drink]!
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "FavoriteDrinksTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoriteDrinksTableViewCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // MARK: Вынимаем данные из CoreData и вставляю в таблицу
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = Drink.fetchRequest() as NSFetchRequest<Drink>
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            drinks = try context.fetch(fetchRequest)
        } catch let error {
            print(error.localizedDescription)
        }
        tableView.reloadData()
        
    }
    
    func jumpToNewViewController(identifier: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: identifier)
        present(destinationVC, animated: true, completion: nil)
    }
    
    @IBAction func aboutButtonPressed(_ sender: UIButton) {
        jumpToNewViewController(identifier: "AboutViewController")
    }
    
    @IBAction func addNewDrinkButtonPressed(_ sender: UIButton) {
        jumpToNewViewController(identifier: "AddAlcoViewController")
    }
    
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteDrinksTableViewCell", for: indexPath) as? FavoriteDrinksTableViewCell {
            
            let drink = drinks[indexPath.row]
            cell.setupCell(drink: drink)
            return cell
            
        }
        return UITableViewCell()
    }
    
    // MARK: Удаление строчки из таблицы и базы данных
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if drinks.count > indexPath.row {
            let drink = drinks[indexPath.row]
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            context.delete(drink)
            drinks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            do {
                try context.save()
            } catch let error {
                print(error.localizedDescription)
            }
            
        }
        
    }
    
    // MARK: Выбрать ячейку и перейти на детальный просмотр
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toInfoVC" {
            if let destinationVC = segue.destination as? InfoViewController {
                destinationVC.drinks = sender as? Drink
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let drinks = drinks?[indexPath.row] else { return }
        performSegue(withIdentifier: "toInfoVC", sender: drinks)
    }
    
    
}
