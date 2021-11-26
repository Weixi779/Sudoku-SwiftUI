//
//  SudokuViewModel.swift
//  Suduku
//
//  Created by 孙世伟 on 2021/7/19.
//

import Foundation

enum buttonState {
    case fill, note
}
//
//class SudokuViewModelBefore: ObservableObject {
//    @Published var sudoku: Sudoku {
//        didSet {
//            let encoder = JSONEncoder()
//            if let encoder = try? encoder.encode(sudoku) {
//                UserDefaults.standard.set(encoder, forKey: "Sudoku")
//            }
//        }
//    }
//    var section = [(Int,Int)]()
//    var deepen = [(Int,Int)]()
//    @Published var buttonstate: buttonState = .fill
//    
//    init() {
//        if let s = UserDefaults.standard.data(forKey: "Sudoku") {
//            let decoder = JSONDecoder()
//            if let decoded = try? decoder.decode(Sudoku.self, from: s) {
//                self.sudoku = decoded
//                return
//            }
//        }
//        self.sudoku = Sudoku.init()
//    }
//    
//    func initSudoku() {
//        let board = [[Int]](repeating: [Int](repeating: 0, count: 9), count: 9)
//        let dlx = DLX(board: board)
//        dlx.initStartSudoku(11)
//        let level = dlx.RemoveToSingele()
//        sudoku.setLevel(level)
//        let startBoard = dlx.export()
//        dlx.solve()
//        let finalBoard = dlx.export()
//        for x in 0..<9 {
//            for y in 0..<9 {
//                sudoku.setValue(x: x, y: y, value: startBoard[x][y], aimValue: finalBoard[x][y])
//            }
//        }
//    }
//    
//    func RestartSudoku() {
//        sudoku = Sudoku()
//        deepen = [(Int,Int)]()
//        section = [(Int,Int)]()
//    }
//    
//    func ClickAction(_ figures: Figures) {
//        SectionAction(figures)
//    }
//    
//    func FillButtonAction(_ fillNumber: Int) {
//        switch buttonstate {
//        case .fill:
//            FillAction(fillNumber)
//
//        case .note:
//            NoteAction(fillNumber)
//        }
//    }
//    
//    func DeleteButtonAction() {
//        DeleteAction()
//    }
//    
//    func getLevel() -> Int {
//        return 81 - sudoku.getLevel()
//    }
//    
//    func setFillState() {
//        buttonstate = .fill
//    }
//    
//    func setNoteState() {
//        buttonstate = .note
//    }
//    
//    func addTime() {
//        if sudoku.time != [] {
//            sudoku.addAction()
//        }
//    }
//}
//
//// - MARK: DeepenPart
//extension SudokuViewModelBefore {
//    // 1.将之前的变为blank
//    // 2.清空数组
//    // 3.将所有符合的区域加入
//    // 4.数组遍历变成Deepen
//    private func DeepenAction(_ figures: Figures) {
//        let x = figures.x
//        let y = figures.y
//        deepen.forEach{ sudoku.setBlank($0.0, $0.1) }
//        deepen = [(Int,Int)]()
//        for row in 0..<9 {
//            deepen.append((x,row))
//        }
//        for col in 0..<9 {
//            deepen.append((col,y))
//        }
//        
//        let target = (x/3)*3 + (y/3)
//        for row in 0..<9 {
//            for col in 0..<9 {
//                if row != x , col != y , ((row/3)*3 + (col/3)) == target {
//                    deepen.append((row,col))
//                }
//            }
//        }
//        
//        deepen.forEach{ sudoku.setDeepen($0.0, $0.1) }
//    }
//}
//
//
//// - MARK: SelectionPart
//extension SudokuViewModelBefore {
//    private func SectionAction(_ figures: Figures) {
//
//        section.forEach{ sudoku.setBlank($0.0, $0.1) }
//        DeepenAction(figures)
//        section = [(Int,Int)]()
//        section.append((figures.x,figures.y))
//        if figures.value != 0 {
//            for row in 0..<9 {
//                for col in 0..<9 {
//                    if sudoku.board[row][col].value == figures.value {
//                        section.append((row,col))
//                    }
//                }
//            }
//        }
//        section.forEach{ sudoku.setSelected($0.0, $0.1) }
//    }
//}
//
//// - MARK: FiilPart
//extension SudokuViewModelBefore {
//    private func FillAction(_ fillNumber: Int) {
//        if let aimFigures = section.first{
//            let x = aimFigures.0
//            let y = aimFigures.1
//            if sudoku.getFontState(x, y) != .know {
//                sudoku.fillValue(x, y, fillNumber)
//                FillNoteAction(fillNumber)
//            }
//        }
//    }
//    
//    private func FillNoteAction(_ fillNumber: Int) {
//        for figure in deepen {
//            if sudoku.getFontState(figure.0, figure.1) == .note {
//                sudoku.board[figure.0][figure.1].noteSetNumberFalse(fillNumber-1)
//            }
//        }
//    }
//}
//
//// - MARK: DeletePArt
//extension SudokuViewModelBefore {
//    private func DeleteAction() {
//        if let aimFigures = section.first  {
//            let x = aimFigures.0
//            let y = aimFigures.1
//            if sudoku.getFontState(x, y) != .know {
//                sudoku.fillValue(x, y, 0)
//            }
//        }
//    }
//}
//
//// - MARK: NotePart
//extension SudokuViewModelBefore {
//    private func NoteAction(_ fillNumber: Int) {
//        if let aimFigures = section.first {
//            let x = aimFigures.0
//            let y = aimFigures.1
//            if sudoku.getFontState(x, y) != .know {
//                if sudoku.getFontState(x, y) != .note {
//                    sudoku.setNote(x, y)
//                }
//                sudoku.setNoteArrayIndex(x, y, fillNumber)
//            }
//        }
//    }
//}
