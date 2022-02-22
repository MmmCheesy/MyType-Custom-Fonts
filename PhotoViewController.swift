//
//  PhotoViewController.swift
//  MyType
//
//  Created by Alexander Eckert on 3/27/18.
//  Copyright © 2018 Alexander Eckert. All rights reserved.
//

import UIKit
import AVFoundation
import SpriteKit

class PhotoViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    let captureSession = AVCaptureSession()
    var previewLayer: CALayer!
    
    var captureDevice: AVCaptureDevice!
    
    var takePhoto = false
    
    var sampleBuffer: CMSampleBuffer!
    
    var capturePhotoOutput: AVCapturePhotoOutput?
    
    var examples: Array = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",".",",","!","?","'","1","2","3","4","5","6","7","8","9","0"]
    
    @IBOutlet weak var LetterOn: UILabel!
    
    @IBOutlet weak var guideLetter: UILabel!
    
    @IBOutlet weak var guideBox: UIView!
    
    @IBOutlet weak var TakePicBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SegueVariables.actual = false
        
        LetterOn.text = "\(examples[letter.dletter])"
        if fontVariables.editLetter != "" {
            LetterOn.text = fontVariables.editLetter
            var x : Int = 0
            while x < 67 {
                if examples[x] == fontVariables.editLetter {
                    letter.dletter = x
                }
                x += 1
            }
        }
        
        capturePhotoOutput = AVCapturePhotoOutput()
        capturePhotoOutput?.isHighResolutionCaptureEnabled = true
        
        captureSession.addOutput(capturePhotoOutput!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        URLCache.shared.removeAllCachedResponses()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        prepareCamera()
    }
    
    func prepareCamera(){
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
        let availableDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back).devices
        captureDevice = availableDevices.first
        beginSession()
        guideLetter.removeFromSuperview()
        guideBox.removeFromSuperview()
        guideLetter.text = "\(examples[letter.dletter])"
        if fontVariables.editLetter != "" {
            guideLetter.text = fontVariables.editLetter
        }
        guideBox.layer.borderColor = UIColor(white: 0.3, alpha: 0.4).cgColor
        guideBox.layer.borderWidth = 5
        guideBox.backgroundColor = UIColor(hue: 1, saturation: 1, brightness: 1, alpha: 0)
        self.view.addSubview(guideLetter)
        self.view.addSubview(guideBox)
        guideLetter.bringSubviewToFront(self.view)
        guideBox.bringSubviewToFront(self.view)
        
        var changeNeeded : Bool = false
        var x : Int = 5
        while x < 67 {
            if guideLetter.text == examples[x]{
                changeNeeded = true
                guideBox.bounds.size = CGSize(width: (self.guideBox.frame.width / 1.6), height: self.guideBox.frame.height)
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
                changeNeeded = true
                guideBox.bounds.size = CGSize(width: (self.guideBox.frame.width * 0.43), height: self.guideBox.frame.height)
            }
            y += 1
        }
        if changeNeeded == false{
            print("no change necessary")
        }
    }
    
    func beginSession(){
        do{
            let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(captureDeviceInput)
        }catch{
            print(error.localizedDescription)
        }
        
        let PreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.previewLayer = PreviewLayer
        self.view.layer.addSublayer(self.previewLayer)
        self.previewLayer.frame = CGRect(x: 0, y: self.view.bounds.height / 8, width: self.view.bounds.width, height: self.view.bounds.height / 1.4)
        captureSession.startRunning()
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.videoSettings = [((kCVPixelBufferPixelFormatTypeKey as NSString) as String):NSNumber(value: kCVPixelFormatType_32BGRA)]
        
        dataOutput.alwaysDiscardsLateVideoFrames = true
        
        if captureSession.canAddOutput(dataOutput){
            captureSession.addOutput(dataOutput)
        }
        
        captureSession.commitConfiguration()
            
        let queue = DispatchQueue(label: "com.brianAdvent.captureQueue")
        dataOutput.setSampleBufferDelegate(self, queue: queue)
        
    }
    @IBAction func TakePhoto(_ sender: Any) {
        print("Blah")
    
        
        guard let capturePhotoOutput = self.capturePhotoOutput else { return }
        
        let photoSettings = AVCapturePhotoSettings()
        
        photoSettings.isAutoStillImageStabilizationEnabled = true
        photoSettings.isHighResolutionPhotoEnabled = true
        photoSettings.flashMode = .off
        
        capturePhotoOutput.capturePhoto(with: photoSettings, delegate: self as AVCapturePhotoCaptureDelegate)
        print("photo btn was pressed")
    }
    
    func stopCaptureSession(){
        self.captureSession.stopRunning()
        
        if let inputs = captureSession.inputs as? [AVCaptureDeviceInput]{
            for input in inputs {
                self.captureSession.removeInput(input)
            }
        }
    }
    
    override var shouldAutorotate: Bool{
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
        
    }


}

extension PhotoViewController : AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        // Make sure we get some photo sample buffer
        
        // Convert photo same buffer to a jpeg image data by using // AVCapturePhotoOutput
        let imageData = photo.fileDataRepresentation()
        // Initialise a UIImage with our image data
        let capturedImage = UIImage.init(data: imageData! , scale: 1.0)
        if let image = capturedImage {
            stopCaptureSession()
            print(image)
            
            takenPicture.imageTaken = image
            stopCaptureSession()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                if letter.takePic == true {
                    NotificationCenter.default.post(name: NSNotification.Name("NotificationID"), object: nil)
                    self.dismiss(animated: true, completion: nil)
                    letter.takePic = false
                    /*
                    self.dismiss(animated: true){
                        let parent = CameraScene()
                        parent.removeAllChildren()
                        parent.ReloadView()
                    }
                    */
                }else{
                    self.performSegue(withIdentifier: "LoadPictures", sender: nil)
                    letter.picJustTook = true
                }
            })
        }
    }
}
struct takenPicture {
    static var imageTaken = UIImage()
    func reloadTheView() {
        
    }
}
