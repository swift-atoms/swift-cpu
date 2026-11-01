public import Ordinal
public import Tagged

extension CPU.NUMA {

    public struct Node: Sendable, Equatable, Identifiable {

        public let id: ID

        public let processors: Set<CPU.Logical.ID>

        public init(id: ID, processors: Set<CPU.Logical.ID>) {
            self.id = id
            self.processors = processors
        }
    }
}

extension CPU.NUMA.Node {

    public typealias ID = Tagged<CPU.NUMA.Node, Ordinal>
}
