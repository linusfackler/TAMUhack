//
//  BufferView.swift
//  Diago
//
//  Created by Cesar Gamez on 1/29/23.
//

import SwiftUI

struct BufferView: View {
    @State var duration: Int
    @State var diagnosis: String
    @State var completed = false
    @State var isRotating = 0.0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        NavigationView {
            ZStack {
                Color.ui.primary
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    Image("BufferLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(.degrees(isRotating))
                        .frame(width: UIScreen.main.bounds.width/7, height: UIScreen.main.bounds.width/7)
                        .onAppear {
                            withAnimation(.linear(duration: 1)
                                    .speed(0.3).repeatForever(autoreverses: false)) {
                                isRotating = 360.0
                            }
                        }
                    Spacer()
                }
                if completed {
                    if (sendQuery() == "pos") {
                        DiagnosisView(diagnosis: "pos")
                    }
                    else {
                        DiagnosisView(diagnosis: "")
                    }
                }
            }
            .onReceive(timer) { _ in
                if duration > 0 {
                    duration -= 1
                } else {
                    completed = true
                }
            }
        }.navigationBarHidden(true)
    }
}
