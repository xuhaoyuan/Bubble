import UIKit

class GameOverViewController: UIViewController, GameOverViewDelegate {

    private weak var delegate: GameOverViewControllerDelegate?
    private let scoreNumber: Int

    init(score: Int, delegate: GameOverViewControllerDelegate?) {
        self.scoreNumber = score
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .custom
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = GameOverView(score: scoreNumber, delegate: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: GameOverViewDelegate

    func gameOverViewDidTapRetry(_ gameOverView: GameOverView) {
        dismiss(animated: true) {
            self.delegate?.gameOverViewControllerDidTapRetry(self)
        }
    }

    func gameOverViewDidTapQuit(_ gameOverView: GameOverView) {
        dismiss(animated: true) {
            self.delegate?.gameOverViewControllerDidTapQuit(self)
        }
    }
}

// MARK: - Delegate

protocol GameOverViewControllerDelegate: AnyObject {
    func gameOverViewControllerDidTapRetry(_ gameOverViewController: GameOverViewController)
    func gameOverViewControllerDidTapQuit(_ gameOverViewController: GameOverViewController)
}
