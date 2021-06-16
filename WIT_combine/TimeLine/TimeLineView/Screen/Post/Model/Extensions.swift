//
//  File.swift
//  WIT_combine
//
//  Created by LEESEUNGMIN on 2021/06/16.
//

import Foundation

extension Encodable {
    func asDictionary() throws -> [String:Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
        else {
            throw NSError()
        }
        return dictionary
    }
}

extension Decodable {
    init(fromDictionary: Any) throws{
        let data = try JSONSerialization.data(withJSONObject: fromDictionary, options: .prettyPrinted)
        
        let decoder = JSONDecoder()
        self = try decoder.decode(Self.self , from: data)
    }
    
}

extension String {
    
    func splitString()-> [String] {
        
        var stringArray: [String] = []
        let trimmed = String(self.filter{ !" \n\t\r".contains($0)})
        
        for(index,_) in trimmed.enumerated(){
            let prefixedIndex = index+1
            let substringPrefix = String(trimmed.prefix(prefixedIndex)).lowercased()
            stringArray.append(substringPrefix)
        }
        return stringArray
    }
    
}
