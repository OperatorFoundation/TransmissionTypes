//
//  CodableConnection.swift
//  
//
//  Created by Dr. Brandon Wiley on 12/24/22.
//

import Foundation

public class CodableConnection<ReadType, WriteType> where ReadType: Codable, WriteType: Codable
{
    let connection: Connection
    let prefixLength: Int

    public init(connection: Connection, prefixLength: Int)
    {
        self.connection = connection
        self.prefixLength = prefixLength
    }

    public func read() throws -> ReadType
    {
        guard let data = self.connection.readWithLengthPrefix(prefixSizeInBits: self.prefixLength) else
        {
            throw CodableConnectionError.readError
        }

        let decoder = JSONDecoder()
        return try decoder.decode(ReadType.self, from: data)
    }

    public func write(_ message: WriteType) throws
    {
        let encoder = JSONEncoder()
        let data = try encoder.encode(message)
        guard self.connection.write(data: data) else
        {
            throw CodableConnectionError.writeError
        }
    }

    public func close()
    {
        self.connection.close()
    }
}

public enum CodableConnectionError: Error
{
    case readError
    case writeError
}
