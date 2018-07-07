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
//    var screen_width = view.frame.width
//    var screen_height = 1000
    var target_box = SKSpriteNode(color:.white,size:CGSize(width: 100, height : 100))
    
    // object represeting the text that will tell us the score
    var label = SKLabelNode(text: "Press for Treats!")

    // object represnting return to home
    var exit_box = SKSpriteNode(color:.red,size:CGSize(width: 40, height : 40))
    
    let my_blue = UIColor(red: 0, green: 162/255, blue: 1, alpha: 1)

    override func didMove(to view: SKView) {
        x_box_position = Int(self.frame.width / 2)
        y_box_position = Int(self.frame.height / 2)
        target_box.size.height = self.frame.height
        target_box.size.width = self.frame.width
        target_box.position = CGPoint(x: x_box_position, y: y_box_position)
        target_box.name = "target_box"
        target_box.color = my_blue
        addChild(target_box)
        
        label.position = CGPoint(x: self.frame.width / 4, y: self.frame.height-40)
        label.fontColor = SKColor.black
        label.fontName = "AvenirNext-Bold"
        
        addChild(label)
        
        x_box_position = Int(self.frame.width - exit_box.size.width+10)
        y_box_position = Int(self.frame.height - exit_box.size.height+10)
        exit_box.texture = SKTexture(imageNamed: "home_black")

        exit_box.position = CGPoint(x: x_box_position, y: y_box_position)
        exit_box.name = "exit_box"
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
