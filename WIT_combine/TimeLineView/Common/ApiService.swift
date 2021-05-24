//
//  ApiService.swift
//  WIT
//
//  Created by LEESEUNGMIN on 2021/05/23.
//

import Foundation

//let people : [Person] = [
//    Person(name: "seungmin", image: "look1"),
//    Person(name: "gyurim", image: "look2"),
//    Person(name: "juyeong", image: "look3"),
//    Person(name: "jaejoon", image: "look4"),
//]
class ApiService {
    static let personApi = PersonApi()
    static let commentsApi = CommentsApi()
    static let newsApi = NewsApi()
    static let contentApi = ContentApi()
}
class ContentApi {
    fileprivate static var content: [UserContent] = [
    
        UserContent(image: "look1", desc: "First Look", owner: PersonApi.people[0], comments : [CommentsApi.comments[1],CommentsApi.comments[3],CommentsApi.comments[2]]),
        UserContent(image: "look2", desc: "Second Look", owner: PersonApi.people[1], comments : [CommentsApi.comments[1],CommentsApi.comments[4]]),
        UserContent(image: "look3", desc: "Second Look", owner: PersonApi.people[2], comments : [CommentsApi.comments[1],CommentsApi.comments[7]]),
        UserContent(image: "look4", desc: "Fourth Look", owner: PersonApi.people[3],comments : [CommentsApi.comments[2],CommentsApi.comments[5],CommentsApi.comments[6]]),
    
    ]
    
    func getContentOfOwners(owners: [Person]) -> [UserContent]? { //유저와 해당 유저의 content-owner를 연결 시키기
        ContentApi.content.filter{ con in
            owners.contains { owner in
                con.owner.id == owner.id
            }
        }
    }
}
class PersonApi {
    fileprivate static var people: [Person] = [
            Person(name: "seungmin"),
            Person(name: "gyurim"),
            Person(name: "juyeong"),
            Person(name: "jaejoon"),
    ]
    
    func getFollowing() -> [Person] {
        return PersonApi.people
    }
    func addPerson(person: Person){
        
        PersonApi.people.append(person)
    }
}

class CommentsApi {
    
    fileprivate static var comments: [Comment] = [
        Comment(owner: PersonApi.people[2],respondingTo: PersonApi.people[1],text: "Terrific post!"),
        Comment(owner: PersonApi.people[1],respondingTo: PersonApi.people[0],text: "Terrific post!"),
        Comment(owner: PersonApi.people[0],respondingTo: PersonApi.people[1],text: "Terrific post!"),
        Comment(owner: PersonApi.people[2],respondingTo: PersonApi.people[2],text: "Terrific post!"),
        Comment(owner: PersonApi.people[1],respondingTo: PersonApi.people[2],text: "Terrific post!"),
        Comment(owner: PersonApi.people[0],respondingTo: PersonApi.people[1],text: "Terrific post!"),
        Comment(owner: PersonApi.people[3],respondingTo: PersonApi.people[3],text: "Terrific post!"),
        Comment(owner: PersonApi.people[3],respondingTo: PersonApi.people[0],text: "Terrific post!"),
    
    ]
    func getComments() -> [Comment] {
        return CommentsApi.comments
    }
    func addComments(comment: Comment){
        CommentsApi.comments.append(comment)
    }
}

class NewsApi {
    
    fileprivate static var news: [News] = [
        News(subject: "Shows the best look of the day. Hey, Upload your own look and communicate with your friends.")
    ]
    func getLatestNews() -> News? {
        NewsApi.news.last
    }
}
