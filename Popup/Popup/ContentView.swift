//
//  ContentView.swift
//  Popup
//
//  Created by dxiu on 6/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented = false
    
    @State private var curHeight: CGFloat = 700
    let minHeight: CGFloat = 700
    
    var body: some View {
        ZStack {
            // Button to display Registering Device popup wil
            // be here
            Button("Show Popup!") {
                isPresented = true
            }
            
            ModalView(isShowing: $isPresented)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
