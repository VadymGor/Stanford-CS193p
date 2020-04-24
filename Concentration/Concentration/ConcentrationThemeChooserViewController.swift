//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Vadym Horovyi on 24/04/2020.
//  Copyright © 2020 Vadym Horovyi. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {
    
    let themes = [
        "Sports":"⚽️🏀🏈⚾️🎾🏐🏉🎱🏓🏸🤺🏏",
        "Animals":"🐶🐱🐹🦊🐻🐨🐯🦁🐸🐝🐞🐵",
        "Faces":"😃😂😍😋🧐🤓😎🥳🤩🤗🤠👽",
    ]
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                }
            }
        }
    }
    
}





