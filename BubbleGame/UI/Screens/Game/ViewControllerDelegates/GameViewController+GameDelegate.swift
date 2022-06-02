import Foundation

extension GameViewController: GameDelegate {

    func gameDidStart(_ game: Game) {

    }

    func game(_ game: Game, didInsertCircle circle: Circle, intoSlot slot: Slot) {
        slotView(forSlot: slot)?.circleView = CircleView(circle: circle)
    }

    func game(_ game: Game, didRemoveCircle circle: Circle, fromSlot slot: Slot) {
        slotView(forSlot: slot)?.circleView = nil
    }

    func gameOver(_ game: Game) {
        let viewController = GameOverViewController(score: game.scoreNumber, delegate: self)
        present(viewController, animated: true, completion: nil)
    }

    func gameDidUpdateScore(from: Int, to: Int) {
        guard let gameView = view as? GameView else { return }
        gameView.update(score: to)
    }

    func gameDidPause() {
        guard presentedViewController == nil else { return }
        let menuViewController = MenuViewController(delegate: self)
        present(menuViewController, animated: true, completion: nil)
    }

    // MARK: Helpers

    private func slotView(forSlot slot: Slot) -> GameBoardSlotView? {
        guard let view = view as? GameView else { return nil }
        guard let boardView = view.boardView else { return nil }
        return boardView.slotViewAtLocation(column: slot.location.column, row: slot.location.row)
    }

}
