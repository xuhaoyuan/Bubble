import UIKit
import Spring
import SnapKit

class StartView: UIView {

    private weak var delegate: StartViewDelegate?
    let contentView = UIView()

    init(delegate: StartViewDelegate?) {
        self.delegate = delegate
        super.init(frame: .zero)
        loadSubviews()
        setupLayout()
        configureButtonActions()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addCircle(_ circleView: CircleView) {
        insertSubview(circleView, belowSubview: logoImageView)
    }

    // MARK: Subviews

    private func loadSubviews() {
        addSubview(backgroundView)
        addSubview(contentView)
//        addGradientForView(backgroundView)
//        addSubview(backgroundImageView)
        addSubview(logoImageView)
        addSubview(newGameButton)
        // addSubview(rankingButton)
    }

    private let backgroundView: UIView = {
        let backgroundView = UIImageView(image: UIImage(named: "background"))
        backgroundView.backgroundColor = UIColor(color: .gray202B39)
        backgroundView.contentMode = .scaleAspectFill
        return backgroundView
    }()

//    private let backgroundImageView: UIImageView = {
//        let view = UIImageView(frame: .zero)
//        view.image = UIImage(asset: .circleBackground)
//        view.contentMode = .scaleAspectFill
//        return view
//    }()


    private let logoImageView: UILabel = {
        let previewView = UILabel()
        previewView.text = "Bubble"
        previewView.font = UIFont(name: "Noteworthy-Light", size: 80) ?? .systemFont(ofSize: 80)
        previewView.textColor = UIColor.white
        previewView.textAlignment = .center
        return previewView
    }()

    private let newGameButton = Button(title: "新游戏", color: UIColor(color: .green6BE01A))
    // private let rankingButton = Button(title: "排行榜", color: UIColor(color: .turquoise54C7C7))
    // private let infoButton = Button(image: UIImage(asset: .info))

    // MARK: Layout

    private func setupLayout() {
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

//        backgroundImageView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }


        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().multipliedBy(0.5)
        }

        contentView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(18)
            make.leading.equalTo(18)
            make.trailing.equalTo(18)
            make.bottom.equalTo(newGameButton.snp.top).offset(-18)
        }

        newGameButton.snp.makeConstraints {
            $0.width.equalTo(200)
            $0.height.equalTo(50)
            $0.centerXWithinMargins.equalToSuperview()
            $0.centerY.equalToSuperview().multipliedBy(1.5)
        }
//        rankingButton.snp.makeConstraints {
//            $0.top.equalTo(newGameButton.snp.bottom).offset(15)
//            $0.width.equalTo(200)
//            $0.height.equalTo(50)
//            $0.centerXWithinMargins.equalToSuperview()
//        }
    }

//    private func addGradientForView(_ view: UIView) {
//        let gradient: CAGradientLayer = CAGradientLayer()
//        gradient.frame = UIScreen.main.bounds
//        let topColor = UIColor(color: .purpleC86DD7).cgColor
//        let bottomColor = UIColor(color: .blue3023AE).cgColor
//        guard let topColorWithAlpha = topColor.copy(alpha: 0.2) else { return }
//        guard let bottomColorWithAlpha = bottomColor.copy(alpha: 0.2) else { return }
//        gradient.colors = [topColorWithAlpha, bottomColorWithAlpha]
//        view.layer.insertSublayer(gradient, at: 0)
//    }

    // MARK: Button actions

    private func configureButtonActions() {
        newGameButton.buttonActionClosure = { [unowned self] in
            self.delegate?.startViewDidTapNewGame(self)
        }
    }

    
}

// MARK: - Delegate

protocol StartViewDelegate: AnyObject {
    func startViewDidTapNewGame(_ startView: StartView)
}
