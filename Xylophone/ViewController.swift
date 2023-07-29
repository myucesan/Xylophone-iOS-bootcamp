//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
var audioPlayer: AVAudioPlayer?
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        print("Start")
        sender.alpha = 0.2
        
        // this works
        if let buttonText = sender.titleLabel?.text {
            print(buttonText)
            playSound(buttonText)
        }
        print("End")
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }
        
        // this works too, from AppBrewery
//        let buttonText = sender.currentTitle!
//        playSound(text: buttonText)
    }
    
    func playSound(_ text: String) { // _ can be removed with AppBrewery's solution, like that one more actually
        do {
            // Check if the sound file is in the bundle
            if let fileURL = Bundle.main.path(forResource: text, ofType: "wav") {
                // Translating the file URL to 'Data' which the AVAudioPlayer understands
                let soundData = NSData(contentsOfFile: fileURL)
                // Creating the player
                audioPlayer = try AVAudioPlayer(data: soundData! as Data)
                audioPlayer?.play()
            } else {
                print("No file with specified name exists")
            }
        } catch let error {
            print("Can't play the audio file failed with an error \(error.localizedDescription)")
        }

    }
    
    

}

