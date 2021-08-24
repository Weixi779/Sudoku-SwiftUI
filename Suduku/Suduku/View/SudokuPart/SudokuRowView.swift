//
//  SudokuView.swift
//  Suduku
//
//  Created by 孙世伟 on 2021/7/19.
//

import SwiftUI

struct SudokuRowView: View {
    var numbers: [Figures]
    var body: some View {
        HStack(spacing: 0) {
            ForEach (numbers) { number in
                SudokuCellView(figures: number)
                    .clipped()
            }
        }
        

    }
}

//struct SudokuView_Previews: PreviewProvider {
//    static var previews: some View {
//        SudokuView()
//    }
//}
