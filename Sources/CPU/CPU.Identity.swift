public import Cardinal
public import Ordinal
public import Tagged

extension CPU {

    public typealias Count = Tagged<CPU, Cardinal>

    public typealias ID = Tagged<CPU, Ordinal>
}
