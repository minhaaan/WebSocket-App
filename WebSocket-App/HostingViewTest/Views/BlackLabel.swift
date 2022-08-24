//
//  BlackView.swift
//  WebSocket-App
//
//  Created by 최민한 on 2022/08/24.
//

import SwiftUI

struct BlackLabel: View {
  var body: some View {
    HStack {
      Text("Hello World!")
        .foregroundColor(.white)
        .font(.system(size: 24, weight: .black, design: .rounded))
    }
    .padding(12)
    .background(Color.black)
    .cornerRadius(12)
  }
}

struct BlackView_Previews: PreviewProvider {
  static var previews: some View {
    BlackLabel()
  }
}
