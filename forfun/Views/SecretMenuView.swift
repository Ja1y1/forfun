//
//  SecretMenuView.swift
//  forfun
//
//  Created by JAY on 08/09/2024.
//

import SwiftUI

struct SecretMenuView: View {
    @StateObject private var viewModel = SecretMenuViewModel()
    
    var body: some View {
        ZStack{
//            Color.gray
//                .ignoresSafeArea()
            VStack {
                
                if viewModel.menuItems.isEmpty {
                    Text("No Menu Items Available")
                        .foregroundColor(.pink)
                        .padding()
                } else {
                    List(viewModel.menuItems) { item in
                        VStack(alignment: .leading) {
                            Text(item.menuName)
                                .font(.headline)
                                .foregroundColor(.purple)
                            
                            Text(item.menuDescription)
                                .font(.body)
                                .foregroundColor(.blue)
                            
                            Text(item.restaurantName)
                                .font(.body)
                                .foregroundColor(.green)
                            
                        }
                        .padding(.vertical, 4)
                        
                    }

                }
            }
        }
    }
}

#Preview {
    SecretMenuView()
}
