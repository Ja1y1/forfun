//
//  PopupView.swift
//  forfun
//
//  Created by JAY on 16/05/2024.
//

import SwiftUI

struct PopupView: View {
    @State var ShowPopup : Bool = false
    var body: some View {
        NavigationView{
            
            Button("Show popup"){
                ShowPopup.toggle()
            }.navigationTitle("Custom Popup's")
        }
        .popupNavigationView(horizontalPadding: 40, show: $ShowPopup){
            
            //MARK: Popup content which will also perform navigations
            
            List{
                ForEach(tasks){
                    task in
                    NavigationLink(task.taskTitle){
                        Text(task.taskDescription)
                            .navigationTitle("Destination")
                    }
                }
            }
            .navigationTitle("Popup Navigation")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    PopupView()
}
