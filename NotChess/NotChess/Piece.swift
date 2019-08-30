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
    var direction : String?
    var pX : Int?
    var pY : Int?
    var delay : Int = 0
    init(type: String, direction: String, positionX : Int, positionY: Int){
        pieceType = type
        self.direction = direction
        pX = positionX
        pY = positionY
    }
    func checkMove(){
        switch pieceType{
        case "pawn":
            if delay <= 4 {
                movePawn()
            }
        case "rook":
            if delay <= 3 {
                moveRook()
            }
        case "knight":
            if delay <= 2 {
                moveKnight()
            }
        case "bishop":
            if delay <= 2 {
                moveBishop()
            }
        case "king":
            if delay <= 4 {
                moveKing()
            }
        case "queen":
            if delay <= 1 {
                moveQueen()
            }
        default:
            print("invalid piece")
        }
    }
    func movePawn(){
        
    }
    func moveRook(){
        
    }
    func moveKnight(){
        
    }
    func moveBishop(){
        
    }
    func moveKing(){
        
    }
    func moveQueen(){
        
    }
}
