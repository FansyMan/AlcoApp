//
//  AboutViewController.swift
//  AlcoApp
//
//  Created by Surgeont on 26.08.2021.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var creatorImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        iconImage.image = UIImage(named: "appicon")
        creatorImage.image = UIImage(named: "avatar")
        
        creatorImage.layer.cornerRadius = creatorImage.frame.width / 2
        
    }
    

    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
