import Foundation
import WebSocketKit
import NIO

final class WebSocketManager {
  
  private let url = URL(string: "ws://localhost:8080/echo")
  private let eventLoop = MultiThreadedEventLoopGroup(numberOfThreads: 1)
  
  var ws: WebSocket!
  
  static let shared = WebSocketManager()
  
  private init() {}
  
  func connect() {
    WebSocket.connect(to: url!, on: eventLoop) { ws in
      self.ws = ws
    }
    
  }
  
  func disconnect() {
    ws.close()
  }
  
  func send(text: String) {
    ws.send(text)
  }
  
}
