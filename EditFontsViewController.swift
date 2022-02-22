//
//  EditFontsViewController.swift
//  MyType
//
//  Created by Alexander Eckert on 6/29/18.
//  Copyright © 2018 Alexander Eckert. All rights reserved.
//

import UIKit
import SpriteKit

class EditFontsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = EditFontsScene(fileNamed: "EditFontsScene"){
            let skView = self.view as! SKView
            
            skView.presentScene(scene)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var shouldAutorotate: Bool{
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if SegueVariables.editFonts == true {
            SegueVariables.editFonts = false
            self.performSegue(withIdentifier: "DoneEditing", sender: nil)
        }
        else if fontVariables.drawEdit == true {
            self.performSegue(withIdentifier: "editWithDraw", sender: nil)
        }
        else if fontVariables.camEdit == true {
            self.performSegue(withIdentifier: "EditWithCam", sender: nil)
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
