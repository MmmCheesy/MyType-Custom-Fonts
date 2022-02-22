//
//  FontCreatedViewController.swift
//  MyType
//
//  Created by Alexander Eckert on 8/2/18.
//  Copyright © 2018 Alexander Eckert. All rights reserved.
//

import UIKit
import SpriteKit

class FontCreatedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let scene = FontCreatedScene(fileNamed: "FontCreatedScene"){
            let skView = self.view as! SKView
            
            skView.presentScene(scene)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if SegueVariables.fontMade == true {
            SegueVariables.fontMade = false
            self.performSegue(withIdentifier: "FontCreated", sender: nil)
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
