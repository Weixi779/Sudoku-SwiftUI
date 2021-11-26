//
//  SudokuController.swift
//  Suduku
//
//  Created by yunzhanghu1186 on 2021/11/26.
//

import Foundation

enum OperationState {
    case fill
    case note
}

class SudokuViewModel: ObservableObject {
    @Published var boardController = BoardController()
    @Published var themeColor = ThemeColor()
    
    func initSudoku() {
        print("start init")
        boardController.reinitToBlank()
        let board = [[Int]](repeating: [Int](repeating: 0, count: 9), count: 9)
        // TODO: DLXController
        let dlx = DLX(board: board)
        dlx.initStartSudoku(11)
        
        let startBoard = dlx.export()
        print("startBoard is over")
        print(startBoard)
        dlx.solve()
        let finalBoard = dlx.export()
        print("finalBoard is over")
        print(finalBoard)
        boardController.initBoardAction(aimBoard: finalBoard, filledBoard: startBoard)

    }
    
    func getBoard() -> [[Figures]] {
        return boardController.getBoard()
    }
    
    func getDivideBlock() -> [[(Int,Int)]] {
        return boardController.blockDivide
    }
    
    func restartSudoku() {
        boardController.reinitToBlank()
    }
    
    func clickFiguresAction(_ x: Int, _ y: Int) {
        boardController.selectAction(x, y)
    }
    
    func fillFigutreAction(_ fillValue: Int) {
        boardController.fillAction(fillValue)
    }
    
    func deleteFigutreAction() {
        boardController.deleteActionNormal()
    }
}
