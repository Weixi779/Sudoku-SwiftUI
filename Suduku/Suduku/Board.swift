//
//  Board.swift
//  Suduku
//
//  Created by yunzhanghu1186 on 2021/11/25.
//

import Foundation

struct Board {
    var board: [[Figures]]
    
    init() {
        board = [[Figures]]()
        for x in 0..<9 {
            board.append( [Figures]() )
            for y in 0..<9 {
                board[x].append(Figures(x: x, y: y, aimValue: 0, writeValue: 0))
            }
        }
    }
    
    mutating func initBoardValue(_ x:Int, _ y:Int, _ aimValue: Int, _ writeValue: Int) {
        board[x][y].setAimValue(aimValue)
        board[x][y].setWriteValue(writeValue)
        if aimValue == writeValue { board[x][y].fontKnown() }
    }
    
    mutating func fillBoardValue(_ figures: inout Figures, _ fillValue: Int) {
        figures.setWriteValue(fillValue)
        figures.aimValue == fillValue ? figures.fontCorrect() : figures.fontWrong()
    }
    
    mutating func boardInitBlank() {
        board.forEach{ $0.forEach{ board[$0.x][$0.y].colorBlank() } }
    }
}
