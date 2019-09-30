//
//  Piece.swift
//  NotChess
//
//  Created by Jason Lieu on 8/29/19.
//  Copyright © 2019 JasonApplication. All rights reserved.
//

import UIKit

class Piece{
    var pieceType : String
    var direction : String
    var pX : Int
    var pY : Int
    var color : Character
    var delay : Int = 0
    init(type: String, direction: String, positionX : Int, positionY: Int, color : Character){
        pieceType = type
        self.direction = direction
        pX = positionX
        pY = positionY
        self.color = color
    }
    
}
