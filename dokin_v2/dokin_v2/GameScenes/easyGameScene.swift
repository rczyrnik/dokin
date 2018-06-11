//
//  GameScene.swift
//  dokin_v2
//
//  Created by Gandalf Fluffernutter on 6/10/18.
//  Copyright © 2018 Gandalf. All rights reserved.
//

import SpriteKit
//import GameplayKit

class easyGameScene: SKScene {
    
   // keep track of presses for scoring
    var numberOfPresses = 0;
    var numberOfCorrectPresses = 0;
    var treatString = " treat so far!"
    
    // position of the box (default to 1)
    var x_box_position = 1
    var y_box_position = 1

    // object representing the box he will be touching
    var target_box = SKSpriteNode(color:.white,size:CGSize(width: 1000, height : 1000))
    
    // object represeting the text that will tell us the score
    var label = SKLabelNode(text: "Press for Treats!")

    // object represnting return to home
    var exit_box = SKSpriteNode(color:.red,size:CGSize(width: 20, height : 20))
    
    override func didMove(to view: SKView) {
        x_box_position = Int(view.frame.width / 2)
        y_box_position = Int(view.frame.height / 2)
        target_box.size.height = view.frame.height
        target_box.size.width = view.frame.width-60
        target_box.position = CGPoint(x: x_box_position, y: y_box_position)
        target_box.name = "target_box"
        addChild(target_box)
        
        label.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 20)
        label.fontColor = SKColor.red
        addChild(label)
        
        x_box_position = Int(view.frame.width - exit_box.size.width)
        y_box_position = Int(view.frame.height - exit_box.size.height)
        exit_box.position = CGPoint(x: x_box_position, y: y_box_position)
        addChild(exit_box)
        
    }
    
    func touchDown() {
        self.run(SKAction.playSoundFileNamed("KnifeClicker.wav", waitForCompletion: false))
        numberOfPresses += 1
        if numberOfPresses > 1 {treatString = " treats so far!"}
        label.text = String(numberOfPresses) + treatString
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        if let name = touchedNode.name {
            if name == "target_box" {
                touchDown()
            } else if name == "exit_box" {
                let scene = SKScene(fileNamed: "MenuScene")
                scene?.scaleMode = .aspectFill
                view?.presentScene(scene)
            }
            
        }
    }
}
