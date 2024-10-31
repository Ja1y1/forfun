//
//  QRView.swift
//  forfun
//
//  Created by JAY on 05/10/2024.
//

import SwiftUI

struct QRView: View {
    @StateObject private var viewModel = QrcodeViewModel()
    var ticketId: Int
    var body: some View {
        VStack() {
            
            if let qrCodeImage = viewModel.qrCodeImage {
                Image(uiImage: qrCodeImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            } else {
                // Placeholder QR code icon
                Image(systemName: "qrcode")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.blue)
                    .onAppear {
                        // Trigger QR code fetch based on the ticketId
                        viewModel.fetchQRCodeImage(for: ticketId)
                    }
            }
        }
        .toolbar {
            // Custom ToolbarItem for title
            ToolbarItem(placement: .principal) {
                Text("Ticket ID: \(ticketId)")
                    .font(.headline)
                    .foregroundColor(.purple)
            }
        }
        
        .onAppear {
            print("Showing QRView for ticket ID: \(ticketId)")
        }
    }
        
}

#Preview {
    TicketListView()
}
