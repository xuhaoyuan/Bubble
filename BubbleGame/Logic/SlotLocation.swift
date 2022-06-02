import Foundation

struct SlotLocation {
    let column: Int
    let row: Int
}

extension SlotLocation: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine("\(column)x\(row)".hashValue)
    }
}

func == (lhs: SlotLocation, rhs: SlotLocation) -> Bool {
    return lhs.hashValue == rhs.hashValue
}
