//
//  ViewController.swift
//  Calculator-2
//
//  Created by Cloud Analogy on 02/06/22.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var resultLabel: UILabel!
	
	var performingMath:Bool = false
	var numberOnScreen:Double = 0
	var firstNumber:Double = 0
	var operation:String?
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		resultLabel.text = ""
		// Do any additional setup after loading the view.
	}

	@IBAction func numbers(_ sender: UIButton) {
		if performingMath == true{
			resultLabel.text = (sender.titleLabel?.text)!
			performingMath = false
		}
		else{
			resultLabel.text = resultLabel.text! + (sender.titleLabel?.text)!
		}
		numberOnScreen = Double(resultLabel.text!)!
		
	}
	
	
	@IBAction func operationButton(_ sender: UIButton) {
		if resultLabel.text != "" && (sender.titleLabel?.text)! != "AC" && (sender.titleLabel?.text)! != "="{
			firstNumber = Double(resultLabel.text!)!
			resultLabel.text = (sender.titleLabel?.text)!
			operation = (sender.titleLabel?.text)!
			performingMath = true
		}
		else if (sender.titleLabel?.text)! == "="{
			switch operation{
			case "+":
				resultLabel.text = String(firstNumber + numberOnScreen)
			case "-":
				resultLabel.text = String(firstNumber - numberOnScreen)
			case "*":
				resultLabel.text = String(firstNumber * numberOnScreen)
			case "/":
				resultLabel.text = String(firstNumber / numberOnScreen)
			case "%":
				resultLabel.text = String(Int(firstNumber) % Int(numberOnScreen))
			default:
				print("Some Error!")
			}
		}
		else if (sender.titleLabel?.text)! == "AC"{
			resultLabel.text = ""
			performingMath = false
			numberOnScreen = 0
			firstNumber = 0
		}
		
	}
	

}

