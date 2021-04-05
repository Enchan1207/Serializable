//
//  Serializable.swift
//  Codable拡張してJSONとの相互変換をスムーズに (Enchan1207/YoutubeKitより分離)
//
//  Created by EnchantCode on 2021/04/05.
//  Copyright © 2021 EnchantCode. All rights reserved.
//

import Foundation

public protocol Serializable: Codable, CustomStringConvertible {
    func serialize() -> String?
    static func deserialize(object: String) -> Self?
    
    var description: String { get }
}

public extension Serializable{
    func serialize() -> String?{
        guard let selializedData = try? JSONEncoder().encode(self) else {return nil}
        return String(data: selializedData, encoding: .utf8)
    }
    
    static func deserialize(object: String) -> Self?{
        let selialized = try? JSONDecoder().decode(Self.self, from: object.data(using: .utf8)!)
        return selialized
    }
    
    var description: String{
        get{
            return self.serialize()!
        }
    }
}
