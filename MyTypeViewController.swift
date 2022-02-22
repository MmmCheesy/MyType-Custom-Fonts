//
//  MyTypeViewController.swift
//  MyType
//
//  Created by Alexander Eckert on 3/4/18.
//  Copyright © 2018 Alexander Eckert. All rights reserved.
//

import UIKit
import SpriteKit

class MyTypeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = MyTypeScene(fileNamed: "MyTypeScene"){
            let skView = self.view as! SKView
            
            skView.presentScene(scene)
        }
        // Do any additional setup after loading the view.
        
        let defautls = UserDefaults.standard
        let fontActive = defautls.integer(forKey: "activeFont")
        if fontActive != 0 && SegueVariables.doneTexting == false {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                self.performSegue(withIdentifier: "writeTxt", sender: nil)
            })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
        
    }
    
    override var shouldAutorotate: Bool{
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if SegueVariables.drawYoLetters == true {
            self.performSegue(withIdentifier: "DrawLetters", sender: nil)
        }
        else if SegueVariables.actual == true {
            self.performSegue(withIdentifier: "Actualizer", sender: nil)
        }
        else if SegueVariables.shoopingTime == true {
            SegueVariables.shoopingTime = false
            self.performSegue(withIdentifier: "Shooping", sender: nil)
        }
        else if SegueVariables.newMessage == true {
            SegueVariables.newMessage = false
            SegueVariables.doneTexting = false
            self.performSegue(withIdentifier: "writeTxt", sender: nil)
        }
        else if SegueVariables.editFonts == true {
            SegueVariables.editFonts = false
            self.performSegue(withIdentifier: "EditFonts", sender: nil)
        }
        else if SegueVariables.theCreator == true {
            SegueVariables.theCreator = false
            self.performSegue(withIdentifier: "mail", sender: nil)
        }
    }
}

struct SegueVariables {
    static var drawYoLetters: Bool = false
    static var finDraw: Bool = false
    static var actual: Bool = false
    static var shoopingTime = false
    static var newMessage = false
    static var editFonts = false
    static var doneTexting = false
    static var fontMade : Bool = false
    static var finishedDrawing : Bool = false
    static var finishedCam : Bool = false
    static var doneEdit : Bool = false
    static var theCreator : Bool = false
    static var email : Bool = false
}
