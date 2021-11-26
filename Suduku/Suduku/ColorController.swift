//
//  ColorController.swift
//  Suduku
//
//  Created by yunzhanghu1186 on 2021/11/26.
//

import Foundation
import SwiftUI

struct ColorSet {
    let backgroundColor: Color
    let normalColor: Color
    let highLightColor: Color
    let selectedColor: Color
    init(_ backgroundColor: Color,_ normalColor:Color,_ highLightColor:Color,_ selectedColor:Color) {
        self.backgroundColor = backgroundColor
        self.normalColor = normalColor
        self.highLightColor = highLightColor
        self.selectedColor = selectedColor
    }
}

class ThemeColor {
    var themeColor: ColorSet
    private let normal = ColorSet(
        Color(.white),
        Color(.white),
        Color("Deepen").opacity(0.2),
        Color("Deepen").opacity(0.5)
    )
    private let SP = ColorSet(
        Color(.black),
        Color(.black),
        Color(.black),
        Color(.black)
    )
    init() {
        themeColor = normal
    }
    
    func ThemeToNormal() { themeColor = normal }
    func ThemeToSP() { themeColor = SP }
    
    func backgroundColor() -> Color {
        return themeColor.backgroundColor
    }
    func normalColor() -> Color {
        return themeColor.normalColor
    }
    func highLightColor() -> Color {
        return themeColor.highLightColor
    }
    func selectedColor() -> Color {
        return themeColor.selectedColor
    }
}
