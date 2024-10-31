//
//  SecretMenuModel.swift
//  forfun
//
//  Created by JAY on 08/09/2024.
//

import Foundation

struct MenuItem: Codable, Identifiable {
        var id: Int
        var menuName: String
        var restaurantName: String
        var menuDescription: String
    
        
        enum CodingKeys: String, CodingKey {
            case id
            case menuName = "menu_name"
            case restaurantName = "resturant_name"
            case menuDescription = "menu_description"
        }
    }

struct MenuItemsResponse: Codable {
    var data: [MenuItem]
}

