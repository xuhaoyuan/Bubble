import UIKit

extension CGFloat {
    var w: CGFloat {
        return self * (UIScreen.main.bounds.width / 375.0)
    }
}

extension Int {
    var w: CGFloat {
        return CGFloat(self) * (UIScreen.main.bounds.width / 375.0)
    }
}

extension Double {
    var w: CGFloat {
        return self * (UIScreen.main.bounds.width / 375.0)
    }
}

