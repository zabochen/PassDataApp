//
//  SecondViewController.swift
//  PassDataApp
//

import UIKit

class SecondViewController: UIViewController {

    var someTextFromFirstScreen: String?
    
    @IBOutlet weak var showTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard
            let someTextFirstScreen = someTextFromFirstScreen
            else { return }
        
        showTextLabel.text = someTextFirstScreen
    }
    
    // Close Screen
    @IBAction func sendDataToFirstScreen() {
        performSegue(withIdentifier: "unwindSegueFromSecondScreenToFirstScreen", sender: nil)
    }
}
