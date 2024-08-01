//
//  FirstScreenViewController.swift
//  Concentration
//
//  Created by Ann Akulova on 22.10.2023.
//

import UIKit

class FirstScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var GameLogoLabel: UILabel!
    
    @IBOutlet weak var GameNameLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTheme()
    }
    func setupTheme(){
        self.view.backgroundColor = Theme.currentTheme.backgroundColor
        GameNameLabel.textColor = Theme.currentTheme.textColor
        
    }


}
