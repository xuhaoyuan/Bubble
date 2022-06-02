import UIKit

protocol AlertControllerCreating {
    func create(title: String?, message: String?, preferredStyle: UIAlertController.Style) -> UIAlertController
}

class AlertControllerFactory: AlertControllerCreating {

    func create(title: String?,
                message: String?,
                preferredStyle: UIAlertController.Style) -> UIAlertController {
        return UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
    }

}
