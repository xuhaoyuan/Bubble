import UIKit

class Button: UIButton {

    typealias ButtonActionClosure = () -> Void
    var buttonActionClosure: ButtonActionClosure?

    init(title: String, color: UIColor) {
        super.init(frame: .zero)

        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 25.0
        layer.borderColor = UIColor(color: .lightPurple7D75C7).cgColor
        layer.borderWidth = 2
        backgroundColor = color
        setBackgroundColor(UIColor.black.withAlphaComponent(0.25), forUIControlState: .highlighted)
        configureButtonAction()
    }

    init(image: UIImage?) {
        super.init(frame: .zero)

        setImage(image, for: .normal)
        configureButtonAction()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureButtonAction() {
        addTarget(self, action: #selector(Button.didTapOnButton(_:)), for: .touchUpInside)
    }

    @objc func didTapOnButton(_ sender: UIButton) {
        buttonActionClosure?()
    }

}
