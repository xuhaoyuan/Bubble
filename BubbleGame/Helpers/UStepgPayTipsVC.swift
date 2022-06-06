//
//  UStepgPayTipsVC.swift
//  BubbleGame
//
//  Created by 许浩渊 on 2022/6/5.
//

import UIKit

class UStepgPayTipsVC: BaseModalTransitionVC, TransitionCoordinator {

    private let icon = UIImageView()
    private let titleLabel = UILabel(text: "购买成功", font: .systemFont(ofSize: 20, weight: .semibold), color: .white, alignment: .center)
    private let descLabel = UILabel(text: "恭喜获得“笑脸公仔NFT一枚”，笑一笑功能已激活，马上去拍摄体验吧！", font: .systemFont(ofSize: 14, weight: .regular), color: .white, alignment: .center)
    private let stepButton: UStepgStateButton = {
        return UStepgStateButton()
            .set(font: UIFont.systemFont(ofSize: 16, weight: .bold))
            .set(title: "立即拍摄", state: .normal)
            .set(textColor: .black, state: .normal)
            .set(backColor: .white, state: .normal)
            .set(corner: (52/2).w)
    }()
    private let tipsLabel = UILabel(text: "下次不再提示", font: .systemFont(ofSize: 14, weight: .regular), color: .white, alignment: .center)

    private let containerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()

        tipsLabel.addTapGesture {

        }
    }

    private func makeUI() {
        icon.corner = 12.w
        icon.backgroundColor = UIColor.lightGray
        descLabel.numberOfLines = 0
        containerView.backgroundColor = UIColor.clear

        let stackView = UIStackView(subviews: [icon, titleLabel, descLabel, stepButton, tipsLabel], axis: .vertical, alignment: .center, distribution: .fill, spacing: 0)
        view.addSubview(containerView)
        containerView.addSubview(stackView)
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalTo(18.w)
            make.trailing.equalTo(-18.w)
        }
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        stackView.setCustomSpacing(24.w, after: icon)
        stackView.setCustomSpacing(12.w, after: titleLabel)
        stackView.setCustomSpacing(24.w, after: descLabel)
        stackView.setCustomSpacing(16.w, after: stepButton)

        icon.snp.makeConstraints { make in
            make.size.equalTo(220.w)
        }

        stepButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 168.w, height: 52.w))
        }

        containerView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        containerView.alpha = 0
    }

    func backgroundIsUserEnable() -> Bool {
        return false
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
