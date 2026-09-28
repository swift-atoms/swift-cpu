#if BinarySerializer
public import Binary
public import enum Binary.Binary

extension CPU.Timestamp: Binary.Serializable {}
#endif
