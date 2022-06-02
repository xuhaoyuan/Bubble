import Foundation

class Board {

    let size: BoardSize
    weak var delegate: BoardDelegate?

    init(size: BoardSize) {
        self.size = size
        internalSlots = Board.createSlots(size, slotDelegate: self)
    }

    // MARK: Slots

    private class func createSlots(_ size: BoardSize, slotDelegate: SlotDelegate?) -> [Slot] {
        var slots = [Slot]()
        for column in 0..<size.columns {
            for row in 0..<size.rows {
                let location = SlotLocation(column: column, row: row)
                let slot = Slot(location: location, delegate: slotDelegate)
                slots.append(slot)
            }
        }
        return slots
    }

    private var internalSlots: [Slot]?

    var slots: [Slot] {
        return internalSlots ?? []
    }

    func slot(atLocation location: SlotLocation) -> Slot? {
        guard location.column < size.columns else { return nil }
        guard location.row < size.rows else { return nil }
        return slots.filter { $0.location == location }.first
    }

    func slot(forCircle circle: Circle) -> Slot? {
        return slots.filter { $0.circle === circle }.first
    }

    // MARK: Circles

    func circle(atLocation location: SlotLocation) -> Circle? {
        return slot(atLocation: location)?.circle
    }

    func canMoveCircle(fromLocation: SlotLocation, toLocation: SlotLocation) -> Bool {
        guard fromLocation != toLocation else { return false }
        guard let movingCircle = circle(atLocation: fromLocation) else { return false }
        guard let targetCircle = circle(atLocation: toLocation) else { return false }
        return movingCircle.type == targetCircle.type
    }

    func moveCircle(fromLocation: SlotLocation, toLocation: SlotLocation) throws {
        guard circle(atLocation: fromLocation) != nil else {
            throw BoardError.noCircleAtLocation(location: fromLocation)
        }
        guard circle(atLocation: toLocation) != nil else {
            throw BoardError.noCircleAtLocation(location: toLocation)
        }
        slot(atLocation: fromLocation)?.circle = nil
        slot(atLocation: toLocation)?.circle = nil
    }

}

extension Board {
    enum BoardError: Error {
        case noCircleAtLocation(location: SlotLocation)
    }
}
