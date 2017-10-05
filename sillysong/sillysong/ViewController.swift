//
//  ViewController.swift
//  sillysong
//
//  Created by Rahul Dhiman on 05/10/17.
//  Copyright © 2017 Rahul Dhiman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var nameView: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    @IBAction func reset(_ sender: Any) {
        nameView.text?.removeAll()
        lyricsView.text.removeAll()
        nameView.autocapitalizationType = .words
    }
    
    
    @IBAction func displayLyrics(_ sender: Any) {
        if let name = nameView.text {
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: name)
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return false
        
    }
}
    
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")

    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        
        let shortshort = shortname(name: fullName)
        
        let strshow = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName).replacingOccurrences(of: "<SHORT_NAME>", with: shortshort)
        
        return strshow
    }
    
    
    
    func shortname(name:String)->String{
        let lowercase = name.lowercased()
        let vowelSet  = NSCharacterSet(charactersIn: "aeiou")
        
        if let Range = lowercase.rangeOfCharacter(from: vowelSet as CharacterSet) {
            return lowercase.substring(from: Range.lowerBound)
        }
        
        return lowercase
    }



