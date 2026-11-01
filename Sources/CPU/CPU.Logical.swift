public import Cardinal
public import Ordinal
public import Tagged

extension CPU {

    /// A logical processor: one hardware thread the operating system schedules.
    ///
    /// With simultaneous multithreading a core runs more than one logical processor,
    /// so the logical count can exceed ``CPU/Core`` count.
    public enum Logical {}
}

extension CPU.Logical {

    public typealias Count = Tagged<CPU.Logical, Cardinal>

    public typealias ID = Tagged<CPU.Logical, Ordinal>
}
