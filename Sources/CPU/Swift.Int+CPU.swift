extension Swift.Int {

    @inlinable
    public init(_ count: CPU.Count) {
        self = Int(bitPattern: count.underlying.rawValue)
    }
}
