//
//  EmailViewController.swift
//  MyType
//
//  Created by Alexander Eckert on 9/27/18.
//  Copyright © 2018 Alexander Eckert. All rights reserved.
//

import UIKit
import SpriteKit
import MessageUI
import Foundation

class EmailViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = EmailScene(fileNamed: "EmailScene"){
            let skview = self.view as! SKView
            
            skview.presentScene(scene)
        }
        // Do any additional setup after loading the view.
    }
    
    func sendEmail() {
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        // Configure the fields of the interface.
        composeVC.setToRecipients(["meatballs123@rocketmail.com"])
        composeVC.setSubject("MyType")
        composeVC.setMessageBody("", isHTML: false)
        self.present(composeVC, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if SegueVariables.theCreator == true {
            SegueVariables.theCreator = false
            self.performSegue(withIdentifier: "created", sender: nil)
        }
        else if SegueVariables.email == true {
            SegueVariables.email = false
            sendEmail()
            print("Email time!")
        }
    }
    
    override var shouldAutorotate: Bool{
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
