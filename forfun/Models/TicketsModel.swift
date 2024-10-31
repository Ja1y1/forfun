//
//  ticketsModel.swift
//  forfun
//
//  Created by JAY on 04/10/2024.
//

import Foundation

struct TicketResponse: Codable {
    let tickets: [Ticket]
}

struct Ticket : Codable, Identifiable{
       let id: Int
       let code: String
       let createdAt: String
       let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
            case id
            case code
            case createdAt = "created_at"
            case updatedAt = "updated_at"
        }
}
