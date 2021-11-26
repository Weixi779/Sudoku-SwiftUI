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
    
    func initSudoku() {
        boardController.reinitToBlank()
        let board = [[Int]](repeating: [Int](repeating: 0, count: 9), count: 9)
        // TODO: DLXController
        let dlx = DLX(board: board)
        dlx.initStartSudoku(11)
        
        let startBoard = dlx.export()
        dlx.solve()
        let finalBoard = dlx.export()
        boardController.initBoardAction(aimBoard: finalBoard, filledBoard: startBoard)

    }
    
    func getBoard() -> [[Figures]] {
        return boardController.getBoard()
    }
    
    func restartSudoku() {
        boardController.reinitToBlank()
    }
    
    func clickFiguresAction(_ figures: inout Figures) {
        boardController.selectAction(&figures)
    }
    
    func fillFigutreAction(_ fillValue: Int) {
        boardController.fillAction(fillValue)
    }
    
    func deleteFigutreAction() {
        boardController.deleteActionNormal()
    }
}
