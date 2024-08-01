//
//  ComplocationViewController.swift
//  Concentration
//
//  Created by Ann Akulova on 22.10.2023.
//

import UIKit

class ComplicationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //let complications = [
    //    "Light": 8,
     //   "Middle": 12,
      //  "Hard": 24
    //]
    
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //    if segue.identifier == "Complication Choose"{
    //        if let cardName = (sender as? UIButton)?.currentTitle,
    //        let complication = complications[cardName]{
    //            if let cvc = segue.destination as? ConcentrationViewController{
    //                //cvc.numberOfCards = complication
    //
    //            }
    //        }
    //    }
    //}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTheme()
    }
    func setupTheme(){
        self.view.backgroundColor = Theme.currentTheme.backgroundColor
        
        
    }
   
    static var Complication = ""
    
    @IBAction func GoToLightGame(_ sender: UIButton) {
        ComplicationViewController.Complication = "Light"
    }
    @IBAction func GoToMiddleGame(_ sender: UIButton) {
        ComplicationViewController.Complication = "Middle"
    }
    @IBAction func GoToHardGame(_ sender: UIButton) {
        ComplicationViewController.Complication = "Hard"
    }
    
    
    
  static var NameTheme = ""
    
    @IBAction func GoToEatTheme(_ sender: UIButton) {
        ComplicationViewController.NameTheme = "Eat"
        }
    
    @IBAction func GoToCarTheme(_ sender: UIButton) {
        ComplicationViewController.NameTheme = "Car"
    }
    
    @IBAction func GoToNatureTheme(_ sender: UIButton) {
        ComplicationViewController.NameTheme = "Nature"
    }
    @IBAction func GoToRandomTheme(_ sender: UIButton) {
        ComplicationViewController.NameTheme = "Random"
    }
    
}


