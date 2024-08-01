//
//  ThemeViewController.swift
//  Concentration
//
//  Created by Ann Akulova on 22.10.2023.
//

import UIKit

class ThemeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        switchDarkTheme.isOn = UserDefaults.standard.bool(forKey: "DarkTheme")
        setupTheme()
        
        switchRandomTheme.isOn = UserDefaults.standard.bool(forKey: "RandomTheme")
        setupThemeForRandom()
    }
    @IBOutlet weak var DarkColor: UILabel!
    @IBOutlet weak var switchDarkTheme: UISwitch!
    
    @IBOutlet weak var RandomColor: UILabel!
    
    @IBOutlet weak var switchRandomTheme: UISwitch!
    
    func setupTheme(){
        switchDarkTheme.onTintColor = Theme.currentTheme.accentColor
        self.view.backgroundColor = Theme.currentTheme.backgroundColor
        self.DarkColor.textColor = Theme.currentTheme.textColor
        self.RandomColor.textColor = Theme.currentTheme.textColor
        switchRandomTheme.onTintColor = Theme.currentTheme.accentColor
    }
  
    func setupThemeForRandom(){
        switchDarkTheme.onTintColor = Theme.currentTheme.accentColor
        self.view.backgroundColor = Theme.currentTheme.backgroundColor
        self.DarkColor.textColor = Theme.currentTheme.textColor
        self.RandomColor.textColor = Theme.currentTheme.textColor
        switchRandomTheme.onTintColor = Theme.currentTheme.accentColor
    }
    
    @IBAction func changeThemeForRandom(_ sender: UISwitch) {
        Theme.currentTheme = sender.isOn ? RandomTheme() : LightTheme()
        setupThemeForRandom()
    }
    @IBAction func changeTheme(_ sender: UISwitch) {
        Theme.currentTheme = sender.isOn ? DarkTheme() : LightTheme()
        setupTheme()
        
        UserDefaults.standard.set(sender.isOn, forKey: "DarkTheme")
    }
    


}
