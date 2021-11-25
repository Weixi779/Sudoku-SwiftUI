//
//  Figures.swift
//  Suduku
//
//  Created by yunzhanghu1186 on 2021/11/25.
//

import Foundation

// 字体颜色分类
enum FontColor: Codable {
    case known      // 正常已知
    case correct    // 填写正确
    case wrong      // 填写错误
}

// 背景颜色分类
enum BackgroundColor: Codable {
    case blank      // 无背景色
    case deepen     // 连带选择
    case selected   // 被选择
}

struct Figures: Identifiable, Codable {
    var id = UUID()
    let x: Int
    let y: Int
    var aimValue: Int
    var writeValue: Int

    var fontColor: FontColor {
        get {
            if writeValue != 0 {
                return .known
            } else {
                return aimValue == writeValue ? .correct : .wrong
            }
        }
    }
    
    var backgroundColor: BackgroundColor = .blank
    
    
    init(x: Int, y: Int, aimValue: Int, writeValue: Int) {
        self.x = x
        self.y = y
        self.aimValue = aimValue
        self.writeValue = writeValue
    }
    
    mutating func setWriteValue(_ writeValue: Int) { self.writeValue = writeValue }
    
    mutating func setAimValue(_ aimValue: Int) { self.aimValue = aimValue }
    
    mutating func colorBlank() { self.backgroundColor = .blank }
    
    mutating func colorDeepen() { self.backgroundColor = .deepen }
    
    mutating func colorSelected() { self.backgroundColor = .selected }

}
