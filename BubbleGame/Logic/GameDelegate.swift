import Foundation

protocol GameDelegate: AnyObject {
    func gameDidStart(_ game: Game)
    func game(_ game: Game, didInsertCircle circle: Circle, intoSlot slot: Slot)
    func game(_ game: Game, didRemoveCircle circle: Circle, fromSlot slot: Slot)
    func gameOver(_ game: Game)
    func gameDidPause()
    func gameDidUpdateScore(from: Int, to: Int)
}
