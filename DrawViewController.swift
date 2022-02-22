//
//  DrawViewController.swift
//  MyType
//
//  Created by Alexander Eckert on 3/18/18.
//  Copyright © 2018 Alexander Eckert. All rights reserved.
//

import UIKit
import SpriteKit

class DrawViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = DrawScene(fileNamed: "DrawScene"){
            let skView = self.view as! SKView
            
            skView.presentScene(scene)
        }
        // Do any additional setup after loading the view.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if SegueVariables.finDraw == true{
            SegueVariables.finDraw = false
            self.performSegue(withIdentifier: "finDrawing", sender: nil)
        }
        if SegueVariables.finishedDrawing == true {
            SegueVariables.finishedDrawing = false
            self.performSegue(withIdentifier: "goingHome", sender: nil)
        }
        if SegueVariables.doneEdit == true {
            SegueVariables.doneEdit = false
            performSegue(withIdentifier: "DoneEditWithDraw", sender: nil)
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
