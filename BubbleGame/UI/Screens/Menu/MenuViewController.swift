import UIKit

class MenuViewController: UIViewController, MenuViewDelegate {

    private weak var delegate: MenuViewControllerDelegate?

    init(delegate: MenuViewControllerDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .custom
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = MenuView(delegate: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: MenuViewDelegate

    func menuViewDidTapResume(_ menuView: MenuView) {
        dismiss(animated: true) {
            self.delegate?.menuViewControllerDidResumeGame(self)
        }
    }

    func menuViewDidTapNewGame(_ menuView: MenuView) {
        dismiss(animated: true) {
            self.delegate?.menuViewControllerDidTapNewGame(self)
        }
    }

    func menuViewDidTapQuit(_ menuView: MenuView) {
        dismiss(animated: true) {
            self.delegate?.menuViewControllerDidTapQuit(self)
        }
    }

}

// MARK: - Delegate

protocol MenuViewControllerDelegate: AnyObject {
    func menuViewControllerDidResumeGame(_ menuViewController: MenuViewController)
    func menuViewControllerDidTapNewGame(_ menuViewController: MenuViewController)
    func menuViewControllerDidTapQuit(_ menuViewController: MenuViewController)
}
