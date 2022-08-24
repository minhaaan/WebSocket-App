import UIKit
import SwiftUI
import SocketIO

final class ViewController: UIViewController {
  
  private let blackView = UIHostingController(rootView: BlackLabel())
  private let blueLabel = UIHostingController(
    rootView: BlueLabel(text: "BlueLabel")
  ).view!
  private let purpleButton = UIHostingController(
    rootView: PurpleButton(
      tapAction: {
        print("DEBUG: taptaptap")
      }
    )
  ).view!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    setupLayout()
  }
  
  func connect() {
    let manager = SocketManager(
      socketURL: URL(string: "http://127.0.0.1:8080")!,
      config: [.log(true)]
    )
    let socket = manager.defaultSocket
    
    socket.on(clientEvent: .connect) { data, ack in
      print("DEBUG: socket connected")
    }
    
    socket.on("echo") { data, ack in
      guard let cur = data[0] as? Double else { return }
      
      socket.emitWithAck("aa", cur).timingOut(after: 0) { data in
        if data.first as? String ?? "passed" == SocketAckStatus.noAck {
          
        }
        
      }
    }
  }


}

extension ViewController {
  private func setupLayout() {
    view.backgroundColor = .white
    
    view.addSubview(blackView.view)
    blackView.view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      blackView.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      blackView.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
    ])
    
    view.addSubview(blueLabel)
    blueLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      blueLabel.centerXAnchor.constraint(equalTo: blackView.view.centerXAnchor),
      blueLabel.topAnchor.constraint(equalTo: blackView.view.bottomAnchor, constant: 20)
    ])
    
    view.addSubview(purpleButton)
    purpleButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      purpleButton.centerXAnchor.constraint(equalTo: blueLabel.centerXAnchor),
      purpleButton.topAnchor.constraint(equalTo: blueLabel.bottomAnchor, constant: 20)
    ])
  }
}
