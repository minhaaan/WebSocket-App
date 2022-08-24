//
//  ViewController.swift
//  WebSocket-App
//
//  Created by 최민한 on 2022/08/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
  
  let blackView = UIHostingController(rootView: BlackLabel())

  let blueLabel = UIHostingController(rootView: BlueLabel()).view!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    setupLayout()
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
  }
}
