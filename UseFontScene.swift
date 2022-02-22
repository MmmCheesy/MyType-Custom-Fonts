//
//  SendMessageScene.swift
//  MyType
//
//  Created by Alexander Eckert on 4/18/18.
//  Copyright © 2018 Alexander Eckert. All rights reserved.
//

import UIKit
import SpriteKit

class UseFontScene: SKScene, UITextViewDelegate {
    
    var theLetter : Int = 0
    var letters : Array = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",".",",","!","?","1","2","3","4","5","6","7","8","9","0"]
    
    var bg = SKSpriteNode(imageNamed: "BlooSperkles")
    var backColor = SKSpriteNode()
    var recentKey : Int = 0
    var lettersTyped : Int = 0
    
    var btn = SKSpriteNode()
    var addLetter = SKLabelNode(fontNamed: "American Typewriter")
    var sendMessage = SKLabelNode(fontNamed: "American Typewriter")
    var copyBtn = SKLabelNode(fontNamed: "American Typewriter")
    var back = SKSpriteNode(imageNamed: "BackBtn")
    var clearBtn = SKLabelNode(fontNamed: "American Typewriter")
    
    var typeHere = UITextView()
    var instructions = UITextView()
    
    var notif = SKSpriteNode(imageNamed: "CopyNotif")
    var activeFont : Int = 0
    var textNo : Int = 0
    var quotation : String = "”"
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor.white
        bg.size = CGSize(width: self.frame.width, height: self.frame.height)
        bg.position = CGPoint(x: 0, y: 0)
        self.addChild(self.bg)
        let defaults = UserDefaults.standard
        let defaults2 = UserDefaults(suiteName: "group.io.golf.fonts")
        var key = defaults2?.integer(forKey: "key")
        key! = 0
        defaults2?.set(key!, forKey: "key")
        activeFont = defaults2!.integer(forKey: "activeFont")
        if defaults.string(forKey: "dsize") == nil {defaults.set("", forKey: "dsize")}
        
        typeHere = UITextView(frame: CGRect(x: 0,y: 30,width: self.frame.width, height: self.frame.height / 3))
        typeHere.font = UIFont(name: "American Typewriter", size: 30)
        typeHere.layer.borderWidth = 5
        typeHere.backgroundColor = UIColor(white: 0.92, alpha: 1)
        typeHere.layer.borderColor = UIColor(white: 0.92, alpha: 1).cgColor
        typeHere.delegate = self
        typeHere.autocapitalizationType = .none
        typeHere.isScrollEnabled = false
        if activeFont == 0 {
            typeHere.isSelectable = false
            typeHere.isEditable = false
            typeHere.text = "You don't seem you have an active font... \n Make sure to activate a font in the 'Edit Fonts' area."
        } else {
            typeHere.text = "Type Here"
        }
        if UIDevice.current.userInterfaceIdiom == .pad {
            typeHere = UITextView(frame: CGRect(x: self.frame.width * 0.12,y: 30,width: self.frame.width * 0.76, height: self.frame.height / 3))
            typeHere.font = UIFont(name: "American Typewriter", size: 30)
            typeHere.layer.borderWidth = 5
            typeHere.backgroundColor = UIColor(white: 0.92, alpha: 1)
            typeHere.layer.borderColor = UIColor(white: 0.92, alpha: 1).cgColor
            typeHere.delegate = self
            typeHere.isScrollEnabled = false
            if activeFont == 0 {
                typeHere.isSelectable = false
                typeHere.isEditable = false
                typeHere.text = "You don't seem you have an active font... \n Make sure to activate a font in the 'Edit Fonts' area."
            } else {
                typeHere.text = "Type Here"
            }
        }
        
        let BGColor = defaults.integer(forKey: "BGColor")
        if BGColor == 1{
            typeHere.backgroundColor = UIColor(white: 0.92, alpha: 1)
            typeHere.layer.borderColor = UIColor(white: 0.92, alpha: 1).cgColor
        }
        if BGColor == 2 {
            typeHere.backgroundColor = UIColor.white
            typeHere.layer.borderColor = UIColor.white.cgColor
        }
        if BGColor == 3 {
            typeHere.backgroundColor = UIColor(red: 0, green: 0.7137, blue: 1, alpha: 1.0)
            typeHere.layer.borderColor = UIColor(red: 0, green: 0.7137, blue: 1, alpha: 1.0).cgColor
        }
        if BGColor == 4 {
            typeHere.backgroundColor = UIColor.red
            typeHere.layer.borderColor = UIColor.red.cgColor
        }
        if BGColor == 5 {
            typeHere.backgroundColor = UIColor(red: 0.7882, green: 0, blue: 0.9882, alpha: 1.0)
            typeHere.layer.borderColor = UIColor(red: 0.7882, green: 0, blue: 0.9882, alpha: 1.0).cgColor
        }
        
        self.view?.addSubview(typeHere)
        
        backColor.size = CGSize(width: self.frame.width * 2, height: self.frame.height / 3)
        backColor.position = CGPoint(x: 0, y: ((self.frame.height / 2) - (self.frame.height / 6)) - 30)
        backColor.color = typeHere.backgroundColor!
        self.addChild(backColor)
        
        let float : CGFloat = self.frame.width / 14
        clearBtn.text = "Clear Text"
        clearBtn.fontSize = float
        clearBtn.position = CGPoint(x: self.frame.width / 5, y: -float)
        clearBtn.fontColor = UIColor.gray
        self.addChild(clearBtn)
        
        sendMessage.text = "Send Message"
        sendMessage.fontColor = UIColor.gray
        sendMessage.fontSize = 20
        sendMessage.position = CGPoint(x: self.frame.width / 4, y: 0)
        
        btn.color = UIColor.gray
        btn.position = CGPoint(x: 0, y: self.frame.height / 10)
        btn.size = CGSize(width: self.frame.width, height: self.frame.width / 9)
        self.addChild(btn)
        
        back.size = CGSize(width: self.frame.width / 5, height: self.frame.width / 8)
        back.position = CGPoint(x: -self.frame.width / 4, y: -float / 2)
        self.addChild(back)
        
        addLetter.text = "CopyMessage"
        addLetter.fontSize = 40
        addLetter.fontColor = UIColor.white
        addLetter.position = CGPoint(x: 0, y: btn.position.y - (btn.size.height / 2))
        self.addChild(addLetter)
        
        instructions = UITextView(frame: CGRect(x: 0, y: self.frame.height / 1.5, width: self.frame.width, height: self.frame.height / 2))
        instructions.font = UIFont(name: "American Typewriter", size: 18)
        instructions.textColor = UIColor.gray
        instructions.text = "Type text above with the normal keyboard. Then press the 'Copy Message' button, and your text will be automatically copied. Then you can paste and send it anywhere! \n To paste a message, go to your texting app, double click inside the text message box, and select the 'PASTE' button. \n Be sure your font is selected"
        instructions.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0)
        instructions.layer.borderColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0).cgColor
        instructions.isUserInteractionEnabled = false
        instructions.isSelectable = false
        instructions.textAlignment = .center
        self.view?.addSubview(instructions)
        
        notif.size = CGSize(width: self.frame.width * 0.75, height: (self.frame.width * 0.75) * 0.35)
        notif.position = CGPoint(x: 0, y: 0)
        
    }
    func saveMessageToPasteboard(){
        var rect = CGRect()
        rect = CGRect(x: 10, y: -30, width: (self.view?.bounds.width)!, height: (self.view?.bounds.height)!)
        UIGraphicsBeginImageContextWithOptions(CGSize(width: self.frame.width + 5, height: (self.frame.height / 3) - 5), false, 1)
        self.view?.drawHierarchy(in: rect, afterScreenUpdates: true)
        let image : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIPasteboard.general.image = image
        if typeHere.text.count == 4 {
            print("bueno!")
        }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        typeHere.text = ""
    }
    func textViewDidChange(_ textView: UITextView) {
        var theIt = String()
        var newLetter = UIImage()
        if typeHere.text.count > textNo {
            if typeHere.text != "" {
                let str : String = typeHere.text
                let last = str.last!
                theIt = "\(last)"
            }
            if theIt == "-" || theIt == "/" || theIt == ":" || theIt == ";" || theIt == "(" || theIt == ")" || theIt == "$" || theIt == "&" || theIt == "@" || theIt == "]" || theIt == "[" || theIt == "{" || theIt == "}" || theIt == "#" || theIt == "%" || theIt == "^" || theIt == "*" || theIt == "+" || theIt == "=" || theIt == "_" || theIt == "|" || theIt == "~" || theIt == "<" || theIt == ">" || theIt == "\n" {
                print("Not a valid character")
                if theIt != "\n"{
                    typeHere.deleteBackward()
                }
            }
            else if theIt == " " {
                typeHere.deleteBackward()
                let defaults = UserDefaults.standard
                if activeFont != 7 && activeFont != 8 && activeFont != 9 {
                    let space = defaults.integer(forKey: "size\(activeFont)")
                    if space == 1 {
                        newLetter = UIImage(named: "Space")!
                    }
                    else if space == 2 {
                        newLetter = UIImage(named: "MidSpace")!
                    }
                    else if space == 3 {
                        newLetter = UIImage(named: "SmallSpace")!
                    }
                    else {
                        newLetter = UIImage(named: "Space")!
                    }
                }else{
                    let space = defaults.string(forKey: "dsize")
                    if space == "" {
                        newLetter = UIImage(named: "Space")!
                    }
                    else if space == " copy" {
                        newLetter = UIImage(named: "MidSpace")!
                    }
                    else if space == " copy 2" {
                        newLetter = UIImage(named: "SmallSpace")!
                    }
                    else {
                        newLetter = UIImage(named: "Space")!
                    }
                }
                
                let textAttachment = NSTextAttachment()
                textAttachment.image = newLetter
                let mutable = NSMutableAttributedString(string: "")
                let attribute = NSAttributedString(attachment: textAttachment)
                let keepText = typeHere.attributedText
                if keepText?.string != "" {
                    mutable.append(keepText!)
                }
                if attribute.string != "" {
                    mutable.append(attribute)
                }
                if mutable.string != "" {
                    typeHere.attributedText = mutable
                }
            }
            else if theIt == "’" {
                typeHere.deleteBackward()
                if activeFont != 7 && activeFont != 8 && activeFont != 9 {
                    newLetter = getALetterFromDefaults(letter: "'\(activeFont)")
                }else{
                    let defaults = UserDefaults.standard
                    if activeFont == 7 {
                        let size = defaults.string(forKey: "dsize")
                        newLetter = getFont(font: "Phillis", lett: "'", size: "\(size!)")
                    }
                    else if activeFont == 8 {
                        let size = defaults.string(forKey: "dsize")
                        newLetter = getFont(font: "Martin", lett: "'", size: "\(size!)")
                    }
                    else if activeFont == 9 {
                        let size = defaults.string(forKey: "dsize")
                        newLetter = getFont(font: "Shake", lett: "'", size: "\(size!)")
                    }
                }
                
                let textAttachment = NSTextAttachment()
                textAttachment.image = newLetter
                let mutable = NSMutableAttributedString(string: "")
                let attribute = NSAttributedString(attachment: textAttachment)
                let keepText = typeHere.attributedText
                if keepText?.string != "" {
                    mutable.append(keepText!)
                }
                if attribute.string != "" {
                    mutable.append(attribute)
                }
                if mutable.string != "" {
                    typeHere.attributedText = mutable
                }
            }
            else if theIt == "A" || theIt == "B" || theIt == "C" || theIt == "D"  || theIt == "E" || theIt == "F" || theIt == "G" || theIt == "H" || theIt == "I" || theIt == "J" || theIt == "K" || theIt == "L" || theIt == "M" || theIt == "N" || theIt == "O" || theIt == "P" || theIt == "Q" || theIt == "R" || theIt == "S" || theIt == "T" || theIt == "U" || theIt == "V" || theIt == "W" || theIt == "X" || theIt == "Y" || theIt == "Z" || theIt == "a" || theIt == "b" || theIt == "c" || theIt == "d" || theIt == "e" || theIt == "f" || theIt == "g" || theIt == "h" || theIt == "i" || theIt == "j" || theIt == "k" || theIt == "l" || theIt == "m" || theIt == "n" || theIt == "o" || theIt == "p" || theIt == "q" || theIt == "r" || theIt == "s" || theIt == "t" || theIt == "u" || theIt == "v" || theIt == "w" || theIt == "x" || theIt == "y" || theIt == "z" || theIt == "1" || theIt == "2" || theIt == "3" || theIt == "4" || theIt == "5" || theIt == "6" || theIt == "7" || theIt == "8" || theIt == "9" || theIt == "0" || theIt == "." || theIt == "," || theIt == "!" || theIt == "?"{
                typeHere.deleteBackward()
                if activeFont != 7 && activeFont != 8 && activeFont != 9 {
                    newLetter = getALetterFromDefaults(letter: "\(theIt)" + "\(activeFont)")
                }else{
                    let defaults = UserDefaults.standard
                    if theIt == "a" || theIt == "b" || theIt == "c" || theIt == "d" || theIt == "e" || theIt == "f" || theIt == "g" || theIt == "h" || theIt == "i" || theIt == "j" || theIt == "k" || theIt == "l" || theIt == "m" || theIt == "n" || theIt == "o" || theIt == "p" || theIt == "q" || theIt == "r" || theIt == "s" || theIt == "t" || theIt == "u" || theIt == "v" || theIt == "w" || theIt == "x" || theIt == "y" || theIt == "z"{
                        if activeFont == 7 {
                            let size = defaults.string(forKey: "dsize")
                            newLetter = getFont(font: "Phillis", lett: "z\(theIt)", size: "\(size!)")
                        }
                        else if activeFont == 8 {
                            let size = defaults.string(forKey: "dsize")
                            newLetter = getFont(font: "Martin", lett: "z\(theIt)", size: "\(size!)")
                        }
                        else if activeFont == 9 {
                            let size = defaults.string(forKey: "dsize")
                            newLetter = getFont(font: "Shake", lett: "z\(theIt)", size: "\(size!)")
                        }
                    }else{
                        if activeFont == 7 {
                            let size = defaults.string(forKey: "dsize")
                            newLetter = getFont(font: "Phillis", lett: "\(theIt)", size: "\(size!)")
                        }
                        else if activeFont == 8 {
                            let size = defaults.string(forKey: "dsize")
                            newLetter = getFont(font: "Martin", lett: "\(theIt)", size: "\(size!)")
                        }
                        else if activeFont == 9 {
                            let size = defaults.string(forKey: "dsize")
                            newLetter = getFont(font: "Shake", lett: "\(theIt)", size: "\(size!)")
                        }
                    }
                }
                
                let textAttachment = NSTextAttachment()
                textAttachment.image = newLetter
                let mutable = NSMutableAttributedString(string: "")
                let attribute = NSAttributedString(attachment: textAttachment)
                let keepText = typeHere.attributedText
                if keepText?.string != "" {
                    mutable.append(keepText!)
                }
                if attribute.string != "" {
                    mutable.append(attribute)
                }
                if mutable.string != "" {
                    typeHere.attributedText = mutable
                }
            }
            else {
                typeHere.deleteBackward()
            }
        }
        textNo = typeHere.text.count
    }
    func getALetterFromDefaults(letter: String) -> UIImage {
        let defaults = UserDefaults(suiteName: "group.io.golf.fonts")
        let savedLetter = defaults?.object(forKey: letter) as? Data
        let theLetter = NSKeyedUnarchiver.unarchiveObject(with: savedLetter!) as! UIImage
        return theLetter
    }
    func getFont(font: String, lett: String, size: String) -> UIImage {
        let image = UIImage(named: "\(font)\(lett)\(size)")
        return image!
    }
    func touchDown(atPoint pos : CGPoint) {
        if addLetter.contains(pos){
            typeHere.resignFirstResponder()
            saveMessageToPasteboard()
            notif.removeFromParent()
            self.addChild(notif)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                let fade = SKAction.fadeAlpha(by: 1, duration: 1)
                self.notif.run(fade)
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                self.notif.removeFromParent()
            })
        }
        else if back.contains(pos){
            SegueVariables.doneTexting = true
        }
    }
    func touchesMoved(toPoint pos: CGPoint) {
        
    }
    func touchUp(atPoint pos : CGPoint) {
        if clearBtn.contains(pos){
            typeHere.text = ""
            textNo = 0
            typeHere.becomeFirstResponder()
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchesMoved(toPoint: t.location(in: self)) }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
}
