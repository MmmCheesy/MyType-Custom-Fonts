//
//  DrawScene.swift
//  MyType
//
//  Created by Alexander Eckert on 3/20/18.
//  Copyright © 2018 Alexander Eckert. All rights reserved.
//

import UIKit
import SpriteKit

class DrawScene: SKScene {
    
    var line = SKSpriteNode()
    var clearLetter = SKSpriteNode(imageNamed: "Clear")
    var save = SKSpriteNode(imageNamed: "Save")
    var back = SKSpriteNode(imageNamed: "AllDone")
    var backALetter = SKLabelNode(fontNamed: "American Typewriter")
    var tut = SKLabelNode(fontNamed: "American Typewriter")
    var lineStart = CGPoint()
    var lineEnd = CGPoint()
    
    var fontBeingDrawn : Int = 0
    
    var guideOutline = SKShapeNode()
    var guideLetter = SKLabelNode(fontNamed: "Times New Roman")
    
    var letterToBeDrawn : Int = 0
    var examples: Array = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",".",",","!","?","'","1","2","3","4","5","6","7","8","9","0"]
    
    var tipsScreen = SKSpriteNode()
    var gotIt = SKLabelNode(fontNamed: "American Typewriter")
    var theTips = UITextView()
    var tutNo : Int = 0
    var guideExample = SKSpriteNode(imageNamed: "GuideExample")
    
    var saveMenu = SKSpriteNode()
    var yeees = SKLabelNode(fontNamed: "American Typewriter")
    var noooo = SKLabelNode(fontNamed: "American Typewriter")
    var texts = UITextView()
    
    var tutTaken: Bool = false
    var guidePosition = CGPoint()
    var crashed: Bool = true
    var editing: Bool = false
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor.white
        self.addChild(line)
        
        let defaults3 = UserDefaults(suiteName: "group.io.golf.fonts")
        let a11 = defaults3?.object(forKey: "01")
        let a22 = defaults3?.object(forKey: "02")
        let a33 = defaults3?.object(forKey: "03")
        let a44 = defaults3?.object(forKey: "04")
        let a55 = defaults3?.object(forKey: "05")
        let a66 = defaults3?.object(forKey: "06")
        if a11 == nil && a.fontsCreated > 1 {
            fontBeingDrawn = a.fontsCreated
            a.fontsCreated = 1
        }
        if a22 == nil && a.fontsCreated > 2 {
            fontBeingDrawn = a.fontsCreated
            a.fontsCreated = 2
        }
        if a33 == nil && a.fontsCreated > 3 {
            fontBeingDrawn = a.fontsCreated
            a.fontsCreated = 3
        }
        if a44 == nil && a.fontsCreated > 4 {
            fontBeingDrawn = a.fontsCreated
            a.fontsCreated = 4
        }
        if a55 == nil && a.fontsCreated > 5 {
            fontBeingDrawn = a.fontsCreated
            a.fontsCreated = 5
        }
        if a66 == nil && a.fontsCreated > 6 {
            fontBeingDrawn = a.fontsCreated
            a.fontsCreated = 6
        }
        
        clearLetter.size = CGSize(width: self.frame.width / 3, height: self.frame.width  / 6)
        clearLetter.position = CGPoint(x: 0, y: -(self.frame.height / 2) + clearLetter.size.height)
        self.addChild(clearLetter)
        
        save.size = CGSize(width: self.frame.width / 3, height: self.frame.width  / 6)
        save.position = CGPoint(x: (self.frame.width / 2) - (save.size.width / 2), y: (self.frame.height / 2) - (save.size.height))
        self.addChild(save)
        
        back.size = CGSize(width: self.frame.width / 4, height: self.frame.height / 15)
        back.position = CGPoint(x:-(self.frame.width / 2) + (self.back.size.width / 2), y: (self.frame.height / 2) - (self.back.size.height))
        self.addChild(back)
        
        let float: CGFloat = self.frame.size.height / 1.6
        guideLetter.text = "\(examples[letterToBeDrawn])"
        if fontVariables.editLetter != "" {
            guideLetter.text = fontVariables.editLetter
        }
        guideLetter.fontColor = UIColor.black
        guideLetter.fontSize = float
        guideLetter.position = CGPoint(x: 0, y: -(self.guideLetter.fontSize / 3))
        guideLetter.alpha = 0.3
        self.addChild(guideLetter)
        guidePosition = guideLetter.position
        
        let rect = CGRect(x: 0, y: 0, width: self.frame.height / 2, height: self.frame.height / 1.8)
        guideOutline = SKShapeNode(rect: rect)
        guideOutline.lineWidth = 15
        guideOutline.position = CGPoint(x: -(self.frame.height / 4), y: -self.frame.height / 3)
        guideOutline.strokeColor = UIColor(hue: 1, saturation: 1, brightness: 0.5, alpha: 0.3)
        guideOutline.fillColor = UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 0)
        if (self.frame.height / 4) > (self.frame.width  / 2) {
            let rect = CGRect(x: 0, y: 0, width: self.frame.width - 40, height: self.frame.height / 1.8)
            guideOutline = SKShapeNode(rect: rect)
            guideOutline.lineWidth = 15
            guideOutline.strokeColor = UIColor(hue: 1, saturation: 1, brightness: 0.5, alpha: 0.3)
            guideOutline.fillColor = UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 0)
            guideOutline.position = CGPoint(x: -(self.frame.width / 2) + 20, y: -self.frame.height / 3)
        }
        self.addChild(guideOutline)
        
        backALetter.text = "Back"
        backALetter.fontColor = UIColor.red
        backALetter.fontSize = 25
        backALetter.position = CGPoint(x: self.frame.width / -3, y: self.frame.height / 3)
        self.addChild(backALetter)
        
        tipsScreen.size = CGSize(width: self.frame.width, height: self.frame.height)
        tipsScreen.position = CGPoint(x: 0, y: 0)
        tipsScreen.color = UIColor.white
        
        gotIt.text = "Got It"
        gotIt.fontColor = UIColor.green
        gotIt.fontSize = 60
        gotIt.position = CGPoint(x: self.frame.width / 4, y: self.frame.height / -3)
        
        tut.text = "Tutorial"
        tut.fontColor = UIColor.blue
        tut.fontSize = 25
        tut.position = CGPoint(x: 0, y: self.frame.height / 2.5)
        self.addChild(tut)
        
        theTips = UITextView(frame: CGRect(x: 0, y: self.frame.height / 4.5, width: self.frame.width, height: self.frame.height / 2))
        theTips.text = " -In this area, you will create your font by drawing each of your letters on the screen \n -When drawing, keep your letters inside the gray box \n -Any drawing outside the box won't be saved "
        theTips.font = UIFont(name: "American Typewriter", size: 30)
        theTips.textAlignment = .center
        theTips.isEditable = false
        theTips.isSelectable = false
        theTips.textColor = UIColor.blue
        theTips.backgroundColor = UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 0)
        self.view?.addSubview(theTips)
        
        let defaults = UserDefaults.standard
        tutTaken = defaults.bool(forKey: "drawTut")
        tipsScreen.removeFromParent()
        theTips.removeFromSuperview()
        gotIt.removeFromParent()
        if tutTaken == false && SegueVariables.drawYoLetters == true {
            self.addChild(tipsScreen)
            self.view?.addSubview(theTips)
            self.addChild(gotIt)
            self.back.removeFromParent()
            self.addChild(back)
        }
        SegueVariables.drawYoLetters = false
        
        saveMenu.size = CGSize(width: self.frame.width, height: self.frame.height / 3)
        saveMenu.position = CGPoint(x: 0, y: 0)
        saveMenu.color = UIColor.gray
        
        yeees.text = "Yes"
        yeees.fontColor = UIColor.green
        yeees.fontSize = 30
        yeees.position = CGPoint(x: self.frame.width / 5, y: self.frame.height / -10)
        
        noooo.text = "No"
        noooo.fontColor = UIColor.red
        noooo.fontSize = 30
        noooo.position = CGPoint(x: self.frame.width / -5, y: self.frame.height / -10)
        
        texts = UITextView(frame: CGRect(x: 0, y: self.frame.height / 2.7, width: self.frame.width, height: self.frame.width / 3.5))
        texts.text = "It seems you've already designed some of the characters in your font. \n Would you like to continue where you left off?"
        texts.font = UIFont(name: "American Typewriter", size: 20)
        texts.textAlignment = .center
        texts.textColor = UIColor.blue
        texts.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0, alpha: 0)
        texts.isEditable = false
        texts.isSelectable = false
        
        crashCeck()
        moveLetter()
        
        if fontVariables.drawEdit == true {
            editing = true
            fontVariables.drawEdit = false
        }
    }
    func draw(fromPoint: CGPoint, toPoint: CGPoint){
        let liney = UIBezierPath()
        liney.move(to: fromPoint)
        liney.addLine(to: toPoint)
        
        let pathNode = SKShapeNode(path: liney.cgPath)
        pathNode.strokeColor = UIColor.black
        pathNode.lineWidth = 15
        pathNode.lineCap = CGLineCap.round
        self.line.addChild(pathNode)
    }
    func save(letter: UIImage){
        var key : String = examples[letterToBeDrawn] + "\(a.fontsCreated)"
        if examples[letterToBeDrawn] == "'"{
            key = "'" + "\(a.fontsCreated)"
        }
        if fontVariables.editLetter != "" {
            key = fontVariables.editLetter + "\(fontVariables.fontSelected)"
            fontVariables.editLetter = ""
        }
        let savedData = NSKeyedArchiver.archivedData(withRootObject: letter)
        let defaults = UserDefaults(suiteName: "group.io.golf.fonts")
        defaults?.set(savedData, forKey: key)
        if editing == true {
            defaults?.set(savedData, forKey: "m" + key)
        }
        defaults?.synchronize()
        
        if let savedLetter = defaults?.object(forKey: key) as? Data {
            let theLetter  = NSKeyedUnarchiver.unarchiveObject(with: savedLetter) as! UIImage
            print(theLetter)
            //self.addChild(theLetter)
            line.removeFromParent()
            line.removeAllChildren()
            self.addChild(line)
        }

    }
    func crashCeck() {
        let defaults = UserDefaults.standard
        let lettersDone = defaults.integer(forKey: "crash\(a.fontsCreated)")
        if lettersDone != 0 && fontVariables.drawEdit == false {
            self.addChild(saveMenu)
            self.addChild(yeees)
            self.addChild(noooo)
            self.view?.addSubview(texts)
            self.tipsScreen.removeFromParent()
            self.gotIt.removeFromParent()
            self.theTips.removeFromSuperview()
        }
        else {
            crashed = false
        }
    }
    func moveLetter(){
        var changeNeeded : Bool = false
        var x : Int = 5
        while x < 67 {
            if guideLetter.text == examples[x]{
                let rect = CGRect(x: 0, y: 0, width: (self.frame.height / 2) / 1.6, height: self.frame.height / 1.8)
                guideOutline.removeFromParent()
                guideOutline = SKShapeNode(rect: rect)
                guideOutline.lineWidth = 15
                guideOutline.position = CGPoint(x: ((self.frame.height / 2) / 1.6) / -2, y: -(self.frame.height / 3))
                guideOutline.strokeColor = UIColor(hue: 1, saturation: 1, brightness: 0.5, alpha: 0.3)
                guideOutline.fillColor = UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 0)
                self.addChild(guideOutline)
                changeNeeded = true
            }
            if x == 5 {
                x = 8
            }
            else if x == 9 {
                x = 26
            }
            else if x == 37 {
                x = 39
            }
            else if x == 47 {
                x = 49
            }
            else if x == 51 {
                x = 57
            }
            else {
                x += 1
            }
        }
        var y : Int = 52
        while y < 57 {
            if guideLetter.text == examples[y]{
                let rect = CGRect(x: 0, y: 0, width: (self.frame.height / 2) * 0.43, height: self.frame.height / 1.8)
                guideOutline.removeFromParent()
                guideOutline = SKShapeNode(rect: rect)
                guideOutline.lineWidth = 15
                guideOutline.position = CGPoint(x: ((self.frame.height / 2) * 0.43) / -2, y: -(self.frame.height / 3))
                guideOutline.strokeColor = UIColor(hue: 1, saturation: 1, brightness: 0.5, alpha: 0.3)
                guideOutline.fillColor = UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 0)
                self.addChild(guideOutline)
                changeNeeded = true
            }
            y += 1
        }
        if guideLetter.text == "A" {
            changeNeeded = true
        }
        if changeNeeded == false{
            let rect = CGRect(x: 0, y: 0, width: self.frame.height / 2, height: self.frame.height / 1.8)
            guideOutline.removeFromParent()
            guideOutline = SKShapeNode(rect: rect)
            guideOutline.lineWidth = 15
            guideOutline.position = CGPoint(x: -(self.frame.height / 4), y: -(self.frame.height / 3))
            guideOutline.strokeColor = UIColor(hue: 1, saturation: 1, brightness: 0.5, alpha: 0.3)
            guideOutline.fillColor = UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 0)
            self.addChild(guideOutline)
            if (self.frame.height / 4) > (self.frame.width  / 2) {
                let rect = CGRect(x: 0, y: 0, width: self.frame.width - 40, height: self.frame.height / 1.8)
                guideOutline = SKShapeNode(rect: rect)
                guideOutline.lineWidth = 15
                guideOutline.strokeColor = UIColor(hue: 1, saturation: 1, brightness: 0.5, alpha: 0.3)
                guideOutline.fillColor = UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 0)
                guideOutline.position = CGPoint(x: -(self.frame.width / 2) + 20, y: -self.frame.height / 3)
            }
        }
    }
    func retakeTut(){
        tutNo = 0
        self.addChild(tipsScreen)
        theTips.text = " -In this area, you will create your font by drawing each of your letters on the screen \n -When drawing, keep your letters inside the gray box \n -Any drawing outside the box won't be saved "
        self.view?.addSubview(theTips)
        self.addChild(gotIt)
        back.removeFromParent()
        self.addChild(back)
        tutTaken = false
    }
    func touchDown(atPoint pos : CGPoint) {
        lineStart = pos
    }
    func touchesMoved(toPoint pos: CGPoint) {
        lineEnd = pos
        draw(fromPoint: lineStart, toPoint: lineEnd)
        lineStart = lineEnd
    }
    func touchUp(atPoint pos : CGPoint) {
        if clearLetter.contains(pos){
            line.removeFromParent()
            line.childNode(withName: "thing")?.removeFromParent()
            line.removeAllChildren()
            self.addChild(self.line)
        }
        else if back.contains(pos){
            print("sure you want to leave?")
            if fontBeingDrawn != 0 {
                a.fontsCreated = fontBeingDrawn
            }
            SegueVariables.finishedDrawing = true
        }
        else if save.contains(pos) {
            guideLetter.removeFromParent()
            guideOutline.removeFromParent()
            guideLetter.removeFromParent()
            guideOutline.removeFromParent()
            var rect = CGRect()
            var changeNeeded : Bool = false
            var x : Int = 5
            while x < 67 {
                if guideLetter.text == examples[x]{
                    rect = CGRect(x: ((self.frame.height / 2) / 1.6) / -2, y: (view?.bounds.size.height)! / -4, width: (view?.bounds.size.width)!, height: (view?.bounds.size.height)!)
                    UIGraphicsBeginImageContextWithOptions(CGSize(width: (self.frame.height / 2) / 1.6, height: self.guideOutline.frame.size.height), false, 1)
                    changeNeeded = true
                }
                if x == 5 {
                    x = 8
                }
                else if x == 9 {
                    x = 26
                }
                else if x == 37 {
                    x = 39
                }
                else if x == 47 {
                    x = 49
                }
                else if x == 51 {
                    x = 57
                }
                else {
                    x += 1
                }
            }
            var y : Int = 52
            while y < 57 {
                if guideLetter.text == examples[y]{
                    rect = CGRect(x: ((self.frame.height / 2) * 0.43) / -2, y: (view?.bounds.size.height)! / -4, width: (view?.bounds.size.width)!, height: (view?.bounds.size.height)!)
                    UIGraphicsBeginImageContextWithOptions(CGSize(width: (self.frame.height / 2) * 0.43, height: self.guideOutline.frame.size.height), false, 1)
                    changeNeeded = true
                }
                y += 1
            }
            if changeNeeded == false{
                rect = CGRect(x: -((self.frame.width / 2) - ((self.frame.height / 2) / 2)), y: (view?.bounds.size.height)! / -4, width: (view?.bounds.size.width)!, height: (view?.bounds.size.height)!)
                UIGraphicsBeginImageContextWithOptions(CGSize(width: self.guideOutline.frame.size.width, height: self.guideOutline.frame.size.height), false, 1)
            }
            self.view?.drawHierarchy(in: rect, afterScreenUpdates: true)
            let image : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            let darker : UIImage = increaseContrast(image)
            processPixels(in: darker)
            UIGraphicsEndImageContext()
            if letterToBeDrawn != 66 && fontVariables.drawEdit == false {
                letterToBeDrawn += 1
                guideLetter.text = "\(examples[letterToBeDrawn])"
                let defaults = UserDefaults.standard
                defaults.set(letterToBeDrawn, forKey: "crash\(a.fontsCreated)")
            }
            else if letterToBeDrawn == 66 {
                print("congrats you're done")
                let defaults = UserDefaults(suiteName: "group.io.golf.fonts")
                let defaults2 = UserDefaults.standard
                if fontBeingDrawn != 0 {
                    a.fontsCreated = fontBeingDrawn
                }
                defaults?.set(a.fontsCreated, forKey: "fontsCreated")
                defaults2.set(false, forKey: "fontBought")
                SegueVariables.finDraw = true
            }
            if editing == true {  
                if fontBeingDrawn != 0 {
                    a.fontsCreated = fontBeingDrawn
                }
                SegueVariables.doneEdit = true
            }
            self.addChild(guideLetter)
            self.addChild(guideOutline)
            moveLetter()
        }
        else if backALetter.contains(pos) && letterToBeDrawn > 0{
            guideLetter.removeFromParent()
            letterToBeDrawn -= 1
            guideLetter.text = "\(examples[letterToBeDrawn])"
            self.addChild(guideLetter)
            moveLetter()
            line.removeFromParent()
            line.childNode(withName: "thing")?.removeFromParent()
            line.removeAllChildren()
            self.addChild(self.line)
        }
        else if gotIt.contains(pos) && tutTaken == false {
            if tutNo == 0 {
                theTips.text = "\n -Any letter can be redone later in the 'Edit Fonts' area \n -You can leave anytime and your progress will be saved \n -You cannot, however, use your font till you've created every character. "
                tutNo += 1
            }
            else if tutNo == 1 {
                theTips.text = " -Touch anywhere in the box to begin drawing \n -Press the clear button to erase your drawing "
                guideExample.size = CGSize(width: self.frame.width, height: self.frame.width * 0.6)
                guideExample.position = CGPoint(x: self.frame.width / -5, y: self.frame.height / -10)
                self.addChild(guideExample)
                tutNo += 1
            }
            else if tutNo == 2 {
                theTips.text = " -You will design your font in this order: \n 1. Capital Letters \n 2. Lowercase Letters \n 3. Punctuation Marks \n 4. Numbers "
                guideExample.removeFromParent()
                tutNo += 1
            }
            else if tutNo == 3 {
                tipsScreen.removeFromParent()
                theTips.removeFromSuperview()
                gotIt.removeFromParent()
                let defaults = UserDefaults.standard
                defaults.set(true, forKey: "drawTut")
                line.removeFromParent()
                line.childNode(withName: "thing")?.removeFromParent()
                line.removeAllChildren()
                self.addChild(self.line)
            }
        }
        if yeees.contains(pos) && crashed == true {
            let defaults = UserDefaults.standard
            let lettersDone = defaults.integer(forKey: "crash\(a.fontsCreated)")
            letterToBeDrawn = lettersDone
            guideLetter.removeFromParent()
            guideOutline.removeFromParent()
            guideLetter.removeFromParent()
            guideOutline.removeFromParent()
            guideLetter.text = "\(examples[letterToBeDrawn])"
            self.addChild(guideLetter)
            self.addChild(guideOutline)
            self.saveMenu.removeFromParent()
            self.yeees.removeFromParent()
            self.noooo.removeFromParent()
            self.texts.removeFromSuperview()
            moveLetter()
            crashed = false
        }
        if noooo.contains(pos) && crashed == true {
            print("Hello, why you no clicky?!")
            let defaults = UserDefaults.standard
            defaults.set(0, forKey: "crash\(a.fontsCreated)")
            self.saveMenu.removeFromParent()
            self.yeees.removeFromParent()
            self.noooo.removeFromParent()
            self.texts.removeFromSuperview()
            crashed = false
        }
        if tut.contains(pos){
            retakeTut()
        }
    }
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height)
        UIGraphicsBeginImageContextWithOptions(targetSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    func processPixels(in image: UIImage) {
        let inputCGImage = image.cgImage
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let width = inputCGImage?.width
        let height = inputCGImage?.height
        let bytesPerPixel = 4
        let bitsPerComponent = 8
        let bytesPerRow = bytesPerPixel * width!
        let bitmapInfo = RGBA32.bitmapInfo
        
        let context = CGContext(data: nil, width: width!, height: height!, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        context?.draw(inputCGImage!, in: CGRect(x: 0, y: 0, width: width!, height: height!))
        
        let buffer = context?.data
        
        let pixelBuffer = buffer?.bindMemory(to: RGBA32.self, capacity: width! * height!)
        
        for row in 0 ..< Int(height!) {
            for column in 0 ..< Int(width!) {
                let offset = row * width! + column
                if pixelBuffer![offset].alphaComponent == 0 && pixelBuffer![offset].blueComponent == 0 && pixelBuffer![offset].greenComponent == 0 && pixelBuffer![offset].redComponent == 255 {
                }
                else {
                    pixelBuffer![offset] = RGBA32(red: 0, green: 0, blue: 0, alpha: 0)
                }
            }
        }
        
        let outputCGImage = context?.makeImage()!
        let outputImage = UIImage(cgImage: outputCGImage!, scale: 0.1, orientation: image.imageOrientation)
        var sizer = UIImage()
        var changeNeeded : Bool = false
        var x : Int = 5
        while x < 67 {
            if guideLetter.text == examples[x]{
                sizer = resizeImage(image: outputImage, targetSize: CGSize(width: 40 / 1.6, height: 40))
                changeNeeded = true
            }
            if x == 5 {
                x = 8
            }
            else if x == 9 {
                x = 26
            }
            else if x == 37 {
                x = 39
            }
            else if x == 47 {
                x = 49
            }
            else if x == 51 {
                x = 57
            }
            else {
                x += 1
            }
        }
        var y : Int = 52
        while y < 57 {
            if guideLetter.text == examples[y]{
                sizer = resizeImage(image: outputImage, targetSize: CGSize(width: 40 * 0.43, height: 40))
                changeNeeded = true
            }
            y += 1
        }
        if changeNeeded == false{
            sizer = resizeImage(image: outputImage, targetSize: CGSize(width: 40, height: 40))
        }
        save(letter: sizer)
    }
    func increaseContrast(_ image: UIImage) -> UIImage {
        let inputImage = CIImage(image: image)!
        let parameters = [
            "inputContrast": NSNumber(value: 2)
        ]
        let outputImage = inputImage.applyingFilter("CIColorControls", parameters: parameters)
        
        let context = CIContext(options: nil)
        let img = context.createCGImage(outputImage, from: outputImage.extent)!
        let uimage : UIImage = UIImage(cgImage: img)
        return uimage
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
