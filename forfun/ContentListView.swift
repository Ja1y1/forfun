//
//  testing.swift
//  forfun
//
//  Created by JAY on 05/10/2024.
//

import SwiftUI
//
//make it the view for accessing other views within the app <<<<

struct ContentListView: View {
    var body: some View {
        NavigationStack{
            List{
              
                NavigationLink(LocalizedStringKey("1- Ticket List"), destination: TicketListView())
                    .foregroundColor(.pink)
                    
                NavigationLink(LocalizedStringKey("2- Secret Menu"), destination: SecretMenuView())
                    .foregroundColor(.pink)
                
                NavigationLink(LocalizedStringKey("3- Popup"), destination: PopupView())
                    .foregroundColor(.pink)
                
        
            }.navigationTitle("Content List")
        }
    }
    }
    
#Preview {
    ContentListView()
}
