// Importing UIKit framework
import UIKit

// Defining a ViewController class that inherits from UIViewController
class ViewController: UIViewController {

    // IBOutlet properties for UI elements
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    // Variable to keep track of user's position in the story
    var userPosition: Int = 0
    
    // Array of Story objects
    let story = [
        Story(title: "You see a fork in the road.", choice1: "Take a left.", choice2: "Take a right."),
        Story(title: "You see a tiger.", choice1: "Shout for help.", choice2: "Play dead."),
        Story(title: "You find a treasure chest", choice1: "Open it.", choice2: "Check for traps."),
        Story(title: "You encounter a friendly wizard.", choice1: "Ask for a spell.", choice2: "Ignore him."),
        Story(title: "You come across a river.", choice1: "Build a raft.", choice2: "Swim across."),
        Story(title: "You see a castle in the distance.", choice1: "Approach the castle.", choice2: "Continue on your path.")
    ]
    
    // Dictionary to map user positions to next steps
    var storyMap: [Int: [Int]] = [
        0: [1, 2],
        1: [3, 4],
        2: [5, 6],
        3: [7, 8],
        4: [9, 10],
        5: [11, 12]
        // Add more mappings as needed
    ]

    // Function to update the UI based on the user's position
    func updateUI() {
        // Check if userPosition is within the bounds of the story array
        guard userPosition < story.count else {
            // Show an error or a default story
            return
        }
        
        // Get the current story based on userPosition
        let currentStory = story[userPosition]
        storyLabel.text = currentStory.title
        
        // Set the title of choice1Button if it is not empty
        if !currentStory.choice1.isEmpty {
            choice1Button.setTitle(currentStory.choice1, for: .normal)
        }
        
        // Set the title of choice2Button if it is not empty
        if !currentStory.choice2.isEmpty {
            choice2Button.setTitle(currentStory.choice2, for: .normal)
        }
    }

    // Action method called when a choice button is tapped
    @IBAction func choiceMade(_ sender: UIButton) {
        // Get the next steps based on userPosition from the storyMap dictionary
        guard let nextSteps = storyMap[userPosition] else {
            // Show an error or a default story
            return
        }
        
        // Update userPosition based on the button tapped
        if sender == choice1Button {
            userPosition = nextSteps[0]
        } else {
            userPosition = nextSteps[1]
        }

        // Update the UI based on the new userPosition
        updateUI()
    }
    
    // Called after the controller's view is loaded into memory
    override func viewDidLoad() {
        super.viewDidLoad()
        // Update the initial UI
        updateUI()
    }
}