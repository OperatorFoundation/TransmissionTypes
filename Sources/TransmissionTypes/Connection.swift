import Foundation

public protocol Connection
{
    // Reads exactly size bytes
    func read(size: Int) -> Data?

    // Read without locking
    func unsafeRead(size: Int) -> Data?

    // reads up to maxSize bytes
    func read(maxSize: Int) -> Data?

    func readWithLengthPrefix(prefixSizeInBits: Int) -> Data?

    func write(string: String) -> Bool

    func write(data: Data) -> Bool

    func writeWithLengthPrefix(data: Data, prefixSizeInBits: Int) -> Bool

    func close()
}

public enum ConnectionType: Codable
{
    case udp
    case tcp
}
