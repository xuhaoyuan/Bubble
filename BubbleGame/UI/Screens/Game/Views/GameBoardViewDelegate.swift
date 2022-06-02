import Foundation

protocol GameBoardViewDelegate: AnyObject {
    func gameBoardViewCanMoveCircle(fromLocation from: SlotLocation, toLocation: SlotLocation) -> Bool
    func gameBoardViewMoveCircle(fromLocation from: SlotLocation, toLocation: SlotLocation)
}
