//
//  QrcodeViewModel.swift
//  forfun
//
//  Created by JAY on 04/10/2024.
//

import Foundation
import SwiftUI
import Combine
import SVGKit
//http://127.0.0.1:3000/tickets/ID show id info
//http://127.0.0.1:3000/tickets/ID/qr display specific qr code
class QrcodeViewModel :ObservableObject{
    @Published var qrCodeImage: UIImage? = nil
    @Published var tickets: [Ticket] = []
      private var cancellables = Set<AnyCancellable>()
    
    func getQRCode (){
        guard let url = URL(string:"http://127.0.0.1:3000/tickets")
        else {return}
        
        print("GET Request URL: \(url)")
        print("HTTP Method: GET")
        
        URLSession.shared.dataTaskPublisher(for: url)
                   .map(\.data)
                   .decode(type: [Ticket].self, decoder: JSONDecoder())
                   .receive(on: DispatchQueue.main)
                   .sink(receiveCompletion: { completion in
                       switch completion {
                       case .failure(let error):
                           print("Error fetching tickets: \(error)")
                       case .finished:
                           break
                       }
                   },  receiveValue: { [weak self] tickets in
                       print("Received tickets: \(tickets)")
                       self?.tickets = tickets
                       
//                       if let firstTicket = tickets.first {
//                           self?.fetchQRCodeImage(for: firstTicket.id)
//                       }
                   })
                   .store(in: &cancellables)
                }
            
//                if let json = try?
//                    JSONSerialization.jsonObject(with: data, options: []){
//                    print("Raw JSON Response:\(json)")
//                }
          
            //http://127.0.0.1:3000/tickets/\(ticketId)/qr
//            .decode(type:[].self, decoder: JSONDecoder())
                   func fetchQRCodeImage(for ticketId: Int) {
                      let qrCodeUrlString = "http://127.0.0.1:3000/tickets/\(ticketId)/qr"
                              guard let url = URL(string: qrCodeUrlString) else {
                                  print("Invalid QR code URL")
                                  return
                              }
                       print("GET Request URL: \(url)")
                       print("HTTP Method: GET")
                       
                              URLSession.shared.dataTaskPublisher(for: url)
                                  .tryMap { (data, response) -> UIImage? in
                                     
                                      if let httpResponse = response as? HTTPURLResponse{
                                          print("HTTP Status Code: \(httpResponse.statusCode)")
                                      }
                                      let svgString = String(data: data, encoding: .utf8) ?? "No data"
                                   
                                      
                                      let previewLength = 100
                                      let shortenedSvgString = svgString.prefix(previewLength) + "..." + svgString.suffix(previewLength)
                                      
                                      print("Received QR code data (shortened): \(shortenedSvgString)")
                                      
                                      let svgImage = SVGKImage(data: data)
                                      print("SVG Image: \(String(describing: svgImage))")
                                      return svgImage?.uiImage
                                  }
                       
                                  .receive(on: DispatchQueue.main)
                                  .sink(receiveCompletion: { completion in
                                      switch completion {
                                      case .failure(let error):
                                          print("Error fetching QR code: \(error)")
                                      case .finished:
                                          print("Finished fetching QR code")
                                      }
                                  }, receiveValue: { [weak self] image in
                                      print("Received QR code image")
                                      self?.qrCodeImage = image
                                  })
                                  .store(in: &cancellables)
                          }
                 }
