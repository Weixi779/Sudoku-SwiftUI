//
//  ContentView.swift
//  Suduku
//
//  Created by 孙世伟 on 2021/7/19.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = SudokuViewModel()
    @StateObject var viewModel = SudokuViewModel()
    var body: some View {
        VStack {
            SudokuView(viewModel: viewModel)
            //FunctionButtonView().environmentObject(viewModel)
            //FilNumberlListView().environmentObject(viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
