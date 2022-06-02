import UIKit

extension UIView {

    func addIncreaseSizeAnimation() {
        configureKeyFrameAnimation(withValues: [1.2], keyTimes: [1])
    }

    func addBounceAnimation() {
        configureKeyFrameAnimation(withValues: [0.25, 0.4, 1.3, 1.0], keyTimes: [0, 0.3, 0.75, 1], duration: 0.3)
    }

    func addAppearAnimation() {
        let values = [0.0, 0.2, 0.5, 1.4, 1.0]
        configureKeyFrameAnimation(withValues: values, keyTimes: [0, 0.3, 0.5, 0.75, 1], duration: 0.4)
    }

    private func configureKeyFrameAnimation(withValues values: [Any],
                                            keyTimes: [NSNumber],
                                            duration: CFTimeInterval? = nil) {
        let keyFrame = CAKeyframeAnimation(keyPath: "transform.scale")
        keyFrame.values = values
        keyFrame.keyTimes = keyTimes
        if let duration = duration {
            keyFrame.duration = duration
        }
        keyFrame.isRemovedOnCompletion = false
        keyFrame.fillMode = CAMediaTimingFillMode.forwards
        keyFrame.timingFunctions = [
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut),
            CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        ]
        layer.add(keyFrame, forKey: "transform.scale")
    }

}
