//
//  PurpleButton.swift
//  WebSocket-App
//
//  Created by 최민한 on 2022/08/24.
//

import SwiftUI

struct PurpleButton: View {
  let tapAction: () -> Void
  
  var body: some View {
    Button {
      tapAction()
    } label: {
      Text("PurpleButton")
        .foregroundColor(.white)
        .font(.system(size: 15, weight: .heavy, design: .monospaced))
    }
    .padding(15)
    .background(Color.pink)
    .cornerRadius(12)
  }
}

struct PurpleButton_Previews: PreviewProvider {
  static var previews: some View {
    PurpleButton(tapAction: {})
  }
}
