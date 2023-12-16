// Importing the UIKit framework for building the user interface.
import UIKit

// import GameOverViewController


// ViewController class inheriting from UIViewController.
class ViewController: UIViewController {

    // UI element connections from storyboard.
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!

    // Variable to keep track of the user's position in the story.
    var userPosition: Int = 0


    func showToast(message : String) {
        // Creating a UILabel for the toast.
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        // Animation for fading out the toast message.
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }

    // Function to reset the game.
    func resetGame() {
        userPosition = 0
        updateUI()
    }

    // Function to handle the game over scenario.
    func gameOver() {
        // Creating an instance of the GameOverViewController.
        let gameOverVC: GameOverViewController = GameOverViewController()
        gameOverVC.modalPresentationStyle = .overCurrentContext
        gameOverVC.dismissalHandler = { [weak self] in
            self?.resetGame()
        }
        self.present(gameOverVC, animated: true, completion: nil)
    }

   
    // Function to update the user interface.
    func updateUI() {
        // Check if the user position is within the story array.
        guard userPosition < story.count else {
            showToast(message: "Game Over")
            gameOver()
            return
        }

        // Update the UI elements with the current story details.
        let currentStory = story[userPosition]
        storyLabel.text = currentStory.title

        if !currentStory.choice1.isEmpty {
            choice1Button.setTitle(currentStory.choice1, for: .normal)
        }

        if !currentStory.choice2.isEmpty {
            choice2Button.setTitle(currentStory.choice2, for: .normal)
        }
    }

    // Action handler for choice buttons.
    @IBAction func choiceMade(_ sender: UIButton) {
        // Get the next steps for the current user position.
        guard let nextSteps:[Int] = storyMap[userPosition] else {
            return
        }

        // Update the user position based on the button pressed.
        if sender == choice1Button {
            userPosition = nextSteps[0]
        } else {
            userPosition = nextSteps[1]
        }

        // Call updateUI to refresh the screen with the new story part.
        updateUI()
    }

    // Called after the view controller’s view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initial UI setup.
        updateUI()
    }
}

