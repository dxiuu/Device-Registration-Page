//
//  ModalView.swift
//  Popup
//
//  Created by dxiu on 6/17/22.
//

import SwiftUI

struct ModalView: View {
    
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                
                mainView
                .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .animation(.easeInOut)
    }
    
    var mainView: some View {
        VStack {
            ZStack {
                VStack {
                    VStack {
                        Text("Registering")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text("Device")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                    }
                    .padding(.bottom, 20)
                    .padding(.top, 40)
                    VStack {
                        Text("Your device is being registered - ")
                            .font(.title3)
                            .fontWeight(.light)
                        Text("this may take around 10 minutes")
                            .font(.title3)
                            .fontWeight(.light)
                        Text("to complete.")
                            .font(.title3)
                            .fontWeight(.light)
                    }
                    ZStack {
                        // Image to be changed in the future
                        // Currently a bit too large
                        // Space between text and image will be fixed then
                        Image("coffee")
                        
                        // Currently very blurry
                        // Can be changed in future to directly
                        // correspond to progress of device registration
                        ProgressView()
                            .scaleEffect(5)
                            .brightness(-1)
                            .colorInvert()
                    }
                }
            }
            .frame(maxHeight: .infinity)
        }
        .frame(height: 700)
        .frame(maxWidth: 370)
        .background(Color.white)
        .cornerRadius(30)
        .overlay(alignment: .topTrailing) {
            close
        }
    }
    
    var close: some View {
        Button {
            isShowing = false
        } label: {
            Image(systemName: "xmark")
                .symbolVariant(.circle.fill)
                .font(
                    .system(size: 35,
                      weight: .bold,
                      design: .rounded)
                )
        }
        .foregroundStyle(.gray.opacity(0.4))
        .padding([.top, .trailing], 10.0)
    }
}


struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(isShowing: .constant(true))
    }
}
