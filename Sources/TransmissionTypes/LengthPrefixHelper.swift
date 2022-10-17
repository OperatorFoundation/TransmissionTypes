//
//  LengthPrefixHelper.swift
//  
//
//  Created by Dr. Brandon Wiley on 10/16/22.
//

import Foundation

import Datable

public func readWithLengthPrefix(prefixSizeInBits: Int, connection: TransmissionTypes.Connection) -> Data?
{
    let prefixSizeInBytes = prefixSizeInBits * 8
    guard let lengthData = connection.read(size: prefixSizeInBytes) else
    {
        return nil
    }

    let length: Int
    switch prefixSizeInBits
    {
        case 8:
            let uint8 = UInt8(data: lengthData)
            length = Int(uint8)

        case 16:
            let uint16 = UInt16(data: lengthData)
            length = Int(uint16)

        case 32:
            let uint32 = UInt32(data: lengthData)
            length = Int(uint32)

        case 64:
            let uint64 = UInt64(data: lengthData)
            length = Int(uint64)

        default:
            return nil
    }

    return connection.read(size: length)
}

public func writeWithLengthPrefix(data: Data, prefixSizeInBits: Int, connection: TransmissionTypes.Connection) -> Bool
{
    let dataSize = data.count
    switch prefixSizeInBits
    {
        case 8:
            guard dataSize < UInt8.max else
            {
                return false
            }

            let uint8 = UInt8(dataSize)
            let newData = uint8.data + data
            return connection.write(data: newData)

        case 16:
            guard dataSize < UInt16.max else
            {
                return false
            }

            let uint16 = UInt16(dataSize)
            let newData = uint16.data + data
            return connection.write(data: newData)

        case 32:
            guard dataSize < UInt32.max else
            {
                return false
            }

            let uint32 = UInt32(dataSize)
            let newData = uint32.data + data
            return connection.write(data: newData)

        case 64:
            guard dataSize < UInt64.max else
            {
                return false
            }

            let uint64 = UInt64(dataSize)
            let newData = uint64.data + data
            return connection.write(data: newData)

        default:
            return false
    }
}
