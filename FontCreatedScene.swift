//
//  FontCreatedScene.swift
//  MyType
//
//  Created by Alexander Eckert on 8/2/18.
//  Copyright © 2018 Alexander Eckert. All rights reserved.
//

import UIKit
import SpriteKit

class FontCreatedScene: SKScene {
    
    var congrats = UITextView()
    let fontMessage = SKLabelNode(fontNamed: "American Typewriter")
    var instruct  = UITextView()
    
    let bg = SKSpriteNode(imageNamed: "BlooSperkles")
    
    let doneBtn = SKLabelNode(fontNamed: "American Typewriter")
    
    var fontBeingDrawn : Int = 0
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor.white
        bg.size = CGSize(width: self.frame.width, height: self.frame.height)
        self.addChild(bg)
        
        let defaults3 = UserDefaults(suiteName: "group.io.golf.fonts")
        let a11 = defaults3?.object(forKey: "01")
        let a22 = defaults3?.object(forKey: "02")
        let a33 = defaults3?.object(forKey: "03")
        let a44 = defaults3?.object(forKey: "04")
        let a55 = defaults3?.object(forKey: "05")
        let a66 = defaults3?.object(forKey: "06")
        if a11 != nil {
            fontBeingDrawn = 1
        }
        if a22 != nil {
            fontBeingDrawn = 2
        }
        if a33 != nil {
            fontBeingDrawn = 3
        }
        if a44 != nil {
            fontBeingDrawn = 4
        }
        if a55 != nil {
            fontBeingDrawn = 5
        }
        if a66 != nil {
            fontBeingDrawn = 6
        }
        
        congrats = UITextView(frame: CGRect(x: 10, y: self.frame.height / 7, width: self.frame.width, height: self.frame.height / 12))
        congrats.attributedText = writeCongrats()
        congrats.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        congrats.layer.borderColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0).cgColor
        congrats.isUserInteractionEnabled = false
        congrats.isSelectable = false
        self.view?.addSubview(congrats)
        
        fontMessage.text = "You've just created a font!"
        fontMessage.fontSize = 20
        fontMessage.fontColor = UIColor.blue
        fontMessage.position = CGPoint(x: 0, y: self.frame.height / 4)
        self.addChild(fontMessage)
        
        instruct = UITextView(frame: CGRect(x: self.frame.width / 8, y: self.frame.height / 3, width: self.frame.width * 0.8, height: self.frame.height / 2))
        instruct.font = UIFont(name: "American Typewriter", size: 30)
        instruct.text = "Now, go to 'Edit Fonts.' You will see a circle at the top that says 'Font 1' Click it to activate your font."
        instruct.textColor = UIColor.gray
        instruct.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        instruct.layer.borderColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0).cgColor
        instruct.isUserInteractionEnabled = false
        instruct.isSelectable = false
        self.view?.addSubview(instruct)
        
        doneBtn.text = "Continue"
        doneBtn.fontColor = UIColor.blue
        doneBtn.fontSize = 50
        doneBtn.position = CGPoint(x: 0, y: self.frame.height / -2.5)
        self.addChild(doneBtn)
    }
    
    func writeCongrats() -> NSMutableAttributedString {
        let defaults = UserDefaults(suiteName: "group.io.golf.fonts")
        
        let textAttachment3 = NSTextAttachment()
        let save3 = defaults?.object(forKey: "C\(fontBeingDrawn)") as? Data
        let C = NSKeyedUnarchiver.unarchiveObject(with: save3!) as! UIImage
        textAttachment3.image = C
        let attributeC = NSAttributedString(attachment: textAttachment3)
        
        let textAttachment15 = NSTextAttachment()
        let save15 = defaults?.object(forKey: "O\(fontBeingDrawn)") as? Data
        let O = NSKeyedUnarchiver.unarchiveObject(with: save15!) as! UIImage
        textAttachment15.image = O
        let attributeO = NSAttributedString(attachment: textAttachment15)
        
        let textAttachment14 = NSTextAttachment()
        let save14 = defaults?.object(forKey: "N\(fontBeingDrawn)") as? Data
        let N = NSKeyedUnarchiver.unarchiveObject(with: save14!) as! UIImage
        textAttachment14.image = N
        let attributeN = NSAttributedString(attachment: textAttachment14)
        
        let textAttachment7 = NSTextAttachment()
        let save7 = defaults?.object(forKey: "G\(fontBeingDrawn)") as? Data
        let G = NSKeyedUnarchiver.unarchiveObject(with: save7!) as! UIImage
        textAttachment7.image = G
        let attributeG = NSAttributedString(attachment: textAttachment7)
        
        let textAttachment18 = NSTextAttachment()
        let save18 = defaults?.object(forKey: "R\(fontBeingDrawn)") as? Data
        let R = NSKeyedUnarchiver.unarchiveObject(with: save18!) as! UIImage
        textAttachment18.image = R
        let attributeR = NSAttributedString(attachment: textAttachment18)
        
        let textAttachment1 = NSTextAttachment()
        let save1 = defaults?.object(forKey: "A\(fontBeingDrawn)") as? Data
        let A = NSKeyedUnarchiver.unarchiveObject(with: save1!) as! UIImage
        textAttachment1.image = A
        let attributeA = NSAttributedString(attachment: textAttachment1)
        
        let textAttachment20 = NSTextAttachment()
        let save20 = defaults?.object(forKey: "T\(fontBeingDrawn)") as? Data
        let T = NSKeyedUnarchiver.unarchiveObject(with: save20!) as! UIImage
        textAttachment20.image = T
        let attributeT = NSAttributedString(attachment: textAttachment20)
        
        let textAttachment19 = NSTextAttachment()
        let save19 = defaults?.object(forKey: "S\(fontBeingDrawn)") as? Data
        let S = NSKeyedUnarchiver.unarchiveObject(with: save19!) as! UIImage
        textAttachment19.image = S
        let attributeS = NSAttributedString(attachment: textAttachment19)
        
        let textAttachment22 = NSTextAttachment()
        let save22 = defaults?.object(forKey: "!\(fontBeingDrawn)") as? Data
        let v = NSKeyedUnarchiver.unarchiveObject(with: save22!) as! UIImage
        textAttachment22.image = v
        let attributeV = NSAttributedString(attachment: textAttachment22)
        
        let mutable = NSMutableAttributedString(string: "")
        mutable.append(attributeC)
        mutable.append(attributeO)
        mutable.append(attributeN)
        mutable.append(attributeG)
        mutable.append(attributeR)
        mutable.append(attributeA)
        mutable.append(attributeT)
        mutable.append(attributeS)
        mutable.append(attributeV)
        
        return mutable
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if doneBtn.contains(pos){
            SegueVariables.fontMade = true
        }
    }
    func touchUp(atPoint pos : CGPoint) {
        if doneBtn.contains(pos){
            SegueVariables.fontMade = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
}
