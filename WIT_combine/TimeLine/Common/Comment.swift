//
//  Comment.swift
//  WIT
//
//  Created by LEESEUNGMIN on 2021/05/24.
//

import Foundation


struct Comment: Identifiable {
    var id: UUID = UUID()
    var owner: Person?
    var respondingTo: Person?
    var text: String
}
