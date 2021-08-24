//
//  FillButtonCellView.swift
//  Suduku
//
//  Created by 孙世伟 on 2021/8/17.
//

import SwiftUI

struct FillNumberCellView: View {
    @EnvironmentObject var viewmodel: SudokuViewModel
    
    var enterNumber: Int
    var body: some View {
        ZStack {
            Color(.white)
            Text("\(enterNumber)")
                .foregroundColor(Color.blue)
                .fontWeight(.light)
                .font(.system(size: 33))
        }
        .frame(width: 35, height: 35)
        .cornerRadius(5)
        .shadow(radius: 1)
        .onTapGesture {
            print("\(enterNumber)")
            viewmodel.FillButtonAction(enterNumber)
        }
            
    }
    
    
}

//struct FillButtonCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        FillButtonCellView()
//    }
//}
