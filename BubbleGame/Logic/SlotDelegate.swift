import Foundation

protocol SlotDelegate: AnyObject {
    func slot(_ slot: Slot, didInsertCircle circle: Circle)
    func slot(_ slot: Slot, didRemoveCirlce circle: Circle)
}
