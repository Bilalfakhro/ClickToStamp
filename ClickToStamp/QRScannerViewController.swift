//
//  QRScannerViewController.swift
//  ClickToStamp
//
//  Created by Bilal Fakhro on 2018-11-17.
//  Copyright © 2018 Bilal Fakhro. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import Firebase

class QRScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    var code = ("00.00.00.x")
    var newQRCode = String("valfarden.se")
    
    var ref : DatabaseReference!
    var userRef : DatabaseReference!
    var restuarantsRef : DatabaseReference!
    var lunchRef : DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uid = Auth.auth().currentUser?.uid
        ref = Database.database().reference()
        userRef = self.ref.child("Users").child(uid!)
        restuarantsRef = self.userRef.child("Valfarden")
        lunchRef = self.restuarantsRef.child("Lunch")
        
        //view.backgroundColor = UIColor.black
        captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video)
            else {
                return
                }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (captureSession.canAddInput(videoInput)) {
            captureSession.addInput(videoInput)
        } else {
            failed()
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if (captureSession.canAddOutput(metadataOutput)) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr, .ean8, .ean13]
        } else {
            failed()
            return
        }
        // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        // Start video capture.
        captureSession.startRunning()
    }
    
    // If any error occurs, simply print it out and don't continue any more.
    func failed() {
        let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
        captureSession = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (captureSession?.isRunning == false) {
            captureSession.startRunning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (captureSession?.isRunning == true) {
            captureSession.stopRunning()
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        captureSession.stopRunning()
        
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            addStamp(newQRCode: stringValue)
        }
    }
    
    func addStamp(newQRCode: String) {

        let newQRCode: String = "valfarden.se"
        // CHECK IF USER LOGGED IN
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            self.restuarantsRef.observe(.value, with: { (snapshot) in
                if newQRCode == nil {
                    self.failed()
                    } else {
                    self.lunchRef.setValue("9")
                    }
                //print(newQRCode)
               // self.performSegue(withIdentifier: "qrToCardSegue", sender: self)
            })
        }
        
//        self.dismiss(animated: true, completion: nil)
        }
    
    // HANDLE LOGOUT AND GO BACK TO SIGN IN VIEWCONTROLLER
    @objc func handleLogout() {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        let signInController = SignInViewController()
        present(signInController, animated: false, completion: nil)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
}
