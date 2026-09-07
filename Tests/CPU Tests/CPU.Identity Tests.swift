import CPU
import CPU_Standard_Library_Integration
import Testing

@Suite struct CPUIdentityTests {
    @Test func countAndIdentityHaveDistinctRoles() {
        let count = CPU.Count(_unchecked: Cardinal(4 as UInt))
        let id = CPU.ID(_unchecked: Ordinal(3 as UInt))
        #expect(Int(count) == 4)
        #expect(id.underlying.rawValue == 3)
    }
}
