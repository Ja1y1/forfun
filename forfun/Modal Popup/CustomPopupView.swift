//
//  CustomPopupView.swift
//  forfun
//
//  Created by JAY on 17/05/2024.
//

//actioncardtableview add this popup
import SwiftUI

struct CustomPopupView: View {
    @State private var showingModal = false
    var body: some View {
        ZStack{
            VStack(spacing: 20) {
                Text("Custom Popup").font(.largeTitle)
                
                Text("Introduction").font(.title).foregroundColor(.gray)
                
                Text("You can create your own modal popup with the use of a ZStack and a State variable.")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .font(.title)
                    .layoutPriority(1)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
                //this makes the popup appear
                
                Button(action: {
                    self.showingModal = true
                }) {
                    Image("pausebutton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                }
                .position(CGPoint(x: 200, y:70 ))
                
//                Button(action: {
//                    self.showingModal = true
//                }) {
//                    Text("Show popup")
//                }
                Spacer()
            }
            if $showingModal.wrappedValue{
                
                ZStack{
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.vertical)
                    
                    //this VStack is the popup
                    VStack(spacing: 20) {
                        Text("Popup")
                            .bold().padding()
                            .frame(maxWidth: .infinity)
//                            .background(Color.orange)
                            .foregroundColor(Color.black)
                        
                  
                            Button(action: {
                                //add action
                            }
                            , label: {
                                Text("متابعة")
                                    .font(.custom("GESndBook", size: 25))
                                    .frame(width: 195, height: 66)
                                    .background(Color("start"))
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                            })
                            
                            Button(action: {
                                //add action
                            }
                            , label: {
                                Text("خروج")
                                    .font(.custom("GESndBook", size: 25))
                                    .frame(width: 195, height: 66)
                                    .background(Color("button"))
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                            })
                            
                            Button(action: {
                                //add action
                            }
                            , label: {
                                Image("speaker.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 35, height: 35)
                                Image(systemName: "switch.2")
                            })
                            
                            Button(action: {
                                //add action
                            }
                            , label: {
                                Image("music.note")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 35, height: 35)
                                Image(systemName: "switch.2")
                            })
             
                        Spacer()
                        Button(action: {
                            self.showingModal = false
                        }) {
                            Text("Close")
                        }.padding()
                        
                    } .frame(width: 300, height: 500)
                        .background(Color("Colorcustom"))
                        .cornerRadius(20).shadow(radius: 20)
                }
                
            }
        } // big stack container end
       
    }
}

#Preview {
    CustomPopupView()
}
