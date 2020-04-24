//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by Vadym Horovyi on 21/04/2020.
//  Copyright © 2020 Vadym Horovyi. All rights reserved.
//

import Foundation

// Represents a deck of playing cards
struct PlayingCardDeck {
    
    // The collection of cards
    private(set) var cards = [PlayingCard]()
    
    // Create a new deck of cards
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    // Draw a card from the deck
    mutating func draw() -> PlayingCard? {
        // If there are cards, return a random one
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4random)
        } else {
            return nil
        }
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
    
}
