//
//  Entity.swift
//  NotesApp
//
//  Created by Melania Dababi on 9/2/24.
//

import Foundation

struct Todos: Codable {
    let todos: [Todo]
    let total, skip, limit: Int
}

struct Todo: Codable {
    let id: Int
    let todo: String
    let completed: Bool
    let userID = UUID()

    enum CodingKeys: String, CodingKey {
        case id, todo, completed
        case userID = "userId"
    }
}

