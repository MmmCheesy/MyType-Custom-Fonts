//
//  EditFontsScene.swift
//  MyType
//
//  Created by Alexander Eckert on 6/29/18.
//  Copyright © 2018 Alexander Eckert. All rights reserved.
//

import UIKit
import SpriteKit

class EditFontsScene: SKScene {
    
    let bg = SKSpriteNode(imageNamed: "BlooSperkles")
    let bg2 = SKSpriteNode(imageNamed: "BlooSperkles")
    let back = SKSpriteNode(imageNamed: "AllDone")
    let cameraNode = SKCameraNode()
    var distance = Int()
    var scroll = SKSpriteNode(imageNamed: "ScrollHint")
    var add : Int = 0
    var timer = Timer()
    var no : Int = 0
    var str : String = ""
    var sceneOn : Bool = true
    var fontSize = CGFloat()
    
    var a1 : Bool = false
    var a2 : Bool = false
    var a3 : Bool = false
    var a4 : Bool = false
    var a5 : Bool = false
    var a6 : Bool = false
    
    var div1 = SKShapeNode()
    let fontSelection = SKLabelNode(fontNamed: "American Typewriter")
    let selectFont1 = SKLabelNode(fontNamed: "American Typewriter")
    let fontOne = SKShapeNode(circleOfRadius: 20)
    let font1selected = SKShapeNode(circleOfRadius: 15)
    let selectFont2 = SKLabelNode(fontNamed: "American Typewriter")
    let fontTwo = SKShapeNode(circleOfRadius: 20)
    let font2selected = SKShapeNode(circleOfRadius: 15)
    let selectFont3 = SKLabelNode(fontNamed: "American Typewriter")
    let fontThree = SKShapeNode(circleOfRadius: 20)
    let font3selected = SKShapeNode(circleOfRadius: 15)
    let selectFont4 = SKLabelNode(fontNamed: "American Typewriter")
    let fontFour = SKShapeNode(circleOfRadius: 20)
    let font4selected = SKShapeNode(circleOfRadius: 15)
    let selectFont5 = SKLabelNode(fontNamed: "American Typewriter")
    let fontFive = SKShapeNode(circleOfRadius: 20)
    let font5selected = SKShapeNode(circleOfRadius: 15)
    let selectFont6 = SKLabelNode(fontNamed: "American Typewriter")
    let fontSix = SKShapeNode(circleOfRadius: 20)
    let font6selected = SKShapeNode(circleOfRadius: 15)
    let selectFontPW = SKLabelNode(fontNamed: "American Typewriter")
    let fontPW = SKShapeNode(circleOfRadius: 20)
    let fontPWselected = SKShapeNode(circleOfRadius: 15)
    let selectFontWS = SKLabelNode(fontNamed: "American Typewriter")
    let fontWS = SKShapeNode(circleOfRadius: 20)
    let fontWSselected = SKShapeNode(circleOfRadius: 15)
    let selectFontML = SKLabelNode(fontNamed: "American Typewriter")
    let fontML = SKShapeNode(circleOfRadius: 20)
    let fontMLselected = SKShapeNode(circleOfRadius: 15)
    
    var div2 = SKShapeNode()
    let nameFont = SKLabelNode(fontNamed: "American Typewriter")
    var typeIt = UITextView()
    var saveIt = SKSpriteNode(imageNamed: "SaveIt")
    
    var div3 = SKShapeNode()
    let fontColor = SKLabelNode(fontNamed: "American Typewriter")
    let color1 = SKShapeNode(circleOfRadius: 20)
    let color2 = SKShapeNode(circleOfRadius: 20)
    let color3 = SKShapeNode(circleOfRadius: 20)
    let color4 = SKShapeNode(circleOfRadius: 20)
    let color5 = SKShapeNode(circleOfRadius: 20)
    let changeBgClr = SKLabelNode(fontNamed: "American Typewriter")
    let color6 = SKShapeNode(circleOfRadius: 20)
    let color7 = SKShapeNode(circleOfRadius: 20)
    let color8 = SKShapeNode(circleOfRadius: 20)
    let color9 = SKShapeNode(circleOfRadius: 20)
    let color10 = SKShapeNode(circleOfRadius: 20)
    var textBox = UITextView()
    
    var div4 = SKShapeNode()
    var enterCharacter = SKLabelNode(fontNamed: "American Typewriter")
    var enterHere = UITextView()
    var edit = SKLabelNode(fontNamed: "American Typewriter")
    var editme = SKSpriteNode()
    var cameraToggle = SKAction()
    var newBG = SKSpriteNode(imageNamed: "BlooSperkles")
    var drawLetter = SKLabelNode(fontNamed: "American Typewriter")
    var editWithCam = SKLabelNode(fontNamed: "American Typewriter")
    var cam = SKSpriteNode(imageNamed: "Camera")
    var paintBrush = SKSpriteNode(imageNamed: "PaintBrush")
    var divider = SKSpriteNode(imageNamed: "Scribble")
    var oopsnope = SKSpriteNode(imageNamed: "BackBtn")
    var moveBack = SKAction()
    var touchPad1 = SKSpriteNode()
    var touchPad2 = SKSpriteNode()
    
    var deleteFontBtn = SKSpriteNode()
    var delete = SKLabelNode(fontNamed: "American Typewriter")
    var deleteAFont = SKAction()
    var deleteMessage = UITextView()
    var deleteConfirm = SKLabelNode(fontNamed: "American Typewriter")
    var cancelDelete = SKLabelNode(fontNamed: "American Typewriter")
    var canceled = SKAction()
    var deleteSCN : Bool = false
    
    var sizeFontArea = SKShapeNode()
    var sizeFont = SKLabelNode(fontNamed: "American Typewriter")
    var size1 = SKLabelNode(fontNamed: "American Typewriter")
    var size2 = SKLabelNode(fontNamed: "American Typewriter")
    var size3 = SKLabelNode(fontNamed: "American Typewriter")
    var examples: Array = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",".",",","!","?","'","1","2","3","4","5","6","7","8","9","0"]
    
    var PWBool = Bool()
    var WSBool = Bool()
    var MLBool = Bool()
    
    var notify = SKSpriteNode(imageNamed: "SelectFontNotification")
    var notif : Int = 0
    var aFontHasBeenMade : Bool = true
    
    override func didMove(to view: SKView) {
        bg.size = CGSize(width: self.frame.width, height: self.frame.height)
        self.addChild(bg)
        bg2.size = CGSize(width: self.frame.width, height: self.frame.height)
        bg2.position = CGPoint(x: 0, y: -self.frame.height + (self.frame.height / -12))
        self.addChild(bg2)
        self.backgroundColor = UIColor.white
        update()
        print("\(a.fontsCreated) fonts created...")
        fontSize = self.frame.width / 20
        
        let defaults = UserDefaults.standard
        let defaults2 = UserDefaults(suiteName: "group.io.golf.fonts")
        if defaults.string(forKey: "dsize") == nil {defaults.set("", forKey: "dsize")}
        
        let a11 = defaults2?.object(forKey: "01")
        let a22 = defaults2?.object(forKey: "02")
        let a33 = defaults2?.object(forKey: "03")
        let a44 = defaults2?.object(forKey: "04")
        let a55 = defaults2?.object(forKey: "05")
        let a66 = defaults2?.object(forKey: "06")
        if a11 == nil {
            a1 = true
        }
        else {
            a.fontsCreated = 1
            let defaults = UserDefaults(suiteName: "group.io.golf.fonts")
            defaults!.set(a.fontsCreated, forKey: "fontsCreated")
        }
        if a22 == nil {
            a2 = true
        }
        else {
            a.fontsCreated = 2
            let defaults = UserDefaults(suiteName: "group.io.golf.fonts")
            defaults!.set(a.fontsCreated, forKey: "fontsCreated")
        }
        if a33 == nil {
            a3 = true
        }
        else {
            a.fontsCreated = 3
            let defaults = UserDefaults(suiteName: "group.io.golf.fonts")
            defaults!.set(a.fontsCreated, forKey: "fontsCreated")
        }
        if a44 == nil {
            a4 = true
        }
        else {
            a.fontsCreated = 4
            let defaults = UserDefaults(suiteName: "group.io.golf.fonts")
            defaults!.set(a.fontsCreated, forKey: "fontsCreated")
        }
        if a55 == nil {
            a5 = true
        }
        else {
            a.fontsCreated = 5
            let defaults = UserDefaults(suiteName: "group.io.golf.fonts")
            defaults!.set(a.fontsCreated, forKey: "fontsCreated")
        }
        if a66 == nil {
            a6 = true
        }
        else {
            a.fontsCreated = 6
            let defaults = UserDefaults(suiteName: "group.io.golf.fonts")
            defaults!.set(a.fontsCreated, forKey: "fontsCreated")
        }
        if a11 == nil && a22 == nil && a33 == nil && a44 == nil && a55 == nil && a66 == nil {
            aFontHasBeenMade = false
        }
        print("\(a.fontsCreated) fonts created!")
        
        let bgcolor = defaults.integer(forKey: "BGColor")
        PWBool = defaults.bool(forKey: "PhillisWheatley")
        WSBool = defaults.bool(forKey: "Shakespeare")
        MLBool = defaults.bool(forKey: "MartinLuther")
        
        cameraNode.position = CGPoint(x: 0, y: self.frame.height / -12)
        self.addChild(cameraNode)
        self.camera = cameraNode
        
        back.size = CGSize(width: self.frame.width / 4, height: self.frame.height  / 15)
        back.position = CGPoint(x:-(self.frame.width / 2) + (self.back.size.width / 2), y: (self.frame.height / 2) - (self.back.size.height / 1.2) + (self.frame.height / -12))
        self.addChild(back)
        
        scroll.size = CGSize(width: self.frame.width / 4, height: self.frame.width / 6)
        scroll.position = CGPoint(x: 0, y: self.frame.height / 2.5)
        //self.addChild(scroll)
        
        div1 = SKShapeNode.init(rect: CGRect(x: (self.frame.width / -2) + 10, y: ((self.frame.height / 3) - (self.frame.height / 2)), width: self.frame.width - 20, height: self.frame.height / 2))
        div1.lineWidth = 7
        div1.strokeColor = UIColor.blue
        self.addChild(div1)
        
        add = defaults.integer(forKey: "activeFont")
        fontVariables.fontSelected = add
        
        fontSelection.text = "Font Selection: "
        fontSelection.fontSize = fontSize
        fontSelection.position = CGPoint(x: self.frame.width / -5, y: self.frame.height / 3.5)
        fontSelection.fontColor = UIColor.blue
        self.addChild(fontSelection)
        
        let font1Name = defaults.string(forKey: "font1name")
        selectFont1.text = font1Name
        if selectFont1.text == "" || font1Name == nil {
            selectFont1.text = "Font 1"
        }
        selectFont1.fontColor = UIColor.blue
        selectFont1.fontSize = 15
        selectFont1.position = CGPoint(x: self.frame.width / -4, y: self.frame.height / 4.5)
        
        fontOne.lineWidth = 5
        fontOne.strokeColor = UIColor.blue
        fontOne.position = CGPoint(x: self.frame.width / -4, y: self.selectFont1.position.y - 30)
        
        font1selected.fillColor = UIColor.blue
        font1selected.position = fontOne.position
        if add == 1 {
            self.addChild(font1selected)
        }
        
        let font2Name = defaults.string(forKey: "font2name")
        selectFont2.text = font2Name
        if selectFont2.text == "" || font2Name == nil {
            selectFont2.text = "Font 2"
        }
        selectFont2.fontColor = UIColor.blue
        selectFont2.fontSize = 15
        selectFont2.position = CGPoint(x: 0, y: self.frame.height / 4.5)
        
        fontTwo.lineWidth = 5
        fontTwo.strokeColor = UIColor.blue
        fontTwo.position = CGPoint(x: 0, y: self.selectFont2.position.y - 30)
        
        font2selected.fillColor = UIColor.blue
        font2selected.position = fontTwo.position
        if add == 2 {
            self.addChild(font2selected)
        }
        
        let font3Name = defaults.string(forKey: "font3name")
        selectFont3.text = font3Name
        if selectFont3.text == "" || font3Name == nil {
            selectFont3.text = "Font 3"
        }
        selectFont3.fontColor = UIColor.blue
        selectFont3.fontSize = 15
        selectFont3.position = CGPoint(x: self.frame.width / 4, y: self.frame.height / 4.5)
        
        fontThree.lineWidth = 5
        fontThree.strokeColor = UIColor.blue
        fontThree.position = CGPoint(x: self.frame.width / 4, y: self.selectFont3.position.y - 30)
        
        font3selected.fillColor = UIColor.blue
        font3selected.position = fontThree.position
        if add == 3 {
            self.addChild(font3selected)
        }
        
        let font4Name = defaults.string(forKey: "font4name")
        selectFont4.text = font4Name
        if selectFont4.text == "" || font4Name == nil {
            selectFont4.text = "Font 4"
        }
        selectFont4.fontColor = UIColor.blue
        selectFont4.fontSize = 15
        selectFont4.position = CGPoint(x: self.frame.width / -4, y: self.frame.height / 9.5)
        
        fontFour.lineWidth = 5
        fontFour.strokeColor = UIColor.blue
        fontFour.position = CGPoint(x: self.frame.width / -4, y: self.selectFont4.position.y - 30)
        
        font4selected.fillColor = UIColor.blue
        font4selected.position = fontFour.position
        if add == 4 {
            self.addChild(font4selected)
        }
        
        let font5Name = defaults.string(forKey: "font5name")
        selectFont5.text = font5Name
        if selectFont5.text == "" || font5Name == nil {
            selectFont5.text = "Font 5"
        }
        selectFont5.fontColor = UIColor.blue
        selectFont5.fontSize = 15
        selectFont5.position = CGPoint(x: 0, y: self.frame.height / 9.5)
        
        fontFive.lineWidth = 5
        fontFive.strokeColor = UIColor.blue
        fontFive.position = CGPoint(x: 0, y: selectFont5.position.y - 30)
        
        font5selected.fillColor = UIColor.blue
        font5selected.position = fontFive.position
        if add == 5 {
            self.addChild(selectFont5)
        }
        
        let font6Name = defaults.string(forKey: "font6name")
        selectFont6.text = font6Name
        if selectFont6.text == "" || font6Name == nil {
            selectFont6.text = "Font 6"
        }
        selectFont6.fontColor = UIColor.blue
        selectFont6.fontSize = 15
        selectFont6.position = CGPoint(x: self.frame.width / 4, y: self.frame.height / 9.5)
        
        fontSix.lineWidth = 5
        fontSix.strokeColor = UIColor.blue
        fontSix.position = CGPoint(x: self.frame.width / 4, y: self.selectFont6.position.y - 30)
        
        font6selected.fillColor = UIColor.blue
        font6selected.position = fontSix.position
        if add == 6 {
            self.addChild(font6selected)
        }
        
        selectFontPW.text = "Phillis W."
        selectFontPW.fontColor = UIColor.blue
        selectFontPW.fontSize = 15
        selectFontPW.position = CGPoint(x: self.frame.width / -4, y: self.frame.height / -30)
        
        fontPW.lineWidth = 5
        fontPW.strokeColor = UIColor.blue
        fontPW.position = CGPoint(x: self.frame.width / -4, y: self.selectFontPW.position.y - 30)
        
        fontPWselected.fillColor = UIColor.blue
        fontPWselected.position = fontPW.position
        if add == 7 {
            self.addChild(fontPWselected)
        }
        
        selectFontWS.text = "Shakespeare"
        selectFontWS.fontColor = UIColor.blue
        selectFontWS.fontSize = 15
        selectFontWS.position = CGPoint(x: self.frame.width / 4, y: self.frame.height / -30)
        
        fontWS.lineWidth = 5
        fontWS.strokeColor = UIColor.blue
        fontWS.position = CGPoint(x: self.frame.width / 4, y: self.selectFontWS.position.y - 30)
        
        fontWSselected.fillColor = UIColor.blue
        fontWSselected.position = fontWS.position
        if add == 9 {
            self.addChild(fontWSselected)
        }
        
        selectFontML.text = "Dr. King"
        selectFontML.fontColor = UIColor.blue
        selectFontML.fontSize = 15
        selectFontML.position = CGPoint(x: 0, y: self.frame.height / -30)
        
        fontML.lineWidth = 5
        fontML.strokeColor = UIColor.blue
        fontML.position = CGPoint(x: 0, y: self.selectFontML.position.y - 30)
        
        fontMLselected.fillColor = UIColor.blue
        fontMLselected.position = fontML.position
        if add == 8 {
            self.addChild(fontMLselected)
        }
        
        if a.fontsCreated == 0 {
            let note = SKLabelNode(fontNamed: "American Typewriter")
            note.text = "You haven't created any fonts yet..."
            note.fontColor = UIColor.blue
            note.fontSize = 17
            note.position = CGPoint(x: 0, y: self.frame.height / 5)
            self.addChild(note)
        }
        else if a.fontsCreated == 1 {
            self.addChild(selectFont1)
            self.addChild(fontOne)
        }
        else if a.fontsCreated == 2 {
            self.addChild(selectFont1)
            self.addChild(fontOne)
            self.addChild(fontTwo)
            self.addChild(selectFont2)
        }
        else if a.fontsCreated == 3 {
            self.addChild(selectFont1)
            self.addChild(fontOne)
            self.addChild(fontTwo)
            self.addChild(selectFont2)
            self.addChild(fontThree)
            self.addChild(selectFont3)
        }
        else if a.fontsCreated == 4 {
            self.addChild(selectFont1)
            self.addChild(fontOne)
            self.addChild(fontTwo)
            self.addChild(selectFont2)
            self.addChild(fontThree)
            self.addChild(selectFont3)
            self.addChild(selectFont4)
            self.addChild(fontFour)
        }
        else if a.fontsCreated == 5 {
            self.addChild(selectFont1)
            self.addChild(fontOne)
            self.addChild(fontTwo)
            self.addChild(selectFont2)
            self.addChild(fontThree)
            self.addChild(selectFont3)
            self.addChild(selectFont4)
            self.addChild(fontFour)
            self.addChild(selectFont5)
            self.addChild(fontFive)
        }
        else if a.fontsCreated == 6 {
            self.addChild(selectFont1)
            self.addChild(fontOne)
            self.addChild(fontTwo)
            self.addChild(fontThree)
            self.addChild(selectFont3)
            self.addChild(selectFont2)
            self.addChild(selectFont4)
            self.addChild(fontFour)
            self.addChild(selectFont5)
            self.addChild(fontFive)
            self.addChild(selectFont6)
            self.addChild(fontSix)
        }
        if a1 == true {
            selectFont1.removeFromParent()
            fontOne.removeFromParent()
        }
        if a2 == true {
            selectFont2.removeFromParent()
            fontTwo.removeFromParent()
        }
        if a3 == true {
            selectFont3.removeFromParent()
            fontThree.removeFromParent()
        }
        if a4 == true {
            selectFont4.removeFromParent()
            fontFour.removeFromParent()
        }
        if a5 == true {
            selectFont5.removeFromParent()
            fontFive.removeFromParent()
        }
        if a6 == true {
            selectFont6.removeFromParent()
            fontSix.removeFromParent()
        }
        if PWBool == true {
            self.addChild(fontPW)
            self.addChild(selectFontPW)
        }
        if WSBool == true {
            self.addChild(fontWS)
            self.addChild(selectFontWS)
        }
        if MLBool == true {
            self.addChild(fontML)
            self.addChild(selectFontML)
        }
        
        div2 = SKShapeNode.init(rect: CGRect(x: (self.frame.width / -2) + 10, y: (self.frame.height / -12) + ((self.frame.height / 3) - (self.frame.height / 2)), width: self.frame.width - 20, height: self.frame.height / 12))
        div2.lineWidth = 7
        div2.strokeColor = UIColor.blue
        self.addChild(div2)
        
        nameFont.text = "Rename Font:"
        nameFont.fontColor = UIColor.blue
        nameFont.fontSize = fontSize
        nameFont.position = CGPoint(x: self.frame.width / -3.6, y: (div2.frame.size.height / -1.5) + ((self.frame.height / 3) - (self.frame.height / 2)))
        self.addChild(nameFont)
        
        typeIt = UITextView(frame: CGRect(x: self.frame.width / 2.5, y: ((self.frame.height / 1.95) - (self.frame.height / 12)) - ((self.frame.height / 3) - (self.frame.height / 2)), width: self.frame.width / 2.2, height: self.frame.width / 10))
        typeIt.text = ""
        typeIt.font = UIFont(name: "American Typewriter", size: 15)
        typeIt.layer.borderWidth = 5
        typeIt.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.2)
        typeIt.layer.borderColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).cgColor
        self.view?.addSubview(typeIt)
        
        saveIt.position = CGPoint(x: self.frame.width / 2.4, y: -(self.div2.frame.size.height / 2.2) + ((self.frame.height / 3) - (self.frame.height / 2)))
        saveIt.size = CGSize(width: self.frame.width / 7, height: self.frame.width / 9)
        self.addChild(saveIt)
        
        div3 = SKShapeNode.init(rect: CGRect(x: (self.frame.width / -2) + 10, y: (div2.position.y - self.frame.height / 5) + ((self.frame.height / 3) - (self.frame.height / 2)), width: self.frame.width - 20, height: self.frame.height / 5))
        div3.lineWidth = 7
        div3.strokeColor = UIColor.blue
        self.addChild(div3)
        
        textBox = UITextView(frame: CGRect(x: 15, y: (self.frame.height * 0.82), width: self.frame.width - 30, height: self.frame.height / 6))
        textBox.text = ""
        textBox.layer.borderWidth = 5
        textBox.isSelectable = false
        textBox.isEditable = false
        textBox.isUserInteractionEnabled = true
        textBox.isScrollEnabled = true
        if bgcolor == 1 {
            textBox.backgroundColor = UIColor(white: 0.92, alpha: 1)
            textBox.layer.borderColor = UIColor(white: 0.92, alpha: 1).cgColor
        }
        else if bgcolor == 2 {
            textBox.backgroundColor = UIColor.white
            textBox.layer.borderColor = UIColor.white.cgColor
        }
        else if bgcolor == 3 {
            textBox.backgroundColor = UIColor(red: 0, green: 0.7137, blue: 1, alpha: 1.0)
            textBox.layer.borderColor = UIColor(red: 0, green: 0.7137, blue: 1, alpha: 1.0).cgColor
        }
        else if bgcolor == 4 {
            textBox.backgroundColor = UIColor.red
            textBox.layer.borderColor = UIColor.red.cgColor
        }
        else if bgcolor == 5 {
            textBox.backgroundColor = UIColor(red: 0.7882, green: 0, blue: 0.9882, alpha: 1.0)
            textBox.layer.borderColor = UIColor(red: 0.7882, green: 0, blue: 0.9882, alpha: 1.0).cgColor
        }
        if a.fontsCreated != 0 && aFontHasBeenMade == true && a11 != nil && checkForDeletedFont() == true && add != 7 && add != 8 && add != 9 {
            if add == 0 {
                add = a.fontsCreated
            }
            textBox.attributedText = getALetterFromDefaults()
        }
        else if add == 7 || add == 8 || add == 9 {
            let defaults = UserDefaults.standard
            if add == 7 {
                var size = defaults.string(forKey: "dsize")
                if size == nil {
                    size = ""
                    defaults.set("", forKey: "dsize")
                }
                textBox.attributedText = getFont(font: "Phillis", size: size!)
            }
            if add == 8 {
                var size = defaults.string(forKey: "dsize")
                if size == nil {
                    size = ""
                    defaults.set("", forKey: "dsize")
                }
                textBox.attributedText = getFont(font: "Martin", size: size!)
            }
            if add == 9 {
                var size = defaults.string(forKey: "dsize")
                if size == nil {
                    size = ""
                    defaults.set("", forKey: "dsize")
                }
                textBox.attributedText = getFont(font: "Shake", size: size!)
            }
        }
        else {
            textBox.text = "You have yet to create any fonts... \n Create a font, then select it above."
        }
        self.view?.addSubview(textBox)
        
        changeBgClr.text = "Change Background Color:"
        changeBgClr.fontColor = UIColor.blue
        changeBgClr.fontSize = fontSize
        changeBgClr.position = CGPoint(x: self.frame.width / -8, y: (self.frame.height / -8) + ((self.frame.height / 3) - (self.frame.height / 2)))
        self.addChild(changeBgClr)
        
        color6.fillColor = UIColor(white: 0.92, alpha: 1)
        color6.position = CGPoint(x: self.frame.width / -2.5, y: (self.frame.height / -6) + ((self.frame.height / 3) - (self.frame.height / 2)))
        self.addChild(color6)
        
        color7.fillColor = UIColor.white
        color7.position = CGPoint(x: self.frame.width / -4.7, y: (self.frame.height / -6) + ((self.frame.height / 3) - (self.frame.height / 2)))
        color7.strokeColor = UIColor.black
        self.addChild(color7)
        
        color8.fillColor = UIColor(red: 0, green: 0.7137, blue: 1, alpha: 1.0)
        color8.position = CGPoint(x: 0, y: (self.frame.height / -6) + ((self.frame.height / 3) - (self.frame.height / 2)))
        self.addChild(color8)
        
        color9.fillColor = UIColor.red
        color9.position = CGPoint(x: self.frame.width / 4.7, y: (self.frame.height / -6) + ((self.frame.height / 3) - (self.frame.height / 2)))
        self.addChild(color9)
        
        color10.fillColor = UIColor(red: 0.7882, green: 0, blue: 0.9882, alpha: 1.0)
        color10.position = CGPoint(x: self.frame.width / 2.5, y: (self.frame.height / -6) + ((self.frame.height / 3) - (self.frame.height / 2)))
        self.addChild(color10)

        div4 = SKShapeNode.init(rect: CGRect(x: (self.frame.width / -2) + 10, y: (self.frame.height / -3) + ((self.frame.height / 3) - (self.frame.height / 2)), width: self.frame.width - 20, height: self.frame.height / 7.5))
        div4.strokeColor = UIColor.blue
        div4.lineWidth = 7
        self.addChild(div4)
        
        enterCharacter.text = "Type the character you want to edit"
        enterCharacter.fontColor = UIColor.blue
        enterCharacter.fontSize = fontSize
        enterCharacter.position = CGPoint(x: 0, y: (self.frame.height / -4.1) + ((self.frame.height / 3) - (self.frame.height / 2)))
        self.addChild(enterCharacter)
        
        let enter2 = SKLabelNode(fontNamed: "American Typewriter")
        enter2.text = "into the"
        enter2.fontColor = UIColor.blue
        enter2.fontSize = fontSize
        enter2.position = CGPoint(x: self.frame.width / -4, y: self.enterCharacter.position.y - 25)
        self.addChild(enter2)
        
        let enter3 = SKLabelNode(fontNamed: "American Typewriter")
        enter3.text = "box"
        enter3.fontColor = UIColor.blue
        enter3.fontSize = fontSize
        enter3.position = CGPoint(x: self.frame.width / -4, y: enter2.position.y - 25)
        self.addChild(enter3)
        
        enterHere = UITextView(frame: CGRect(x: self.frame.width * 0.55, y: ((self.frame.height * 0.75) - (self.frame.height / 12)) + ((self.frame.height / -12) - (self.frame.height / 28)), width: self.frame.width / 7, height: self.frame.height / 15))
        enterHere.text = ""
        enterHere.font = UIFont(name: "American Typewriter", size: 30)
        enterHere.layer.borderWidth = 5
        enterHere.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.2)
        enterHere.layer.borderColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).cgColor
        
        edit.text = "Edit Letter"
        edit.fontColor = UIColor.green
        edit.fontSize = 14
        edit.position = CGPoint(x: self.frame.width / 3, y: (self.frame.height / -3.4) + ((self.frame.height / 3) - (self.frame.height / 2)))
        
        editme.size = CGSize(width: self.frame.width / 5, height: self.frame.height / 15)
        editme.color = UIColor.blue
        editme.position = CGPoint(x: self.frame.width / 3, y: (self.frame.height / -3.5) + ((self.frame.height / 3) - (self.frame.height / 2)))
        self.addChild(editme)
        self.addChild(edit)
        
        cameraToggle = SKAction.move(to: CGPoint(x: self.frame.width, y: 0), duration: 0)
        
        newBG.size = self.frame.size
        newBG.position = CGPoint(x: self.frame.width, y: 0)
        self.addChild(newBG)
        
        drawLetter.text = "Draw Letter"
        drawLetter.fontColor = UIColor.blue
        drawLetter.fontSize = 35
        drawLetter.position = CGPoint(x: self.frame.width, y: self.frame.height / 4)
        
        editWithCam.text = "Capture New Letter"
        editWithCam.fontColor = UIColor.blue
        editWithCam.fontSize = 35
        editWithCam.position = CGPoint(x: self.frame.width, y: self.frame.height / -8)
        self.addChild(editWithCam)
        
        paintBrush.size = CGSize(width: self.frame.width / 3, height: self.frame.height / 2.5)
        paintBrush.position = CGPoint(x: self.frame.width * 0.75, y: self.frame.height / 4)
        self.addChild(paintBrush)
        self.addChild(drawLetter)
        
        cam.size = CGSize(width: self.frame.width / 2, height: self.frame.height / 4)
        cam.position = CGPoint(x: self.frame.width, y: self.frame.height / -3)
        self.addChild(cam)
        
        divider.position = CGPoint(x: self.frame.width, y: 0)
        divider.size = CGSize(width: self.frame.width - 20, height: self.frame.width / 8)
        self.addChild(divider)
        
        oopsnope.size = CGSize(width: self.frame.width / 4, height: self.frame.width  / 8)
        oopsnope.position = CGPoint(x: (self.frame.width / 2) + (self.oopsnope.size.width / 2), y: (self.frame.height / 2) - (self.oopsnope.size.height))
        self.addChild(oopsnope)
        
        moveBack = SKAction.moveBy(x: -self.frame.width, y: self.frame.height / -12, duration: 0)
        
        touchPad1.size = CGSize(width: self.frame.width, height: self.frame.height / 2.5)
        touchPad1.position = CGPoint(x: self.frame.width, y: self.frame.height / 5)
        
        touchPad2.size = CGSize(width: self.frame.width, height: self.frame.height / 2)
        touchPad2.position = CGPoint(x: self.frame.width, y: self.frame.height / -2)
        
        deleteFontBtn.size = CGSize(width: self.frame.width - 60, height: self.frame.width / 8)
        deleteFontBtn.position = CGPoint(x: 0, y: (self.frame.height / -2.02) + ((self.frame.height / 3) - (self.frame.height / 2)))
        deleteFontBtn.color = UIColor.red
        self.addChild(deleteFontBtn)
        
        delete.text = "Delete Selected Font"
        delete.fontSize = fontSize
        delete.fontColor = UIColor.black
        delete.position = CGPoint(x: 0, y: (self.frame.height / -1.97) + ((self.frame.height / 3) - (self.frame.height / 2)))
        self.addChild(delete)
        
        deleteAFont = SKAction.moveTo(y: (self.frame.height * 2) + (self.frame.height / -12), duration: 0)
        
        deleteMessage = UITextView(frame: CGRect(x: 0, y: self.frame.height / 4, width: self.frame.width, height: self.frame.height / 3))
        deleteMessage.text = ""
        deleteMessage.font = UIFont(name: "American Typewriter", size : 30)
        deleteMessage.isSelectable = false
        deleteMessage.isEditable = false
        deleteMessage.textColor = UIColor.blue
        deleteMessage.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0, alpha: 0)
        deleteMessage.textAlignment = .center
        
        deleteConfirm.text = "Delete"
        deleteConfirm.fontColor = UIColor.red
        deleteConfirm.fontSize = 40
        deleteConfirm.position  = CGPoint(x: self.frame.width / 4, y: self.frame.height * 1.7)
        self.addChild(deleteConfirm)
        
        cancelDelete.text = "Cancel"
        cancelDelete.fontColor = UIColor.red
        cancelDelete.fontSize = 40
        cancelDelete.position = CGPoint(x: self.frame.width / -4, y: self.frame.height * 1.7)
        self.addChild(cancelDelete)
        
        canceled = SKAction.move(to: CGPoint(x: 0, y: self.frame.height / -12), duration: 0)
        
        notify.size = CGSize(width: self.frame.width * 2.5, height: self.frame.height)
        notify.position = CGPoint(x: 0, y: self.frame.height / -12)
        
        sizeFontArea = SKShapeNode.init(rect: CGRect(x: (self.frame.width / -2) + 10, y: (self.frame.height / -2.18) + ((self.frame.height / 3) - (self.frame.height / 2)), width: self.frame.width - 20, height: self.frame.height / 8))
        sizeFontArea.strokeColor = UIColor.blue
        sizeFontArea.fillColor = UIColor.clear
        sizeFontArea.lineWidth = 7
        self.addChild(sizeFontArea)
        
        sizeFont.text = "Select Font Size: "
        sizeFont.fontSize = fontSize
        sizeFont.fontColor = UIColor.blue
        sizeFont.position = CGPoint(x: self.frame.width / -4, y: (self.frame.height / -2.6) + ((self.frame.height / 3) - (self.frame.height / 2)))
        self.addChild(sizeFont)
        
        size1.text = "20"
        size1.fontColor = UIColor.blue
        size1.fontSize = 30
        size1.position = CGPoint(x: self.frame.width / -4, y: (self.frame.height / -2.3) + ((self.frame.height / 3) - (self.frame.height / 2)))
        self.addChild(size1)
        
        size2.text = "30"
        size2.fontColor = UIColor.blue
        size2.fontSize = 30
        size2.position = CGPoint(x: 0, y: (self.frame.height / -2.3) + ((self.frame.height / 3) - (self.frame.height / 2)))
        self.addChild(size2)
        
        size3.text = "40"
        size3.fontColor = UIColor.blue
        size3.fontSize = 30
        size3.position = CGPoint(x: self.frame.width / 4, y: (self.frame.height / -2.3) + ((self.frame.height / 3) - (self.frame.height / 2)))
        self.addChild(size3)
    }
    func checkForDeletedFont() -> Bool {
        var bool : Bool = false
        if add == 1 {
            if a1 == true {
                add = 2
                setActiveFont(font: 2)
            }
            else {
                bool = true
            }
        }
        else if add == 2 {
            if a2 == true {
                add = 3
                setActiveFont(font: 3)
            }
            else {
                bool = true
            }
        }
        else if add == 3 {
            if a3 == true {
                add = 4
                setActiveFont(font: 4)
            }
            else {
                bool = true
            }
        }
        else if add == 4 {
            if a4 == true {
                add = 5
                setActiveFont(font: 5)
            }
            else {
                bool = true
            }
        }
        else if add == 5 {
            if a5 == true {
                add = 6
                setActiveFont(font: 6)
            }
            else {
                bool = true
            }
        }
        else if add == 6 {
            if a6 == true {
                if a1 == false {
                    add = 1
                    setActiveFont(font: 1)
                    bool = true
                }
                else if a2 == false {
                    add = 2
                    setActiveFont(font: 2)
                    bool = true
                }
                else if a3 == false {
                    add = 3
                    setActiveFont(font: 3)
                    bool = true
                }
                else if a4 == false {
                    add = 4
                    setActiveFont(font: 4)
                    bool = true
                }
                else if a5 == false {
                    add = 5
                    setActiveFont(font: 5)
                    bool = true
                }
                else {
                    bool = false
                    setActiveFont(font: 0)
                }
            }
            else {
                bool = true
            }
        }
        else if add == 0 {
            bool = true
        }
        else if add == 7 {
            bool = true
        }
        else if add == 8 {
            bool = true
        }
        else if add == 9 {
            bool = true
        }
        return bool
    }
    func getALetterFromDefaults() -> NSMutableAttributedString {
        let defaults = UserDefaults(suiteName: "group.io.golf.fonts")
        
        let textAttachment1 = NSTextAttachment()
        let save1 = defaults?.object(forKey: "A\(add)") as? Data
        let A = NSKeyedUnarchiver.unarchiveObject(with: save1!) as! UIImage
        textAttachment1.image = A
        let attributeA = NSAttributedString(attachment: textAttachment1)
        
        let textAttachment2 = NSTextAttachment()
        let save2 = defaults?.object(forKey: "B\(add)") as? Data
        let B = NSKeyedUnarchiver.unarchiveObject(with: save2!) as! UIImage
        textAttachment2.image = B
        let attributeB = NSAttributedString(attachment: textAttachment2)
        
        let textAttachment3 = NSTextAttachment()
        let save3 = defaults?.object(forKey: "C\(add)") as? Data
        let C = NSKeyedUnarchiver.unarchiveObject(with: save3!) as! UIImage
        textAttachment3.image = C
        let attributeC = NSAttributedString(attachment: textAttachment3)
        
        let textAttachment4 = NSTextAttachment()
        let save4 = defaults?.object(forKey: "D\(add)") as? Data
        let D = NSKeyedUnarchiver.unarchiveObject(with: save4!) as! UIImage
        textAttachment4.image = D
        let attributeD = NSAttributedString(attachment: textAttachment4)
        
        let textAttachment5 = NSTextAttachment()
        let save5 = defaults?.object(forKey: "E\(add)") as? Data
        let E = NSKeyedUnarchiver.unarchiveObject(with: save5!) as! UIImage
        textAttachment5.image = E
        let attributeE = NSAttributedString(attachment: textAttachment5)
        
        let textAttachment6 = NSTextAttachment()
        let save6 = defaults?.object(forKey: "F\(add)") as? Data
        let F = NSKeyedUnarchiver.unarchiveObject(with: save6!) as! UIImage
        textAttachment6.image = F
        let attributeF = NSAttributedString(attachment: textAttachment6)
        
        let textAttachment7 = NSTextAttachment()
        let save7 = defaults?.object(forKey: "G\(add)") as? Data
        let G = NSKeyedUnarchiver.unarchiveObject(with: save7!) as! UIImage
        textAttachment7.image = G
        let attributeG = NSAttributedString(attachment: textAttachment7)
        
        let textAttachment8 = NSTextAttachment()
        let save8 = defaults?.object(forKey: "H\(add)") as? Data
        let H = NSKeyedUnarchiver.unarchiveObject(with: save8!) as! UIImage
        textAttachment8.image = H
        let attributeH = NSAttributedString(attachment: textAttachment8)
        
        let textAttachment9 = NSTextAttachment()
        let save9 = defaults?.object(forKey: "I\(add)") as? Data
        let I = NSKeyedUnarchiver.unarchiveObject(with: save9!) as! UIImage
        textAttachment9.image = I
        let attributeI = NSAttributedString(attachment: textAttachment9)
        
        let textAttachment10 = NSTextAttachment()
        let save10 = defaults?.object(forKey: "J\(add)") as? Data
        let J = NSKeyedUnarchiver.unarchiveObject(with: save10!) as! UIImage
        textAttachment10.image = J
        let attributeJ = NSAttributedString(attachment: textAttachment10)
        
        let textAttachment11 = NSTextAttachment()
        let save11 = defaults?.object(forKey: "K\(add)") as? Data
        let K = NSKeyedUnarchiver.unarchiveObject(with: save11!) as! UIImage
        textAttachment11.image = K
        let attributeK = NSAttributedString(attachment: textAttachment11)
        
        let textAttachment12 = NSTextAttachment()
        let save12 = defaults?.object(forKey: "L\(add)") as? Data
        let L = NSKeyedUnarchiver.unarchiveObject(with: save12!) as! UIImage
        textAttachment12.image = L
        let attributeL = NSAttributedString(attachment: textAttachment12)
        
        let textAttachment13 = NSTextAttachment()
        let save13 = defaults?.object(forKey: "M\(add)") as? Data
        let M = NSKeyedUnarchiver.unarchiveObject(with: save13!) as! UIImage
        textAttachment13.image = M
        let attributeM = NSAttributedString(attachment: textAttachment13)
        
        let textAttachment14 = NSTextAttachment()
        let save14 = defaults?.object(forKey: "N\(add)") as? Data
        let N = NSKeyedUnarchiver.unarchiveObject(with: save14!) as! UIImage
        textAttachment14.image = N
        let attributeN = NSAttributedString(attachment: textAttachment14)
        
        let textAttachment15 = NSTextAttachment()
        let save15 = defaults?.object(forKey: "O\(add)") as? Data
        let O = NSKeyedUnarchiver.unarchiveObject(with: save15!) as! UIImage
        textAttachment15.image = O
        let attributeO = NSAttributedString(attachment: textAttachment15)
        
        let textAttachment16 = NSTextAttachment()
        let save16 = defaults?.object(forKey: "P\(add)") as? Data
        let P = NSKeyedUnarchiver.unarchiveObject(with: save16!) as! UIImage
        textAttachment16.image = P
        let attributeP = NSAttributedString(attachment: textAttachment16)
        
        let textAttachment17 = NSTextAttachment()
        let save17 = defaults?.object(forKey: "Q\(add)") as? Data
        let Q = NSKeyedUnarchiver.unarchiveObject(with: save17!) as! UIImage
        textAttachment17.image = Q
        let attributeQ = NSAttributedString(attachment: textAttachment17)
        
        let textAttachment18 = NSTextAttachment()
        let save18 = defaults?.object(forKey: "R\(add)") as? Data
        let R = NSKeyedUnarchiver.unarchiveObject(with: save18!) as! UIImage
        textAttachment18.image = R
        let attributeR = NSAttributedString(attachment: textAttachment18)
        
        let textAttachment19 = NSTextAttachment()
        let save19 = defaults?.object(forKey: "S\(add)") as? Data
        let S = NSKeyedUnarchiver.unarchiveObject(with: save19!) as! UIImage
        textAttachment19.image = S
        let attributeS = NSAttributedString(attachment: textAttachment19)
        
        let textAttachment20 = NSTextAttachment()
        let save20 = defaults?.object(forKey: "T\(add)") as? Data
        let T = NSKeyedUnarchiver.unarchiveObject(with: save20!) as! UIImage
        textAttachment20.image = T
        let attributeT = NSAttributedString(attachment: textAttachment20)
        
        let textAttachment21 = NSTextAttachment()
        let save21 = defaults?.object(forKey: "U\(add)") as? Data
        let U = NSKeyedUnarchiver.unarchiveObject(with: save21!) as! UIImage
        textAttachment21.image = U
        let attributeU = NSAttributedString(attachment: textAttachment21)
        
        let textAttachment22 = NSTextAttachment()
        let save22 = defaults?.object(forKey: "V\(add)") as? Data
        let V = NSKeyedUnarchiver.unarchiveObject(with: save22!) as! UIImage
        textAttachment22.image = V
        let attributeV = NSAttributedString(attachment: textAttachment22)
        
        let textAttachment23 = NSTextAttachment()
        let save23 = defaults?.object(forKey: "W\(add)") as? Data
        let W = NSKeyedUnarchiver.unarchiveObject(with: save23!) as! UIImage
        textAttachment23.image = W
        let attributeW = NSAttributedString(attachment: textAttachment23)
        
        let textAttachment24 = NSTextAttachment()
        let save24 = defaults?.object(forKey: "X\(add)") as? Data
        let X = NSKeyedUnarchiver.unarchiveObject(with: save24!) as! UIImage
        textAttachment24.image = X
        let attributeX = NSAttributedString(attachment: textAttachment24)
        
        let textAttachment25 = NSTextAttachment()
        let save25 = defaults?.object(forKey: "Y\(add)") as? Data
        let Y = NSKeyedUnarchiver.unarchiveObject(with: save25!) as! UIImage
        textAttachment25.image = Y
        let attributeY = NSAttributedString(attachment: textAttachment25)
        
        let textAttachment26 = NSTextAttachment()
        let save26 = defaults?.object(forKey: "Z\(add)") as? Data
        let Z = NSKeyedUnarchiver.unarchiveObject(with: save26!) as! UIImage
        textAttachment26.image = Z
        let attributeZ = NSAttributedString(attachment: textAttachment26)
        
        let textAttachment27 = NSTextAttachment()
        let save27 = defaults?.object(forKey: "a\(add)") as? Data
        let a = NSKeyedUnarchiver.unarchiveObject(with: save27!) as! UIImage
        textAttachment27.image = a
        let attributea = NSAttributedString(attachment: textAttachment27)
        
        let textAttachment28 = NSTextAttachment()
        let save28 = defaults?.object(forKey: "b\(add)") as? Data
        let b = NSKeyedUnarchiver.unarchiveObject(with: save28!) as! UIImage
        textAttachment28.image = b
        let attributeb = NSAttributedString(attachment: textAttachment28)
        
        let textAttachment29 = NSTextAttachment()
        let save29 = defaults?.object(forKey: "c\(add)") as? Data
        let c = NSKeyedUnarchiver.unarchiveObject(with: save29!) as! UIImage
        textAttachment29.image = c
        let attributec = NSAttributedString(attachment: textAttachment29)
        
        let textAttachment30 = NSTextAttachment()
        let save30 = defaults?.object(forKey: "d\(add)") as? Data
        let d = NSKeyedUnarchiver.unarchiveObject(with: save30!) as! UIImage
        textAttachment30.image = d
        let attributed = NSAttributedString(attachment: textAttachment30)
        
        let textAttachment31 = NSTextAttachment()
        let save31 = defaults?.object(forKey: "e\(add)") as? Data
        let e = NSKeyedUnarchiver.unarchiveObject(with: save31!) as! UIImage
        textAttachment31.image = e
        let attributee = NSAttributedString(attachment: textAttachment31)
        
        let textAttachment32 = NSTextAttachment()
        let save32 = defaults?.object(forKey: "f\(add)") as? Data
        let f = NSKeyedUnarchiver.unarchiveObject(with: save32!) as! UIImage
        textAttachment32.image = f
        let attributef = NSAttributedString(attachment: textAttachment32)
        
        let textAttachment33 = NSTextAttachment()
        let save33 = defaults?.object(forKey: "g\(add)") as? Data
        let g = NSKeyedUnarchiver.unarchiveObject(with: save33!) as! UIImage
        textAttachment33.image = g
        let attributeg = NSAttributedString(attachment: textAttachment33)
        
        let textAttachment34 = NSTextAttachment()
        let save34 = defaults?.object(forKey: "h\(add)") as? Data
        let h = NSKeyedUnarchiver.unarchiveObject(with: save34!) as! UIImage
        textAttachment34.image = h
        let attributeh = NSAttributedString(attachment: textAttachment34)
        
        let textAttachment35 = NSTextAttachment()
        let save35 = defaults?.object(forKey: "i\(add)") as? Data
        let i = NSKeyedUnarchiver.unarchiveObject(with: save35!) as! UIImage
        textAttachment35.image = i
        let attributei = NSAttributedString(attachment: textAttachment35)
        
        let textAttachment36 = NSTextAttachment()
        let save36 = defaults?.object(forKey: "j\(add)") as? Data
        let j = NSKeyedUnarchiver.unarchiveObject(with: save36!) as! UIImage
        textAttachment36.image = j
        let attributej = NSAttributedString(attachment: textAttachment36)
        
        let textAttachment37 = NSTextAttachment()
        let save37 = defaults?.object(forKey: "k\(add)") as? Data
        let k = NSKeyedUnarchiver.unarchiveObject(with: save37!) as! UIImage
        textAttachment37.image = k
        let attributek = NSAttributedString(attachment: textAttachment37)
        
        let textAttachment38 = NSTextAttachment()
        let save38 = defaults?.object(forKey: "l\(add)") as? Data
        let l = NSKeyedUnarchiver.unarchiveObject(with: save38!) as! UIImage
        textAttachment38.image = l
        let attributel = NSAttributedString(attachment: textAttachment38)
        
        let textAttachment39 = NSTextAttachment()
        let save39 = defaults?.object(forKey: "m\(add)") as? Data
        let m = NSKeyedUnarchiver.unarchiveObject(with: save39!) as! UIImage
        textAttachment39.image = m
        let attributem = NSAttributedString(attachment: textAttachment39)
        
        let textAttachment40 = NSTextAttachment()
        let save40 = defaults?.object(forKey: "n\(add)") as? Data
        let n = NSKeyedUnarchiver.unarchiveObject(with: save40!) as! UIImage
        textAttachment40.image = n
        let attributen = NSAttributedString(attachment: textAttachment40)
        
        let textAttachment41 = NSTextAttachment()
        let save41 = defaults?.object(forKey: "o\(add)") as? Data
        let o = NSKeyedUnarchiver.unarchiveObject(with: save41!) as! UIImage
        textAttachment41.image = o
        let attributeo = NSAttributedString(attachment: textAttachment41)
        
        let textAttachment42 = NSTextAttachment()
        let save42 = defaults?.object(forKey: "p\(add)") as? Data
        let p = NSKeyedUnarchiver.unarchiveObject(with: save42!) as! UIImage
        textAttachment42.image = p
        let attributep = NSAttributedString(attachment: textAttachment42)
        
        let textAttachment43 = NSTextAttachment()
        let save43 = defaults?.object(forKey: "q\(add)") as? Data
        let q = NSKeyedUnarchiver.unarchiveObject(with: save43!) as! UIImage
        textAttachment43.image = q
        let attributeq = NSAttributedString(attachment: textAttachment43)
        
        let textAttachment44 = NSTextAttachment()
        let save44 = defaults?.object(forKey: "r\(add)") as? Data
        let r = NSKeyedUnarchiver.unarchiveObject(with: save44!) as! UIImage
        textAttachment44.image = r
        let attributer = NSAttributedString(attachment: textAttachment44)
        
        let textAttachment45 = NSTextAttachment()
        let save45 = defaults?.object(forKey: "s\(add)") as? Data
        let s = NSKeyedUnarchiver.unarchiveObject(with: save45!) as! UIImage
        textAttachment45.image = s
        let attributes = NSAttributedString(attachment: textAttachment45)
        
        let textAttachment46 = NSTextAttachment()
        let save46 = defaults?.object(forKey: "t\(add)") as? Data
        let t = NSKeyedUnarchiver.unarchiveObject(with: save46!) as! UIImage
        textAttachment46.image = t
        let attributet = NSAttributedString(attachment: textAttachment46)
        
        let textAttachment47 = NSTextAttachment()
        let save47 = defaults?.object(forKey: "u\(add)") as? Data
        let u = NSKeyedUnarchiver.unarchiveObject(with: save47!) as! UIImage
        textAttachment47.image = u
        let attributeu = NSAttributedString(attachment: textAttachment47)
        
        let textAttachment48 = NSTextAttachment()
        let save48 = defaults?.object(forKey: "v\(add)") as? Data
        let v = NSKeyedUnarchiver.unarchiveObject(with: save48!) as! UIImage
        textAttachment48.image = v
        let attributev = NSAttributedString(attachment: textAttachment48)
        
        let textAttachment49 = NSTextAttachment()
        let save49 = defaults?.object(forKey: "w\(add)") as? Data
        let w = NSKeyedUnarchiver.unarchiveObject(with: save49!) as! UIImage
        textAttachment49.image = w
        let attributew = NSAttributedString(attachment: textAttachment49)
        
        let textAttachment50 = NSTextAttachment()
        let save50 = defaults?.object(forKey: "x\(add)") as? Data
        let x = NSKeyedUnarchiver.unarchiveObject(with: save50!) as! UIImage
        textAttachment50.image = x
        let attributex = NSAttributedString(attachment: textAttachment50)
        
        let textAttachment51 = NSTextAttachment()
        let save51 = defaults?.object(forKey: "y\(add)") as? Data
        let y = NSKeyedUnarchiver.unarchiveObject(with: save51!) as! UIImage
        textAttachment51.image = y
        let attributey = NSAttributedString(attachment: textAttachment51)
        
        let textAttachment52 = NSTextAttachment()
        let save52 = defaults?.object(forKey: "z\(add)") as? Data
        let z = NSKeyedUnarchiver.unarchiveObject(with: save52!) as! UIImage
        textAttachment52.image = z
        let attributez = NSAttributedString(attachment: textAttachment52)
        
        let textAttachmentOne = NSTextAttachment()
        let saveOne = defaults?.object(forKey: "1\(add)") as? Data
        let One = NSKeyedUnarchiver.unarchiveObject(with: saveOne!) as! UIImage
        textAttachmentOne.image = One
        let attributeOne = NSAttributedString(attachment: textAttachmentOne)
        
        let textAttachmentTwo = NSTextAttachment()
        let saveTwo = defaults?.object(forKey: "2\(add)") as? Data
        let Two = NSKeyedUnarchiver.unarchiveObject(with: saveTwo!) as! UIImage
        textAttachmentTwo.image = Two
        let attributeTwo = NSAttributedString(attachment: textAttachmentTwo)
        
        let textAttachmentThree = NSTextAttachment()
        let saveThree = defaults?.object(forKey: "3\(add)") as? Data
        let Three = NSKeyedUnarchiver.unarchiveObject(with: saveThree!) as! UIImage
        textAttachmentThree.image = Three
        let attributeThree = NSAttributedString(attachment: textAttachmentThree)
        
        let textAttachmentFour = NSTextAttachment()
        let saveFour = defaults?.object(forKey: "4\(add)") as? Data
        let Four = NSKeyedUnarchiver.unarchiveObject(with: saveFour!) as! UIImage
        textAttachmentFour.image = Four
        let attributeFour = NSAttributedString(attachment: textAttachmentFour)
        
        let textAttachmentFive = NSTextAttachment()
        let saveFive = defaults?.object(forKey: "5\(add)") as? Data
        let Five = NSKeyedUnarchiver.unarchiveObject(with: saveFive!) as! UIImage
        textAttachmentFive.image = Five
        let attributeFive = NSAttributedString(attachment: textAttachmentFive)
        
        let textAttachmentSix = NSTextAttachment()
        let saveSix = defaults?.object(forKey: "6\(add)") as? Data
        let Six = NSKeyedUnarchiver.unarchiveObject(with: saveSix!) as! UIImage
        textAttachmentSix.image = Six
        let attributeSix = NSAttributedString(attachment: textAttachmentSix)
        
        let textAttachmentSeven = NSTextAttachment()
        let saveSeven = defaults?.object(forKey: "7\(add)") as? Data
        let Seven = NSKeyedUnarchiver.unarchiveObject(with: saveSeven!) as! UIImage
        textAttachmentSeven.image = Seven
        let attributeSeven = NSAttributedString(attachment: textAttachmentSeven)
        
        let textAttachmentEight = NSTextAttachment()
        let saveEight = defaults?.object(forKey: "8\(add)") as? Data
        let Eight = NSKeyedUnarchiver.unarchiveObject(with: saveEight!) as! UIImage
        textAttachmentEight.image = Eight
        let attributeEight = NSAttributedString(attachment: textAttachmentEight)
        
        let textAttachmentNine = NSTextAttachment()
        let saveNine = defaults?.object(forKey: "9\(add)") as? Data
        let Nine = NSKeyedUnarchiver.unarchiveObject(with: saveNine!) as! UIImage
        textAttachmentNine.image = Nine
        let attributeNine = NSAttributedString(attachment: textAttachmentNine)
        
        let textAttachmentZero = NSTextAttachment()
        let saveZero = defaults?.object(forKey: "0\(add)") as? Data
        let Zero = NSKeyedUnarchiver.unarchiveObject(with: saveZero!) as! UIImage
        textAttachmentZero.image = Zero
        let attributeZero = NSAttributedString(attachment: textAttachmentZero)
        
        let textAttachmentPeriod = NSTextAttachment()
        let savePeriod = defaults?.object(forKey: ".\(add)") as? Data
        let period = NSKeyedUnarchiver.unarchiveObject(with: savePeriod!) as! UIImage
        textAttachmentPeriod.image = period
        let attributePeriod = NSAttributedString(attachment: textAttachmentPeriod)
        
        let textAttachmentComma = NSTextAttachment()
        let saveComma = defaults?.object(forKey: ",\(add)") as? Data
        let Comma = NSKeyedUnarchiver.unarchiveObject(with: saveComma!) as! UIImage
        textAttachmentComma.image = Comma
        let attributeComma = NSAttributedString(attachment: textAttachmentComma)
        
        let textAttachmentYay = NSTextAttachment()
        let saveYay = defaults?.object(forKey: "!\(add)") as? Data
        let Yay = NSKeyedUnarchiver.unarchiveObject(with: saveYay!) as! UIImage
        textAttachmentYay.image = Yay
        let attributeYay = NSAttributedString(attachment: textAttachmentYay)
        
        let textAttachmentQuestion = NSTextAttachment()
        let saveQuestion = defaults?.object(forKey: "?\(add)") as? Data
        let Question = NSKeyedUnarchiver.unarchiveObject(with: saveQuestion!) as! UIImage
        textAttachmentQuestion.image = Question
        let attributeQuestion = NSAttributedString(attachment: textAttachmentQuestion)
        
        let textAttachmentApostrophe = NSTextAttachment()
        let saveApostrophe = defaults?.object(forKey: "'\(add)") as? Data
        let Apostrophe = NSKeyedUnarchiver.unarchiveObject(with: saveApostrophe!) as! UIImage
        textAttachmentApostrophe.image = Apostrophe
        let attributeApostrophe = NSAttributedString(attachment: textAttachmentApostrophe)
        
        let mutable = NSMutableAttributedString(string: "")
        mutable.append(attributeA)
        mutable.append(attributeB)
        mutable.append(attributeC)
        mutable.append(attributeD)
        mutable.append(attributeE)
        mutable.append(attributeF)
        mutable.append(attributeG)
        mutable.append(attributeH)
        mutable.append(attributeI)
        mutable.append(attributeJ)
        mutable.append(attributeK)
        mutable.append(attributeL)
        mutable.append(attributeM)
        mutable.append(attributeN)
        mutable.append(attributeO)
        mutable.append(attributeP)
        mutable.append(attributeQ)
        mutable.append(attributeR)
        mutable.append(attributeS)
        mutable.append(attributeT)
        mutable.append(attributeU)
        mutable.append(attributeV)
        mutable.append(attributeW)
        mutable.append(attributeX)
        mutable.append(attributeY)
        mutable.append(attributeZ)
        mutable.append(attributea)
        mutable.append(attributeb)
        mutable.append(attributec)
        mutable.append(attributed)
        mutable.append(attributee)
        mutable.append(attributef)
        mutable.append(attributeg)
        mutable.append(attributeh)
        mutable.append(attributei)
        mutable.append(attributej)
        mutable.append(attributek)
        mutable.append(attributel)
        mutable.append(attributem)
        mutable.append(attributen)
        mutable.append(attributeo)
        mutable.append(attributep)
        mutable.append(attributeq)
        mutable.append(attributer)
        mutable.append(attributes)
        mutable.append(attributet)
        mutable.append(attributeu)
        mutable.append(attributev)
        mutable.append(attributew)
        mutable.append(attributex)
        mutable.append(attributey)
        mutable.append(attributez)
        mutable.append(attributeOne)
        mutable.append(attributeTwo)
        mutable.append(attributeThree)
        mutable.append(attributeFour)
        mutable.append(attributeFive)
        mutable.append(attributeSix)
        mutable.append(attributeSeven)
        mutable.append(attributeEight)
        mutable.append(attributeNine)
        mutable.append(attributeZero)
        mutable.append(attributePeriod)
        mutable.append(attributeComma)
        mutable.append(attributeYay)
        mutable.append(attributeQuestion)
        mutable.append(attributeApostrophe)
        
        return mutable
    }
    func getFont(font: String, size: String) -> NSMutableAttributedString {
        
        let textAttachment1 = NSTextAttachment()
        textAttachment1.image = UIImage(named: "\(font)A\(size)")
        let attributeA = NSAttributedString(attachment: textAttachment1)
        
        let textAttachment2 = NSTextAttachment()
        textAttachment2.image = UIImage(named: "\(font)B\(size)")
        let attributeB = NSAttributedString(attachment: textAttachment2)
        
        let textAttachment3 = NSTextAttachment()
        textAttachment3.image = UIImage(named: "\(font)C\(size)")
        let attributeC = NSAttributedString(attachment: textAttachment3)
        
        let textAttachment4 = NSTextAttachment()
        textAttachment4.image = UIImage(named: "\(font)D\(size)")
        let attributeD = NSAttributedString(attachment: textAttachment4)
        
        let textAttachment5 = NSTextAttachment()
        textAttachment5.image = UIImage(named: "\(font)E\(size)")
        let attributeE = NSAttributedString(attachment: textAttachment5)
        
        let textAttachment6 = NSTextAttachment()
        textAttachment6.image = UIImage(named: "\(font)F\(size)")
        let attributeF = NSAttributedString(attachment: textAttachment6)
        
        let textAttachment7 = NSTextAttachment()
        textAttachment7.image = UIImage(named: "\(font)G\(size)")
        let attributeG = NSAttributedString(attachment: textAttachment7)
        
        let textAttachment8 = NSTextAttachment()
        textAttachment8.image = UIImage(named: "\(font)H\(size)")
        let attributeH = NSAttributedString(attachment: textAttachment8)
        
        let textAttachment9 = NSTextAttachment()
        textAttachment9.image = UIImage(named: "\(font)I\(size)")
        let attributeI = NSAttributedString(attachment: textAttachment9)
        
        let textAttachment10 = NSTextAttachment()
        textAttachment10.image = UIImage(named: "\(font)J\(size)")
        let attributeJ = NSAttributedString(attachment: textAttachment10)
        
        let textAttachment11 = NSTextAttachment()
        textAttachment11.image = UIImage(named: "\(font)K\(size)")
        let attributeK = NSAttributedString(attachment: textAttachment11)
        
        let textAttachment12 = NSTextAttachment()
        textAttachment12.image = UIImage(named: "\(font)L\(size)")
        let attributeL = NSAttributedString(attachment: textAttachment12)
        
        let textAttachment13 = NSTextAttachment()
        textAttachment13.image = UIImage(named: "\(font)M\(size)")
        let attributeM = NSAttributedString(attachment: textAttachment13)
        
        let textAttachment14 = NSTextAttachment()
        textAttachment14.image = UIImage(named: "\(font)N\(size)")
        let attributeN = NSAttributedString(attachment: textAttachment14)
        
        let textAttachment15 = NSTextAttachment()
        textAttachment15.image = UIImage(named: "\(font)O\(size)")
        let attributeO = NSAttributedString(attachment: textAttachment15)
        
        let textAttachment16 = NSTextAttachment()
        textAttachment16.image = UIImage(named: "\(font)P\(size)")
        let attributeP = NSAttributedString(attachment: textAttachment16)
        
        let textAttachment17 = NSTextAttachment()
        textAttachment17.image = UIImage(named: "\(font)Q\(size)")
        let attributeQ = NSAttributedString(attachment: textAttachment17)
        
        let textAttachment18 = NSTextAttachment()
        textAttachment18.image = UIImage(named: "\(font)R\(size)")
        let attributeR = NSAttributedString(attachment: textAttachment18)
        
        let textAttachment19 = NSTextAttachment()
        textAttachment19.image = UIImage(named: "\(font)S\(size)")
        let attributeS = NSAttributedString(attachment: textAttachment19)
        
        let textAttachment20 = NSTextAttachment()
        textAttachment20.image = UIImage(named: "\(font)T\(size)")
        let attributeT = NSAttributedString(attachment: textAttachment20)
        
        let textAttachment21 = NSTextAttachment()
        textAttachment21.image = UIImage(named: "\(font)U\(size)")
        let attributeU = NSAttributedString(attachment: textAttachment21)
        
        let textAttachment22 = NSTextAttachment()
        textAttachment22.image = UIImage(named: "\(font)V\(size)")
        let attributeV = NSAttributedString(attachment: textAttachment22)
        
        let textAttachment23 = NSTextAttachment()
        textAttachment23.image = UIImage(named: "\(font)W\(size)")
        let attributeW = NSAttributedString(attachment: textAttachment23)
        
        let textAttachment24 = NSTextAttachment()
        textAttachment24.image = UIImage(named: "\(font)X\(size)")
        let attributeX = NSAttributedString(attachment: textAttachment24)
        
        let textAttachment25 = NSTextAttachment()
        textAttachment25.image = UIImage(named: "\(font)Y\(size)")
        let attributeY = NSAttributedString(attachment: textAttachment25)
        
        let textAttachment26 = NSTextAttachment()
        textAttachment26.image = UIImage(named: "\(font)Z\(size)")
        let attributeZ = NSAttributedString(attachment: textAttachment26)
        
        let textAttachment27 = NSTextAttachment()
        textAttachment27.image = UIImage(named: "\(font)za\(size)")
        let attributea = NSAttributedString(attachment: textAttachment27)
        
        let textAttachment28 = NSTextAttachment()
        textAttachment28.image = UIImage(named: "\(font)zb\(size)")
        let attributeb = NSAttributedString(attachment: textAttachment28)
        
        let textAttachment29 = NSTextAttachment()
        textAttachment29.image = UIImage(named: "\(font)zc\(size)")
        let attributec = NSAttributedString(attachment: textAttachment29)
        
        let textAttachment30 = NSTextAttachment()
        textAttachment30.image = UIImage(named: "\(font)zd\(size)")
        let attributed = NSAttributedString(attachment: textAttachment30)
        
        let textAttachment31 = NSTextAttachment()
        textAttachment31.image = UIImage(named: "\(font)ze\(size)")
        let attributee = NSAttributedString(attachment: textAttachment31)
        
        let textAttachment32 = NSTextAttachment()
        textAttachment32.image = UIImage(named: "\(font)zf\(size)")
        let attributef = NSAttributedString(attachment: textAttachment32)
        
        let textAttachment33 = NSTextAttachment()
        textAttachment33.image = UIImage(named: "\(font)zg\(size)")
        let attributeg = NSAttributedString(attachment: textAttachment33)
        
        let textAttachment34 = NSTextAttachment()
        textAttachment34.image = UIImage(named: "\(font)zh\(size)")
        let attributeh = NSAttributedString(attachment: textAttachment34)
        
        let textAttachment35 = NSTextAttachment()
        textAttachment35.image = UIImage(named: "\(font)zi\(size)")
        let attributei = NSAttributedString(attachment: textAttachment35)
        
        let textAttachment36 = NSTextAttachment()
        textAttachment36.image = UIImage(named: "\(font)zj\(size)")
        let attributej = NSAttributedString(attachment: textAttachment36)
        
        let textAttachment37 = NSTextAttachment()
        textAttachment37.image = UIImage(named: "\(font)zk\(size)")
        let attributek = NSAttributedString(attachment: textAttachment37)
        
        let textAttachment38 = NSTextAttachment()
        textAttachment38.image = UIImage(named: "\(font)zl\(size)")
        let attributel = NSAttributedString(attachment: textAttachment38)
        
        let textAttachment39 = NSTextAttachment()
        textAttachment39.image = UIImage(named: "\(font)zm\(size)")
        let attributem = NSAttributedString(attachment: textAttachment39)
        
        let textAttachment40 = NSTextAttachment()
        textAttachment40.image = UIImage(named: "\(font)zn\(size)")
        let attributen = NSAttributedString(attachment: textAttachment40)
        
        let textAttachment41 = NSTextAttachment()
        textAttachment41.image = UIImage(named: "\(font)zo\(size)")
        let attributeo = NSAttributedString(attachment: textAttachment41)
        
        let textAttachment42 = NSTextAttachment()
        textAttachment42.image = UIImage(named: "\(font)zp\(size)")
        let attributep = NSAttributedString(attachment: textAttachment42)
        
        let textAttachment43 = NSTextAttachment()
        textAttachment43.image = UIImage(named: "\(font)zq\(size)")
        let attributeq = NSAttributedString(attachment: textAttachment43)
        
        let textAttachment44 = NSTextAttachment()
        textAttachment44.image = UIImage(named: "\(font)zr\(size)")
        let attributer = NSAttributedString(attachment: textAttachment44)
        
        let textAttachment45 = NSTextAttachment()
        textAttachment45.image = UIImage(named: "\(font)zs\(size)")
        let attributes = NSAttributedString(attachment: textAttachment45)
        
        let textAttachment46 = NSTextAttachment()
        textAttachment46.image = UIImage(named: "\(font)zt\(size)")
        let attributet = NSAttributedString(attachment: textAttachment46)
        
        let textAttachment47 = NSTextAttachment()
        textAttachment47.image = UIImage(named: "\(font)zu\(size)")
        let attributeu = NSAttributedString(attachment: textAttachment47)
        
        let textAttachment48 = NSTextAttachment()
        textAttachment48.image = UIImage(named: "\(font)zv\(size)")
        let attributev = NSAttributedString(attachment: textAttachment48)
        
        let textAttachment49 = NSTextAttachment()
        textAttachment49.image = UIImage(named: "\(font)zw\(size)")
        let attributew = NSAttributedString(attachment: textAttachment49)
        
        let textAttachment50 = NSTextAttachment()
        textAttachment50.image = UIImage(named: "\(font)zx\(size)")
        let attributex = NSAttributedString(attachment: textAttachment50)
        
        let textAttachment51 = NSTextAttachment()
        textAttachment51.image = UIImage(named: "\(font)zy\(size)")
        let attributey = NSAttributedString(attachment: textAttachment51)
        
        let textAttachment52 = NSTextAttachment()
        textAttachment52.image = UIImage(named: "\(font)zz\(size)")
        let attributez = NSAttributedString(attachment: textAttachment52)
        
        let textAttachment53 = NSTextAttachment()
        textAttachment53.image = UIImage(named: "\(font)0\(size)")
        let attribute0 = NSAttributedString(attachment: textAttachment53)
        
        let textAttachment54 = NSTextAttachment()
        textAttachment54.image = UIImage(named: "\(font)1\(size)")
        let attribute1 = NSAttributedString(attachment: textAttachment54)
        
        let textAttachment55 = NSTextAttachment()
        textAttachment55.image = UIImage(named: "\(font)2\(size)")
        let attribute2 = NSAttributedString(attachment: textAttachment55)
        
        let textAttachment56 = NSTextAttachment()
        textAttachment56.image = UIImage(named: "\(font)3\(size)")
        let attribute3 = NSAttributedString(attachment: textAttachment56)
        
        let textAttachment57 = NSTextAttachment()
        textAttachment57.image = UIImage(named: "\(font)4\(size)")
        let attribute4 = NSAttributedString(attachment: textAttachment57)
        
        let textAttachment58 = NSTextAttachment()
        textAttachment58.image = UIImage(named: "\(font)5\(size)")
        let attribute5 = NSAttributedString(attachment: textAttachment58)
        
        let textAttachment59 = NSTextAttachment()
        textAttachment59.image = UIImage(named: "\(font)6\(size)")
        let attribute6 = NSAttributedString(attachment: textAttachment59)
        
        let textAttachment60 = NSTextAttachment()
        textAttachment60.image = UIImage(named: "\(font)7\(size)")
        let attribute7 = NSAttributedString(attachment: textAttachment60)
        
        let textAttachment61 = NSTextAttachment()
        textAttachment61.image = UIImage(named: "\(font)8\(size)")
        let attribute8 = NSAttributedString(attachment: textAttachment61)
        
        let textAttachment62 = NSTextAttachment()
        textAttachment62.image = UIImage(named: "\(font)9\(size)")
        let attribute9 = NSAttributedString(attachment: textAttachment62)
        
        let textAttachment63 = NSTextAttachment()
        textAttachment63.image = UIImage(named: "\(font).\(size)")
        let attributePeriod = NSAttributedString(attachment: textAttachment63)
        
        let textAttachment64 = NSTextAttachment()
        textAttachment64.image = UIImage(named: "\(font)?\(size)")
        let attributeQuestionMark = NSAttributedString(attachment: textAttachment64)
        
        let textAttachment65 = NSTextAttachment()
        textAttachment65.image = UIImage(named: "\(font)'\(size)")
        let attributeApostrophe = NSAttributedString(attachment: textAttachment65)
        
        let textAttachment66 = NSTextAttachment()
        textAttachment66.image = UIImage(named: "\(font)!\(size)")
        let attributeExclamationMark = NSAttributedString(attachment: textAttachment66)
        
        let textAttachment67 = NSTextAttachment()
        textAttachment67.image = UIImage(named: "\(font),\(size)")
        let attributeComma = NSAttributedString(attachment: textAttachment67)
        
        let mutable = NSMutableAttributedString(string: "")
        mutable.append(attributeA)
        mutable.append(attributeB)
        mutable.append(attributeC)
        mutable.append(attributeD)
        mutable.append(attributeE)
        mutable.append(attributeF)
        mutable.append(attributeG)
        mutable.append(attributeH)
        mutable.append(attributeI)
        mutable.append(attributeJ)
        mutable.append(attributeK)
        mutable.append(attributeL)
        mutable.append(attributeM)
        mutable.append(attributeN)
        mutable.append(attributeO)
        mutable.append(attributeP)
        mutable.append(attributeQ)
        mutable.append(attributeR)
        mutable.append(attributeS)
        mutable.append(attributeT)
        mutable.append(attributeU)
        mutable.append(attributeV)
        mutable.append(attributeW)
        mutable.append(attributeX)
        mutable.append(attributeY)
        mutable.append(attributeZ)
        mutable.append(attributea)
        mutable.append(attributeb)
        mutable.append(attributec)
        mutable.append(attributed)
        mutable.append(attributee)
        mutable.append(attributef)
        mutable.append(attributeg)
        mutable.append(attributeh)
        mutable.append(attributei)
        mutable.append(attributej)
        mutable.append(attributek)
        mutable.append(attributel)
        mutable.append(attributem)
        mutable.append(attributen)
        mutable.append(attributeo)
        mutable.append(attributep)
        mutable.append(attributeq)
        mutable.append(attributer)
        mutable.append(attributes)
        mutable.append(attributet)
        mutable.append(attributeu)
        mutable.append(attributev)
        mutable.append(attributew)
        mutable.append(attributex)
        mutable.append(attributey)
        mutable.append(attributez)
        mutable.append(attribute1)
        mutable.append(attribute2)
        mutable.append(attribute3)
        mutable.append(attribute4)
        mutable.append(attribute5)
        mutable.append(attribute6)
        mutable.append(attribute7)
        mutable.append(attribute8)
        mutable.append(attribute9)
        mutable.append(attribute0)
        mutable.append(attributePeriod)
        mutable.append(attributeQuestionMark)
        mutable.append(attributeApostrophe)
        mutable.append(attributeExclamationMark)
        mutable.append(attributeComma)
        
        return mutable
    }
    func getFromDefaults(letter: String) -> UIImage {
        let defaults = UserDefaults(suiteName: "group.io.golf.fonts")
        let savedLetter = defaults?.object(forKey: letter) as? Data
        let theLetter = NSKeyedUnarchiver.unarchiveObject(with: savedLetter!) as! UIImage
        return theLetter
    }
    func setActiveFont(font: Int){
        let defaults = UserDefaults.standard
        let defaults2 = UserDefaults(suiteName: "group.io.golf.fonts")
        defaults.set(font, forKey: "activeFont")
        defaults2?.set(font, forKey: "activeFont")
        let no = defaults.integer(forKey: "activeFont")
        print("\(no)")
        fontVariables.fontSelected = font
    }
    func update(){
        self.timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(EditFontsScene.checkLetterEdit), userInfo: nil, repeats: true)
    }
    func save(image: UIImage, key: String) {
        let savedData = NSKeyedArchiver.archivedData(withRootObject: image)
        let defaults = UserDefaults(suiteName: "group.io.golf.fonts")
        defaults?.set(savedData, forKey: key)
    }
    @objc func checkLetterEdit(){
        if enterHere.text.count == 1 && no == 0 {
            enterHere.resignFirstResponder()
            no = 1
        }
        else if enterHere.text.count == 0 && no != 0 {
            no = 0
        }
        else if enterHere.text.count > 1 {
            enterHere.text = ""
        }
        if typeIt.text.count == 10 {
            str = typeIt.text
        }
        if typeIt.text.count > 10 {
            typeIt.text = str
        }
    }
    func setBGColor(color: Int){
        let defaults = UserDefaults.standard
        defaults.set(color, forKey: "BGColor")
    }
    func deleteFont(){
        let defaults = UserDefaults(suiteName: "group.io.golf.fonts")
        let defaults2 = UserDefaults.standard
        defaults?.set(nil, forKey: "A\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "B\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "C\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "D\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "E\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "F\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "G\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "H\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "I\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "J\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "K\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "L\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "M\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "N\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "O\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "P\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "Q\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "R\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "S\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "T\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "U\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "V\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "W\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "X\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "Y\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "Z\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "a\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "b\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "c\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "d\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "e\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "f\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "g\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "h\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "i\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "j\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "k\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "l\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "m\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "n\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "o\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "p\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "q\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "r\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "s\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "t\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "u\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "v\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "w\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "x\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "y\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "z\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "?\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "!\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: ".\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: ",\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "'\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "1\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "2\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "3\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "4\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "5\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "6\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "7\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "8\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "9\(fontVariables.fontSelected)")
        defaults?.set(nil, forKey: "0\(fontVariables.fontSelected)")
        defaults2.set(0, forKey: "crash\(fontVariables.fontSelected)")
        
        let a11 = defaults?.object(forKey: "01")
        let a22 = defaults?.object(forKey: "02")
        let a33 = defaults?.object(forKey: "03")
        let a44 = defaults?.object(forKey: "04")
        let a55 = defaults?.object(forKey: "05")
        let a66 = defaults?.object(forKey: "06")
        if a11 == nil {
            a1 = true
        }
        if a22 == nil {
            a2 = true
        }
        if a33 == nil {
            a3 = true
        }
        if a44 == nil {
            a4 = true
        }
        if a55 == nil {
            a5 = true
        }
        if a66 == nil {
            a6 = true
        }
        if a11 == nil && a22 == nil && a33 == nil && a44 == nil && a55 == nil && a66 == nil {
            setActiveFont(font: 0)
            SegueVariables.editFonts = true
        }
        else if a11 != nil {
            setActiveFont(font: 1)
            SegueVariables.editFonts = true
        }
        else if a22 != nil {
            setActiveFont(font: 2)
            SegueVariables.editFonts = true
        }
        else if a33 != nil {
            setActiveFont(font: 3)
            SegueVariables.editFonts = true
        }
        else if a44 != nil {
            setActiveFont(font: 4)
            SegueVariables.editFonts = true
        }
        else if a55 != nil {
            setActiveFont(font: 5)
            SegueVariables.editFonts = true
        }
        else if a66 != nil {
            setActiveFont(font: 6)
            SegueVariables.editFonts = true
        }
    }
    func resizeImage(letter: UIImage, targetSize: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size:targetSize).image { _ in
            letter.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
    func touchDown(atPoint pos : CGPoint) {
        distance = Int(pos.y)
    }
    func touchesMoved(toPoint pos: CGPoint){
        if sceneOn == true && deleteSCN == false {
            var move = SKAction()
            let change = -CGFloat((Int(pos.y) - distance))
            move = SKAction.moveBy(x: 0, y: change, duration: 0)
            cameraNode.run(move)
            if cameraNode.position.y != 0 {
                typeIt.removeFromSuperview()
                enterHere.removeFromSuperview()
            }
            distance = Int(pos.y) + Int(change)
        }
    }
    func touchUp(atPoint pos : CGPoint) {
        if deleteSCN == false {
        if cameraNode.position.y > self.frame.height / -12 {
            let camerareset = SKAction.move(to: CGPoint(x: 0, y: self.frame.height / -12), duration: 0)
            cameraNode.run(camerareset)
            typeIt.removeFromSuperview()
            self.view?.addSubview(self.typeIt)
        }
        if cameraNode.position.y < ((self.frame.height / -12) - (self.frame.height / 8 )) + ((self.frame.height / 3) - (self.frame.height / 2)) {
            let camerareset = SKAction.move(to: CGPoint(x: 0, y: ((self.frame.height / -12) - (self.frame.height / 8)) + ((self.frame.height / 3) - (self.frame.height / 2))), duration: 0)
            self.enterHere.removeFromSuperview()
            self.view?.addSubview(enterHere)
            cameraNode.run(camerareset)
        }
        if back.contains(pos){
            SegueVariables.editFonts = true
        }
        if fontOne.contains(pos) && a.fontsCreated >= 1 && a1 == false {
            setActiveFont(font: 1)
            font1selected.removeFromParent()
            font2selected.removeFromParent()
            font3selected.removeFromParent()
            font4selected.removeFromParent()
            font5selected.removeFromParent()
            font6selected.removeFromParent()
            fontPWselected.removeFromParent()
            fontWSselected.removeFromParent()
            fontMLselected.removeFromParent()
            self.addChild(font1selected)
            add = 1
            textBox.attributedText = getALetterFromDefaults()
            self.addChild(notify)
            notif = 1
            typeIt.removeFromSuperview()
            enterHere.removeFromSuperview()
            textBox.removeFromSuperview()
        }
        if fontTwo.contains(pos) && a.fontsCreated >= 2 && a2 == false {
            setActiveFont(font: 2)
            font1selected.removeFromParent()
            font2selected.removeFromParent()
            font3selected.removeFromParent()
            font4selected.removeFromParent()
            font5selected.removeFromParent()
            font6selected.removeFromParent()
            fontPWselected.removeFromParent()
            fontWSselected.removeFromParent()
            fontMLselected.removeFromParent()
            self.addChild(font2selected)
            add = 2
            textBox.attributedText = getALetterFromDefaults()
        }
        if fontThree.contains(pos) && a.fontsCreated >= 3 && a3 == false {
            setActiveFont(font: 3)
            font1selected.removeFromParent()
            font2selected.removeFromParent()
            font3selected.removeFromParent()
            font4selected.removeFromParent()
            font5selected.removeFromParent()
            font6selected.removeFromParent()
            fontPWselected.removeFromParent()
            fontWSselected.removeFromParent()
            fontMLselected.removeFromParent()
            self.addChild(font3selected)
            add = 3
            textBox.attributedText = getALetterFromDefaults()
        }
        if fontFour.contains(pos) && a.fontsCreated >= 4 && a4 == false {
            setActiveFont(font: 4)
            font1selected.removeFromParent()
            font2selected.removeFromParent()
            font3selected.removeFromParent()
            font4selected.removeFromParent()
            font5selected.removeFromParent()
            font6selected.removeFromParent()
            fontPWselected.removeFromParent()
            fontWSselected.removeFromParent()
            fontMLselected.removeFromParent()
            self.addChild(font4selected)
            add = 4
            textBox.attributedText = getALetterFromDefaults()
        }
        if fontFive.contains(pos) && a.fontsCreated >= 5 && a5 == false {
            setActiveFont(font: 5)
            font1selected.removeFromParent()
            font2selected.removeFromParent()
            font3selected.removeFromParent()
            font4selected.removeFromParent()
            font5selected.removeFromParent()
            font6selected.removeFromParent()
            fontPWselected.removeFromParent()
            fontWSselected.removeFromParent()
            fontMLselected.removeFromParent()
            self.addChild(font5selected)
            add = 5
            textBox.attributedText = getALetterFromDefaults()
        }
        if fontSix.contains(pos) && a.fontsCreated >= 6 && a6 == false {
            setActiveFont(font: 6)
            font1selected.removeFromParent()
            font2selected.removeFromParent()
            font3selected.removeFromParent()
            font4selected.removeFromParent()
            font5selected.removeFromParent()
            font6selected.removeFromParent()
            fontPWselected.removeFromParent()
            fontWSselected.removeFromParent()
            fontMLselected.removeFromParent()
            self.addChild(font6selected)
            add = 6
            textBox.attributedText = getALetterFromDefaults()
        }
        if fontPW.contains(pos) && PWBool == true {
            setActiveFont(font: 7)
            font1selected.removeFromParent()
            font2selected.removeFromParent()
            font3selected.removeFromParent()
            font4selected.removeFromParent()
            font5selected.removeFromParent()
            font6selected.removeFromParent()
            fontPWselected.removeFromParent()
            fontWSselected.removeFromParent()
            fontMLselected.removeFromParent()
            self.addChild(fontPWselected)
            add = 7
            textBox.attributedText = getFont(font: "Phillis", size: "")
        }
        if fontML.contains(pos) && MLBool == true {
            setActiveFont(font: 8)
            font1selected.removeFromParent()
            font2selected.removeFromParent()
            font3selected.removeFromParent()
            font4selected.removeFromParent()
            font5selected.removeFromParent()
            font6selected.removeFromParent()
            fontPWselected.removeFromParent()
            fontWSselected.removeFromParent()
            fontMLselected.removeFromParent()
            self.addChild(fontMLselected)
            add = 8
            textBox.attributedText = getFont(font: "Martin", size: "")
        }
        if fontWS.contains(pos) && WSBool == true {
            setActiveFont(font: 9)
            font1selected.removeFromParent()
            font2selected.removeFromParent()
            font3selected.removeFromParent()
            font4selected.removeFromParent()
            font5selected.removeFromParent()
            font6selected.removeFromParent()
            fontPWselected.removeFromParent()
            fontWSselected.removeFromParent()
            fontMLselected.removeFromParent()
            self.addChild(fontWSselected)
            add = 9
            textBox.attributedText = getFont(font: "Shake", size: "")
        }
        if color6.contains(pos){
            setBGColor(color: 1)
            textBox.removeFromSuperview()
            textBox.backgroundColor = UIColor(white: 0.92, alpha: 1)
            textBox.layer.borderColor = UIColor(white: 0.92, alpha: 1).cgColor
            self.view?.addSubview(textBox)
        }
        if color7.contains(pos){
            setBGColor(color: 2)
            textBox.removeFromSuperview()
            textBox.backgroundColor = UIColor.white
            textBox.layer.borderColor = UIColor.white.cgColor
            self.view?.addSubview(textBox)
        }
        if color8.contains(pos){
            setBGColor(color: 3)
            textBox.removeFromSuperview()
            textBox.backgroundColor = UIColor(red: 0, green: 0.7137, blue: 1, alpha: 1.0)
            textBox.layer.borderColor = UIColor(red: 0, green: 0.7137, blue: 1, alpha: 1.0).cgColor
            self.view?.addSubview(textBox)
        }
        if color9.contains(pos){
            setBGColor(color: 4)
            textBox.removeFromSuperview()
            textBox.backgroundColor = UIColor.red
            textBox.layer.borderColor = UIColor.red.cgColor
            self.view?.addSubview(textBox)
        }
        if color10.contains(pos){
            setBGColor(color: 5)
            textBox.removeFromSuperview()
            textBox.backgroundColor = UIColor(red: 0.7882, green: 0, blue: 0.9882, alpha: 1.0)
            textBox.layer.borderColor = UIColor(red: 0.7882, green: 0, blue: 0.9882, alpha: 1.0).cgColor
            self.view?.addSubview(textBox)
        }
        if saveIt.contains(pos){
            let defaults = UserDefaults.standard
            typeIt.resignFirstResponder()
            if add == 1 {
                defaults.set(typeIt.text, forKey: "font1name")
                selectFont1.removeFromParent()
                selectFont1.text = typeIt.text
                self.addChild(selectFont1)
            }
            else if add == 2 {
                defaults.set(typeIt.text, forKey: "font2name")
                selectFont2.removeFromParent()
                selectFont2.text = typeIt.text
                self.addChild(selectFont2)
            }
            else if add == 3 {
                defaults.set(typeIt.text, forKey: "font3name")
                selectFont3.removeFromParent()
                selectFont3.text = typeIt.text
                self.addChild(selectFont3)
            }
            else if add == 4 {
                defaults.set(typeIt.text, forKey: "font4name")
                selectFont4.removeFromParent()
                selectFont4.text = typeIt.text
                self.addChild(selectFont4)
            }
            else if add == 5 {
                defaults.set(typeIt.text, forKey: "font5name")
                selectFont5.removeFromParent()
                selectFont5.text = typeIt.text
                self.addChild(selectFont5)
            }
            else if add == 6 {
                defaults.set(typeIt.text, forKey: "font6name")
                selectFont6.removeFromParent()
                selectFont6.text = typeIt.text
                self.addChild(selectFont6)
            }
            else {
                typeIt.text = ""
            }
        }
        if editme.contains(pos) && enterHere.text != "" && add != 0 && add != 7 && add != 8 && add != 9{
            cameraNode.run(cameraToggle)
            enterHere.removeFromSuperview()
            typeIt.removeFromSuperview()
            textBox.removeFromSuperview()
            sceneOn = false
        }
        if oopsnope.contains(pos){
            enterHere.text = ""
            cameraNode.run(moveBack)
            self.view?.addSubview(typeIt)
            self.view?.addSubview(textBox)
            sceneOn = true
        }
        if touchPad1.contains(pos){
            fontVariables.editLetter = enterHere.text
            fontVariables.drawEdit = true
        }
        if touchPad2.contains(pos){
            fontVariables.editLetter = enterHere.text
            fontVariables.camEdit = true
        }
        }
        if deleteFontBtn.contains(pos) && add != 0 && add != 7 && add != 8 && add != 9 && notif == 0 {
            deleteSCN = true
            self.cameraNode.run(deleteAFont)
            typeIt.removeFromSuperview()
            enterHere.removeFromSuperview()
            textBox.removeFromSuperview()
            if fontVariables.fontSelected == 1 {
                deleteMessage.text = "Are you sure you want to delete " + selectFont1.text! + "? \n This action cannot be undone. \n You won't be refunded the cost of the font."
                deleteMessage.removeFromSuperview()
                self.view?.addSubview(deleteMessage)
            }
            else if fontVariables.fontSelected == 2 {
                deleteMessage.text = "Are you sure you want to delete " + selectFont2.text! + "? \n This action cannot be undone. \n You won't be refunded the cost of the font."
                deleteMessage.removeFromSuperview()
                self.view?.addSubview(deleteMessage)
            }
            else if fontVariables.fontSelected == 3 {
                deleteMessage.text = "Are you sure you want to delete " + selectFont3.text! + "? \n This action cannot be undone. \n You won't be refunded the cost of the font."
                deleteMessage.removeFromSuperview()
                self.view?.addSubview(deleteMessage)
            }
            else if fontVariables.fontSelected == 4 {
                deleteMessage.text = "Are you sure you want to delete " + selectFont4.text! + "? \n This action cannot be undone. \n You won't be refunded the cost of the font."
                deleteMessage.removeFromSuperview()
                self.view?.addSubview(deleteMessage)
            }
            else if fontVariables.fontSelected == 5 {
                deleteMessage.text = "Are you sure you want to delete " + selectFont5.text! + "? \n This action cannot be undone. \n You won't be refunded the cost of the font."
                deleteMessage.removeFromSuperview()
                self.view?.addSubview(deleteMessage)
            }
            else if fontVariables.fontSelected == 6 {
                deleteMessage.text = "Are you sure you want to delete " + selectFont6.text! + "? \n This action cannot be undone. \n You won't be refunded the cost of the font."
                deleteMessage.removeFromSuperview()
                self.view?.addSubview(deleteMessage)
            }
        }
        if deleteConfirm.contains(pos){
            deleteFont()
        }
        if cancelDelete.contains(pos){
            self.cameraNode.run(canceled)
            self.view?.addSubview(typeIt)
            self.view?.addSubview(textBox)
            deleteMessage.removeFromSuperview()
            deleteSCN = false
        }
        if size1.contains(pos) && add != 0 && add != 7 && add != 8 && add != 9 {
            var x: Int = 0
            while x < 67 {
                var letter = UIImage()
                let defaults = UserDefaults.standard
                let fullQual = defaults.bool(forKey: "fullSaved\(add)")
                if fullQual == true {
                    letter = getFromDefaults(letter: "m\(examples[x])\(add)")
                } else {
                    letter = getFromDefaults(letter: "\(examples[x])\(add)")
                    save(image: letter, key: "m\(examples[x])\(add)")
                }
                if x == 5 || x == 8 || x == 9 || x == 26 || x == 27 || x == 28 || x == 29 || x == 30 || x == 31 || x == 32 || x == 33 || x == 34 || x == 35 || x == 36 || x == 37 || x == 39 || x == 40 || x == 41 || x == 42 || x == 43 || x == 44 || x == 45 || x == 46 || x == 47 || x == 49 || x == 50 || x == 51 || x == 57 || x == 58 || x == 59 || x == 60 || x == 61 || x == 62 || x == 63 || x == 64 || x == 65 || x == 66 {
                    let resize = resizeImage(letter: letter, targetSize: CGSize(width: 25 / 1.6, height: 25))
                    save(image: resize, key: "\(examples[x])\(add)")
                }
                else if x == 52 || x == 53 || x == 54 || x == 55 || x == 56 {
                    let resize = resizeImage(letter: letter, targetSize: CGSize(width: 25 * 0.43, height: 25))
                    save(image: resize, key: "\(examples[x])\(add)")
                }
                else {
                    let resize = resizeImage(letter: letter, targetSize: CGSize(width: 25, height: 25))
                    save(image: resize, key: "\(examples[x])\(add)")
                }
                x += 1
            }
            if x >= 67 {
                textBox.attributedText = getALetterFromDefaults()
                let defaults = UserDefaults.standard
                defaults.set(3, forKey: "size\(add)")
                defaults.set(true, forKey: "fullSaved\(add)")
            }
        }
        if size2.contains(pos) && add != 0 && add != 7 && add != 8 && add != 9{
            var x: Int = 0
            while x < 67 {
                var letter = UIImage()
                let defaults = UserDefaults.standard
                let fullQual = defaults.bool(forKey: "fullSaved\(add)")
                if fullQual == true {
                    letter = getFromDefaults(letter: "m\(examples[x])\(add)")
                } else {
                    letter = getFromDefaults(letter: "\(examples[x])\(add)")
                    save(image: letter, key: "m\(examples[x])\(add)")
                }
                if x == 5 || x == 8 || x == 9 || x == 26 || x == 27 || x == 28 || x == 29 || x == 30 || x == 31 || x == 32 || x == 33 || x == 34 || x == 35 || x == 36 || x == 37 || x == 39 || x == 40 || x == 41 || x == 42 || x == 43 || x == 44 || x == 45 || x == 46 || x == 47 || x == 49 || x == 50 || x == 51 || x == 57 || x == 58 || x == 59 || x == 60 || x == 61 || x == 62 || x == 63 || x == 64 || x == 65 || x == 66 {
                    let resize = resizeImage(letter: letter, targetSize: CGSize(width: 32.5 / 1.6, height: 32.5))
                    save(image: resize, key: "\(examples[x])\(add)")
                }
                else if x == 52 || x == 53 || x == 54 || x == 55 || x == 56 {
                    let resize = resizeImage(letter: letter, targetSize: CGSize(width: 32.5 * 0.43, height: 32.5))
                    save(image: resize, key: "\(examples[x])\(add)")
                }
                else {
                    let resize = resizeImage(letter: letter, targetSize: CGSize(width: 32.5, height: 32.5))
                    save(image: resize, key: "\(examples[x])\(add)")
                }
                x += 1
            }
            if x >= 67 {
                textBox.attributedText = getALetterFromDefaults()
                let defaults = UserDefaults.standard
                defaults.set(2, forKey: "size\(add)")
                defaults.set(true, forKey: "fullSaved\(add)")
            }
        }
        if size3.contains(pos) && add != 0 && add != 7 && add != 8 && add != 9{
            var x: Int = 0
            while x < 67 {
                var letter = UIImage()
                let defaults = UserDefaults.standard
                let fullQual = defaults.bool(forKey: "fullSaved\(add)")
                if fullQual == true {
                    letter = getFromDefaults(letter: "m\(examples[x])\(add)")
                } else {
                    letter = getFromDefaults(letter: "\(examples[x])\(add)")
                    save(image: letter, key: "m\(examples[x])\(add)")
                }
                if x == 5 || x == 8 || x == 9 || x == 26 || x == 27 || x == 28 || x == 29 || x == 30 || x == 31 || x == 32 || x == 33 || x == 34 || x == 35 || x == 36 || x == 37 || x == 39 || x == 40 || x == 41 || x == 42 || x == 43 || x == 44 || x == 45 || x == 46 || x == 47 || x == 49 || x == 50 || x == 51 || x == 57 || x == 58 || x == 59 || x == 60 || x == 61 || x == 62 || x == 63 || x == 64 || x == 65 || x == 66 {
                    let resize = resizeImage(letter: letter, targetSize: CGSize(width: 40 / 1.6, height: 40))
                    save(image: resize, key: "\(examples[x])\(add)")
                }
                else if x == 52 || x == 53 || x == 54 || x == 55 || x == 56 {
                    let resize = resizeImage(letter: letter, targetSize: CGSize(width: 40 * 0.43, height: 40))
                    save(image: resize, key: "\(examples[x])\(add)")
                }
                else {
                    let resize = resizeImage(letter: letter, targetSize: CGSize(width: 40, height: 40))
                    save(image: resize, key: "\(examples[x])\(add)")
                }
                x += 1
            }
            if x >= 67 {
                textBox.attributedText = getALetterFromDefaults()
                let defaults = UserDefaults.standard
                defaults.set(1, forKey: "size\(add)")
                defaults.set(true, forKey: "fullSaved\(add)")
            }
        }
        if size1.contains(pos) && (add == 7 || add == 8 || add == 9) {
            let defaults = UserDefaults.standard
            if add == 7 {
                textBox.attributedText = getFont(font: "Phillis", size: " copy 2")
            }
            else if add == 8 {
                textBox.attributedText = getFont(font: "Martin", size: " copy 2")
            }
            else if add == 9 {
                textBox.attributedText = getFont(font: "Shake", size: " copy 2")
            }
            defaults.set(" copy 2", forKey: "dsize")
        }
        if size2.contains(pos) && (add == 7 || add == 8 || add == 9) {
            let defaults = UserDefaults.standard
            if add == 7 {
                textBox.attributedText = getFont(font: "Phillis", size: " copy")
            }
            else if add == 8 {
                textBox.attributedText = getFont(font: "Martin", size: " copy")
            }
            else if add == 9 {
                textBox.attributedText = getFont(font: "Shake", size: " copy")
            }
            defaults.set(" copy", forKey: "dsize")
        }
        if size3.contains(pos) && (add == 7 || add == 8 || add == 9) {
            let defaults = UserDefaults.standard
            if add == 7 {
                textBox.attributedText = getFont(font: "Phillis", size: "")
            }
            else if add == 8 {
                textBox.attributedText = getFont(font: "Martin", size: "")
            }
            else if add == 9 {
                textBox.attributedText = getFont(font: "Shake", size: "")
            }
            defaults.set("", forKey: "dsize")
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if typeIt.isFirstResponder {
            typeIt.resignFirstResponder()
        }

        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchesMoved(toPoint: t.location(in: self)) }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if notif == 1 {
            notify.removeFromParent()
            self.view?.addSubview(typeIt)
            self.view?.addSubview(textBox)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.notif = 0
            })
        }
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
}
struct fontVariables {
    static var fontSelected : Int = 0
    static var editLetter : String = ""
    static var camEdit : Bool = false
    static var drawEdit : Bool = false
}
