public import CPU_Shims

extension CPU {

    public enum Atomic {}
}

extension CPU.Atomic {

    @inline(always)
    public static func load(
        _ pointer: UnsafeMutablePointer<UInt8>,
        ordering: Load.Ordering
    ) -> UInt8 {
        switch ordering {
        case .relaxed:
            return unsafe swift_cpu_atomic_load_relaxed_u8_v1(pointer)

        case .acquiring:
            return unsafe swift_cpu_atomic_load_acquire_u8_v1(pointer)
        }
    }
}

extension CPU.Atomic {

    @inline(always)
    public static func load(
        _ pointer: UnsafeMutablePointer<UInt32>,
        ordering: Load.Ordering
    ) -> UInt32 {
        switch ordering {
        case .relaxed:
            return unsafe swift_cpu_atomic_load_relaxed_u32_v1(pointer)

        case .acquiring:
            return unsafe swift_cpu_atomic_load_acquire_u32_v1(pointer)
        }
    }
}

extension CPU.Atomic {

    @inline(always)
    public static func load(
        _ pointer: UnsafeMutablePointer<UInt64>,
        ordering: Load.Ordering
    ) -> UInt64 {
        switch ordering {
        case .relaxed:
            return unsafe swift_cpu_atomic_load_relaxed_u64_v1(pointer)

        case .acquiring:
            return unsafe swift_cpu_atomic_load_acquire_u64_v1(pointer)
        }
    }
}

extension CPU.Atomic {

    @inline(always)
    public static func store(
        _ pointer: UnsafeMutablePointer<UInt8>,
        _ value: UInt8,
        ordering: Store.Ordering
    ) {
        switch ordering {
        case .relaxed:
            unsafe swift_cpu_atomic_store_relaxed_u8_v1(pointer, value)

        case .releasing:
            unsafe swift_cpu_atomic_store_release_u8_v1(pointer, value)
        }
    }
}

extension CPU.Atomic {

    @inline(always)
    public static func store(
        _ pointer: UnsafeMutablePointer<UInt32>,
        _ value: UInt32,
        ordering: Store.Ordering
    ) {
        switch ordering {
        case .relaxed:
            unsafe swift_cpu_atomic_store_relaxed_u32_v1(pointer, value)

        case .releasing:
            unsafe swift_cpu_atomic_store_release_u32_v1(pointer, value)
        }
    }
}

extension CPU.Atomic {

    @inline(always)
    public static func store(
        _ pointer: UnsafeMutablePointer<UInt64>,
        _ value: UInt64,
        ordering: Store.Ordering
    ) {
        switch ordering {
        case .relaxed:
            unsafe swift_cpu_atomic_store_relaxed_u64_v1(pointer, value)

        case .releasing:
            unsafe swift_cpu_atomic_store_release_u64_v1(pointer, value)
        }
    }
}
