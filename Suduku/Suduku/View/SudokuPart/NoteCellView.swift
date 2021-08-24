//
//  NoteCellView.swift
//  Suduku
//
//  Created by 孙世伟 on 2021/8/23.
//

import SwiftUI

struct NoteCellView: View {
    let noteArray: [Bool]
    let index: Int
    var body: some View {
        HStack(spacing:0) {
            ForEach(index*3..<index*3+3) { item in
                Text(noteArray[item] == false ? "" : "\(item + 1)")
                    .font(.system(size: 10, weight: .light, design: .default))
                    .foregroundColor(.gray)
                    .frame(width: 10, height: 10)
            }
        }
    }
}

//struct NoteCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteCellView()
//    }
//}
