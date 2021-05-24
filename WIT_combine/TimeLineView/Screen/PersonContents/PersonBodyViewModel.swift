//
//  PeopleContentBodyViewModel.swift
//  WIT
//
//  Created by LEESEUNGMIN on 2021/05/24.
//

import Foundation

class PersonBodyViewModel: ObservableObject {
    
    @Published var content: [UserContent]?
    
    func setContentOfOwners(owners: [Person]) {
        self.content = ApiService.contentApi.getContentOfOwners(owners: owners)
    }
    
    func getContentOfOwners(ownerId: UUID) -> UserContent? {
        if let allContent = content {
            return allContent.first { con in
                //print("owner.id \(con.owner.id) OwnerId \(ownerId)")
                return con.owner.id == ownerId //Boolean
            }
        }
        return nil
    }
}
