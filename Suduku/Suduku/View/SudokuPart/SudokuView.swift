//
//  SudokuView.swift
//  Suduku
//
//  Created by 孙世伟 on 2021/8/14.
//

import SwiftUI

//struct SudokuView: View {
//    @ObservedObject var viewModel: SudokuViewModel
//    @State var isCount = false
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//
//    var body: some View {
//        VStack {
//            HStack {
//                Button("ReinitSudoku") {
//                    ReinitSudoku()
//                }
//            }
//
//            sudokuHeadView
//
//            VStack (spacing: 0) {
//                ForEach(0..<3) { number in
//                    SudokuGroupView(sudokuGroup: divideGroup(number)).environmentObject(viewModel)
//                }
//            }
//            .border(Color.black, width: 1.5)
//        }
//        .onReceive(timer) { _ in
//            if isCount == true {
//                viewModel.addTime()
//            }
//        }
//
//
//    }
//
//    var sudokuHeadView: some View {
//        HStack {
//            levelView
//            Spacer()
//            timeCounterView
//        }
//    }
//
//    var levelView: some View {
//        HStack {
//            Text("难度系数:")
//            viewModel.getLevel() == 81 ? Text("-") : Text("\(viewModel.getLevel())")
//        }
//            .padding([.horizontal])
//    }
//
//    var timeCounterView: some View {
//        HStack {
//            viewModel.sudoku.time == [] ?  Text("--:--") : Text("\(viewModel.sudoku.time[0])\(viewModel.sudoku.time[1]):\(viewModel.sudoku.time[2])\(viewModel.sudoku.time[3])")
//            Button {
//                isCount.toggle()
//            } label: {
//                ( isCount == false ?
//                Image(systemName: "play.fill")
//                    :
//                Image(systemName: "stop.fill")
//                )
//                .frame(width: 20, height: 20)
//                .foregroundColor(.gray)
//            }
//        }
//        .padding([.horizontal])
//    }
//
//    func divideGroup(_ index: Int) -> [[Figures]] {
//        var result = [[Figures]]()
//        let indexs = [[0,2],[3,5],[6,8]]
//        let left = indexs[index][0]
//        let right = indexs[index][1]
//        result = viewModel.sudoku.board[left...right].map{ $0 }
//        return result
//    }
//
//    func ReinitSudoku() {
//        viewModel.RestartSudoku()
//        viewModel.initSudoku()
//    }
//}

//struct SudokuView_Previews: PreviewProvider {
//    static var previews: some View {
//        SudokuView()
//    }
//}

struct SudokuView: View {
    @ObservedObject var viewModel: SudokuViewModel
    
    var body: some View {
        VStack {
            
        }
    }
}
