//
//  Extensions.swift
//  forfun
//
//  Created by JAY on 16/05/2024.
// https://youtu.be/zW2OCKsmg8c?si=dFVX_C8Jtp9DtJRi

import Foundation
import SwiftUI

//MARK: Custom View Proprety Extensions
extension View{
    
    func popupNavigationView<Content: View>( horizontalPadding: CGFloat =  40, show: Binding<Bool>, @ViewBuilder content: @escaping()-> Content)-> some View{
         return self
            .overlay {
                
                if show.wrappedValue{
                    
                //MARK: GEOMETRY READER FOR READING CONTAINER FRAME
                    GeometryReader{
                        proxy in
                        let size = proxy.size
                        
                        NavigationView{
                            content()
                        }.frame(width: size.width - horizontalPadding, height: size.height / 1.7, alignment: .center)
                        //Corner radius
                            .cornerRadius(15)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    }
                }
            }
    }
}
