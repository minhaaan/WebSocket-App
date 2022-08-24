//
//  BlueLabel.swift
//  WebSocket-App
//
//  Created by 최민한 on 2022/08/24.
//

import SwiftUI

struct BlueLabel: View {
  let text: String
  
  var body: some View {
    HStack {
      Text(text)
        .foregroundColor(.blue)
        .font(.system(size: 24, weight: .black, design: .rounded))
    }
    .padding(24)
    .background(Color.black)
    .cornerRadius(12)
  }
}

struct BlueLabel_Previews: PreviewProvider {
  static var previews: some View {
    BlueLabel(text: "123")
  }
}
