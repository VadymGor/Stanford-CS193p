//
//  Card.swift
//  Concentration
//
//  Created by Vadym Horovyi on 06/04/2020.
//  Copyright © 2020 Vadym Horovyi. All rights reserved.
//

import Foundation

struct Card: Hashable {
    
    var hashValue: Int { return identifier } 
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMathed = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
