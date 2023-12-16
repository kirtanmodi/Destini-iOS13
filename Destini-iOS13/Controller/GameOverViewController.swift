
class GameOverViewController: UIViewController {
    // Called after the view controller’s view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Create and configure the 'Start Again' button.
        let startAgainButton = UIButton(type: .system)
        startAgainButton.setTitle("Start Again", for: .normal)
        startAgainButton.addTarget(self, action: #selector(startAgainTapped), for: .touchUpInside)

        // Setting up the constraints for the button.
        startAgainButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startAgainButton)
        NSLayoutConstraint.activate([
            startAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startAgainButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startAgainButton.widthAnchor.constraint(equalToConstant: 200),
            startAgainButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    // Closure to handle the dismissal of the view controller.
    var dismissalHandler: (() -> Void)?

    // Function called when 'Start Again' button is tapped.
    @objc func startAgainTapped() {
        // Dismiss the view controller and call the dismissal handler.
        dismiss(animated: true) {
            self.dismissalHandler?()
        }
    }
}