import Foundation

protocol GameViewDelegate: AnyObject {
    func gameViewDidTapPause(_ gameView: GameView)
    func gameViewDidTapRestart(_ gameView: GameView)
    func gameViewCanMoveCircle(fromLocation: SlotLocation, toLocation: SlotLocation) -> Bool
    func gameViewMoveCircle(fromLocation: SlotLocation, toLocation: SlotLocation)
}
