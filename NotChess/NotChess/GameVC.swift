//
//  ViewController.swift
//  NotChess
//
//  Created by Jason Lieu on 8/29/19.
//  Copyright © 2019 JasonApplication. All rights reserved.
//

import UIKit

class GameVC: UIViewController {
    @IBOutlet var p00 : UIImageView!
    @IBOutlet var p01 : UIImageView!
    @IBOutlet var p02 : UIImageView!
    @IBOutlet var p03 : UIImageView!
    @IBOutlet var p04 : UIImageView!
    @IBOutlet var p05 : UIImageView!
    @IBOutlet var p06 : UIImageView!
    @IBOutlet var p07 : UIImageView!
    
    @IBOutlet var p10 : UIImageView!
    @IBOutlet var p11 : UIImageView!
    @IBOutlet var p12 : UIImageView!
    @IBOutlet var p13 : UIImageView!
    @IBOutlet var p14 : UIImageView!
    @IBOutlet var p15 : UIImageView!
    @IBOutlet var p16 : UIImageView!
    @IBOutlet var p17 : UIImageView!
    
    @IBOutlet var p20 : UIImageView!
    @IBOutlet var p21 : UIImageView!
    @IBOutlet var p22 : UIImageView!
    @IBOutlet var p23 : UIImageView!
    @IBOutlet var p24 : UIImageView!
    @IBOutlet var p25 : UIImageView!
    @IBOutlet var p26 : UIImageView!
    @IBOutlet var p27 : UIImageView!
    
    @IBOutlet var p30 : UIImageView!
    @IBOutlet var p31 : UIImageView!
    @IBOutlet var p32 : UIImageView!
    @IBOutlet var p33 : UIImageView!
    @IBOutlet var p34 : UIImageView!
    @IBOutlet var p35 : UIImageView!
    @IBOutlet var p36 : UIImageView!
    @IBOutlet var p37 : UIImageView!
    
    @IBOutlet var p40 : UIImageView!
    @IBOutlet var p41 : UIImageView!
    @IBOutlet var p42 : UIImageView!
    @IBOutlet var p43 : UIImageView!
    @IBOutlet var p44 : UIImageView!
    @IBOutlet var p45 : UIImageView!
    @IBOutlet var p46 : UIImageView!
    @IBOutlet var p47 : UIImageView!

    @IBOutlet var p50 : UIImageView!
    @IBOutlet var p51 : UIImageView!
    @IBOutlet var p52 : UIImageView!
    @IBOutlet var p53 : UIImageView!
    @IBOutlet var p54 : UIImageView!
    @IBOutlet var p55 : UIImageView!
    @IBOutlet var p56 : UIImageView!
    @IBOutlet var p57 : UIImageView!
    
    @IBOutlet var p60 : UIImageView!
    @IBOutlet var p61 : UIImageView!
    @IBOutlet var p62 : UIImageView!
    @IBOutlet var p63 : UIImageView!
    @IBOutlet var p64 : UIImageView!
    @IBOutlet var p65 : UIImageView!
    @IBOutlet var p66 : UIImageView!
    @IBOutlet var p67 : UIImageView!
    
    @IBOutlet var p70 : UIImageView!
    @IBOutlet var p71 : UIImageView!
    @IBOutlet var p72 : UIImageView!
    @IBOutlet var p73 : UIImageView!
    @IBOutlet var p74 : UIImageView!
    @IBOutlet var p75 : UIImageView!
    @IBOutlet var p76 : UIImageView!
    @IBOutlet var p77 : UIImageView!
    
    var positions : [[(UIImageView, Piece?)]] = []
    var occupancy : [[Bool]] = []
    var pieces : [Piece] = []
    var playerPosition : (Int, Int) = (0,0) //y,x
    var gameOver : Bool = false
    var timer : Timer?
    var pause : Bool = false
    //var seconds : Int = 60
    var spawnDelay = 8 // 8 = 4secs
    
    @IBAction func swipeRight(sender: UISwipeGestureRecognizer) {
        if !gameOver{
            if playerPosition.1 < 7 {
                updatePlayerPiece(to: (playerPosition.0, playerPosition.1 + 1))
            }
        }
    }
    @IBAction func swipeLeft(sender: UISwipeGestureRecognizer) {
        if !gameOver{
            if playerPosition.1 > 0 {
                updatePlayerPiece(to: (playerPosition.0, playerPosition.1 - 1))
            }
        }
    }
    @IBAction func swipeUp(sender: UISwipeGestureRecognizer) {
        if !gameOver{
            if playerPosition.0 > 0 {
                updatePlayerPiece(to: (playerPosition.0 - 1, playerPosition.1))
            }
        }
    }
    @IBAction func swipeDown(sender: UISwipeGestureRecognizer) {
        if !gameOver{
            if playerPosition.0 < 7 {
                updatePlayerPiece(to: (playerPosition.0 + 1, playerPosition.1))
            }
        }
    }
    
    func updatePlayerPiece(to: (Int, Int)){ //to: y x           erase current, move to next if open
        positions[playerPosition.0][playerPosition.1].0.image = UIImage(named: "transparentSquare")
        if positions[to.0][to.1].1 == nil {
            occupancy[playerPosition.0][playerPosition.1] = false //phase out occupancy
            positions[to.0][to.1].0.image = UIImage(named: "playerRedDot")
            playerPosition = to
            print(playerPosition)
        }
        else {
            gameOver = true
        }
    }
    
    
    //ENEMY LOGIC
    
    
    
    func spawnEnemy() -> Bool{
        var attempts : Int = 0
        while attempts < 5 {                //try 5 times to look for spawn spot, coin flip for side
            let direction = Bool.random() == true ? "right" : "left"
            let x = direction == "right" ? 0 : 7
            let color : Character = direction == "right" ? "w" : "b"
            let y = Int.random(in: 0...7)
            var imageName : String = ""
            if positions[y][x].1 == nil {
                var pieceType : String = ""
                switch Int.random(in: 0 ... 499){
                case 0...499:
                    pieceType = "Pawn"
                    imageName = direction == "right" ? "wPawn" : "bPawn"
                case 500...624:
                    pieceType = "Rook"
                case 625...749:
                    pieceType = "Knight"
                case 750...874:
                    pieceType = "Bishop"
                case 875...938:
                    pieceType = "Queen"
                default:
                    pieceType = "King"
                }
                let newPiece : Piece = Piece(type: pieceType, direction: direction, positionX: x, positionY: y, color: color)
                pieces.append(newPiece)
                positions[newPiece.pY][newPiece.pX].0.image = UIImage(named: String(color) + pieceType)
                positions[newPiece.pY][newPiece.pX].1 = newPiece
                return true
            }
            else {
                attempts += 1
            }
        }
        return false
    }
    
    func checkMove(piece: Piece) -> Bool{   //check moves, handles delays
        switch piece.pieceType{
        case "Pawn":
            if piece.delay >= 4 {
                piece.delay = 0
                return movePawn(piece: piece)
            }
            else {
                piece.delay += 1
                return false
            }
        case "Rook":
            if piece.delay >= 3 {
                piece.delay = 0
                moveRook(piece: piece)
            }
            else {
                piece.delay += 1
            }
        case "Knight":
            if piece.delay >= 2 {
                piece.delay = 0
                moveKnight(piece: piece)
            }
            else {
                piece.delay += 1
            }
        case "Bishop":
            if piece.delay >= 2 {
                piece.delay = 0
                moveBishop(piece: piece)
            }
            else {
                piece.delay += 1
            }
        case "King":
            if piece.delay >= 4 {
                piece.delay = 0
                moveKing(piece: piece)
            }
            else {
                piece.delay += 1
            }
        case "Queen":
            if piece.delay >= 1 {
                piece.delay = 0
                moveQueen(piece: piece)
            }
            else {
                piece.delay += 1
            }
        default:
            print("invalid piece")
            
        }
        return false
    }
    func movePawn(piece: Piece) -> Bool{        //pawn movement
        if piece.direction == "right"{ //move right
            if piece.pX < 7 {
                if piece.pY > 0 && positions[piece.pY - 1][piece.pX + 1].1 != nil &&
                    positions[piece.pY - 1][piece.pX + 1].1?.color != piece.color {   //check for diagonal top take
                    //remove taken piece
                    destroyPiece(atX: piece.pX + 1, atY: piece.pY - 1)
                    //clear current square
                    positions[piece.pY][piece.pX].0.image = UIImage(named: "transparentSquare")
                    positions[piece.pY][piece.pX].1 = nil
                    //move piece to new square
                    piece.pX += 1
                    piece.pY -= 1
                    positions[piece.pY][piece.pX].0.image = UIImage(named: "wPawn")
                    positions[piece.pY][piece.pX].1 = piece
                    print("w toptake b", piece.pX - 1, " ", piece.pY + 1, " to ", piece.pX, " ", piece.pY)
                    return true
                }
                else if piece.pY < 7 && positions[piece.pY + 1][piece.pX + 1].1 != nil &&
                    positions[piece.pY + 1][piece.pX + 1].1?.color != piece.color {   //check for diagonal bot take
                    destroyPiece(atX: piece.pX + 1, atY: piece.pY + 1)
                    positions[piece.pY][piece.pX].0.image = UIImage(named: "transparentSquare")
                    positions[piece.pY][piece.pX].1 = nil
                    piece.pX += 1
                    piece.pY += 1
                    positions[piece.pY][piece.pX].0.image = UIImage(named: "wPawn")
                    positions[piece.pY][piece.pX].1 = piece
                    print("w bottake b", piece.pX - 1, " ", piece.pY - 1, " to ", piece.pX, " ", piece.pY)
                    return true
                }
                else if positions[piece.pY][piece.pX + 1].1 == nil{ //open space ahead
                    positions[piece.pY][piece.pX].0.image = UIImage(named: "transparentSquare")
                    positions[piece.pY][piece.pX].1 = nil
                    piece.pX += 1
                    positions[piece.pY][piece.pX].0.image = UIImage(named: "wPawn")
                    positions[piece.pY][piece.pX].1 = piece
                    print("w forward", piece.pX - 1, " ", piece.pY, " to ", piece.pX, " ", piece.pY)
                    return true
                }
                else{ //could not move
                    return false
                }
            }
            else {  //reached the end, destroy
                positions[piece.pY][piece.pX].0.image = UIImage(named: "transparentSquare")
                positions[piece.pY][piece.pX].1 = nil
                destroyPiece(atX: piece.pX, atY: piece.pY)
                return true
            }
        }
        else { //move left
            if piece.pX > 0{
                if piece.pY > 0 && positions[piece.pY - 1][piece.pX - 1].1 != nil &&
                    positions[piece.pY - 1][piece.pX - 1].1?.color != piece.color {   //check for diagonal top take
                    destroyPiece(atX: piece.pX - 1, atY: piece.pY - 1)
                    positions[piece.pY][piece.pX].0.image = UIImage(named: "transparentSquare")
                    positions[piece.pY][piece.pX].1 = nil
                    piece.pX -= 1
                    piece.pY -= 1
                    positions[piece.pY][piece.pX].0.image = UIImage(named: "bPawn")
                    positions[piece.pY][piece.pX].1 = piece
                    print("b toptake w", piece.pX + 1, " ", piece.pY + 1, " to ", piece.pX, " ", piece.pY)
                    return true
                }
                else if piece.pY < 7 && positions[piece.pY + 1][piece.pX - 1].1 != nil &&
                    positions[piece.pY + 1][piece.pX - 1].1?.color != piece.color {   //check for diagonal bot take
                    destroyPiece(atX: piece.pX - 1, atY: piece.pY + 1)
                    positions[piece.pY][piece.pX].0.image = UIImage(named: "transparentSquare")
                    positions[piece.pY][piece.pX].1 = nil
                    piece.pX -= 1
                    piece.pY += 1
                    positions[piece.pY][piece.pX].0.image = UIImage(named: "bPawn")
                    positions[piece.pY][piece.pX].1 = piece
                    print("b bottake w", piece.pX + 1, " ", piece.pY - 1, " to ", piece.pX, " ", piece.pY)
                    return true
                }
                else if positions[piece.pY][piece.pX - 1].1 == nil{ //open space ahead
                    positions[piece.pY][piece.pX].0.image = UIImage(named: "transparentSquare")
                    positions[piece.pY][piece.pX].1 = nil
                    /*if piece.pX == 7 {  //can jump 2 at starting position
                        if positions[piece.pY][piece.pX - 2].1 == nil{
                            piece.pX -= Bool.random() == true ? 1 : 0
                        }
                    }*/
                    piece.pX -= 1
                    positions[piece.pY][piece.pX].0.image = UIImage(named: "bPawn")//bPawn
                    positions[piece.pY][piece.pX].1 = piece
                    print("b forward", piece.pX + 1, " ", piece.pY, " to ", piece.pX, " ", piece.pY)
                    return true
                }
                else{ //could not move
                    return false
                }
            }
            else {  //reached the end, destroy
                positions[piece.pY][piece.pX].0.image = UIImage(named: "transparentSquare")
                positions[piece.pY][piece.pX].1 = nil
                destroyPiece(atX: piece.pX, atY: piece.pY)
                return true
            }
        }
    }
    func moveRook(piece: Piece){
        //choose direction (maybe no back)
    }
    func moveKnight(piece: Piece){
        
    }
    func moveBishop(piece: Piece){
        
    }
    func moveKing(piece: Piece){
        
    }
    func moveQueen(piece: Piece){
        
    }
    func destroyPiece(atX: Int, atY:Int){
        //remove from array
        if let index = pieces.firstIndex(where: {$0.pX == atX && $0.pY == atY}){
            print("destroy: ", pieces[index].color, " ", atX, " ", atY, "count: ", pieces.count)
            pieces.remove(at: index)
        }
    }
    
    
    
    
    
    
    
    
    @objc func tick() -> Void{
        if pause{
            return
        }
        var moved = false
        for enemy in pieces {               //move pieces[]
            if !moved{
                moved = checkMove(piece: enemy)
            }
        }
        if spawnDelay == 0{                 //spawn enemy if spawn delay is 0, bump back up
            if spawnEnemy(){                //else decrease it
                spawnDelay = 10
            }
        }
        else {
            spawnDelay -= 1
            print(spawnDelay,"   count:",pieces.count)
        }
        //print("tick")
        printPositions()
    }
    func updateBoard(){
        
    }
    func speedUp(){
    }
    func printPositions(){
        print("  01234567")
        for y in 0...7{
            var output : String = ""
            for x in 0...7{
                if positions[y][x].1 == nil{
                    output += "-"
                }
                else{
                    output += String(positions[y][x].1!.color)
                }
            }
            print(y,output)
        }
    }
    @IBAction func testTick(){
        tick()
    }
    @IBAction func pauseButton(){
        pause = !pause
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        positions = [
            [(p00, nil), (p01, nil), (p02, nil), (p03, nil), (p04, nil), (p05, nil), (p06, nil), (p07, nil)],
            [(p10, nil), (p11, nil), (p12, nil), (p13, nil), (p14, nil), (p15, nil), (p16, nil), (p17, nil)],
            [(p20, nil), (p21, nil), (p22, nil), (p23, nil), (p24, nil), (p25, nil), (p26, nil), (p27, nil)],
            [(p30, nil), (p31, nil), (p32, nil), (p33, nil), (p34, nil), (p35, nil), (p36, nil), (p37, nil)],
            [(p40, nil), (p41, nil), (p42, nil), (p43, nil), (p44, nil), (p45, nil), (p46, nil), (p47, nil)],
            [(p50, nil), (p51, nil), (p52, nil), (p53, nil), (p54, nil), (p55, nil), (p56, nil), (p57, nil)],
            [(p60, nil), (p61, nil), (p62, nil), (p63, nil), (p64, nil), (p65, nil), (p66, nil), (p67, nil)],
            [(p70, nil), (p71, nil), (p72, nil), (p73, nil), (p74, nil), (p75, nil), (p76, nil), (p77, nil)]
        ]
        occupancy = [
            [false, false, false, false, false, false, false, false],
            [false, false, false, false, false, false, false, false],
            [false, false, false, false, false, false, false, false],
            [false, false, false, false, false, false, false, false],
            [false, false, false, false, false, false, false, false],
            [false, false, false, false, false, false, false, false],
            [false, false, false, false, false, false, false, false],
            [false, false, false, false, false, false, false, false]
        ]
        playerPosition = (4,4)
        positions[playerPosition.0][playerPosition.1].0.image = UIImage(named: "playerRedDot")

        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [weak self] in
            self?.timer = Timer.scheduledTimer(timeInterval: 0.05, target:self, selector:#selector(self?.tick), userInfo:nil, repeats:true)
            
        }
        
    }

}

