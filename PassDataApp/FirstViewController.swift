//
//  ViewController.swift
//  PassDataApp
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var enterSomeTextTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func sendDataToSecondScreen(button: UIButton) {
        // Open "Second Screen" using "Segue"
        openSecondScreen()
    }
    
    // Back from other screen
    @IBAction func unwindToFirstScreen(segue: UIStoryboardSegue) {
        guard segue.identifier == "unwindSegueFromSecondScreenToFirstScreen" else { return }
        guard let sourceViewController = segue.source as? SecondViewController else { return }
        
        guard
            let someTextFromSecondViewController = sourceViewController.someTextFromFirstScreen
            else { return }
        print("Back Segue. Text from Second Screen: \(someTextFromSecondViewController)")
    }
    
    func openSecondScreen() {
        performSegue(withIdentifier: "segueOpenSecondScreen", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let secondViewController = segue.destination as? SecondViewController
            else { return }
        
        guard
            let someTextFirstScreen = enterSomeTextTextField.text
            else { return }
        
        secondViewController.someTextFromFirstScreen = someTextFirstScreen
    }
    
}

