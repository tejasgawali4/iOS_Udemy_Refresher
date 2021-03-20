//
//  PostData.swift
//  HackerNews
//
//  Created by Tejas Gawali on 11/03/21.
//

import Foundation

struct Results: Decodable {
    let hits : [Post]
}

struct Post: Decodable, Identifiable {
    var id : String {
        return objectID
    }
    let points : Int
    let title : String
    let url : String?
    let objectID : String
}
