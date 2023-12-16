import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var userPosition: Int = 0
    
    let story = [
        Story(title: "You see a fork in the road.", choice1: "Take a left.", choice2: "Take a right."),
        Story(title: "You see a tiger.", choice1: "Shout for help.", choice2: "Play dead."),
        Story(title: "You find a treasure chest", choice1: "Open it.", choice2: "Check for traps."),
        Story(title: "You encounter a friendly wizard.", choice1: "Ask for a spell.", choice2: "Ignore him."),
        Story(title: "You come across a river.", choice1: "Build a raft.", choice2: "Swim across."),
        Story(title: "You see a castle in the distance.", choice1: "Approach the castle.", choice2: "Continue on your path.")
    ]
    var storyMap: [Int: [Int]] = [
        0: [1, 2],
        1: [3, 4],
        2: [5, 6],
        3: [7, 8],
        4: [9, 10],
        5: [11, 12]
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
