//
//  BoardController.swift
//  Suduku
//
//  Created by yunzhanghu1186 on 2021/11/26.
//

import Foundation

class BoardController {
    var board: Board = Board()
    var lastSelected: Figures?
    var blockDivide: [[(Int,Int)]]
    
    init() {
        blockDivide = [[(Int,Int)]]()
        let arr = [[0,1,2], [3,4,5], [6,7,8]]
        for time in 0..<9 {
            var temp = [(Int,Int)]()
            for i in arr[time/3] {
                for j in arr[time%3] {
                    temp.append((i,j))
                }
            }
            blockDivide.append(temp)
        }
    }
    
    func reinitToBlank() {
        board = Board()
        lastSelected = nil
    }
    
    func initBoardAction(aimBoard: [[Int]], filledBoard: [[Int]]) {
        lastSelected = nil
        for x in 0..<9 {
            for y in 0..<9 {
                board.board[x][y].setAimValue(aimBoard[x][y])
                board.board[x][y].setWriteValue(filledBoard[x][y])
            }
        }
    }
    
    func getBoard() -> [[Figures]] {
        return board.board
    }
    
    
    func getDiviedBlockBoard() -> [[(Int,Int)]] {
        return blockDivide
    }
    
    /*
     - 选区的全部操作
        1. 清除之前的所有选择操作（设置全部选区为Blank）
        2. 高亮同行、列、块的其他所有方格
        3. 要是选择不为空，选上其他同值块
        4. 更新选择
     */
    func selectAction(_ figures: inout Figures) {
        // Part1
        boardInitBlank()
        // Part2
        let x = figures.x
        let y = figures.y
        for index in 0..<9 {
            board.board[x][index].colorHighLight()
            board.board[index][y].colorHighLight()
        }
        let block = (x/3)*3 + (y/3)
        blockDivide[block].forEach{ (x,y) in
            board.board[x][y].colorHighLight()
        }
        // Part3
        let writedValue = figures.writeValue
        if writedValue != 0 {
            for i in 0..<9 {
                for j in 0..<9 {
                    if board.board[i][j].writeValue == writedValue {
                        board.board[i][j].colorSelected()
                    }
                }
            }
        }
        lastSelected = figures
    }
    
    func boardInitBlank() {
        for x in 0..<9 {
            for y in 0..<9 {
                board.board[x][y].colorBlank()
            }
        }
    }
    
    func fillAction(_ writeValue: Int) {
        guard let lastSelected = lastSelected else { return }
        let x = lastSelected.x
        let y = lastSelected.y
        board.board[x][y].setWriteValue(writeValue)
    }
    
    func deleteActionNormal() {
        guard let lastSelected = lastSelected else { return }
        guard lastSelected.fontColor != .known else { return }
        let x = lastSelected.x
        let y = lastSelected.y
        board.board[x][y].setWriteValue(0)
    }
    
    func deleteActionEdited() {
        guard let lastSelected = lastSelected else { return }
        let x = lastSelected.x
        let y = lastSelected.y
        board.board[x][y].setWriteValue(0)
    }
}
