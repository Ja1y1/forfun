//
//  SecretMenuViewModel.swift
//  forfun
//
//  Created by JAY on 08/09/2024.
//

import Foundation
import SwiftUI
import Combine

class SecretMenuViewModel: ObservableObject{
    @Published var menuItems: [MenuItem] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getMenuitems()
    }
    
    // GET Request
     
    func getMenuitems(){
        guard let url = URL(string:"http://127.0.0.1:3000/secret_menu_items")
        else {return}
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap(){ (data, response) -> Data in
                
                if let json = try? JSONSerialization.jsonObject(with: data, options: []){
                    
                    print("Raw JSON response: \(json)")
                    
                }
                return data
            }
            .decode(type: [MenuItem].self, decoder: JSONDecoder())
            .replaceError(with:[])
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] menuItems in
                self?.menuItems = menuItems
                
            }
            .store(in: &cancellables)
    }
    
    // POST Request
    
}
