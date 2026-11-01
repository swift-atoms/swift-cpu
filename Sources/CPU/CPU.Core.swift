public import Cardinal
public import Tagged

extension CPU {

    /// A physical core, which runs one or more ``CPU/Logical`` processors.
    public enum Core {}
}

extension CPU.Core {

    public typealias Count = Tagged<CPU.Core, Cardinal>
}
