//
//  ButtonView.swift
//  Suduku
//
//  Created by 孙世伟 on 2021/8/22.
//

import SwiftUI

struct FunctionButtonView: View {
    @EnvironmentObject var viewmodel: SudokuViewModel
    
    var body: some View {
        HStack {
            fillButtonView
            noteButtonView
            Spacer()
            deleteButtonView
            
        }
        .padding([.vertical])
    }
    
    //.imageScale(.large)
    
    var fillButtonView: some View {
        FitButtonView(imageSystemName: "pencil", descriptionString: "填入")
            .whichcolor(viewmodel.buttonstate == .fill)
            .padding([.horizontal])
            .onTapGesture {
                viewmodel.setFillState()
            }
    }
    
    var noteButtonView: some View {
        FitButtonView(imageSystemName: "pencil.and.outline", descriptionString: "笔记")
            .whichcolor(viewmodel.buttonstate == .note)
            .padding([.horizontal])
            .onTapGesture {
                viewmodel.setNoteState()
            }
    }
    
    var deleteButtonView: some View {
        Button {
            viewmodel.DeleteButtonAction()
        } label: {
            FitButtonView(imageSystemName: "pencil.slash", descriptionString: "删除")
                .foregroundColor(.black)
                .padding([.horizontal])
        }
    }
}

struct FitButtonView: View {
    let imageSystemName: String
    let descriptionString: String
    
    var body: some View {
        VStack( spacing: 0 ){
            Image(systemName: imageSystemName)
                .resizable()
                .imageSize()
            Text(descriptionString)
                .font(.caption)
                .fixedSize(horizontal: false, vertical: true)
        }
        .contentShape(Rectangle())
    }
}

extension View {
    func whichcolor(_ flag: Bool) -> some View {
        return flag == true ?
            AnyView(self.modifier(blueButton()))
            :
            AnyView(self.modifier(greyButton()))
    }
    
    
    func imageSize() -> some View {
        self.modifier(imageButtonSize())
    }
}


struct blueButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
    }
}


struct greyButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
    }
}

struct imageButtonSize :ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 30, height: 30)
    }
}


