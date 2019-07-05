//
//  ViewController.swift
//  D09
//
//  Created by Anastasiia ALOKHINA on 7/5/19.
//  Copyright © 2019 Anastasiia ALOKHINA. All rights reserved.
//

import UIKit
import LocalAuthentication


class ViewController: UIViewController {
    var authenticated : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // showAlertController(message : "Please proceed to authenticaation!")
        print("hello")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func authenticatePressed(_ sender: UIButton) {
        authenticateUser()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        authenticateUser()
        // showAlertController("Please authorize")
        
    }
    
    
    func authenticateUser() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [unowned self] success, authenticationError in
                
                DispatchQueue.main.async {
                    if success {
                        print("success")
                        
                            DispatchQueue.main.async {
                                let storyboard = UIStoryboard.init(name: "DiaryBoard", bundle: nil)
                                print("here")
                                let vc = storyboard.instantiateViewController(withIdentifier : "DiaryBoardController") as! DiaryBoardController
                                self.navigationController?.pushViewController(vc, animated: true)
                            }

                    } else {
                        self.authenticateUser()
                    }
                }
            }
        } else {
            let ac = UIAlertController(title: "Touch ID not available", message: "Your device is not configured for Touch ID.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(ac, animated: true)
        }
    }
}


extension ViewController{

    func showAlertController(_ message: String) {
        
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: UIAlertControllerStyle.alert
        );
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
