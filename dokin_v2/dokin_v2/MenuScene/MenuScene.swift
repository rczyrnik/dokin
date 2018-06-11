//
//  MenuScene.swift
//  dokin_v2
//
//  Created by Gandalf Fluffernutter on 6/10/18.
//  Copyright © 2018 Gandalf. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {

    var easyGameButtonNode: SKSpriteNode!
    
//    override func didMove(to view: SKView) {
////        easyGameButtonNode = self.childNode(withName: "easyGameButton") as! SKSpriteNode
////        mediumGameButtonNode = self.childNode(withName: "mediumGameButton") as! SKSpriteNode
////        hardGameButtonNode = self.childNode(withName: "hardGameButton") as! SKSpriteNode
//
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        if let location = touch?.location(in: self) {
            let nodesArray = self.nodes(at: location)
            
            if nodesArray.first?.name == "easyGameButton" {
                let gameScene = easyGameScene(size: self.size)
                let transition = SKTransition.fade(withDuration: 0.1)
                self.view?.presentScene(gameScene, transition: transition)
            }
            if nodesArray.first?.name == "mediumGameButton" {
                let gameScene = mediumGameScene(size: self.size)
                let transition = SKTransition.fade(withDuration: 0.1)
                self.view?.presentScene(gameScene, transition: transition)
            }
            if nodesArray.first?.name == "hardGameButton" {
                let gameScene = hardGameScene(size: self.size)
                let transition = SKTransition.fade(withDuration: 0.1)
                self.view?.presentScene(gameScene, transition: transition)
            }
            
        }
    }
    
}
