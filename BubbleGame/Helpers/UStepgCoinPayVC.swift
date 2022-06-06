//
//  UStepgNftPayViewController.swift
//  BubbleGame
//
//  Created by 许浩渊 on 2022/6/5.
//

import UIKit
import XHYCategories

class UStepgCoinPayVC: BaseModalTransitionVC, TransitionCoordinator {


    private let containerView = XCornerView(corners: [.topLeft, .topRight], corner: 12)

    private let closeButton = UIButton(bgColor: .white, cornerRadius: 16.w)
    private let titleLabel = UILabel(text: "Title", size: 14, weight: .regular, color: .black, alignment: .center)
    private let coinIcon = UIImageView()
    private let priceLabel = UILabel(text: "0SUPE", font: .systemFont(ofSize: 28, weight: .bold), color: .black, alignment: .center)
    private let usdtLabel = UILabel(text: "≈0 USDT", font: .systemFont(ofSize: 12, weight: .regular), color: UIColor(hex: "#A0A1B8"), alignment: .center)

    private let walletCard = UIView()
    private let walletGameTitle = UILabel(text: "游戏钱包账户余额（$SUPE）", font: .systemFont(ofSize: 12), color: UIColor(hex: "#A8ABB2"), alignment: .left)
    private let walletGameBalance = UILabel(text: "0", font: .systemFont(ofSize: 14, weight: .semibold), color: .black, alignment: .right)
    private let walletBoxTitle = UILabel(text: "百宝箱余额（$SUPE）", font: .systemFont(ofSize: 12), color: UIColor(hex: "#A8ABB2"), alignment: .left)
    private let walletBoxBalance = UILabel(text: "0", font: .systemFont(ofSize: 14, weight: .semibold), color: .black, alignment: .right)

    private let tipsLabel = UILabel(text: "购买费用优先从您的游戏钱包支付，再从您的", size: 12, weight: .regular, color: UIColor(hex: "#FF7757"), alignment: .center)

    private let payButton: UStepgStateButton = {
        return UStepgStateButton()
            .set(title: "确认支付", state: .normal)
            .set(font: UIFont.systemFont(ofSize: 16, weight: .black))
            .set(backColor: .black, state: .normal)
            .set(textColor: .white, state: .normal)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }

    private func makeUI() {
        containerView.backgroundColor = UIColor.white
        payButton.corner = 52.w/2
        walletCard.corner = 8
        walletCard.backgroundColor = UIColor(hex: "#F6F7F8")
        let subviews = [
            titleLabel,
            coinIcon,
            priceLabel,
            usdtLabel,
            walletCard,
            tipsLabel,
            payButton
        ]
        let stackView = UIStackView(subviews: subviews,axis: .vertical, alignment: .center, distribution: .fill, spacing: 0)
        stackView.backgroundColor = UIColor.white

        containerView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(19.w)
            make.leading.equalTo(12.w)
            make.trailing.equalTo(-12.w)
            make.bottom.equalTo(containerView.safeAreaLayoutGuide.snp.bottom).offset(-74.w)
        }
        stackView.setCustomSpacing(38.w, after: titleLabel)
        stackView.setCustomSpacing(12.w, after: coinIcon)
        stackView.setCustomSpacing(8.w, after: priceLabel)
        stackView.setCustomSpacing(40.w, after: usdtLabel)
        stackView.setCustomSpacing(12.w, after: walletCard)
        stackView.setCustomSpacing(40.w, after: tipsLabel)

        walletCard.addSubview(walletGameTitle)
        walletCard.addSubview(walletGameBalance)
        walletCard.addSubview(walletBoxTitle)
        walletCard.addSubview(walletBoxBalance)

        walletCard.snp.makeConstraints { make in
            make.width.equalTo(351.w)
        }

        walletGameTitle.snp.makeConstraints { make in
            make.leading.equalTo(12.w)
            make.top.equalTo(12.w)
        }

        walletBoxTitle.snp.makeConstraints { make in
            make.top.equalTo(walletGameTitle.snp.bottom).offset(8.w)
            make.leading.equalTo(12.w)
            make.bottom.equalTo(-12.w)
        }

        walletGameBalance.snp.makeConstraints { make in
            make.centerY.equalTo(walletGameTitle)
            make.trailing.equalTo(-12.w)
        }

        walletBoxBalance.snp.makeConstraints { make in
            make.centerY.equalTo(walletBoxTitle)
            make.trailing.equalTo(-12.w)
        }

        coinIcon.snp.makeConstraints { make in
            make.size.equalTo(50.w)
        }

        payButton.snp.makeConstraints { make in
            make.width.equalTo(215.w)
            make.height.equalTo(52.w)
        }

        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.snp.bottom)
        }
    }

    func presentAnimation() {
        containerView.snp.remakeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom)
        }
    }

    func dismissAnimation() {
        containerView.snp.remakeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.snp.bottom)
        }
    }
}
