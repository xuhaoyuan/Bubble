import Foundation

enum CircleType: CaseIterable {
    case purple
    case blue
    case orange
    case red
    case turquoise
    case green
}

private func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
    var i = 0
    return AnyIterator {
        let next = withUnsafePointer(to: &i) { UnsafeRawPointer($0).load(as: T.self) }
        defer { i = i + 1 }
        return next.hashValue == i ? next : nil
    }
}
