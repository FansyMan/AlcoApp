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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
    
    @IBAction func aboutButtonPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "AboutViewController")
        present(destinationVC, animated: true, completion: nil)
        
    }
    
    @IBAction func addNewDrinkButtonPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "AddAlcoViewController")
        present(destinationVC, animated: true, completion: nil)
        
    }
    
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? FavoriteDrinksTableViewCell {
            
            let drink = drinks[indexPath.row]
            let name = drink.name ?? ""
            let shop = drink.shop ?? ""
            let rate = drink.rate ?? "-"
            
            cell.nameLabel?.text = name
            cell.shopLabel?.text = shop
            cell.rateLabel?.text = rate
            
            return cell
            
        }
        
        return UITableViewCell()
        
    }
    
    
    
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
