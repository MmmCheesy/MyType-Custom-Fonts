//
//  CameraScene.swift
//  MyType
//
//  Created by Alexander Eckert on 3/22/18.
//  Copyright © 2018 Alexander Eckert. All rights reserved.
//

import UIKit
import SpriteKit
import CoreImage

class CameraScene: SKScene {
    
    var takenImage: UIImage? = nil
    var examples: Array = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",".",",","!","?","'","1","2","3","4","5","6","7","8","9","0"]
    
    let nextLetter = SKLabelNode(fontNamed: "American Typewriter")
    let retakePic = SKLabelNode(fontNamed: "American Typewriter")
    let goBack = SKLabelNode(fontNamed: "American Typewriter")
    let tutBtn = SKLabelNode(fontNamed: "American Typewriter")
    var tutSer : Bool = false
    
    var back = SKSpriteNode(imageNamed: "AllDone")
    
    var pendingletter = UIImage()
    var cover = SKSpriteNode()
    
    var tipsScreen = SKSpriteNode()
    var gotIt = SKSpriteNode(imageNamed: "GotIt")
    var theTips = UITextView()
    var tutNo : Int = 0
    var guideEx = SKSpriteNode(imageNamed: "GuideExample")
    var tut: Bool = false
    var crashed: Bool = false
    var editing : Bool = false
    
    var saveMenu = SKSpriteNode()
    var yeees = SKLabelNode(fontNamed: "American Typewriter")
    var noooo = SKLabelNode(fontNamed: "American Typewriter")
    var texts = UITextView()
    
    var typewriter = SKSpriteNode(imageNamed: "TypeWriter")
    var loadMessage = SKLabelNode(fontNamed: "American Typewriter")
    var loadMessage2 = SKLabelNode(fontNamed: "American Typewriter")
    var picLoaded : Bool = false
    var fontBeingDrawn : Int = 0
    var sceneLoaded : Bool = true
    var crashCheckLater : Bool = false
    
    override func didMove(to view: SKView) {
        print("The Letter Loading Function Has Began")
        NotificationCenter.default.addObserver(self, selector: #selector(CameraScene.ReloadView), name: NSNotification.Name("NotificationID"), object: nil)
        backgroundColor = UIColor.white
        takenImage = takenPicture.imageTaken
        if SegueVariables.actual == false {
            print("Segue is equal to false for some reason")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                self.increaseContrast(self.takenImage!)
            })
        }
        takenPicture.imageTaken = UIImage()
        print(takenPicture.imageTaken)
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
        
        nextLetter.text = "Next Letter"
        nextLetter.fontSize = 20
        nextLetter.fontColor = UIColor.green
        nextLetter.position = CGPoint(x: self.frame.width / 3.5, y: (self.frame.width / -2) - 40)
        self.addChild(nextLetter)
        
        retakePic.text = "Retake Pic"
        retakePic.fontColor = UIColor.red
        retakePic.fontSize = 20
        retakePic.position = CGPoint(x: self.frame.width / -3.5, y: (self.frame.width / -2) - 40)
        self.addChild(retakePic)
        
        goBack.text = "Redo Previous Letter"
        goBack.fontColor = UIColor.blue
        goBack.fontSize = 20
        goBack.position = CGPoint(x: 0, y: self.nextLetter.position.y - 40)
        self.addChild(goBack)
        
        tutBtn.text = "Tutorial"
        tutBtn.fontColor = UIColor.blue
        tutBtn.fontSize = 20
        tutBtn.position = CGPoint(x: 0, y: self.goBack.position.y - 40)
        self.addChild(tutBtn)
        
        if fontVariables.camEdit == true {
            retakePic.removeFromParent()
            goBack.removeFromParent()
            nextLetter.removeFromParent()
            nextLetter.text = "Save New Letter"
            nextLetter.fontSize = 40
            nextLetter.position = CGPoint(x: 0, y: (self.frame.width / -2) - 60)
            self.addChild(nextLetter)
            retakePic.fontSize = 25
            retakePic.position = CGPoint(x: 0, y: nextLetter.position.y - 45)
            self.addChild(retakePic)
            editing = true
            tutBtn.removeFromParent()
        }
        
        back.size = CGSize(width: self.frame.width / 4, height: self.frame.height  / 15)
        back.position = CGPoint(x:-(self.frame.width / 2) + (self.back.size.width / 2), y: (self.frame.height / 2) - (self.back.size.height))
        self.addChild(back)
        
        tipsScreen.size = CGSize(width: self.frame.width, height: self.frame.height  * 0.8)
        tipsScreen.position = CGPoint(x: 0, y: self.frame.height / -10)
        tipsScreen.color = UIColor.white
        
        theTips = UITextView(frame: CGRect(x: 0, y: self.frame.height / 8, width: self.frame.width, height: self.frame.height / 2))
        theTips.text = " -In this area, you will create your font by drawing letters, then using the camera \n -Draw your letters with a dark pen or marker \n -Draw your letters on white or a light colored paper "
        theTips.font = UIFont(name: "American Typewriter", size: 30)
        theTips.textAlignment = .center
        theTips.isEditable = false
        theTips.isSelectable = false
        theTips.textColor = UIColor.blue
        theTips.backgroundColor = UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 0)
        
        gotIt.size = CGSize(width: self.frame.width / 3, height: (self.frame.width / 3) * 0.6)
        gotIt.position = CGPoint(x: self.frame.width / 4, y: self.frame.height / -4)
        
        let defaults = UserDefaults.standard
        tut = defaults.bool(forKey: "tut")
        if tut == false && SegueVariables.actual == true {
            self.addChild(tipsScreen)
            self.addChild(gotIt)
            self.view?.addSubview(theTips)
        }
        else {
            print("I hope you know what you're doing...")
        }
        
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
        
        typewriter.size = CGSize(width: self.frame.width / 3, height: self.frame.width / 3)
        typewriter.position = CGPoint(x: 0, y: 0)
        
        loadMessage.text = "We are loading your letter"
        loadMessage.fontSize = 20
        loadMessage.fontColor = UIColor.blue
        loadMessage.position = CGPoint(x: 0, y: self.frame.height / 6)
        
        loadMessage2.text = "Draw letters while you wait"
        loadMessage2.fontSize = 20
        loadMessage2.fontColor = UIColor.blue
        loadMessage2.position = CGPoint(x: 0, y: self.frame.height / -6)
        
        if SegueVariables.actual == false {
            self.addChild(typewriter)
            self.addChild(loadMessage)
            self.addChild(loadMessage2)
            let invert = SKAction.scaleX(to: -1, duration: 0.5)
            let reinvert = SKAction.scaleX(to: 1, duration: 0.5)
            let pause = SKAction.wait(forDuration: 0.3)
            let runBlock = SKAction.sequence([invert, pause, reinvert, pause])
            let animation = SKAction.repeatForever(runBlock)
            typewriter.run(animation)
        }
        
        cover.color = UIColor.white
        cover.size = CGSize(width: self.frame.width, height: self.frame.height / 3.5)
        cover.position = CGPoint(x: 0, y: self.frame.height / -3)
        self.addChild(cover)
        
        if tut == false && SegueVariables.actual == true {
            cover.removeFromParent()
        }
        if SegueVariables.actual == true {
            crashCeck()
            SegueVariables.actual = false
        }
    }
    @objc func ReloadView(){
        if sceneLoaded == true {
            sceneLoaded = false
            
            self.removeAllChildren()
            takenImage = takenPicture.imageTaken
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
                self.increaseContrast(self.takenImage!)
            })
            
            nextLetter.text = "Next Letter"
            nextLetter.fontSize = 20
            nextLetter.fontColor = UIColor.green
            nextLetter.position = CGPoint(x: self.frame.width / 3.5, y: (self.frame.width / -2) - 40)
            self.addChild(nextLetter)
            
            retakePic.text = "Retake Pic"
            retakePic.fontColor = UIColor.red
            retakePic.fontSize = 20
            retakePic.position = CGPoint(x: self.frame.width / -3.5, y: (self.frame.width / -2) - 40)
            self.addChild(retakePic)
            
            goBack.text = "Redo Previous Letter"
            goBack.fontColor = UIColor.blue
            goBack.fontSize = 20
            goBack.position = CGPoint(x: 0, y: self.nextLetter.position.y - 40)
            self.addChild(goBack)
            
            tutBtn.text = "Tutorial"
            tutBtn.fontColor = UIColor.blue
            tutBtn.fontSize = 20
            tutBtn.position = CGPoint(x: 0, y: self.goBack.position.y - 40)
            self.addChild(tutBtn)
            
            if editing == true {
                retakePic.removeFromParent()
                goBack.removeFromParent()
                nextLetter.removeFromParent()
                nextLetter.text = "Save New Letter"
                nextLetter.fontSize = 40
                nextLetter.position = CGPoint(x: 0, y: (self.frame.width / -2) - 60)
                retakePic.fontSize = 25
                retakePic.position = CGPoint(x: 0, y: nextLetter.position.y - 45)
                self.addChild(nextLetter)
                self.addChild(retakePic)
                tutBtn.removeFromParent()
            }
            
            back.size = CGSize(width: self.frame.width / 4, height: self.frame.height  / 15)
            back.position = CGPoint(x:-(self.frame.width / 2) + (self.back.size.width / 2), y: (self.frame.height / 2) - (self.back.size.height))
            self.addChild(back)

            typewriter.size = CGSize(width: self.frame.width / 3, height: self.frame.width / 3)
            typewriter.position = CGPoint(x: 0, y: 0)
            
            loadMessage.text = "We are loading your letter"
            loadMessage.fontSize = 20
            loadMessage.fontColor = UIColor.blue
            loadMessage.position = CGPoint(x: 0, y: self.frame.height / 6)
            
            loadMessage2.text = "Draw letters while you wait"
            loadMessage2.fontSize = 20
            loadMessage2.fontColor = UIColor.blue
            loadMessage2.position = CGPoint(x: 0, y: self.frame.height / -6)
            
            self.addChild(typewriter)
            self.addChild(loadMessage)
            self.addChild(loadMessage2)
            typewriter.removeAllActions()
            let size = SKAction.scale(to: CGSize(width: self.frame.width / 3, height: self.frame.width / 3), duration: 0)
            let invert = SKAction.scaleX(to: -1, duration: 0.5)
            let reinvert = SKAction.scaleX(to: 1, duration: 0.5)
            let pause = SKAction.wait(forDuration: 0.3)
            let hide = SKAction.removeFromParent()
            let show = SKAction.unhide()
            let runBlock = SKAction.sequence([show, size, invert, pause, reinvert, pause, size, invert, pause, reinvert, pause, size, invert, pause, reinvert, pause, size, invert, pause, reinvert, pause, size, invert, pause, reinvert, pause, hide])
            typewriter.run(runBlock)
            
            cover.color = UIColor.white
            cover.size = CGSize(width: self.frame.width, height: self.frame.height / 3.5)
            cover.position = CGPoint(x: 0, y: self.frame.height / -2.9)
            self.addChild(cover)
        }
    }
    func retakeTut(){
        tutSer = true
        tipsScreen.removeFromParent()
        gotIt.removeFromParent()
        self.addChild(tipsScreen)
        self.addChild(gotIt)
        theTips.removeFromSuperview()
        theTips.text = " -In this area, you will create your font by drawing letters, then using the camera \n -Draw your letters with a dark pen or marker \n -Draw your letters on white or a light colored paper "
        self.view?.addSubview(theTips)
        crashed = false
        tutNo = 0
    }
    func increaseContrast(_ image: UIImage) {
        let inputImage = CIImage(image: image)!
        let parameters = [
            "inputContrast": NSNumber(value: 1.3)
        ]
        let outputImage = inputImage.applyingFilter("CIColorControls", parameters: parameters)
        
        let context = CIContext(options: nil)
        let img = context.createCGImage(outputImage, from: outputImage.extent)!
        let uimage : UIImage = UIImage(cgImage: img)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.processPixels(in: uimage)
            print("Conrtrast Increased")
        })
    }
    func processPixels(in image: UIImage) {
        print(":)")
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            let outputCGImage = context?.makeImage()!
            let outputImage = UIImage(cgImage: outputCGImage!, scale: image.scale, orientation: UIImage.Orientation(rawValue: Int(Double.pi / -2))!)
            print("Pixels Processed")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                var cropImage: UIImage = self.cropToBounds(image: outputImage, width: 800, height: 800)
                print(outputImage)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    let Original = SKTexture(image: cropImage)
                    let original = SKSpriteNode(texture: Original)
                    original.zRotation = CGFloat(Double.pi / -2)
                    original.position = CGPoint(x: 0, y: 0)
                    original.size = CGSize(width: self.frame.width, height: self.frame.width)
                    self.loadMessage2.removeFromParent()
                    self.loadMessage.removeFromParent()
                    self.addChild(original)
                    self.cover.removeFromParent()
                    cropImage = UIImage()
                    let hide = SKAction.hide()
                    self.typewriter.run(hide)
                })
            })
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            var sizer = UIImage()
            var changeNeeded : Bool = false
            var x : Int = 5
            while x < 67 {
                if self.examples[letter.dletter] == self.examples[x]{
                    sizer = self.resizeImage(image: self.rotateImage(), targetSize: CGSize(width: 40 / 1.6, height: 40))
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
                if self.examples[letter.dletter] == self.examples[y]{
                    sizer = self.resizeImage(image: self.rotateImage(), targetSize: CGSize(width: 40 * 0.43, height: 40))
                    changeNeeded = true
                }
                y += 1
            }
            if changeNeeded == false{
                sizer = self.resizeImage(image: self.rotateImage(), targetSize: CGSize(width: 40, height: 40))
                print("no change necessary")
            }
            self.pendingletter = sizer
            sizer = UIImage()
        })
    }
    func cropToBounds(image: UIImage, width: CGFloat, height: CGFloat) -> UIImage {
        
        var cgimage = image.cgImage!
        var posX: CGFloat = CGFloat(image.size.width / 2) * 1.21
        var posY: CGFloat = CGFloat((image.size.height / 2) - (height * 0.98))
        var cgwidth: CGFloat = CGFloat(width * 0.8)
        var cgheight: CGFloat = CGFloat(height * 0.8)
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            cgimage = image.cgImage!
            posX = CGFloat(image.size.width / 2.2) * 1.29
            posY = CGFloat((image.size.height / 2.2) - (height * 0.5))
            cgwidth = CGFloat(width * 0.5)
            cgheight = CGFloat(height * 0.5)
            print("device == iPad")
        }
        
        let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
        let imageRef: CGImage = cgimage.cropping(to: rect)!
        let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        
        return image
    }
    func rotateImage() -> UIImage {
        var rect = CGRect()
        var changeNeeded : Bool = false
        var x : Int = 5
        while x < 67 {
            if examples[letter.dletter] == examples[x]{
                rect = CGRect(x: ((self.frame.height / 2) / 1.6) / -2, y: (view?.bounds.size.height)! / -4, width: (view?.bounds.size.width)!, height: (view?.bounds.size.height)!)
                UIGraphicsBeginImageContextWithOptions(CGSize(width: (self.frame.height / 2) / 1.6, height: self.frame.height / 2), false, 1)
                changeNeeded = true
                let cover1 = SKSpriteNode()
                cover1.size = CGSize(width: (self.frame.width - (self.frame.height / 2) / 1.6) / 2 , height: self.frame.width)
                cover1.color = UIColor.white
                cover1.position = CGPoint(x: (self.frame.width / -2) + (cover1.size.width / 2), y: 0)
                self.addChild(cover1)
                let cover2 = SKSpriteNode()
                cover2.size = CGSize(width: (self.frame.width - (self.frame.height / 2) / 1.6) / 2 , height: self.frame.width)
                cover2.color = UIColor.white
                cover2.position = CGPoint(x: (self.frame.width / 2) - (cover2.size.width / 2), y: 0)
                self.addChild(cover2)

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
            if examples[letter.dletter] == examples[y]{
                rect = CGRect(x: ((self.frame.height / 2) * 0.43) / -2, y: (view?.bounds.size.height)! / -4, width: (view?.bounds.size.width)!, height: (view?.bounds.size.height)!)
                UIGraphicsBeginImageContextWithOptions(CGSize(width: (self.frame.height / 2) * 0.43, height: self.frame.height / 2), false, 1)
                changeNeeded = true
                let cover1 = SKSpriteNode()
                cover1.size = CGSize(width: (self.frame.width - (self.frame.height / 2)  * 0.43) / 2 , height: self.frame.width)
                cover1.color = UIColor.white
                cover1.position = CGPoint(x: (self.frame.width / -2) + (cover1.size.width / 2), y: 0)
                self.addChild(cover1)
                let cover2 = SKSpriteNode()
                cover2.size = CGSize(width: (self.frame.width - (self.frame.height / 2) * 0.43) / 2 , height: self.frame.width)
                cover2.color = UIColor.white
                cover2.position = CGPoint(x: (self.frame.width / 2) - (cover2.size.width / 2), y: 0)
                self.addChild(cover2)
            }
            y += 1
        }
        if changeNeeded == false{
            rect = CGRect(x: -((self.frame.width / 2) - ((self.frame.height / 2) / 2)), y: (view?.bounds.size.height)! / -4, width: (view?.bounds.size.width)!, height: (view?.bounds.size.height)!)
            UIGraphicsBeginImageContextWithOptions(CGSize(width: self.frame.height / 2, height: self.frame.height / 2), false, 1)
            print("no change necessary")
        }
        self.view?.drawHierarchy(in: rect, afterScreenUpdates: true)
        let rotatedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        let theLetter : UIImage = processPixelsAgain(in: rotatedImage)
        return theLetter
    }
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height)
        UIGraphicsBeginImageContextWithOptions(targetSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        picLoaded = true
        return newImage!
    }
    func save(theLetter: UIImage){
        var key : String = examples[letter.dletter] + "\(a.fontsCreated)"
        if fontVariables.editLetter != "" {
            key = fontVariables.editLetter + "\(fontVariables.fontSelected)"
            fontVariables.editLetter = ""
        }
        let savedData = NSKeyedArchiver.archivedData(withRootObject: theLetter)
        let defaults = UserDefaults(suiteName: "group.io.golf.fonts")
        defaults?.set(savedData, forKey: key)
        if editing == true {
            defaults?.set(savedData, forKey: "m" + key)
        }
        defaults?.synchronize()
        
        if let savedLetter = defaults?.object(forKey: key) as? Data {
            let theLetter  = NSKeyedUnarchiver.unarchiveObject(with: savedLetter) as! UIImage
            print("\(savedLetter) <-- what the heck is this?")
            print(theLetter)
            //self.addChild(theLetter)
        }
        
    }
    func crashCeck() {
        let defaults = UserDefaults.standard
        let lettersDone = defaults.integer(forKey: "crash\(a.fontsCreated)")
        if lettersDone != 0 && fontVariables.camEdit == false {
            crashed = true
            crashCheckLater = true
            print("It seems you've already designed some of the characters in your font. \n Would you like to continue where you left off?")
            if tut != false{
                self.addChild(saveMenu)
                self.addChild(yeees)
                self.addChild(noooo)
                self.view?.addSubview(texts)
                self.guideEx.removeFromParent()
            }
            else {
                crashed = false
            }
        }
    }
    func touchDown(atPoint pos : CGPoint) {
    }
    func touchUp(atPoint pos : CGPoint) {
        if retakePic.contains(pos){
            letter.takePic = true
            sceneLoaded = true
        }
        print("\(tut)\(picLoaded)")
        if nextLetter.contains(pos) && letter.dletter != 66 && tut == true && picLoaded == true {
            print("\(picLoaded)" + "-- Pic Loaded")
            sceneLoaded = true
            let defaults = UserDefaults.standard
            save(theLetter: pendingletter)
            print("Edit the letter!")
            if fontVariables.camEdit == true {
                print("Edit the letter!")
                fontVariables.camEdit = false
                SegueVariables.doneEdit = true
                if fontBeingDrawn != 0 {
                    a.fontsCreated = fontBeingDrawn
                }
            }
            else {
                letter.dletter += 1
                print(letter.dletter)
                defaults.set(letter.dletter, forKey: "crash\(a.fontsCreated)")
                letter.takePic = true
            }
        }
        if nextLetter.contains(pos) && letter.dletter == 66 && tut == true && picLoaded == true {
            print("\(picLoaded)" + "-- Pic Loaded")
            save(theLetter: pendingletter)
            print("congrats you're done!")
            let defaults = UserDefaults(suiteName: "group.io.golf.fonts")
            let defaults2 = UserDefaults.standard
            if fontBeingDrawn != 0 {
                a.fontsCreated = fontBeingDrawn
            }
            defaults?.set(a.fontsCreated, forKey: "fontsCreated")
            defaults2.set(false, forKey: "fontBought")
            letter.loadHome = true
            letter.dletter = 0
        }
        if goBack.contains(pos) && letter.dletter > 0 && tut == true {
            if editing == true {
                
            }else{
                letter.dletter -= 1
                letter.takePic = true
                sceneLoaded = true
            }
        }
        if back.contains(pos){
            if fontBeingDrawn != 0 {
                a.fontsCreated = fontBeingDrawn
            }
            SegueVariables.finishedCam = true
            letter.dletter = 0
            fontVariables.camEdit = false
        }
        if gotIt.contains(pos) && crashed == false && fontVariables.camEdit == false {
            if tutNo == 0 {
                theTips.text = " -Only what is inside the guidebox will be saved \n -Try to size the letter you drew as close to the guide letter as possible "
                guideEx.size = CGSize(width: self.frame.width  * 2, height: (self.frame.width * 2) * 0.6)
                guideEx.position = CGPoint(x: self.frame.width / -5, y: self.frame.height / -12)
                self.addChild(guideEx)
                tutNo += 1            }
            else if tutNo == 1 {
                theTips.text = " -You can redo any letters later in the 'Edit Fonts' area \n -You can leave any time and your progress will be saved \n -You cannot, however, use your font till you've created every character. "
                guideEx.removeFromParent()
                tutNo += 1
            }
            else if tutNo == 2 {
                theTips.text = " -You will design your font in this order: \n 1. Capital Letters \n 2. Lowercase Letters \n 3. Punctuation Marks \n 4. Numbers "
                gotIt.removeFromParent()
                gotIt.position = CGPoint(x: 0, y: self.frame.height / -4)
                self.addChild(gotIt)
                tutNo += 1
            }
            else if tutNo == 3 {
                let defaults = UserDefaults.standard
                defaults.set(true, forKey: "tut")
                if tutSer == true {
                    tipsScreen.removeFromParent()
                }
                else if crashCheckLater == true {
                    self.saveMenu.removeFromParent()
                    self.yeees.removeFromParent()
                    self.noooo.removeFromParent()
                    self.texts.removeFromSuperview()
                    self.addChild(saveMenu)
                    self.addChild(yeees)
                    self.addChild(noooo)
                    self.view?.addSubview(texts)
                    self.guideEx.removeFromParent()
                }
                else{
                    letter.takePic = true
                }
                tut = true
                gotIt.removeFromParent()
                gotIt.position = CGPoint(x: self.frame.width / 4, y: self.frame.height / -7)
                theTips.removeFromSuperview()
            }
        }
        if yeees.contains(pos) && tut == true{
            let defaults = UserDefaults.standard
            let lettersDone = defaults.integer(forKey: "crash\(a.fontsCreated)")
            letter.dletter = lettersDone
            letter.takePic = true
            self.saveMenu.removeFromParent()
            self.yeees.removeFromParent()
            self.noooo.removeFromParent()
            self.texts.removeFromSuperview()
        }
        if noooo.contains(pos) && tut == true{
            let defaults = UserDefaults.standard
            defaults.set(0, forKey: "crash\(a.fontsCreated)")
            letter.takePic = true
            self.saveMenu.removeFromParent()
            self.yeees.removeFromParent()
            self.noooo.removeFromParent()
            self.texts.removeFromSuperview()
        }
        if tutBtn.contains(pos) && fontVariables.camEdit == false && editing == false{
            retakeTut()
            crashed = false
        }
    }
    func processPixelsAgain(in image: UIImage) -> UIImage {
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
        let outputImage = UIImage(cgImage: outputCGImage!, scale: image.scale, orientation: image.imageOrientation)
        return outputImage
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
}
struct RGBA32: Equatable {
    private var color: UInt32
    
    var redComponent: UInt8 {
        return UInt8((color >> 24) & 255)
    }
    
    var greenComponent: UInt8 {
        return UInt8((color >> 16) & 255)
    }
    
    var blueComponent: UInt8 {
        return UInt8((color >> 8) & 255)
    }
    
    var alphaComponent: UInt8 {
        return UInt8((color >> 0) & 255)
    }
    
    init(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) {
        color = (UInt32(red) << 24)
        color = (UInt32(green) << 16)
        color = (UInt32(blue) << 8)
        color = (UInt32(alpha) << 0)
        //color = (UInt32(red) << 24) | (UInt32(green) << 16) | (UInt32(blue) << 8) | (UInt32(alpha) << 0)
    }
    static let red = RGBA32(red: 255, green: 0,   blue: 0,   alpha: 255)
    
    static let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
    
    static func ==(lhs: RGBA32, rhs: RGBA32) -> Bool {
        return lhs.color == rhs.color
    }
}
struct letter {
    static var dletter : Int = 0
    
    static var takePic : Bool = false
    
    static var loadHome : Bool = false
    
    static var picJustTook : Bool = false
}
