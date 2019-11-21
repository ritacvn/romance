////
////  ViewController.swift
////  romance
////
////  Created by Rita de Cássia Vasconcelos do Nascimento on 26/08/19.
////  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
////
//
//import UIKit
//import Foundation
//
//
//class ViewController: UIViewController, UITextFieldDelegate {
//
//    @IBOutlet weak var name1: UITextField!
//    @IBOutlet weak var name2: UITextField!
//
//    var nameOfPartnerOne: String = ""
//    var nameOfPartnerTwo: String = ""
//
//    //FeedbackClass
//    var feedback: UIFeedback?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //Looks for single or multiple taps.
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
//        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
//        //tap.cancelsTouchesInView = false
//
//        view.addGestureRecognizer(tap)
//
//        self.name1.delegate = self
//        self.name2.delegate = self
//
//    }
//
//    /// Show alert if text fields are empty
//    @IBAction func alertButton(_ sender: Any) {
//        if name2.text == "" || name2.text == ""{
//
//            let message: String = "You didn't fill all the fields"
//            let alert = UIAlertController(title:title,message: message, preferredStyle: .alert)
//            let action = UIAlertAction(title: "Ok",style: .default, handler: nil)
//
//            alert.addAction(action)
//
//            present(alert, animated: true, completion: nil)
//        }
//    }
//
//    @IBAction func goNextViewButton(_ sender: Any) {
//        self.nameOfPartnerOne = name1.text!
//        self.nameOfPartnerTwo = name2.text!
//        self.performSegue(withIdentifier: "InputNameToDisplay", sender: self)
//
//
//    }
//
//    // Parsing names to the other view
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "InputNameToDisplay" {
//            let displayVC = segue.destination as! Dinamica03ViewController
//            let couple = Couple(partnerOne: self.nameOfPartnerOne, partnerTwo: self.nameOfPartnerTwo)
//            displayVC.couple = couple
//        }
//
//    }
//
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        self.view.endEditing(true)
//        return false
//    }
//
//    //Calls this function when the tap is recognized.
//    @objc func dismissKeyboard() {
//        //Causes the view (or one of its embedded text fields) to resign the first responder status.
//        view.endEditing(true)
//    }
//}
//
