//
//  FillButtonCellView.swift
//  Suduku
//
//  Created by 孙世伟 on 2021/8/17.
//

import SwiftUI

//struct FillNumberCellView: View {
//    @EnvironmentObject var viewmodel: SudokuViewModel
//    
//    var enterNumber: Int
//    @State var isOver = false
//    var body: some View {
//        ZStack {
//            Color(.white)
//            Text("\(enterNumberSet())")
//                .foregroundColor(Color.blue)
//                .fontWeight(.light)
//                .font(.system(size: 33))
//        }
//        .frame(width: 35, height: 35)
//        .cornerRadius(5)
//        .shadow(radius: 1)
//        .onTapGesture {
//            if enterNumberSet() != "" {
//                viewmodel.FillButtonAction(enterNumber)
//            }
//            if viewmodel.sudoku.numberList != [] && viewmodel.sudoku.numberList[0] == 0 {
//                isOver.toggle()
//            }
//        }
//        .alert(isPresented: $isOver) {
//            Alert(title: Text("恭喜您完成数独"),
//                  message: Text("难度系数:\(viewmodel.getLevel())      共用时:\(viewmodel.sudoku.time[0])\(viewmodel.sudoku.time[1]):\(viewmodel.sudoku.time[2])\(viewmodel.sudoku.time[3])"),
//                  dismissButton: .default(Text("确定")) )
//        }
//            
//    }
//    
//    func enterNumberSet() -> String {
//        if viewmodel.sudoku.numberList != [] && viewmodel.sudoku.numberList[enterNumber] == 9 {
//            return ""
//        } else {
//            return "\(enterNumber)"
//        }
//    }
//}

//struct FillButtonCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        FillButtonCellView()
//    }
//}
