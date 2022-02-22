//
//  EmailScene.swift
//  MyType
//
//  Created by Alexander Eckert on 9/27/18.
//  Copyright © 2018 Alexander Eckert. All rights reserved.
//

import UIKit
import SpriteKit

class EmailScene: SKScene {
    
    let pics = SKSpriteNode(imageNamed: "Faces")
    var text = UITextView()
    let aqui = SKLabelNode(fontNamed: "American Typewriter")
    let back = SKSpriteNode(imageNamed: "BackBtn")
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor.white
        
        pics.size = CGSize(width: self.frame.width / 1.5, height: self.frame.height / 2.5)
        pics.position = CGPoint(x: 0, y: (self.frame.height / 2) - ((self.frame.width / 1.5)/1.5))
        self.addChild(pics)
        
        text = UITextView(frame: CGRect(x: self.frame.width * (1/20), y: self.frame.height / 2, width: self.frame.width * (18/20), height : self.frame.height / 4))
        text.font = UIFont(name: "American Typewriter", size: 23)
        text.text = "Alexander G Eckert is a programmer, Rubik's Cube solver, and avid yo-yo trickster. \n You can contact Alex "
        text.isEditable = false
        text.isSelectable = false
        text.isScrollEnabled = false
        text.textAlignment = .center
        text.textColor = UIColor.black
        text.backgroundColor = UIColor.white
        text.layer.borderColor = UIColor.white.cgColor
        self.view?.addSubview(text)
        
        aqui.text = "here"
        aqui.position = CGPoint(x: 0, y: (self.frame.height / -4) - 20)
        aqui.fontColor = UIColor.blue
        aqui.fontSize = 23
        self.addChild(aqui)
        
        back.size = CGSize(width: self.frame.width / 4, height: self.frame.width  / 8)
        back.position = CGPoint(x: 0, y: self.frame.height / -2.6)
        self.addChild(back)
    }
    func touchUp(atPoint pos: CGPoint){
        if back.contains(pos){
            SegueVariables.theCreator = true
        }
        else if aqui.contains(pos){
            SegueVariables.email = true
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
}
