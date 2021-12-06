import Foundation

public protocol Connection
{
    // Reads exactly size bytes
    func read(size: Int) -> Data?

    // reads up to maxSize bytes
    func read(maxSize: Int) -> Data?

    func readWithLengthPrefix(prefixSizeInBits: Int) -> Data?

    func write(string: String) -> Bool

    func write(data: Data) -> Bool

    func writeWithLengthPrefix(data: Data, prefixSizeInBits: Int) -> Bool
}

public enum ConnectionType
{
    case udp
    case tcp
}
