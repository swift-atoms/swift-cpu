extension CPU.NUMA {

    public enum State: Sendable, Equatable {

        case unavailable

        case uniform

        case nonUniform(nodes: [Node])
    }
}
