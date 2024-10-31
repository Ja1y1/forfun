//
//  ContentView.swift
//  forfun
//
//  Created by JAY on 16/05/2024.
//
// Resource for the typeWriter effect:
//https://betterprogramming.pub/typewriter-effect-in-swiftui-ba81db10b570
import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    let finalText: String = "Welcome to this simple app where you will surely find what you are looking for it's a random mix of things i have tried with SwiftUI."
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 16.0) {
                //if you want to use the button
                //                Text(text)
                //                Button("Type") {
                //                    typeWriter()
                //                }
                
                //here i removed the button to make it easier
                Text(text)
                    .foregroundColor(Color.blue)
                    .font(.title)
                    .padding()
                    .onAppear {
                        typeWriter()
                    }
                
            }
   
            NavigationLink(LocalizedStringKey("Ticket List ->"), destination: ContentListView())
                
               
            
        }
    }
        func typeWriter(at position: Int = 0) {
            if position == 0 {
                text = ""
            }
            if position < finalText.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    text.append(finalText[position])
                    typeWriter(at: position + 1)
                }
            }
        }
    }

#Preview {
    ContentView()
}
    extension String {
        subscript(offset: Int) -> Character {
            self[index(startIndex, offsetBy: offset)]
        }
    }
