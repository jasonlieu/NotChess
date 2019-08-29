//
//  Piece.swift
//  NotChess
//
//  Created by Jason Lieu on 8/29/19.
//  Copyright © 2019 JasonApplication. All rights reserved.
//

import UIKit

class Piece{
    var pieceType : String?
    var pX : Int?
    var pY : Int?
    init(type: String, positionX : Int, positionY: Int){
        pieceType = type
        pX = positionX
        pY = positionY
    }
    func move(){
        
    }
}
