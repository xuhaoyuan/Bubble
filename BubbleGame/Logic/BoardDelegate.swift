import Foundation

protocol BoardDelegate: AnyObject {
    func board(_ board: Board, didInsertCircle circle: Circle, intoSlot slot: Slot)
    func board(_ board: Board, didRemoveCircle circle: Circle, fromSlot slot: Slot)
    func boardBecameFull(_ board: Board)
}
