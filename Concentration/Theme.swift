//
//  Theme.swift
//  Concentration
//
//  Created by Ann Akulova on 22.10.2023.
//

import UIKit

protocol ThemeProtocol{
    var backgroundColor: UIColor {get}
    var textColor: UIColor {get}
    var accentColor: UIColor {get}
    
}

class Theme {
    static var currentTheme: ThemeProtocol = LightTheme()
}
