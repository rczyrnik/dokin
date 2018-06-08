//https://www.appcoda.com/spritekit-introduction/

import UIKit
import SpriteKit
import AVFoundation
 
class GameViewController: UIViewController {

    @IBOutlet weak var boopsLabel: UILabel!
    var numberOfClicks = 0;
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        let scene = GameScene(size: view.frame.size)
        let skView = view as! SKView
        skView.presentScene(scene)
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

     @IBAction func clickedButton(_ sender: Any) {
        // Runs when the button is pressed
        numberOfClicks = numberOfClicks + 1;
//        boopsLabel.text = "Number of Clicks: " + String(numberOfClicks)
        playSound()
    }
 
}
