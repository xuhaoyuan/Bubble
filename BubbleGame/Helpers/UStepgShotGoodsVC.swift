import UIKit
import SnapKit
import XHYCategories

class UStepgShotGoodsVC: BaseModalTransitionVC, TransitionCoordinator {

    private let containerView = UIView()
    private let tipsLabel = UILabel(text: "抱歉，您还未拥有该运动类型NFT，请先购买！", size: 14, weight: .medium, color: .white, alignment: .center)
    private let cardView = UIView()
    private let priceView = UIView()
    private let priceTitle = UILabel(text: "价格：", size: 16, weight: .medium, color: .black, alignment: .left)
    private let priceIcon = UIImageView(image: nil)
    private let priceNumber = UILabel(font: UIFont.systemFont(ofSize: 18, weight: .semibold), color: .black, alignment: .right)
    private let descLabel = UILabel(text: "世界上最好的运动，应该是每天笑一笑", size: 14, weight: .regular, color: .white, alignment: .center)
    private let titleLabel = UILabel(text: "笑脸公仔", size: 20, weight: .semibold, color: .white, alignment: .center)
    private let closeButton = UIButton(bgColor: .white, cornerRadius: 16.w)

    private var edgeConstraint: Constraint?

    private let button: UStepgStateButton = {
        let view = UStepgStateButton()

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()

        closeButton.addTapHandler { [weak self] in
            self?.dismiss(animated: true)
        }
    }

    private func makeUI() {

        containerView.backgroundColor = UIColor.clear
        view.addSubview(containerView)
        containerView.addSubview(tipsLabel)
        containerView.addSubview(cardView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(descLabel)
        cardView.addSubview(priceView)
        cardView.addSubview(closeButton)
        priceView.addSubview(priceTitle)
        priceView.addSubview(priceIcon)
        priceView.addSubview(priceNumber)
        containerView.addSubview(button)


        containerView.snp.makeConstraints { make in
            make.leading.equalTo(12.w)
            make.trailing.equalTo(-12.w)
            make.centerY.equalToSuperview()
        }

        tipsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(6)
        }

        cardView.corner = 12
        cardView.backgroundColor = UIColor(hex: "BF3540")
        cardView.snp.makeConstraints { make in
            make.top.equalTo(tipsLabel.snp.bottom).offset(16.w)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(413.w)
        }

        priceView.backgroundColor = UIColor.white
        priceView.corner = 8
        priceView.snp.makeConstraints { make in
            make.leading.equalTo(8.w)
            make.trailing.equalTo(-8.w)
            make.bottom.equalTo(-8.w)
            make.height.equalTo(54.w)
        }

        priceTitle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(16.w)
        }

        priceNumber.snp.makeConstraints { make in
            make.trailing.equalTo(-15.w)
            make.centerY.equalToSuperview()
        }

        priceIcon.snp.makeConstraints { make in
            make.size.equalTo(20.w)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(priceNumber.snp.leading).offset(-4.w)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(priceView)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(descLabel.snp.top).offset(-12.w)
        }

        descLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalTo(priceView)
            make.bottom.equalTo(priceView.snp.top).offset(-37.w)
        }

        closeButton.snp.makeConstraints { make in
            make.top.equalTo(12.w)
            make.trailing.equalTo(-12.w)
            make.size.equalTo(32.w)
        }

        button.corner = 26.w
        button.set(backColor: "#FF7757", state: .normal)
            .set(title: "立即购买", state: .normal)
            .set(textColor: .white, state: .normal)
            .set(font: UIFont.systemFont(ofSize: 16, weight: .semibold))
        button.snp.makeConstraints { make in
            make.leading.equalTo(32.w)
            make.trailing.equalTo(-32.w)
            make.height.equalTo(52.w)
            make.top.equalTo(priceView.snp.bottom).offset(20.w)
            make.bottom.equalToSuperview().offset(-8.w)
        }

        containerView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        containerView.alpha = 0
    }

    func presentAnimation() {
        containerView.alpha = 1
        containerView.transform = CGAffineTransform.identity
    }

    func dismissAnimation() {
        containerView.alpha = 0
        containerView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
    }
}
