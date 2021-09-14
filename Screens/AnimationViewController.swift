//
//  AnimationViewController.swift
//  AlcoApp
//
//  Created by Surgeont on 17.08.2021.
//

import UIKit

class AnimationViewController: UIViewController {

    
    
    @IBOutlet weak var mainPart: UIView!
    @IBOutlet weak var firstPart: UIView!
    @IBOutlet weak var secondPart: UIView!
    @IBOutlet weak var thirdPart: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hiddenState()
        fromHidden()
        firstAnimate()
        secondAnimate()
        thirdAnimate()
        
    }
    
    func hiddenState() {
        self.mainPart.frame.origin.x -= 700
        self.firstPart.alpha = 1
        self.secondPart.alpha = 1
        self.thirdPart.alpha = 1
    }
    
    func fromHidden() {
        UIView.animate(withDuration: 1, delay: 0, options: []) {
            self.mainPart.frame.origin.x += 700
            self.firstPart.alpha = 1
            self.secondPart.alpha = 1
            self.thirdPart.alpha = 1
        }
        
    }
    
    func firstAnimate() {
        UIView.animate(withDuration: 0, delay: 1, options: []) {
            self.firstPart.alpha = 0
            self.secondPart.alpha = 1
            self.thirdPart.alpha = 1
        }
    }
    
    func secondAnimate() {
        UIView.animate(withDuration: 0, delay: 1.5, options: []) {
            self.firstPart.alpha = 0
            self.secondPart.alpha = 0
            self.thirdPart.alpha = 1
        }
    }
    
    func thirdAnimate() {
        UIView.animate(withDuration: 0, delay: 2, options: []) {
            self.firstPart.alpha = 0
            self.secondPart.alpha = 0
            self.thirdPart.alpha = 0
        } completion: { (_) in
            UIView.animate(withDuration: 1, delay: 0.5, options: []) {
                self.mainPart.frame.origin.x += 700
                
            } completion: { (_) in
                self.goToFavorites()
            }
            
        }
        
    }
    
    func goToFavorites() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "FavoritesViewController")
        present(destinationVC, animated: true, completion: nil)
    }
    
    
    
}
 

 
