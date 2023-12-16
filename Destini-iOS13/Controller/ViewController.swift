
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

    
    func showToast(message : String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }

      func resetGame() {
        userPosition = 0 
        updateUI() 
    }

    func gameOver() {
        let gameOverVC = GameOverViewController()
        gameOverVC.modalPresentationStyle = .fullScreen
        gameOverVC.dismissalHandler = { [weak self] in
            self?.resetGame()
        }
        self.present(gameOverVC, animated: true, completion: nil)
    }

    
    
    var storyMap: [Int: [Int]] = [
        0: [1, 2],
        1: [3, 4],
        2: [5, 6],
        3: [7, 8],
        4: [9, 10],
        5: [11, 12]
        
    ]

    
    func updateUI() {
        
           guard userPosition < story.count else {
            showToast(message: "Game Over")
            gameOver() 
            return
        }
        
        
        let currentStory = story[userPosition]
        storyLabel.text = currentStory.title
        
        
        if !currentStory.choice1.isEmpty {
            choice1Button.setTitle(currentStory.choice1, for: .normal)
        }
        
        
        if !currentStory.choice2.isEmpty {
            choice2Button.setTitle(currentStory.choice2, for: .normal)
        }
    }

    
    @IBAction func choiceMade(_ sender: UIButton) {
        
        guard let nextSteps:[Int] = storyMap[userPosition] else {
            
            return
        }
        
        
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

class GameOverViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        
        let startAgainButton = UIButton(type: .system)
        startAgainButton.setTitle("Start Again", for: .normal)
        startAgainButton.addTarget(self, action: #selector(startAgainTapped), for: .touchUpInside)
        
        
        startAgainButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startAgainButton)
        NSLayoutConstraint.activate([
            startAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startAgainButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startAgainButton.widthAnchor.constraint(equalToConstant: 200),
            startAgainButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    var dismissalHandler: (() -> Void)?

    @objc func startAgainTapped() {
        dismiss(animated: true) {
            self.dismissalHandler?()
        }
    }
    
}
