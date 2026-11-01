import CPU
import Testing

@Suite struct CPUNUMATests {
    @Test func nodeKeepsItsProcessors() {
        let processors: Set<CPU.Logical.ID> = [
            CPU.Logical.ID(_unchecked: Ordinal(0 as UInt)),
            CPU.Logical.ID(_unchecked: Ordinal(1 as UInt)),
        ]
        let node = CPU.NUMA.Node(id: CPU.NUMA.Node.ID(_unchecked: Ordinal(0 as UInt)), processors: processors)
        #expect(node.processors.count == 2)
        #expect(CPU.NUMA.State.nonUniform(nodes: [node]) != .uniform)
    }
}
