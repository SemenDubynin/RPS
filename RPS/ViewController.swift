//
//  ViewController.swift
//  RPS
//
//  Created by Дубынин Семён on 03.06.2020.
//  Copyright © 2020 Дубынин Семён. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var robotButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playAgainButton.isHidden = true
    }
    func play(_ sign: Sign) {
        let computerSign = randomSign()
        robotButton.setTitle(computerSign.emoji, for: .normal)
        
        switch sign {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            paperButton.isHidden = false
            rockButton.isHidden =  true
            scissorsButton.isHidden = true
        case .scissors:
            scissorsButton.isHidden = false
            rockButton.isHidden = true
            paperButton.isHidden = true
        }
        playAgainButton.isHidden = false
        
        let result = sign.getResult(computerSign)
        switch result {
        case .win:
            statusLabel.text = "You Win!"
            self.view.backgroundColor = UIColor.green
        case .lose:
            statusLabel.text = "You  lose!"
            self.view.backgroundColor = UIColor.red
        case .draw:
            statusLabel.text = "Draw!"
            self.view.backgroundColor = UIColor.yellow
        case .start:
            reset()
        }
    }
    
    func reset() {
        statusLabel.text = "Rock - Paper - Scissors"
        self.view.backgroundColor = UIColor.white
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        playAgainButton.isHidden = true
    }
    // MARK: - IBAction
    
    @IBAction func rockButtonPressed(_ sender: Any) {
        play(.rock)
    }
    @IBAction func paperButtonPressed(_ sender: Any) {
        play(.paper)
    }
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        play(.scissors)
    }
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        reset()
    }
}

