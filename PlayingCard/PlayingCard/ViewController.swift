//
//  ViewController.swift
//  PlayingCard
//
//  Created by Vadym Horovyi on 21/04/2020.
//  Copyright © 2020 Vadym Horovyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var deck = PlayingCardDeck()
    
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left,.right]
            playingCardView.addGestureRecognizer(swipe)
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy:)))
            playingCardView.addGestureRecognizer(pinch)
        }
    }
    
    // Flip the card
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            playingCardView.isFaceUp = !playingCardView.isFaceUp
        default:
            break
        }
    }
    
    // Get the next card on the deck
    @objc func nextCard() {
        // Try to draw a card
        if let card = deck.draw() {
            // Configure the view to show the new card
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    private var deck = PlayingCardDeck()
//
//    @IBOutlet
//}
