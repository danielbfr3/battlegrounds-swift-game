//
//  ViewController.swift
//  battlegrounds
//
//  Created by Daniel Boga on 06/05/16.
//  Copyright © 2016 Daniel Boga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playerOneAttackButton: UIButton!
    @IBOutlet weak var playerOneAttackLabel: UILabel!
    @IBOutlet weak var playerTwoAttackButton: UIButton!
    @IBOutlet weak var playerTwoAttackLabel: UILabel!
    @IBOutlet weak var gameMessageBoard: UILabel!
    @IBOutlet weak var playerOrc: UIImageView!
    @IBOutlet weak var playerCenturion: UIImageView!
    
    var messageToPlayers: String {
        get {
            if let text = gameMessageBoard.text {
                return text
            } else {
                return "No message"
            }
        }
        set {
            gameMessageBoard.text = newValue
        }
    }
    
    var playerOne: Orc = Orc()
    var playerTwo: Centurion = Centurion()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPlayerOneAttackButtonPressed(sender: UIButton) {
        playerTwo.recieveAttack(playerOne.attackPower)
        if playerTwo.isAlive {
            messageToPlayers = "The Centurion received a attack and has \(playerTwo.hp) HP"
        } else {
            messageToPlayers = "The Centurion is dead! Orc win!"
            restartGame()
        }
    }
    
    @IBAction func onPlayerTwoAttackButtonPressed(sender: UIButton) {
        playerOne.recieveAttack(playerTwo.attackPower)
        if playerOne.isAlive {
            messageToPlayers = "The Orc received a attack and has \(playerOne.hp) HP"
        } else {
            messageToPlayers = "The Orc is dead! Centurion win!"
            restartGame()
        }
    }
    
    func restartGame() {
        playerOneAttackLabel.hidden = true
        playerOneAttackButton.hidden = true
        playerOrc.hidden = true
        playerTwoAttackLabel.hidden = true
        playerTwoAttackButton.hidden = true
        playerCenturion.hidden = true
        
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.createCharacters), userInfo: nil, repeats: false)
    }
    
    func createCharacters() {
        playerOne.ressurect()
        playerTwo.ressurect()
        
        playerOneAttackLabel.hidden = false
        playerOneAttackButton.hidden = false
        playerOrc.hidden = false
        playerTwoAttackLabel.hidden = false
        playerTwoAttackButton.hidden = false
        playerCenturion.hidden = false
        
        messageToPlayers = "Attack your enemy!"
    }


}

