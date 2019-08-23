//
//  ViewController.swift
//  Story Time
//
//  Created by Phobo on 8/19/19.
//  Copyright © 2019 Phobo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var sharingImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func shareToInstaStories(_ sender: Any) {
        
        if let storiesUrl = URL(string: "instagram-stories://share"){
            if UIApplication.shared.canOpenURL(storiesUrl){ // checking if instagram is installed on phone
                guard let image = sharingImageView.image else { return }
                guard let imageData = UIImagePNGRepresentation(image) else { return }
                
                let pasteboardItems: [String: Any] = [
                    "com.instagram.sharedSticker.stickerImage": imageData,
                    "com.instagram.sharedSticker.backgroundTopColor": "#636e72",
                    "com.instagram.sharedSticker.backgroundBottomColor": "#b2bec3"
                    
                ]
                
                let pasteboardOptions = [
                    UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(250)
                ]
                
                UIPasteboard.general.setItems([pasteboardItems], options: pasteboardOptions)
                UIApplication.shared.open(storiesUrl, options: [:], completionHandler: nil)
                
            } else {
                print("User does not have instagram installed")
            }
        }
    }
    
}

