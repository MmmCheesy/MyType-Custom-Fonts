//
//  CameraViewController.swift
//  MyType
//
//  Created by Alexander Eckert on 3/22/18.
//  Copyright © 2018 Alexander Eckert. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

class CameraViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            let defaults = UserDefaults.standard
            let tut = defaults.bool(forKey: "tut")
            let lettersDone = defaults.integer(forKey: "crash\(a.fontsCreated)")
        
            if lettersDone == 0 && tut == true && letter.picJustTook != true {
                self.performSegue(withIdentifier: "NextLetter", sender: self)
            }
            else {
                letter.picJustTook = false
            }
        })

        if let scene = CameraScene(fileNamed: "CameraScene"){
            let skView = self.view as! SKView
            
            skView.presentScene(scene)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        URLCache.shared.removeAllCachedResponses()
    }
    
    override var shouldAutorotate: Bool{
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if letter.takePic == true {
            self.performSegue(withIdentifier: "NextLetter", sender: self)
        }
        else if letter.loadHome == true {
            self.performSegue(withIdentifier: "LoadHome", sender: nil)
            letter.loadHome = false
        }
        else if SegueVariables.finishedCam == true {
            SegueVariables.finishedCam = false
            self.performSegue(withIdentifier: "goinHome", sender: nil)
        }
        else if SegueVariables.doneEdit == true {
            SegueVariables.doneEdit = false
            self.performSegue(withIdentifier: "DoneEditingWithCam", sender: nil)
        }
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
