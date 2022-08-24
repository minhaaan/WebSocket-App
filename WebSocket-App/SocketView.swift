//
//  SocketView.swift
//  WebSocket-App
//
//  Created by 최민한 on 2022/08/24.
//

import SwiftUI

struct SocketView: View {
  @State private var inputText: String = ""
  
//  private let socketIOManager = SocketIOManager.shared
  private let webSocketManager = WebSocketManager.shared
  
  var body: some View {
    VStack {
      Button {
        webSocketManager.connect()
      } label: {
        Text("connect")
          .foregroundColor(.white)
          .font(.system(size: 12, weight: .black, design: .monospaced))
      }
      .padding(12)
      .background(Color.blue)
      .cornerRadius(12)
      
      Button {
        webSocketManager.disconnect()
      } label: {
        Text("disconnect")
          .foregroundColor(.white)
          .font(.system(size: 12, weight: .black, design: .monospaced))
      }
      .padding(12)
      .background(Color.green)
      .cornerRadius(12)
      
      Divider().padding(.horizontal, 20)
      
      TextField("message..", text: $inputText)
        .font(.system(size: 25, weight: .medium, design: .rounded))
        .padding(12)
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(.black, lineWidth: 2)
        )
        .padding(.horizontal, 40)
      
      Button {
        webSocketManager.send(text: inputText)
        inputText = ""
      } label: {
        Text("Send")
          .font(.system(size: 12, weight: .bold, design: .serif))
          .foregroundColor(.white)
      }
      .padding(12)
      .background(Color.pink)
      .cornerRadius(12)

    }
  }
}

struct SocketView_Previews: PreviewProvider {
  static var previews: some View {
    SocketView()
  }
}
