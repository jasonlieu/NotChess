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
    
    var positions : [[UIImageView]] = []
    var occupancy : [[Bool]] = []
    var pieces : [Piece] = []
    var playerPosition : (Int, Int) = (0,0) //y,x
    var gameOver : Bool = false
    var timer : Timer?
    var seconds : Int = 60
    
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
    
    func updatePlayerPiece(to: (Int, Int)){ //to: y x
        positions[playerPosition.0][playerPosition.1].image = UIImage(named: "transparentSquare")
        if occupancy[to.0][to.1] == false {
            occupancy[playerPosition.0][playerPosition.1] = false
            positions[to.0][to.1].image = UIImage(named: "playerRedDot")
            playerPosition = to
            print(playerPosition)
        }
        else {
            gameOver = true
        }
    }
    @objc func tick() -> Void{
        print(1)
    }
    func updateBoard(){
        
    }
    func speedUp(){
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        positions = [
            [p00, p01, p02, p03, p04, p05, p06, p07],
            [p10, p11, p12, p13, p14, p15, p16, p17],
            [p20, p21, p22, p23, p24, p25, p26, p27],
            [p30, p31, p32, p33, p34, p35, p36, p37],
            [p40, p41, p42, p43, p44, p45, p46, p47],
            [p50, p51, p52, p53, p54, p55, p56, p57],
            [p60, p61, p62, p63, p64, p65, p66, p67],
            [p70, p71, p72, p73, p74, p75, p76, p77]
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
        positions[playerPosition.0][playerPosition.1].image = UIImage(named: "playerRedDot")
        occupancy[playerPosition.0][playerPosition.1] = true
        if(timer == nil)
        {
            timer = Timer.scheduledTimer(timeInterval: 0.5, target:self, selector:#selector(tick), userInfo:nil, repeats:true)
        }
    }

}

