# CPU

CPU is provisionally located in swift-molecules. Its current collection of processor identity, synchronization, allocation, checksum, and hardware-operation facilities has not been established as one independently meaningful atom. This placement removes those responsibilities from the atoms layer; it does not settle their final ownership as molecules, standards, or compositions.

The relocation preserves the existing implementation, public API, and published CPU Shims dependency. Atomic loads and stores retain their orderings; barriers, spin hints, prefetch, counters, and CRC32C retain their existing platform implementations. No atom depends on this package or its shim, directly or transitively. The repository retains `https://github.com/swift-atoms/swift-cpu.git` as its GitHub URL during this provisional local relocation.

## Ownership still under review

- CPU.ID currently denotes a processor position and CPU.Count denotes cardinality. Logical versus physical processor identity, identifier scope, and conversions need a more precise contract. Discovery and multi-processor/NUMA topology belong to platform facilities.
- The CRC32C algorithm has deterministic checksum semantics independent of hardware acceleration. Its eventual owner remains undecided; no new checksum package is introduced by this relocation.
- CPU.Cache.Padded combines owned allocation with a fixed 128-byte alignment and minimum allocation size. Reuse of Memory and the distinction between an allocation guarantee and a hardware cache policy require review.
- CPU.Atomic.Flag already uses Swift Synchronization.Atomic. Raw-pointer atomics serve a different storage contract, including kernel-mapped memory in Linux io_uring, and cannot be replaced by assuming such storage is an initialized Swift Atomic.
- Compiler barriers and hardware barriers have different contracts. Architecture instructions, spin hints, prefetch, and raw counter values need architecture-specific documentation and validation. The current tests do not prove all memory-ordering or hardware semantics, and unsupported-platform fallbacks also require review.

The existing swift-compositions/swift-cpu package is a separate architecture router. It combines this vocabulary with the ARM and x86 standards packages, which themselves depend on this package. Future reorganization must account for those dependency directions and the overlapping CPU package/module names. Its design is outside this relocation.

## Validation

CPU is excluded from atoms.xcworkspace. The existing molecules.xcworkspace includes this package, and the shared `CPU Compatibility` scheme in `swift-institute/workspaces/renderer.xcworkspace` builds its core, Foundation Integration, Test Support, and tests together with the CPU Binary Serializer consumer. From the developer checkout root:

```sh
xcodebuild -workspace swift-institute/workspaces/renderer.xcworkspace \
  -scheme 'CPU Compatibility' -destination 'platform=macOS' test
```

The focused scheme preserves regression coverage while broader platform and higher-layer reviews remain deferred. Passing its current tests is not a claim of complete cross-platform or memory-model validation.
