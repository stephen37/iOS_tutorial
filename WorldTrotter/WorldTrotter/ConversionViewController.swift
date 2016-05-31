//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by stephen batifol on 31/05/16.
//  Copyright © 2016 stephen batifol. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    func textField(textField: UITextField,
                   s​h​o​u​l​d​C​h​a​n​g​e​C​h​a​r​a​c​t​e​r​s​I​n​R​a​n​g​e range: NSRange,replacementString string: String) -> Bool
    {
        print("dsqdsqdq")
        let disabledCharacters:NSCharacterSet = NSCharacterSet(charactersInString : "0123456789")
        for i in 0...string.characters.count {
            let c = (string as NSString).characterAtIndex(i)
            if disabledCharacters.characterIsMember(c) {
                return false
            }
        }
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(".")
        let replacementTextHasDecimalSeparator = string.rangeOfString(".")
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        }else {
            return true
        }
    }
    
    var f​a​h​r​e​n​h​e​i​t​Value: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    let numberFormater: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    
    var celsiusValue: Double? {
        if let value = f​a​h​r​e​n​h​e​i​t​Value {
            return (value - 32) * (5/9)
        }else {
            return nil
        }
    }
    
    func updateCelsiusLabel() {
        if let value = celsiusValue {
//            celsiusLabel.text = "\(value)"
            celsiusLabel.text = numberFormater.stringFromNumber(value)
        }else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func f​a​h​r​e​n​h​e​i​t​F​i​e​l​d​E​d​i​t​i​n​g​C​h​a​n​g​e​d(textField: UITextField) {
        if let text = textField.text, value = Double(text) {
            f​a​h​r​e​n​h​e​i​t​Value = value
        }else {
            f​a​h​r​e​n​h​e​i​t​Value = nil
        }
    }
    
    @IBAction func closeKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
        
    }
    
    
}