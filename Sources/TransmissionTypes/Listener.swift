//
//  Listener.swift
//
//
//  Created by Dr. Brandon Wiley on 8/31/20.
//
import Foundation

public protocol Listener
{
    func accept() throws -> Connection
    func close()
}
