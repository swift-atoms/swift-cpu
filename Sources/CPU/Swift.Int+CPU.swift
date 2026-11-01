extension Swift.Int {

    @inlinable
    public init(_ count: CPU.Logical.Count) {
        self = Int(bitPattern: count.underlying.rawValue)
    }

    @inlinable
    public init(_ count: CPU.Core.Count) {
        self = Int(bitPattern: count.underlying.rawValue)
    }

    @inlinable
    public init(_ id: CPU.Logical.ID) {
        self = Int(bitPattern: id.underlying.rawValue)
    }
}
