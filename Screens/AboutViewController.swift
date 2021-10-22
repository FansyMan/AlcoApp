//
//  AboutViewController.swift
//  AlcoApp
//
//  Created by Surgeont on 26.08.2021.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var infoTextLabel: UITextView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var creatorImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupUI() {
        infoTextLabel.text = "Данное приложение создавалось исключительно забавы ради, хотя основной целью была демонстрация моих знаний в области создания экранов и работой с CORE DATA (ну и немножко с анимациями). Понимаю, что код - неидеальный, но я совершенствую свои скиллы"
        iconImage.image = UIImage(named: "appicon")
        creatorImage.image = UIImage(named: "avatar")
        creatorImage.layer.cornerRadius = creatorImage.frame.width / 2
    }
}
