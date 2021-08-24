//
//  NoteView.swift
//  Suduku
//
//  Created by 孙世伟 on 2021/8/23.
//

import SwiftUI

struct NoteView: View {
    let noteArray: [Bool]
    var body: some View {
        VStack {
            ForEach(0..<3) { row in
                NoteCellView(noteArray: noteArray, index: row)
            }
        }
        .frame(width: 40, height: 40)
    }
}

//struct NoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        NoteView()
//    }
//}
