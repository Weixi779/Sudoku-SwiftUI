//
//  SudokuCellView.swift
//  Suduku
//
//  Created by 孙世伟 on 2021/7/19.
//

import SwiftUI

struct SudokuCellView: View {
    @EnvironmentObject var viewModel: SudokuViewModel
    
    var figures: Figures
    
    var body: some View {
        VStack {
            figureDraw()
        }
        .onTapGesture {
            viewModel.ClickAction(figures)
        }
        
    }
    
    func figureDraw() -> some View{
        switch figures.mode {
        case .blank:
            return AnyView(blankDraw)
        case .deepen:
            return AnyView(deepenDraw)
        case .selected:
            return AnyView(selectionDraw)
        }
    }
    
    var blankDraw: some View {
        VStack {
            fontColorDraw
                .border(Color.black.opacity(0.1), width: 1)
        }
    }
    
    var deepenDraw: some View {
        VStack {
            fontColorDraw
                .background(Color("Deepen").opacity(0.2))
                .border(Color.black.opacity(0.1), width: 1)
        }
    }
    
    var selectionDraw: some View {
        VStack {
            fontColorDraw
                .background(Color("Deepen").opacity(0.5))
                .border(Color.black.opacity(0.1), width: 1)
        }
    }
    
    var fontColorDraw: some View {
        switch figures.fontColor {
        case .know:
            return AnyView(fontKnow)
        case .unknow:
            return AnyView(fontUnknow)
        case.wrong:
            return AnyView(fontWrong)
        case.note:
            return AnyView(NoteView(noteArray: figures.noteArray))
        }
    }
    
    var printDraw: String { figures.value == 0 ? "" : "\(figures.value)" }
    
    var fontKnow: some View {
        Text(printDraw)
            .foregroundColor(.black)
            .fontDesign()
    }
    
    var fontUnknow: some View {
        Text(printDraw)
            .foregroundColor(.blue)
            .fontDesign()
    }

    var fontWrong: some View {
        Text(printDraw)
            .foregroundColor(.red)
            .fontDesign()
    }
    
        
}

//struct SudokuCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        SudokuCellView()
//    }
//}




extension View {
    func fontDesign() -> some View {
        self.modifier(FontDesign())
    }
}


struct FontDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 33, weight: .light, design: .default))
            .frame(width: 40, height: 40)
            .contentShape(Rectangle())
    }
}



