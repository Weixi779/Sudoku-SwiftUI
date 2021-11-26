//
//  SudokuGroupView.swift
//  Suduku
//
//  Created by 孙世伟 on 2021/8/15.
//

import SwiftUI
//
//struct SudokuGroupView: View {
//    var sudokuGroup: [[Figures]]
//
//    var body: some View {
//        HStack (spacing: 0) {
//            ForEach(0..<3) { number in
//                SudokuBlockView(numbers: divideGroup(number))
//                    .border(Color.black.opacity(0.3), width: 1)
//                    .clipped()
//            }
//        }
//    }
//
//    func divideGroup(_ index: Int) -> [Figures] {
//        var result = [Figures]()
//        let indexs = [[0,2],[3,5],[6,8]]
//        let left = indexs[index][0]
//        let right = indexs[index][1]
//        for group in sudokuGroup {
//            result += group[left...right].map{ $0 }
//        }
//        return result
//    }
//}

//struct SudokuGroupView_Previews: PreviewProvider {
//    static var previews: some View {
//        SudokuGroupView()
//    }
//}
