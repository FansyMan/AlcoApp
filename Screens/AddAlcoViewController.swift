//
//  AddAlcoViewController.swift
//  AlcoApp
//
//  Created by Surgeont on 16.08.2021.
//

import UIKit
import CoreData

class AddAlcoViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var chooseCathegoryButton: UIButton!
    @IBOutlet weak var addNameTextField: UITextField!
    @IBOutlet weak var addShopTextField: UITextField!
    @IBOutlet weak var addDescriptionTextField: UITextView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    
    var cathegory: String?
    
    var choosenRate: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        
        firstView.layer.shadowColor = UIColor.black.cgColor
        firstView.layer.shadowOffset = CGSize(width: 10, height: 10)
        firstView.layer.shadowOpacity = 0.8
        firstView.layer.shadowRadius = 20
        
        secondView.layer.shadowColor = UIColor.black.cgColor
        secondView.layer.shadowOffset = CGSize(width: 10, height: 10)
        secondView.layer.shadowOpacity = 0.8
        secondView.layer.shadowRadius = 20
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadAllStars()
        
    }
    
    @objc func keyBoardWillShow(notification: Notification) {
        guard let kbSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.size.height, right: 0)
        scrollView.contentInset = insets
    }
    
    @objc func keyBoardWillHide(notification: Notification) {
        let insets = UIEdgeInsets.zero
        scrollView.contentInset = insets
    }
    
    private func createNewDrink() {
        
        
        
        let name = addNameTextField.text
        let shop = addShopTextField.text
        let rate = choosenRate
        let description = addDescriptionTextField.text
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newDrink = Drink(context: context)
        newDrink.name = name
        newDrink.shop = shop
        newDrink.rate = rate
        newDrink.descrip = description
        newDrink.cathegory = cathegory
        
        
        
        if let uniqueId = newDrink.drinkId {
            print("Drink id: \(uniqueId)")
        }
        
        dismiss(animated: true, completion: nil)
        
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        
        if addNameTextField.text == "" || addShopTextField.text == "" || addDescriptionTextField.text == "" {
            showAlert()
        } else {
            createNewDrink()
        }
        
    }
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        
        addNameTextField.text = ""
        addShopTextField.text = ""
        addDescriptionTextField.text = ""
        chooseCathegoryButton.setTitle("Выбрать категорию     >", for: UIControl.State.normal)
        chooseCathegoryButton.contentHorizontalAlignment = .center
        chooseCathegoryButton.setTitleColor(UIColor.blue, for: .normal)
        
        clearAllStars()
        
        
    }
    @IBAction func cancelBUttonPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "FavoritesViewController")
        present(destinationVC, animated: true, completion: nil)
        
    }
    
    @IBAction func chooseCathegoryButtonPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "CathegoriesViewController")
        present(destinationVC, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func unwindFromCathegoriesTableViewController(_ segue: UIStoryboardSegue) {

        guard let tableViewControler = segue.source as? CathegoriesViewController,
              let indexPath = tableViewControler.tableView.indexPathForSelectedRow else { return }

        let choosenCathegory = tableViewControler.cathegories[indexPath.row]
        cathegory = choosenCathegory

        chooseCathegoryButton.setTitle("  Категория: \(choosenCathegory)", for: UIControl.State.normal)
        chooseCathegoryButton.contentHorizontalAlignment = .left
        chooseCathegoryButton.setTitleColor(UIColor.black, for: .normal)
    }
    
    private func clearAllStars() {
        star1.setTitleColor(.blue, for: .normal)
        star2.setTitleColor(.blue, for: .normal)
        star3.setTitleColor(.blue, for: .normal)
        star4.setTitleColor(.blue, for: .normal)
        star5.setTitleColor(.blue, for: .normal)
    }
    
    private func loadAllStars() {
        
        star1.setTitle("1", for: .normal)
        star1.setTitleColor(.blue, for: .normal)
        star1.addTarget(self, action: #selector(star1Action), for: .touchUpInside)
        
        star2.setTitle("2", for: .normal)
        star2.setTitleColor(.blue, for: .normal)
        star2.addTarget(self, action: #selector(star2Action), for: .touchUpInside)
        
        star3.setTitle("3", for: .normal)
        star3.setTitleColor(.blue, for: .normal)
        star3.addTarget(self, action: #selector(star3Action), for: .touchUpInside)
        
        star4.setTitle("4", for: .normal)
        star4.setTitleColor(.blue, for: .normal)
        star4.addTarget(self, action: #selector(star4Action), for: .touchUpInside)
        
        star5.setTitle("5", for: .normal)
        star5.setTitleColor(.blue, for: .normal)
        star5.addTarget(self, action: #selector(star5Action), for: .touchUpInside)
        
    }
    
    @objc func star1Action() {
        choosenRate = "1"
        star1.setTitleColor(.red, for: .normal)
    }
    @objc func star2Action() {
        choosenRate = "2"
        star2.setTitleColor(.red, for: .normal)
    }
    @objc func star3Action() {
        choosenRate = "3"
        star3.setTitleColor(.red, for: .normal)
    }
    @objc func star4Action() {
        choosenRate = "4"
        star4.setTitleColor(.red, for: .normal)
    }
    @objc func star5Action() {
        choosenRate = "5"
        star5.setTitleColor(.red, for: .normal)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Warning!", message: "Заполните все поля", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
}
