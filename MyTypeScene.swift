//
//  MyTypeScene.swift
//  MyType
//
//  Created by Alexander Eckert on 3/4/18.
//  Copyright © 2018 Alexander Eckert. All rights reserved.
//

import UIKit
import SpriteKit
import StoreKit

class MyTypeScene: SKScene, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    var UsernameBox : UITextView = UITextView(frame: CGRect(x: 20, y: 200, width: 350, height: 50))
    var PasswordBox : UITextView = UITextView(frame: CGRect(x: 20, y: 400, width: 350, height: 50))
    var PasswordBoxTwo : UITextView = UITextView(frame: CGRect(x: 20, y: 600, width: 350, height: 50))
    
    var sc1: Bool = true
    var sc2: Bool = false
    var sc3: Bool = false
    var sc4: Bool = false
    var sc5: Bool = false
    var sc6: Bool = false
    var point = CGPoint()
    
    var my = SKSpriteNode(imageNamed: "My")
    var type = SKSpriteNode(imageNamed: "Type")
    var bg = SKSpriteNode(imageNamed: "BlooSperkles")
    var downOne = SKSpriteNode(imageNamed: "Down1")
    var upOne = SKSpriteNode(imageNamed: "Up1")
    var scroll = SKSpriteNode(imageNamed: "Scroll")
    var scribble = SKSpriteNode(imageNamed: "TheCreator")
    var tutBtn = SKSpriteNode(imageNamed: "Tutorial")
    var underLine = SKSpriteNode(imageNamed: "Oonderline")
    var makeFonts = SKSpriteNode(imageNamed: "MakeFonts")
    var scribble2 = SKSpriteNode(imageNamed: "ScribbleTwo")
    var browse = SKSpriteNode(imageNamed: "BrowseFonts")
    var book = SKSpriteNode(imageNamed: "Book")
    var thing1 = SKSpriteNode()
    var paintBrush = SKSpriteNode(imageNamed: "PaintBrush")
    var Jscamera = SKSpriteNode(imageNamed: "Camera")
    var actualize = SKSpriteNode(imageNamed: "Actualize")
    var drawCharacters = SKSpriteNode(imageNamed: "DrawCharacters")
    var scribble3 = SKSpriteNode(imageNamed: "ScribbleThree")
    var backBtn = SKSpriteNode(imageNamed: "BackBtn")
    var writeAlphabet = SKSpriteNode()
    var lookAtFonts = SKSpriteNode()
    var act = SKSpriteNode()
    var newMessage = SKSpriteNode(imageNamed: "NewMessage")
    var topLeftScrollArt = SKSpriteNode(imageNamed: "ScrollWorkOne")
    var bottomRightScrollArt = SKSpriteNode(imageNamed: "ScrollWorkTwo")
    var ScrollArt = SKSpriteNode(imageNamed: "ScrollWorkThree")
    var seporater = SKSpriteNode(imageNamed: "Seporater")
    var seporaterTwo = SKSpriteNode(imageNamed: "SeporaterTwo")
    var seporaterThree = SKSpriteNode(imageNamed: "SeporaterThree")
    var scrollViewSc3 = SKSpriteNode()
    var searchBtn = SKSpriteNode(imageNamed: "SearchBtn")
    var runAnim : Int = 0
    var yetAnotherScribble = SKSpriteNode(imageNamed: "YetAnotherScribble")
    
    var phillisWheatley = SKSpriteNode(imageNamed: "PhillisWheatley")
    var PW = SKLabelNode(fontNamed: "Times New Roman")
    var williamShakespeare = SKSpriteNode(imageNamed: "WilliamShakespeare")
    var WS = SKLabelNode(fontNamed: "Times New Roman")
    var martinLuther = SKSpriteNode(imageNamed: "MartinLuther")
    var ML = SKLabelNode(fontNamed: "Times New Roman")
    var note = SKLabelNode(fontNamed: "American Typewriter")
    var note2 = SKLabelNode(fontNamed: "American Typewriter")
    var note3 = SKLabelNode(fontNamed: "American Typewriter")
    var restorePurchases2 = SKLabelNode(fontNamed: "American Typewriter")
    var distanceScrolled : Int = 0
    var scrollGesture : Bool = true
    var distance : Int = 0
    var textBox = UITextView()
    var textBox2 = UITextView()
    var purchaseFont = SKSpriteNode(imageNamed: "Purchase")
    var WSBool : Bool = false
    var MLBool : Bool = false
    var PWBool : Bool = false
    var famousFontMessage = SKSpriteNode(imageNamed: "FamousFontMessage")
    var fontMessageBool : Bool = false
    var whiteArea = SKSpriteNode()
    
    var popUp = SKSpriteNode()
    var confirm = SKLabelNode(fontNamed: "American Typewriter")
    var deny = SKLabelNode(fontNamed: "American Typewriter")
    var whichOne: Int = 0
    var fontMessage1 = SKLabelNode(fontNamed: "American Typewriter")
    var fontMessage2 = SKLabelNode(fontNamed: "American Typewriter")
    var fontMessage3 = SKLabelNode(fontNamed: "American Typewriter")
    var fontMessage4 = SKLabelNode(fontNamed: "American Typewriter")
    var fontMessage = UITextView()
    var restore = SKLabelNode(fontNamed: "American Typewriter")
    
    var list = [SKProduct]()
    var p = SKProduct()
    var IAPEnabled : Bool = true
    var fontProcessing : Bool = false
    
    override func didMove(to view: SKView) {
        print("Scene loaded.")
        bg.size = self.frame.size
        self.addChild(self.bg)
        self.backgroundColor = UIColor.white
        
        if SKPaymentQueue.canMakePayments() {
            print("IAP is enabled, loading...")
            let productID: NSSet = NSSet(objects: "CandyRain.MyType.BuyFont1", "CandyRain.MyType.BuyFont2", "CandyRain.MyType.BuyFont3", "CandyRain.MyType.BuyFont4", "CandyRain.MyType.BuyFont5", "CandyRain.MyType.BuyFont6", "CandyRain.MyType.Phillis", "CandyRain.MyType.Martin", "CandyRain.MyType.Shakes")
            let request: SKProductsRequest = SKProductsRequest(productIdentifiers: productID as! Set<String>)
            request.delegate = self
            request.start()
        }
        else {
            print("please enable IAPs")
            IAPEnabled = false
        }
        
        let defaults = UserDefaults(suiteName: "group.io.golf.fonts")
        let fontsMade = defaults?.integer(forKey: "fontsCreated")
        a.fontsCreated = fontsMade!
        
        my.size = CGSize(width: self.frame.height / 3, height: self.frame.width / 3)
        my.position = CGPoint(x: 0, y: (my.size.height)/3)
        self.addChild(my)
        
        type.size = CGSize(width: self.frame.height / 3, height: self.frame.width / 2.5)
        type.position = CGPoint(x: 0, y: -(type.size.height)/4)
        self.addChild(type)
        
        tutBtn.size = CGSize(width: self.frame.width / 2.2, height: self.frame.width / 4)
        tutBtn.position = CGPoint(x: 1000, y: (self.frame.height / 3.2) - self.tutBtn.size.height / 2)
        self.addChild(self.tutBtn)
        
        yetAnotherScribble.size = CGSize(width: self.frame.width, height: self.frame.height / 3)
        yetAnotherScribble.position = CGPoint(x: 0, y: tutBtn.position.y)
        self.addChild(yetAnotherScribble)
        
        scribble.position = CGPoint(x: 0, y: -1000)
        scribble.size = CGSize(width: self.frame.width - 40, height: self.frame.width / 8)
        //self.addChild(scribble)
        
        underLine.position = CGPoint(x: -1000, y: (self.frame.height / 3) - my.size.height / 3.5)
        underLine.size = CGSize(width: self.frame.height / 1.5, height: self.frame.height / 5)
        self.addChild(underLine)
        
        makeFonts.position = CGPoint(x: -1000, y: (self.frame.height / 1.9) - (self.frame.height / 2))
        makeFonts.size = CGSize(width: self.frame.width / 2, height: self.frame.height / 4)
        self.addChild(makeFonts)
        
        scroll.position = CGPoint(x: -1000, y: (self.frame.height / 1.9) - (self.frame.height / 2))
        scroll.size = CGSize(width: self.frame.width / 2, height: self.frame.height / 4)
        self.addChild(scroll)
        
        scribble2.position = CGPoint(x: 1000, y: self.scroll.position.y - (scroll.size.height / 1.5))
        scribble2.size = CGSize(width: self.frame.width - 40, height: self.frame.width / 10)
        self.addChild(scribble2)
        
        browse.position = CGPoint(x: -1000, y: -(self.frame.height / 3))
        browse.size = CGSize(width: self.frame.width / 2, height: self.frame.height / 4)
        self.addChild(browse)
        
        book.position = CGPoint(x: -1000, y: -(self.frame.height / 3))
        book.size = CGSize(width: self.frame.width / 2.5, height: self.frame.height / 4)
        self.addChild(book)
        
        thing1.size = CGSize(width: self.frame.width, height: self.frame.height / 3)
        thing1.position = CGPoint(x: 0, y: (self.frame.height / 1.9) - (self.frame.height / 2))
        self.addChild(thing1)
        
        paintBrush.position = CGPoint(x: -(self.frame.width / 3), y: self.frame.height / 4)
        paintBrush.size = CGSize(width: self.frame.width / 3, height: self.frame.height / 2.5)
        
        Jscamera.position = CGPoint(x: -(self.frame.width / 5), y: -(self.frame.height / 5))
        Jscamera.size = CGSize(width: self.frame.width / 2, height: self.frame.height / 4)
        
        actualize.position = CGPoint(x: 0, y: -(self.frame.height / 2.5))
        actualize.size = CGSize(width: self.frame.width, height: self.frame.height / 3)
        
        drawCharacters.position = CGPoint(x: self.frame.width / 6, y: self.frame.height / 4)
        drawCharacters.size = CGSize(width: self.frame.width / 1.5, height: self.frame.height / 3)
        
        scribble3.position = CGPoint(x: 0, y: 0)
        scribble3.size = CGSize(width: self.frame.width - 40, height: self.frame.width / 10)
        
        backBtn.size = CGSize(width: self.frame.width / 4, height: self.frame.width  / 10)
        backBtn.position = CGPoint(x: -(self.frame.width / 2) + (self.backBtn.size.width / 2), y: (self.frame.height / 2) - (self.backBtn.size.height))
        
        writeAlphabet.position = CGPoint(x: 0, y: self.frame.height / 4)
        writeAlphabet.size = CGSize(width: self.frame.width, height: self.frame.height / 2)
        
        lookAtFonts.size = CGSize(width: self.frame.width, height: self.frame.height / 3)
        lookAtFonts.position = CGPoint(x: 0, y: -(self.frame.height / 3))
        self.addChild(lookAtFonts)
        
        act.position = CGPoint(x: 0, y: -(self.frame.height / 4))
        act.size = CGSize(width: self.frame.width, height: self.frame.height / 2)
        
        newMessage.size = CGSize(width: self.tutBtn.size.width * 0.8, height: self.tutBtn.size.height * 0.8)
        newMessage.position = tutBtn.position
        self.addChild(newMessage)
        
        scrollViewSc3.position = CGPoint(x: 0, y: 0)
        scrollViewSc3.size = CGSize(width: self.frame.width, height: self.frame.height * 100)
        
        searchBtn.size = CGSize(width: self.frame.width * 0.8, height: self.frame.width / 4)
        searchBtn.position = CGPoint(x: 0, y: (self.frame.height / 2) - searchBtn.size.height)
        
        ScrollArt.position = CGPoint(x: 0, y: self.frame.height / 6)
        ScrollArt.size = CGSize(width: self.frame.width / 3, height: self.frame.height / 3)
        
        topLeftScrollArt.size = CGSize(width: self.frame.width / 2, height: self.frame.width / 2)
        topLeftScrollArt.position = CGPoint(x: -(self.frame.width / 2) + topLeftScrollArt.size.width / 2, y: (self.frame.height / 2) - self.topLeftScrollArt.size.height / 3)
        
        bottomRightScrollArt.size = CGSize(width: self.frame.width / 2, height: self.frame.width / 2)
        bottomRightScrollArt.position = CGPoint(x: (self.frame.width / 2) - topLeftScrollArt.size.width / 2, y: -(self.frame.height / 2) + self.topLeftScrollArt.size.height / 3)
        
        phillisWheatley.size = CGSize(width: self.frame.width, height: self.frame.width / 4)
        phillisWheatley.position = CGPoint(x: 0, y: 0)
        
        PW.text = "Phillis Wheatley"
        PW.fontColor = UIColor.blue
        PW.fontSize = 20
        PW.position = CGPoint(x: 0, y: phillisWheatley.position.y - (phillisWheatley.size.height * 0.7))
        
        seporater.size = CGSize(width: self.frame.width * 1.3, height: self.frame.width / 3)
        seporater.position = CGPoint(x: 10, y: PW.position.y - (seporater.size.height / 5))
        
        williamShakespeare.size = CGSize(width: self.frame.width, height: self.frame.width / 4)
        williamShakespeare.position = CGPoint(x: 0, y: seporater.position.y - (williamShakespeare.size.height / 2))
        
        WS.text = "William Shakespeare"
        WS.fontColor = UIColor.blue
        WS.fontSize = 20
        WS.position = CGPoint(x: 0, y: williamShakespeare.position.y - (williamShakespeare.size.height * 0.7))
        
        seporaterTwo.size = CGSize(width: self.frame.width * 1.3, height: self.frame.width / 3)
        seporaterTwo.position = CGPoint(x: 10, y: WS.position.y - (seporaterTwo.size.height / 5))
        
        martinLuther.size = CGSize(width: self.frame.width, height: self.frame.width / 4)
        martinLuther.position = CGPoint(x: 0, y: seporaterTwo.position.y - (martinLuther.size.height / 2))
        
        ML.text = "Martin Luther King Jr."
        ML.fontColor = UIColor.blue
        ML.fontSize = 20
        ML.position = CGPoint(x: 0, y: martinLuther.position.y - (martinLuther.size.height * 0.7))
        
        seporaterThree.size = CGSize(width: self.frame.width * 1.3, height: self.frame.width / 3)
        seporaterThree.position = CGPoint(x: 10, y: ML.position.y - (seporaterThree.size.height / 5))
        
        upOne.position = CGPoint(x: 0, y: self.frame.height)
        upOne.size = CGSize(width: self.frame.width, height: self.frame.height)
        
        downOne.position = CGPoint(x: 0, y: -(self.frame.height))
        downOne.size = CGSize(width: self.frame.width, height: self.frame.height)
        
        let font = self.frame.width / 22
        
        note.text = "Not interested in any of these fonts?"
        note.fontColor = UIColor.black
        note.fontSize = font
        note.position = CGPoint(x: 0, y: seporaterThree.position.y - font * 2)
        
        note2.text = "Visit MyType on Instagram and comment"
        note2.fontColor = UIColor.black
        note2.fontSize = font
        note2.position = CGPoint(x: 0, y: note.position.y - font * 1.5)
        
        note3.text = "whose handwriting you want to text with."
        note3.fontColor = UIColor.black
        note3.fontSize = font
        note3.position = CGPoint(x: 0, y: note2.position.y - font * 1.5)
        
        restorePurchases2.text = "Restore Purchases"
        restorePurchases2.fontColor = UIColor.blue
        restorePurchases2.fontSize = font
        restorePurchases2.position = CGPoint(x: 0, y: note3.position.y - font * 3)
        
        popUp.color = UIColor.white
        popUp.size = CGSize(width: self.frame.width - 40, height: self.frame.height / 1.5)
        popUp.position = CGPoint(x: 0, y: 0)
        
        confirm.text = "Confirm"
        confirm.fontColor = UIColor.green
        confirm.fontSize = 30
        confirm.position = CGPoint(x: self.frame.width / 4, y: self.frame.height / -4)
        
        deny.text = "Deny"
        deny.fontColor = UIColor.red
        deny.fontSize = 30
        deny.position = CGPoint(x: self.frame.width / -4, y: self.frame.height / -4)
        
        fontMessage1.text = ""
        fontMessage1.fontColor = UIColor.blue
        fontMessage1.fontSize = 15
        fontMessage1.position = CGPoint(x: 0, y: self.frame.height / 4)
        
        fontMessage2.text = ""
        fontMessage2.fontColor = UIColor.blue
        fontMessage2.fontSize = 15
        fontMessage2.position = CGPoint(x: 0, y: self.fontMessage1.position.y - 20)
        
        fontMessage3.text = ""
        fontMessage3.fontColor = UIColor.blue
        fontMessage3.fontSize = 15
        fontMessage3.position = CGPoint(x: 0, y: self.fontMessage1.position.y - 40)
        
        fontMessage4.text = "Your first font costs 99 cents."
        fontMessage4.fontColor = UIColor.blue
        fontMessage4.fontSize = 15
        fontMessage4.position = CGPoint(x: 0, y: self.fontMessage1.position.y - 60)
        
        fontMessage = UITextView(frame: CGRect(x: 20, y: self.frame.height / 4, width: self.frame.width - 40, height: self.frame.height / 2.5))
        fontMessage.text = ""
        fontMessage.isSelectable = false
        fontMessage.isEditable = false
        fontMessage.font = UIFont(name: "American Typewriter", size: 20)
        fontMessage.backgroundColor = UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 0)
        fontMessage.textAlignment = .center
        fontMessage.textColor = UIColor.blue
        
        restore.text = "Restore Purchases"
        restore.fontColor = UIColor.blue
        restore.fontSize = 15
        restore.position = CGPoint(x: 0, y: confirm.position.y - 40)
        
        textBox = UITextView(frame: CGRect(x: 15, y: (self.frame.height * 0.82), width: self.frame.width - 30, height: self.frame.height / 6))
        textBox.text = ""
        textBox.layer.borderWidth = 5
        textBox.isSelectable = false
        textBox.isEditable = false
        textBox.isUserInteractionEnabled = true
        textBox.isScrollEnabled = true
        textBox.backgroundColor = UIColor(white: 0.92, alpha: 1)
        textBox.layer.borderColor = UIColor(white: 0.92, alpha: 1).cgColor
        
        textBox2 = UITextView(frame: CGRect(x: 15, y: (self.frame.height * 0.28), width: self.frame.width - 30, height: self.frame.height * 0.5))
        textBox2.text = ""
        textBox2.font = UIFont(name: "American Typewriter", size: self.frame.height / 35)
        textBox2.textColor = UIColor.blue
        textBox2.textAlignment = .center
        textBox2.layer.borderWidth = 5
        textBox2.isSelectable = false
        textBox2.isEditable = false
        textBox2.isUserInteractionEnabled = true
        textBox2.isScrollEnabled = true
        textBox2.backgroundColor = UIColor(white: 0.92, alpha: 0)
        textBox2.layer.borderColor = UIColor(white: 0.92, alpha: 0).cgColor
        
        purchaseFont.size = CGSize(width: self.frame.width * 0.7, height : self.frame.height / 4)
        purchaseFont.position = CGPoint(x: 0, y: self.frame.height / 3)
        
        let defaults3 = UserDefaults.standard

        let firstTime = defaults3.bool(forKey: "First Time")
        print(firstTime)
        if firstTime == false {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                let labelShrink = SKAction.scale(by: 0.8, duration: 1)
                let myLabelMove = SKAction.move(to: CGPoint(x: -(self.my.size.width) / 4, y: (self.frame.height / 3) +
                    self.my.size.height / 10), duration: 1)
                let typeLabelMove = SKAction.move(to: CGPoint(x: (self.type.size.width) / 4, y: (self.frame.height / 3) + self.type.size.height / 10), duration: 1)
                let tutMove = SKAction.moveTo(x: self.frame.width / 4, duration: 2)
                let newMsgeMove = SKAction.moveTo(x: -(self.frame.width / 4), duration: 2)
                let scribbleMove = SKAction.moveTo(y: (self.frame.height / 3.1) - self.tutBtn.size.height / 1.3, duration: 2)
                let underMove = SKAction.moveTo(x: -(self.frame.width  / 16), duration: 2)
                let scrollMove = SKAction.moveTo(x: -(self.frame.width / 4), duration: 3)
                let makefontsMove = SKAction.moveTo(x: self.frame.width / 4, duration: 3)
                let scribbletwoMove = SKAction.moveTo(x: 0, duration: 3)
                let browseMove = SKAction.moveTo(x: self.frame.width / 4, duration: 4)
                let bookMove = SKAction.moveTo(x: -(self.frame.width / 4), duration: 4)
                self.my.run(labelShrink)
                self.my.run(myLabelMove)
                self.type.run(labelShrink)
                self.type.run(typeLabelMove)
                self.tutBtn.run(tutMove)
                self.newMessage.run(newMsgeMove)
                self.scribble.run(scribbleMove)
                self.underLine.run(underMove)
                self.makeFonts.run(makefontsMove)
                self.scroll.run(scrollMove)
                self.scribble2.run(scribbletwoMove)
                self.browse.run(browseMove)
                self.book.run(bookMove)
            })
        }
        else if firstTime == true {
            let labelShrink = SKAction.scale(by: 0.8, duration: 0)
            let myLabelMove = SKAction.move(to: CGPoint(x: -(self.my.size.width) / 4, y: (self.frame.height / 3) +
                    self.my.size.height / 10), duration: 0)
            let typeLabelMove = SKAction.move(to: CGPoint(x: (self.type.size.width) / 4, y: (self.frame.height / 3) + self.type.size.height / 10), duration: 0)
            let tutMove = SKAction.moveTo(x: self.frame.width / 4, duration: 0)
            let newMsgeMove = SKAction.moveTo(x: -(self.frame.width / 4), duration: 0)
            let scribbleMove = SKAction.moveTo(y: (self.frame.height / 3.1) - self.tutBtn.size.height / 1.3, duration: 0)
            let underMove = SKAction.moveTo(x: -(self.frame.width  / 16), duration: 0)
            let scrollMove = SKAction.moveTo(x: -(self.frame.width / 4), duration: 0)
            let makefontsMove = SKAction.moveTo(x: self.frame.width / 4, duration: 0)
            let scribbletwoMove = SKAction.moveTo(x: 0, duration: 0)
            let browseMove = SKAction.moveTo(x: self.frame.width / 4, duration: 0)
            let bookMove = SKAction.moveTo(x: -(self.frame.width / 4), duration: 0)
            self.my.run(labelShrink)
            self.my.run(myLabelMove)
            self.type.run(labelShrink)
            self.type.run(typeLabelMove)
            self.tutBtn.run(tutMove)
            self.newMessage.run(newMsgeMove)
            self.scribble.run(scribbleMove)
            self.underLine.run(underMove)
            self.makeFonts.run(makefontsMove)
            self.scroll.run(scrollMove)
            self.scribble2.run(scribbletwoMove)
            self.browse.run(browseMove)
            self.book.run(bookMove)
        }
        defaults3.set(true, forKey: "First Time")
    }
    func loadSceneTwo(){
        self.removeAllChildren()
        self.fontMessage.removeFromSuperview()
        self.addChild(self.bg)
        self.addChild(self.Jscamera)
        self.addChild(self.paintBrush)
        self.addChild(self.drawCharacters)
        self.addChild(self.actualize)
        self.addChild(self.scribble3)
        self.addChild(self.backBtn)
        self.addChild(self.writeAlphabet)
        self.addChild(self.act)
    }
    func loadSceneOne(){
        self.removeAllChildren()
        self.scrollViewSc3.removeAllChildren()
        self.addChild(self.bg)
        self.addChild(self.my)
        self.addChild(self.type)
        //self.addChild(self.scribble)
        self.addChild(yetAnotherScribble)
        self.addChild(self.scribble2)
        self.addChild(self.underLine)
        self.addChild(self.makeFonts)
        self.addChild(self.tutBtn)
        self.addChild(self.newMessage)
        self.addChild(self.browse)
        self.addChild(self.scroll)
        self.addChild(self.book)
        self.addChild(self.thing1)
        backBtn.position = CGPoint(x: -(self.frame.width / 2) + (self.backBtn.size.width / 2), y: (self.frame.height / 2) - (self.backBtn.size.height))
    }
    func loadSceneThree(){
        self.removeAllChildren()
        
        self.addChild(scrollViewSc3)
        self.addChild(topLeftScrollArt)
        self.addChild(bottomRightScrollArt)
        
        scrollViewSc3.addChild(bg)
        scrollViewSc3.addChild(downOne)
        scrollViewSc3.addChild(upOne)
        scrollViewSc3.addChild(ScrollArt)
        scrollViewSc3.addChild(backBtn)
        scrollViewSc3.addChild(seporater)
        scrollViewSc3.addChild(seporaterTwo)
        scrollViewSc3.addChild(martinLuther)
        scrollViewSc3.addChild(williamShakespeare)
        scrollViewSc3.addChild(phillisWheatley)
        scrollViewSc3.addChild(seporaterThree)
        scrollViewSc3.addChild(note)
        scrollViewSc3.addChild(note2)
        scrollViewSc3.addChild(note3)
        scrollViewSc3.addChild(restorePurchases2)
        scrollViewSc3.addChild(PW)
        scrollViewSc3.addChild(WS)
        scrollViewSc3.addChild(ML)
    }
    func addChildren() {
        
        scrollViewSc3.removeAllChildren()
        
        bg.position = CGPoint(x: bg.position.x, y: bg.position.y + scrollViewSc3.position.y)
        downOne.position = CGPoint(x: downOne.position.x, y: downOne.position.y + scrollViewSc3.position.y)
        upOne.position = CGPoint(x: upOne.position.x, y: upOne.position.y + scrollViewSc3.position.y)
        ScrollArt.position = CGPoint(x: ScrollArt.position.x, y: ScrollArt.position.y + scrollViewSc3.position.y)
        backBtn.position = CGPoint(x: backBtn.position.x, y: backBtn.position.y + scrollViewSc3.position.y)
        seporater.position = CGPoint(x: seporater.position.x, y: seporater.position.y + scrollViewSc3.position.y)
        seporaterTwo.position = CGPoint(x: seporaterTwo.position.x, y: seporaterTwo.position.y + scrollViewSc3.position.y)
        martinLuther.position = CGPoint(x: martinLuther.position.x, y: martinLuther.position.y + scrollViewSc3.position.y)
        williamShakespeare.position = CGPoint(x: williamShakespeare.position.x, y: williamShakespeare.position.y + scrollViewSc3.position.y)
        phillisWheatley.position = CGPoint(x: phillisWheatley.position.x, y: phillisWheatley.position.y + scrollViewSc3.position.y)
        seporaterThree.position = CGPoint(x: seporaterThree.position.x, y: seporaterThree.position.y + scrollViewSc3.position.y)
        note.position = CGPoint(x: note.position.x, y: note.position.y + scrollViewSc3.position.y)
        note2.position = CGPoint(x: note2.position.x, y: note2.position.y + scrollViewSc3.position.y)
        note3.position = CGPoint(x: note3.position.x, y: note3.position.y + scrollViewSc3.position.y)
        restorePurchases2.position = CGPoint(x: restorePurchases2.position.x, y: restorePurchases2.position.y + scrollViewSc3.position.y)
        PW.position = CGPoint(x: PW.position.x, y: PW.position.y + scrollViewSc3.position.y)
        WS.position = CGPoint(x: WS.position.x, y: WS.position.y + scrollViewSc3.position.y)
        ML.position = CGPoint(x: ML.position.x, y: ML.position.y + scrollViewSc3.position.y)
        
        scrollViewSc3.position = CGPoint(x: 0, y: 0)
        
        if ScrollArt.position.y < self.frame.height / 6 {
            let action = SKAction.moveBy(x: 0, y: self.frame.height / 6 - ScrollArt.position.y, duration: 0)
            bg.run(action)
            downOne.run(action)
            upOne.run(action)
            ScrollArt.run(action)
            backBtn.run(action)
            seporater.run(action)
            seporaterTwo.run(action)
            martinLuther.run(action)
            williamShakespeare.run(action)
            phillisWheatley.run(action)
            seporaterThree.run(action)
            note.run(action)
            note2.run(action)
            note3.run(action)
            restorePurchases2.run(action)
            PW.run(action)
            WS.run(action)
            ML.run(action)
        }
        else if ScrollArt.position.y > self.frame.height / 6 + self.frame.height / 2 {
            let action = SKAction.moveBy(x: 0, y: (self.frame.height / 6 + self.frame.height / 2) - ScrollArt.position.y, duration: 0)
            bg.run(action)
            downOne.run(action)
            upOne.run(action)
            ScrollArt.run(action)
            backBtn.run(action)
            seporater.run(action)
            seporaterTwo.run(action)
            martinLuther.run(action)
            williamShakespeare.run(action)
            phillisWheatley.run(action)
            seporaterThree.run(action)
            note.run(action)
            note2.run(action)
            note3.run(action)
            restorePurchases2.run(action)
            PW.run(action)
            WS.run(action)
            ML.run(action)
        }
        
        scrollViewSc3.addChild(bg)
        scrollViewSc3.addChild(downOne)
        scrollViewSc3.addChild(upOne)
        scrollViewSc3.addChild(ScrollArt)
        scrollViewSc3.addChild(backBtn)
        scrollViewSc3.addChild(seporater)
        scrollViewSc3.addChild(seporaterTwo)
        scrollViewSc3.addChild(martinLuther)
        scrollViewSc3.addChild(williamShakespeare)
        scrollViewSc3.addChild(phillisWheatley)
        scrollViewSc3.addChild(seporaterThree)
        scrollViewSc3.addChild(note)
        scrollViewSc3.addChild(note2)
        scrollViewSc3.addChild(note3)
        scrollViewSc3.addChild(restorePurchases2)
        scrollViewSc3.addChild(PW)
        scrollViewSc3.addChild(WS)
        scrollViewSc3.addChild(ML)
    }
    func loadSceneFive() {
        self.addChild(popUp)
        self.addChild(deny)
        self.addChild(confirm)
        self.addChild(restore)
        
        let defaults = UserDefaults.standard
        let freeDeal = defaults.integer(forKey: "freeDeal")
        let fontBought = defaults.bool(forKey: "fontBought")
        if fontBought == true {
            a.fontsCreated += 1
            if whichOne == 1 {
                SegueVariables.drawYoLetters = true
            }
            else if whichOne == 2 {
                SegueVariables.actual = true
            }
        }
        else if fontBought == false {
            print("You must buy the font first!")
        
            if a.fontsCreated == 0 && freeDeal == 0 {
                fontMessage.text = "MyType loves new visitors. \n Create your first font for free! \n Future fonts will cost 99 cents. \n Enjoy!"
                self.view?.addSubview(fontMessage)
            }
            else if a.fontsCreated == 0 && freeDeal == 1 {
                fontMessage.text = " A new font costs 99 cents "
                self.view?.addSubview(fontMessage)
            }
            else if a.fontsCreated == 0 && freeDeal == 2 {
                fontMessage.text = " A new font costs 99 cents "
                self.view?.addSubview(fontMessage)
            }
            else if a.fontsCreated == 1 && freeDeal == 1 {
                fontMessage.text = " A new font costs 99 cents "
                self.view?.addSubview(fontMessage)
            }
            else if a.fontsCreated == 1 && freeDeal == 2 {
                fontMessage.text = " A new font costs 99 cents "
                self.view?.addSubview(fontMessage)
            }
            else if a.fontsCreated == 2 {
                fontMessage.text = " A new font costs 99 cents "
                self.view?.addSubview(fontMessage)
            }
            else if a.fontsCreated == 3 {
                fontMessage.text = " A new font costs 99 cents "
                self.view?.addSubview(fontMessage)
            }
            else if a.fontsCreated == 4 {
                fontMessage.text = " A new font costs 99 cents "
                self.view?.addSubview(fontMessage)
            }
            else if a.fontsCreated == 5 {
                fontMessage.text = " A new font costs 99 cents "
                self.view?.addSubview(fontMessage)
            }
            else if a.fontsCreated == 6 {
                self.fontMessage.text = " You've already created 6 fonts. \n To create another you must delete \n a previously created font. "
                self.view?.addSubview(fontMessage)
                self.confirm.removeFromParent()
                
                let defaults2 = UserDefaults(suiteName: "group.io.golf.fonts")
                
                let a11 = defaults2?.object(forKey: "01")
                let a22 = defaults2?.object(forKey: "02")
                let a33 = defaults2?.object(forKey: "03")
                let a44 = defaults2?.object(forKey: "04")
                let a55 = defaults2?.object(forKey: "05")
                let a66 = defaults2?.object(forKey: "06")
                if a11 == nil || a22 == nil || a33 == nil || a44 == nil || a55 == nil || a66 == nil {
                    self.fontMessage.text = " A new font costs 99 cents "
                    self.fontMessage.removeFromSuperview()
                    self.view?.addSubview(fontMessage)
                    confirm.removeFromParent()
                    self.addChild(confirm)
                    a.fontsCreated = 7
                }
            }
            
            if IAPEnabled == false && freeDeal != 0 {
                fontMessage.text = " To create fonts, you must enable \n In App Purchases. "
                self.view?.addSubview(fontMessage)
                self.confirm.removeFromParent()
            }
            else if IAPEnabled == false && freeDeal == 0 {
                fontMessage.text = "MyType loves new visitors. \n Create your first font for free! \n Future fonts will cost 99 cents. /n Enjoy!"
                self.view?.addSubview(fontMessage)
            }
        }
    }
    func loadSceneSix() {
        self.removeAllChildren()
        scrollViewSc3.removeAllChildren()
        sc3 = false
        sc6 = true
        
        backBtn.position = CGPoint(x: -(self.frame.width / 2) + (self.backBtn.size.width / 2), y: (self.frame.height / 2) - (self.backBtn.size.height))
        self.addChild(backBtn)
        
        self.addChild(bg)
        self.addChild(purchaseFont)
        if PWBool == true {
            textBox2.text = "Phillis Wheatley lived from 1753 till 1784 and was the first published African American female (or male) poet. She was sold into slavery at the age of eight and purchased by the Wheatley family of Boston. She was taught to read and write and showed great potential in poetry. Wheatley wrote nearly 40 poems during her lifetime, and published a book, POEMS ON VARIOUS SUBJECTS which contained four of her poems. Phillis Wheatley was emancipated from slavery shortly after the publication of her book."
            self.view?.addSubview(textBox2)
            
            textBox.text = ""
            textBox.attributedText = getFont(font: "Phillis")
            self.view?.addSubview(textBox)
        }
        else if MLBool == true {
            textBox2.text = "Martin Luther King Jr. lived from 1929 to 1968 and was one of the worlds most eloquent and inspirational speakers. He wrote the everlasting I HAVE A DREAM speech and was the most visible leader of the civil rights movement. Through peaceful protests and and non-violent activism, Dr. King was awarded the Nobel Peace Prize in 1964 for combating racial inequality through nonviolent resistance."
            self.view?.addSubview(textBox2)
            
            textBox.text = ""
            textBox.attributedText = getFont(font: "Martin")
            self.view?.addSubview(textBox)
        }
        else if WSBool == true {
            textBox2.text = "William Shakespeare was an English poet who lived from 1564 to 1616. Shakespeare wrote and created 39 plays in his lifetime and over 150 sonnets. Among his most popular works is ROMEO AND JULEIT, HAMLET, and A MID SUMMERS NIGHT DREAM. Shakespeare, to this day, is often regarded as the greatest writer in the English language and England’s National Poet."
            self.view?.addSubview(textBox2)
            
            textBox.text = ""
            textBox.attributedText = getFont(font: "Shake")
            self.view?.addSubview(textBox)
        }
    }
    func getFont(font: String) -> NSMutableAttributedString {
        
        let textAttachment1 = NSTextAttachment()
        textAttachment1.image = UIImage(named: "\(font)A")
        let attributeA = NSAttributedString(attachment: textAttachment1)
        
        let textAttachment2 = NSTextAttachment()
        textAttachment2.image = UIImage(named: "\(font)B")
        let attributeB = NSAttributedString(attachment: textAttachment2)
        
        let textAttachment3 = NSTextAttachment()
        textAttachment3.image = UIImage(named: "\(font)C")
        let attributeC = NSAttributedString(attachment: textAttachment3)
        
        let textAttachment4 = NSTextAttachment()
        textAttachment4.image = UIImage(named: "\(font)D")
        let attributeD = NSAttributedString(attachment: textAttachment4)
        
        let textAttachment5 = NSTextAttachment()
        textAttachment5.image = UIImage(named: "\(font)E")
        let attributeE = NSAttributedString(attachment: textAttachment5)
        
        let textAttachment6 = NSTextAttachment()
        textAttachment6.image = UIImage(named: "\(font)F")
        let attributeF = NSAttributedString(attachment: textAttachment6)
        
        let textAttachment7 = NSTextAttachment()
        textAttachment7.image = UIImage(named: "\(font)G")
        let attributeG = NSAttributedString(attachment: textAttachment7)
        
        let textAttachment8 = NSTextAttachment()
        textAttachment8.image = UIImage(named: "\(font)H")
        let attributeH = NSAttributedString(attachment: textAttachment8)
        
        let textAttachment9 = NSTextAttachment()
        textAttachment9.image = UIImage(named: "\(font)I")
        let attributeI = NSAttributedString(attachment: textAttachment9)
        
        let textAttachment10 = NSTextAttachment()
        textAttachment10.image = UIImage(named: "\(font)J")
        let attributeJ = NSAttributedString(attachment: textAttachment10)
        
        let textAttachment11 = NSTextAttachment()
        textAttachment11.image = UIImage(named: "\(font)K")
        let attributeK = NSAttributedString(attachment: textAttachment11)
        
        let textAttachment12 = NSTextAttachment()
        textAttachment12.image = UIImage(named: "\(font)L")
        let attributeL = NSAttributedString(attachment: textAttachment12)
        
        let textAttachment13 = NSTextAttachment()
        textAttachment13.image = UIImage(named: "\(font)M")
        let attributeM = NSAttributedString(attachment: textAttachment13)
        
        let textAttachment14 = NSTextAttachment()
        textAttachment14.image = UIImage(named: "\(font)N")
        let attributeN = NSAttributedString(attachment: textAttachment14)
        
        let textAttachment15 = NSTextAttachment()
        textAttachment15.image = UIImage(named: "\(font)O")
        let attributeO = NSAttributedString(attachment: textAttachment15)
        
        let textAttachment16 = NSTextAttachment()
        textAttachment16.image = UIImage(named: "\(font)P")
        let attributeP = NSAttributedString(attachment: textAttachment16)
        
        let textAttachment17 = NSTextAttachment()
        textAttachment17.image = UIImage(named: "\(font)Q")
        let attributeQ = NSAttributedString(attachment: textAttachment17)
        
        let textAttachment18 = NSTextAttachment()
        textAttachment18.image = UIImage(named: "\(font)R")
        let attributeR = NSAttributedString(attachment: textAttachment18)
        
        let textAttachment19 = NSTextAttachment()
        textAttachment19.image = UIImage(named: "\(font)S")
        let attributeS = NSAttributedString(attachment: textAttachment19)
        
        let textAttachment20 = NSTextAttachment()
        textAttachment20.image = UIImage(named: "\(font)T")
        let attributeT = NSAttributedString(attachment: textAttachment20)
        
        let textAttachment21 = NSTextAttachment()
        textAttachment21.image = UIImage(named: "\(font)U")
        let attributeU = NSAttributedString(attachment: textAttachment21)
        
        let textAttachment22 = NSTextAttachment()
        textAttachment22.image = UIImage(named: "\(font)V")
        let attributeV = NSAttributedString(attachment: textAttachment22)
        
        let textAttachment23 = NSTextAttachment()
        textAttachment23.image = UIImage(named: "\(font)W")
        let attributeW = NSAttributedString(attachment: textAttachment23)
        
        let textAttachment24 = NSTextAttachment()
        textAttachment24.image = UIImage(named: "\(font)X")
        let attributeX = NSAttributedString(attachment: textAttachment24)
        
        let textAttachment25 = NSTextAttachment()
        textAttachment25.image = UIImage(named: "\(font)Y")
        let attributeY = NSAttributedString(attachment: textAttachment25)
        
        let textAttachment26 = NSTextAttachment()
        textAttachment26.image = UIImage(named: "\(font)Z")
        let attributeZ = NSAttributedString(attachment: textAttachment26)
        
        let textAttachment27 = NSTextAttachment()
        textAttachment27.image = UIImage(named: "\(font)za")
        let attributea = NSAttributedString(attachment: textAttachment27)
        
        let textAttachment28 = NSTextAttachment()
        textAttachment28.image = UIImage(named: "\(font)zb")
        let attributeb = NSAttributedString(attachment: textAttachment28)
        
        let textAttachment29 = NSTextAttachment()
        textAttachment29.image = UIImage(named: "\(font)zc")
        let attributec = NSAttributedString(attachment: textAttachment29)
        
        let textAttachment30 = NSTextAttachment()
        textAttachment30.image = UIImage(named: "\(font)zd")
        let attributed = NSAttributedString(attachment: textAttachment30)
        
        let textAttachment31 = NSTextAttachment()
        textAttachment31.image = UIImage(named: "\(font)ze")
        let attributee = NSAttributedString(attachment: textAttachment31)
        
        let textAttachment32 = NSTextAttachment()
        textAttachment32.image = UIImage(named: "\(font)zf")
        let attributef = NSAttributedString(attachment: textAttachment32)
        
        let textAttachment33 = NSTextAttachment()
        textAttachment33.image = UIImage(named: "\(font)zg")
        let attributeg = NSAttributedString(attachment: textAttachment33)
        
        let textAttachment34 = NSTextAttachment()
        textAttachment34.image = UIImage(named: "\(font)zh")
        let attributeh = NSAttributedString(attachment: textAttachment34)
        
        let textAttachment35 = NSTextAttachment()
        textAttachment35.image = UIImage(named: "\(font)zi")
        let attributei = NSAttributedString(attachment: textAttachment35)
        
        let textAttachment36 = NSTextAttachment()
        textAttachment36.image = UIImage(named: "\(font)zj")
        let attributej = NSAttributedString(attachment: textAttachment36)
        
        let textAttachment37 = NSTextAttachment()
        textAttachment37.image = UIImage(named: "\(font)zk")
        let attributek = NSAttributedString(attachment: textAttachment37)
        
        let textAttachment38 = NSTextAttachment()
        textAttachment38.image = UIImage(named: "\(font)zl")
        let attributel = NSAttributedString(attachment: textAttachment38)
        
        let textAttachment39 = NSTextAttachment()
        textAttachment39.image = UIImage(named: "\(font)zm")
        let attributem = NSAttributedString(attachment: textAttachment39)
        
        let textAttachment40 = NSTextAttachment()
        textAttachment40.image = UIImage(named: "\(font)zn")
        let attributen = NSAttributedString(attachment: textAttachment40)
        
        let textAttachment41 = NSTextAttachment()
        textAttachment41.image = UIImage(named: "\(font)zo")
        let attributeo = NSAttributedString(attachment: textAttachment41)
        
        let textAttachment42 = NSTextAttachment()
        textAttachment42.image = UIImage(named: "\(font)zp")
        let attributep = NSAttributedString(attachment: textAttachment42)
        
        let textAttachment43 = NSTextAttachment()
        textAttachment43.image = UIImage(named: "\(font)zq")
        let attributeq = NSAttributedString(attachment: textAttachment43)
        
        let textAttachment44 = NSTextAttachment()
        textAttachment44.image = UIImage(named: "\(font)zr")
        let attributer = NSAttributedString(attachment: textAttachment44)
        
        let textAttachment45 = NSTextAttachment()
        textAttachment45.image = UIImage(named: "\(font)zs")
        let attributes = NSAttributedString(attachment: textAttachment45)
        
        let textAttachment46 = NSTextAttachment()
        textAttachment46.image = UIImage(named: "\(font)zt")
        let attributet = NSAttributedString(attachment: textAttachment46)
        
        let textAttachment47 = NSTextAttachment()
        textAttachment47.image = UIImage(named: "\(font)zu")
        let attributeu = NSAttributedString(attachment: textAttachment47)
        
        let textAttachment48 = NSTextAttachment()
        textAttachment48.image = UIImage(named: "\(font)zv")
        let attributev = NSAttributedString(attachment: textAttachment48)
        
        let textAttachment49 = NSTextAttachment()
        textAttachment49.image = UIImage(named: "\(font)zw")
        let attributew = NSAttributedString(attachment: textAttachment49)
        
        let textAttachment50 = NSTextAttachment()
        textAttachment50.image = UIImage(named: "\(font)zx")
        let attributex = NSAttributedString(attachment: textAttachment50)
        
        let textAttachment51 = NSTextAttachment()
        textAttachment51.image = UIImage(named: "\(font)zy")
        let attributey = NSAttributedString(attachment: textAttachment51)
        
        let textAttachment52 = NSTextAttachment()
        textAttachment52.image = UIImage(named: "\(font)zz")
        let attributez = NSAttributedString(attachment: textAttachment52)
        
        let textAttachment53 = NSTextAttachment()
        textAttachment53.image = UIImage(named: "\(font)0")
        let attribute0 = NSAttributedString(attachment: textAttachment53)
        
        let textAttachment54 = NSTextAttachment()
        textAttachment54.image = UIImage(named: "\(font)1")
        let attribute1 = NSAttributedString(attachment: textAttachment54)
        
        let textAttachment55 = NSTextAttachment()
        textAttachment55.image = UIImage(named: "\(font)2")
        let attribute2 = NSAttributedString(attachment: textAttachment55)
        
        let textAttachment56 = NSTextAttachment()
        textAttachment56.image = UIImage(named: "\(font)3")
        let attribute3 = NSAttributedString(attachment: textAttachment56)
        
        let textAttachment57 = NSTextAttachment()
        textAttachment57.image = UIImage(named: "\(font)4")
        let attribute4 = NSAttributedString(attachment: textAttachment57)
        
        let textAttachment58 = NSTextAttachment()
        textAttachment58.image = UIImage(named: "\(font)5")
        let attribute5 = NSAttributedString(attachment: textAttachment58)
        
        let textAttachment59 = NSTextAttachment()
        textAttachment59.image = UIImage(named: "\(font)6")
        let attribute6 = NSAttributedString(attachment: textAttachment59)
        
        let textAttachment60 = NSTextAttachment()
        textAttachment60.image = UIImage(named: "\(font)7")
        let attribute7 = NSAttributedString(attachment: textAttachment60)
        
        let textAttachment61 = NSTextAttachment()
        textAttachment61.image = UIImage(named: "\(font)8")
        let attribute8 = NSAttributedString(attachment: textAttachment61)
        
        let textAttachment62 = NSTextAttachment()
        textAttachment62.image = UIImage(named: "\(font)9")
        let attribute9 = NSAttributedString(attachment: textAttachment62)
        
        let textAttachment63 = NSTextAttachment()
        textAttachment63.image = UIImage(named: "\(font).")
        let attributePeriod = NSAttributedString(attachment: textAttachment63)
        
        let textAttachment64 = NSTextAttachment()
        textAttachment64.image = UIImage(named: "\(font)?")
        let attributeQuestionMark = NSAttributedString(attachment: textAttachment64)
        
        let textAttachment65 = NSTextAttachment()
        textAttachment65.image = UIImage(named: "\(font)'")
        let attributeApostrophe = NSAttributedString(attachment: textAttachment65)
        
        let textAttachment66 = NSTextAttachment()
        textAttachment66.image = UIImage(named: "\(font)!")
        let attributeExclamationMark = NSAttributedString(attachment: textAttachment66)
        
        let textAttachment67 = NSTextAttachment()
        textAttachment67.image = UIImage(named: "\(font),")
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
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        let myProduct = response.products
        
        print(response.products.count)
        
        print(myProduct[0].productIdentifier)
        print(myProduct[1].productIdentifier)
        print(myProduct[2].productIdentifier)
        print(myProduct[3].productIdentifier)
        print(myProduct[4].productIdentifier)
        print(myProduct[5].productIdentifier)
        print(myProduct[6].productIdentifier)
        print(myProduct[7].productIdentifier)
        print(myProduct[8].productIdentifier)
        
        list.append(myProduct[0] as SKProduct)
        list.append(myProduct[1] as SKProduct)
        list.append(myProduct[2] as SKProduct)
        list.append(myProduct[3] as SKProduct)
        list.append(myProduct[4] as SKProduct)
        list.append(myProduct[5] as SKProduct)
        list.append(myProduct[6] as SKProduct)
        list.append(myProduct[7] as SKProduct)
        list.append(myProduct[8] as SKProduct)
        print("product added")
    }
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        print("add paymnet")
        for transaction:AnyObject in transactions {
            let trans = transaction as! SKPaymentTransaction
            print(trans.error as Any)
            
            switch trans.transactionState {
            case .purchased:
                print("buy, ok unlock iap here")
                print(p.productIdentifier)
                
                let prodID = p.productIdentifier as String
                switch prodID {
                case "CandyRain.MyType.BuyFont1":
                    giveCustomFont()
                case "CandyRain.MyType.BuyFont2":
                    giveCustomFont()
                case "CandyRain.MyType.BuyFont3":
                    giveCustomFont()
                case "CandyRain.MyType.BuyFont4":
                    giveCustomFont()
                case "CandyRain.MyType.BuyFont5":
                    giveCustomFont()
                case "CandyRain.MyType.BuyFont6":
                    giveCustomFont()
                case "CandyRain.MyType.Phillis":
                    giveFamousFont(font: "PhillisWheatley")
                case "CandyRain.MyType.Martin":
                    giveFamousFont(font: "MartinLuther")
                case "CandyRain.MyType.Shakes":
                    giveFamousFont(font: "Shakespeare")
                default:
                    print("IAP not setup")
                }
                fontProcessing = false
                queue.finishTransaction(trans)
                break;
            case .failed:
                print("buy error")
                queue.finishTransaction(trans)
                fontProcessing = false
                break;
            default:
                print("default")
                break;
                
            }
        }
    }
    func buyCustomFont(num: Int) {
        print("buying func called")
        for product in list {
            let prodID = product.productIdentifier
            if(prodID == "CandyRain.MyType.BuyFont\(num)") {
                p = product
                print("\(p)")
                buyProduct()
                break;
            }
        }
    }
    func buyFamousFont(font: String) {
        for product in list {
            let prodID = product.productIdentifier
            if(prodID == "CandyRain.MyType.\(font)") {
                p = product
                buyProduct()
                break;
            }
        }
    }
    func giveCustomFont(){
        a.fontsCreated += 1
        print("\(a.fontsCreated) fonts created.")
        
        let defaults = UserDefaults.standard
        let freeDeal = defaults.integer(forKey: "freeDeal")
        defaults.set(true, forKey: "fontBought")
        
        print("You can almost create a new font")
        
        if freeDeal == 1 {
            defaults.set(2, forKey: "freeDeal")
        }
        self.loadSceneTwo()
        
        if whichOne == 1 {
            SegueVariables.drawYoLetters = true
        }
        else if whichOne == 2 {
            SegueVariables.actual = true
        }
        touchUp(atPoint: CGPoint(x: 0, y: 0))
        whichOne = 0
    }
    func giveFamousFont(font: String){
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: font)
        
        textBox2.removeFromSuperview()
        whiteArea.size = CGSize(width: self.frame.width, height: self.frame.height)
        whiteArea.color = UIColor.white
        whiteArea.position = CGPoint(x: 0, y: 0)
        self.addChild(whiteArea)
        fontMessageBool = true
        famousFontMessage.size = CGSize(width: self.frame.width - 20, height: self.frame.height)
        famousFontMessage.position = CGPoint(x: 0, y: 0)
        self.addChild(famousFontMessage)
    }
    func buyProduct() {
        print("buy " + p.productIdentifier)
        let pay = SKPayment(product: p)
        SKPaymentQueue.default().add(self as SKPaymentTransactionObserver)
        SKPaymentQueue.default().add(pay as SKPayment)
    }
    func finishTransaction(trans:SKPaymentTransaction){
        print("finish trans")
    }

    private func paymentQueue(queue: SKPaymentQueue!, removedTransactions transactions: [AnyObject]!){
        print("remove trans")
    }
    func touchDown(atPoint pos : CGPoint) {
        point = pos
        distanceScrolled = Int(pos.y)
    }
    func touchesMoved(toPoint pos: CGPoint){
        if scrollViewSc3.contains(pos) && sc3 == true{
            let move = SKAction.moveBy(x: 0, y: CGFloat(Int(pos.y) - Int(point.y)), duration: 0)
            scrollViewSc3.run(move)
            point = pos
        }
    }
    func touchUp(atPoint pos : CGPoint) {
        if sc3 == true {
            var a = distanceScrolled
            var b = Int(pos.y)
            if distanceScrolled < 0 {
                a = distanceScrolled * -1
                distanceScrolled = a
            }
            if Int(pos.y) < 0 {
                b = Int(pos.y) * -1
            }
            if a - b <= 10 &&  a - b >= -10 {
                scrollGesture = false
            }
            addChildren()
        }
        if thing1.contains(pos) && sc1 == true{
            loadSceneTwo()
            sc1 = false
            sc2 = true
        }
        else if backBtn.contains(pos){
            if sc2 == true {
                sc2 = false
                sc1 = true
                loadSceneOne()
            }
            else if sc3 == true {
                sc3 = false
                sc1 = true
                loadSceneOne()
            }
            else if sc6 == true {
                loadSceneThree()
                sc6 = false
                sc3 = true
                PWBool = false
                MLBool = false
                WSBool = false
                textBox.removeFromSuperview()
                textBox2.removeFromSuperview()
            }
        }
        else if writeAlphabet.contains(pos) && sc2 == true{
            //SegueVariables.drawYoLetters = true
            whichOne = 1
            loadSceneFive()
            sc5 = true
            sc2 = false
        }
        else if lookAtFonts.contains(pos) && sc1 == true {
            loadSceneThree()
            sc1 = false
            sc3 = true
        }
        else if act.contains(pos) && sc2 == true {
            //SegueVariables.actual = true
            whichOne = 2
            loadSceneFive()
            sc5 = true
            sc2 = false
        }
        else if newMessage.contains(pos) && sc1 == true{
            SegueVariables.newMessage = true
        }
        else if tutBtn.contains(pos) && sc1 == true{
            SegueVariables.editFonts = true
        }
        else if confirm.contains(pos) && sc5 == true && a.fontsCreated != 6 && IAPEnabled == true && fontProcessing == false{
            fontProcessing = true
            let defaults = UserDefaults.standard
            let freeDeal = defaults.integer(forKey: "freeDeal")
            
            if freeDeal == 0 {
                a.fontsCreated += 1
                defaults.set(1, forKey: "freeDeal")
                defaults.set(true, forKey: "fontBought")
                if whichOne == 1 {
                    SegueVariables.drawYoLetters = true
                }
                else if whichOne == 2 {
                    SegueVariables.actual = true
                }
                whichOne = 0
            }
            else {
                let defaults = UserDefaults(suiteName: "group.io.golf.fonts")
                let a1 = defaults?.object(forKey: "01")
                let a2 = defaults?.object(forKey: "02")
                let a3 = defaults?.object(forKey: "03")
                let a4 = defaults?.object(forKey: "04")
                let a5 = defaults?.object(forKey: "05")
                let a6 = defaults?.object(forKey: "06")
                if a1 == nil{
                    buyCustomFont(num: 1)
                }
                else if a2 == nil {
                    buyCustomFont(num: 2)
                }
                else if a3 == nil {
                    buyCustomFont(num: 3)
                }
                else if a4 == nil {
                    buyCustomFont(num: 4)
                }
                else if a5 == nil {
                    buyCustomFont(num: 5)
                }
                else if a6 == nil {
                    buyCustomFont(num: 6)
                }
            } 
        }
        else if deny.contains(pos) && sc5 == true {
            sc5 = false
            sc2 = true
            popUp.removeFromParent()
            deny.removeFromParent()
            confirm.removeFromParent()
            restore.removeFromParent()
            fontMessage2.removeFromParent()
            fontMessage1.removeFromParent()
            fontMessage3.removeFromParent()
            fontMessage4.removeFromParent()
            fontMessage.removeFromSuperview()
            whichOne = 0
        }
        else if restore.contains(pos) && sc5 == true {
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().restoreCompletedTransactions()
        }
        else if phillisWheatley.contains(pos) && sc3 == true && scrollGesture == false {
            scrollGesture = true
            PWBool = true
            loadSceneSix()
        }
        else if martinLuther.contains(pos) && sc3 == true && scrollGesture == false {
            scrollGesture = true
            MLBool = true
            loadSceneSix()
        }
        else if williamShakespeare.contains(pos) && sc3 == true && scrollGesture == false {
            scrollGesture = true
            WSBool = true
            loadSceneSix()
        }
        else if restorePurchases2.contains(pos) && sc3 == true{
            SKPaymentQueue.default().add(self)
            SKPaymentQueue.default().restoreCompletedTransactions()
        }
        else if purchaseFont.contains(pos) && sc6 == true {
            if PWBool == true {
                buyFamousFont(font: "Phillis")
            }
            else if MLBool == true {
                buyFamousFont(font: "Martin")
            }
            else if WSBool == true {
                buyFamousFont(font: "Shakes")
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
        if fontMessageBool == true {
            whiteArea.removeFromParent()
            self.view?.addSubview(textBox2)
            famousFontMessage.removeFromParent()
            fontMessageBool = false
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchesMoved(toPoint: t.location(in: self)) }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
}
struct a {
    static var fontsCreated : Int = 0
}
