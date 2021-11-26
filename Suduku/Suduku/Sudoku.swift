//
//  Suduku.swift
//  Suduku
//
//  Created by 孙世伟 on 2021/7/19.
//

import Foundation

//struct Sudoku: Codable {
//    
//    var board: [[Figures]]
//    var numberList: [Int]
//    var level: Int
//    var time: [Int]
//    
//    init() {
//        board = [[Figures]]()
//        level = 0
//        time = [0,0,0,0]
//        numberList = [81,0,0,0,0,0,0,0,0,0]
//        for x in 0..<9 {
//            board.append([Figures]())
//            for y in 0..<9 {
//                board[x].append(Figures(x: x, y: y, value: 0, aimValue: 0))
//            }
//        }
//    }
//    
//    mutating  func setValue(x: Int, y:Int, value:Int, aimValue: Int) {
//        let index = board[x][y].value
//        numberList[index] -= 1
//        numberList[value] += 1
//        board[x][y].setValue(value)
//        board[x][y].setAimValue(aimValue)
//        if value != aimValue {
//            board[x][y].setUnknow()
//        }
//    }
//    
//    mutating func fillValue(_ x: Int, _ y: Int, _ fillValue: Int) {
//        let aim = board[x][y].aimValue
//        let index = board[x][y].value
//        numberList[index] -= 1
//        numberList[fillValue] += 1
//        board[x][y].setValue(fillValue)
//        if aim == fillValue {
//            board[x][y].setUnknow()
//        } else {
//            board[x][y].setWrong()
//        }
//    }
//    
//    mutating func setLevel(_ levelNumber: Int) {
//        self.level = levelNumber
//    }
//    
//    func getLevel() -> Int {
//        return level
//    }
//    
//    mutating func setBlank(_ x: Int, _ y: Int) {
//        board[x][y].modeToggleBlank()
//    }
//    
//    mutating func setDeepen(_ x: Int, _ y: Int) {
//        board[x][y].modeToggleDeepen()
//    }
//    
//    mutating func setSelected(_ x: Int, _ y: Int) {
//        board[x][y].modeToggleSelected()
//    }
//    
//    mutating func setNote(_ x: Int, _ y: Int) {
//        board[x][y].setNote()
//    }
//    
//    mutating func getFontState(_ x: Int, _ y: Int) -> FontState {
//        return board[x][y].fontColor
//    }
//    
//    mutating func setNoteArrayIndex(_ x: Int, _ y: Int, _ fillNumber: Int) {
//        board[x][y].noteArraySetNumber(fillNumber-1)
//    }
//    
//    mutating func addAction() {
//        time[3] += 1
//        if time[3] >= 10 {
//            time[2] += time[3]/10
//            time[3] %= 10
//        }
//        
//        if time[2] >= 6 {
//            time[1] += time[2]/6
//            time[2] %= 6
//        }
//        
//        if time[1] >= 10 {
//            time[0] += time[1]/10
//            time[1] %= 10
//        }
//    }
//}
