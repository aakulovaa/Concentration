//
//  RandomTheme.swift
//  Concentration
//
//  Created by Ann Akulova on 22.10.2023.
//

import Foundation
import UIKit

class RandomTheme: ThemeProtocol{
    
    var redValue = CGFloat(drand48())
    var greenValue = CGFloat(drand48())
    var blueValue = CGFloat(drand48())
    
    var redValueForText = CGFloat(drand48())
    var greenValueForText = CGFloat(drand48())
    var blueValueForText = CGFloat(drand48())
    
    var redValueForAccent = CGFloat(drand48())
    var greenValueForAccent = CGFloat(drand48())
    var blueValueForAccent = CGFloat(drand48())
    
    lazy var backgroundColor: UIColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    lazy var textColor: UIColor =  UIColor(red: redValueForText, green: greenValueForText, blue: blueValueForText, alpha: 1.0)
    
    lazy var accentColor: UIColor = UIColor(red: redValueForAccent, green: greenValueForAccent, blue: blueValueForAccent, alpha: 1.0)
    
}
