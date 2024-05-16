//
//  ViewController.swift
//  Calculator
//
//  Created by Arya Deshmukh on 10/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var calcButton: [UIButton]!
    
    var firstNum:String = "";
    var operator1:String = "";
    var secondNum:String = "";
    var result:String = "";
    var haveResult:Bool = false;
    var numAfterResult:String = "";
    @IBOutlet weak var numOnScreen: UILabel!
    
    
    @IBAction func add(_ sender: Any) {
        operator1 = "+"
        numOnScreen.text = operator1
    }
    
    
    @IBAction func subtract(_ sender: Any) {
        operator1 = "-"
        numOnScreen.text = operator1
    }
    
    
    @IBAction func multiply(_ sender: Any) {
        operator1 = "*"
        numOnScreen.text = operator1
    }
    
    @IBAction func division(_ sender: Any) {
        operator1 = "/"
        numOnScreen.text = operator1
    }
    
    
    @IBAction func equals(_ sender: Any) {
        
        result = String( doOperator())
        numOnScreen.text = result
        numAfterResult = ""
    }
    @IBAction func numPressed(_ sender: UIButton) {
        
        if operator1 == "" {
            firstNum += String(sender.tag);
            numOnScreen.text = firstNum
        }
        
        else if (operator1 != "" && !haveResult){
            secondNum += String(sender.tag);
            numOnScreen.text = secondNum
        }
        
        else if (operator1 != "" && haveResult){
            numAfterResult += String(sender.tag);
            numOnScreen.text = numAfterResult
        }
        
    }
    
    
    @IBAction func clear(_ sender: UIButton) {
        firstNum = "";
        operator1 = "";
        secondNum = "";
        result = "";
        haveResult = false;
        numAfterResult = "";
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in calcButton {
            button.layer.cornerRadius = button.frame.size.height/2
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    func doOperator() -> Double {
        
        if operator1 == "+"
        {
            if !haveResult {
                haveResult = true
                return Double(firstNum)! + Double(secondNum)!
            }
            else {
                return Double(result)! + Double(numAfterResult)!
            }
        }
        
        if operator1 == "-"
        {
            if !haveResult {
                haveResult = true
                return Double(firstNum)! - Double(secondNum)!
            }
            else {
                return Double(result)! - Double(numAfterResult)!
            }
        }
        if operator1 == "*"
        {
            if !haveResult {
                haveResult = true
                return Double(firstNum)! * Double(secondNum)!
            }
            else {
                return Double(result)! * Double(numAfterResult)!
            }
        }
        if operator1 == "/"
        {
            if !haveResult {
                haveResult = true
                return Double(firstNum)! / Double(secondNum)!
            }
            else {
                return Double(result)! / Double(numAfterResult)!
            }
        }
        
        return 0;
    }

}

