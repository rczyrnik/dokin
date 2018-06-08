import SpriteKit
import AVFoundation

class GameScene: SKScene {

    // some random stuff
    @IBOutlet weak var boopsLabel: UILabel!
    var player: AVAudioPlayer?
    
    // keep track of presses for scoring
    var numberOfPresses = 0;
    var numberOfCorrectPresses = 0;
    
    // position of the box (default to 1)
    var x_box_position = 1
    var y_box_position = 1

    // object representing the box he will be touching
    var box_size = 1000
    var box = SKSpriteNode(color:.white,size:CGSize(width: 1000, height : 1000))
    
    // object represeting the text that will tell us the score
    var label = SKLabelNode(text: "Press for Treats!")
    
    // function telling
    override func didMove(to view: SKView) {
        x_box_position = Int(view.frame.width / 2)
        y_box_position = Int(view.frame.height / 2)
        box.position = CGPoint(x: x_box_position, y: y_box_position)
        addChild(box)
        
        label.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 20)
        label.fontColor = SKColor.red
        addChild(label)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(swipe))
        view.addGestureRecognizer(recognizer)
    }
    
     func playSound() {
        let url = Bundle.main.url(forResource: "KnifeClicker", withExtension: "wav")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func swipe(recognizer: UIGestureRecognizer) {
        // need for random placement, should be earlier and once :/
        let int_width = UInt32(view!.frame.width)

        let int_height = UInt32(view!.frame.height)

        
        
        // get position of the touch
        let viewLocation = recognizer.location(in: view)
        let sceneLocation = convertPoint(fromView: viewLocation)
        let x_touch = Int(sceneLocation.x)
        let y_touch = Int(sceneLocation.y)
        
        let half_width = Int(box.size.width/2)
        let half_height = Int(box.size.height/2)
        if (x_touch > x_box_position-half_width) && (x_touch < x_box_position+half_width) && (y_touch > y_box_position-half_height) && (y_touch < y_box_position+half_height)
        {
            // play sound, increment the counter and display
            numberOfPresses += 1
            label.text = String(numberOfPresses)
            playSound()
            
            // create and move to new position
            x_box_position = Int(arc4random_uniform(int_width))
            y_box_position = Int(arc4random_uniform(int_height))
            let randomLocation = CGPoint(x: x_box_position, y: y_box_position)
            let moveToAction = SKAction.move(to: randomLocation, duration: 0.1)
            box.run(moveToAction)
        }
        
        //not used at the moment
        if box.size.width > 1000 {
        box.size.width = box.size.width-10
        box.size.height = box.size.height-10
        }

    }
    
}
