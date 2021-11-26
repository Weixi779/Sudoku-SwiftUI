//
//  FillButtonView.swift
//  Suduku
//
//  Created by 孙世伟 on 2021/8/17.
//

import SwiftUI

struct FilNumberlListView: View {
    var body: some View {
        HStack (spacing: 5) {
            ForEach (1..<10) { number in
//                FillNumberCellView(enterNumber: number)
            }
        }
    }
}

struct FillButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FilNumberlListView()
    }
}
