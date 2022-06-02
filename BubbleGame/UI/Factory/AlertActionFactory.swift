import UIKit

protocol AlertActionCreating {
    func create(withTitle title: String?,
                style: UIAlertAction.Style,
                handler: ((UIAlertAction) -> Void)?) -> UIAlertAction
}

class AlertActionFactory: AlertActionCreating {

    func create(withTitle title: String?,
                style: UIAlertAction.Style,
                handler: ((UIAlertAction) -> Void)?) -> UIAlertAction {
        return UIAlertAction(title: title, style: style, handler: handler)
    }

}
