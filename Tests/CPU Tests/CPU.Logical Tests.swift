import CPU
import Testing

@Suite struct CPULogicalTests {
    @Test func `count and identifier have distinct roles`() {
        let count = CPU.Logical.Count(_unchecked: Cardinal(4 as UInt))
        let id = CPU.Logical.ID(_unchecked: Ordinal(3 as UInt))
        #expect(Int(count) == 4)
        #expect(Int(id) == 3)
    }

    @Test func `core count converts to int`() {
        let count = CPU.Core.Count(_unchecked: Cardinal(2 as UInt))
        #expect(Int(count) == 2)
    }
}
