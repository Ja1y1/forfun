//
//  QRCodeView.swift
//  forfun
//
//  Created by JAY on 04/10/2024.
//

import SwiftUI
import SVGKit
import SVGKitSwift
struct TicketListView: View {
    @StateObject private var viewModel = QrcodeViewModel()
    
    var body: some View {
        NavigationStack{
            VStack {
                List(viewModel.tickets, id: \.id) { ticket in
                    NavigationLink(destination: QRView(ticketId: ticket.id)) {
                        VStack(alignment: .leading) {
                            Text("Ticket ID: \(ticket.id)")
                                .font(.headline)
                                .foregroundColor(.blue)
                            Text("Code: \(ticket.code)")
                                .font(.subheadline)
                                .foregroundColor(.purple)
                        }
                    }
                }
                .navigationTitle("Tickets")
                .onAppear {
                    viewModel.getQRCode()
                    
                    // Fetch tickets on view load
                }
            }
        }
    }
        }
        
#Preview {
    TicketListView()
}
