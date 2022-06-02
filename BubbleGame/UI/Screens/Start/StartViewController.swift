import UIKit

class StartViewController: UIViewController, StartViewDelegate {

    private var circleArray: [CircleView] = []
    private var startView: StartView? {
        return view as? StartView
    }
    private var timer: Timer?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func loadView() {
        self.view = StartView(delegate: self)
        self.modalTransitionStyle = .crossDissolve
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let contentView = startView?.contentView else { return }
        timer = Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true, block: { [weak self]  _ in
            guard let self = self else { return }
            if (self.circleArray.count > 10) {
                self.removeCircleViewWithAnimation()
            }
            let size = contentView.frame.size
            let x = Int(arc4random())%(Int(size.width)/60)*60
            let y = Int(arc4random())%(Int(size.height)/60)*60
            self.addCircleViewWithAnimation(
                CircleView(circle: Circle(type: CircleType.allCases.randomElement() ?? .orange)),
                rect: CGRect(x: x, y: y, width: 44, height: 44))

        })
    }

    func startViewDidTapNewGame(_ startView: StartView) {
        let gameViewController = GameViewController()
        present(gameViewController, animated: true, completion: nil)
    }

    private func addCircleViewWithAnimation(_ circleView: CircleView, rect: CGRect) {
        circleView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        circleView.frame = rect
        circleView.addAppearAnimation()
        circleArray.append(circleView)
        guard let contentView = startView?.contentView else { return }
        contentView.addSubview(circleView)
    }

    private func removeCircleViewWithAnimation() {
        guard !circleArray.isEmpty else { return }
        let circleView = circleArray.removeFirst()
        circleView.animation = "zoomOut"
        circleView.animateNext { circleView.removeFromSuperview() }
    }
}
