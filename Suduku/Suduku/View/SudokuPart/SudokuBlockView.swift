//
//  SudokuBlockView.swift
//  Suduku
//
//  Created by 孙世伟 on 2021/8/15.
//

import SwiftUI

struct SudokuBlockView1: View {
    
    var numbers: [Figures]
    
    
    var body: some View {
        VStack ( spacing:0 ) {
            ForEach (0..<3) { index in
                SudokuRowView(numbers: divideRow(index))
                    .clipped()
            }
        }
    }
    
    func divideRow(_ index: Int) -> [Figures] {
        var result = [Figures]()
        let indexs = [[0,2],[3,5],[6,8]]
        let left = indexs[index][0]
        let right = indexs[index][1]
        result = numbers[left...right].map{ $0 }
        return result
    }
}



//struct SudokuBlockView_Previews: PreviewProvider {
//    static var previews: some View {
//        SudokuBlockView()
//    }
//}
