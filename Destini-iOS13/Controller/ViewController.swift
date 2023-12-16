import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var userPosition: Int = 0
    
    let story = [
        Story(title: "You see a fork in the road.", choice1: "Take a left.", choice2: "Take a right."),
        Story(title: "You see a tiger.", choice1: "Shout for help.", choice2: "Play dead."),
        Story(title: "You find a treasure chest", choice1: "Open it.", choice2: "Check for traps.")
    ]

    // New: Map to manage the storyline based on choices
    var storyMap: [Int: [Int]] = [
        0: [1, 2], // From first story, left goes to 1, right goes to 2
        1: [3, 4], // Additional stories can be added here
        2: [5, 6], // And here
        // Add more mappings as needed
    ]

    func updateUI() {
        storyLabel.text = story[userPosition].title
        choice1Button.setTitle(story[userPosition].choice1, for: .normal)
        choice2Button.setTitle(story[userPosition].choice2, for: .normal)
    }

    @IBAction func choiceMade(_ sender: UIButton) {
         let nextSteps: [Int] = storyMap[userPosition] ?? [0, 0]
            if sender == choice1Button {
                userPosition = nextSteps[0]
            } else {
                userPosition = nextSteps[1]
            }


        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
}
