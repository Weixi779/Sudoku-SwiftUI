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
            Button("init") {
                DispatchQueue.main.async {
                    viewModel.initSudoku()
                }
            }
            VStack(spacing: 0) {
                ForEach(0..<3) { x in
                    HStack(spacing: 0) {
                        ForEach(0..<3) { y in
                            SudokuBlockView(blockNumber: x*3+y).environmentObject(viewModel)
                        }
                    }
                }
            }
            .border(Color.black, width: 1.5)
            .padding()
        }
    }
}
struct SudokuBlockView: View {
    @EnvironmentObject var viewModel: SudokuViewModel
    let blockNumber: Int
    var body: some View{
        let block = viewModel.boardController.blockDivide
        return VStack(spacing: 0) {
            ForEach(0..<3) { x in
                HStack(spacing: 0) {
                    ForEach(0..<3) { y in
                        SudokuCellView(
                            x: block[blockNumber][x*3+y].0,
                            y: block[blockNumber][x*3+y].1
                        )
                    }
                }
            }
        }.border(Color.black.opacity(0.3), width: 1)
        
    }
}


struct SudokuCellView: View {
    @EnvironmentObject var viewModel: SudokuViewModel
    let x: Int
    let y: Int

    var body: some View {
        let controller = viewModel.boardController
        print("fontView")
        return VStack {
            fontView
        }
        .border(Color.black.opacity(0.1), width: 1)
        .onTapGesture {
            controller.selectAction(x, y)
            print("\(controller.board.board[x][y].writeValue)")
        }
    }
    
    var fontView: some View {
        let figures = viewModel.boardController.getBoard()[x][y]
        var fontColor: Color
        switch figures.fontColor {
        case .known:
            fontColor = Color(.black)
        case .correct:
            fontColor = Color(.blue)
        case .wrong:
            fontColor = Color(.red)
        }
        
        return Text(viewModel.boardController.board.board[x][y].writeValue == 0 ? "0" : "\(viewModel.boardController.board.board[x][y].writeValue)")
            .foregroundColor(fontColor)
            .font(.system(size: 33, weight: .light, design: .default))
            .frame(width: 40, height: 40)
            .contentShape(Rectangle())
    }
}
