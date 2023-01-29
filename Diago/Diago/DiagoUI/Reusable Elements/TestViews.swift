//
//  TestViews.swift
//  Diago
//
//  Created by Cesar Gamez on 1/28/23.
//

import SwiftUI

struct VitalsTestView: View {
    @State var complete: Bool = false
    @State var countdown = 15
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        NavigationView {
            ZStack {
                Color.ui.primary
                VStack(spacing: UIScreen.main.bounds.width * 0.05) {
                    HStack {
                        Circle()
                            .foregroundColor(Color.ui.primaryWeak)
                            .frame(width: (UIScreen.main.bounds.width * 0.123), height: (UIScreen.main.bounds.width * 0.123))
                        Spacer()
                    }
                    HStack {
                        VStack(alignment: .leading, spacing: Size.Spacing.Vertical.textSpace) {
                            Text("Hold Still...")
                                .font(Font.custom("Gilroy-Semibold", size: Size.Font.Button.titleSize))
                                .foregroundColor(.white)
                            Text("Checking Vitals")
                                .font(Font.custom("Gilroy-Semibold", size: Size.Font.Button.titleSize))
                                .foregroundColor(.white.opacity(0.6))
                        }
                        Spacer()
                    }
                    ZStack {
                        ParticlesView()
                        Text(complete ? "All done" : "\(countdown)")
                            .font(Font.custom("Gilroy-Semibold", size: complete ? Size.Font.Button.titleSize*1.3 : Size.Font.Button.titleSize*2))
                            .foregroundColor(.white)
                            .onReceive(timer) {_ in
                                if countdown > 0 && !complete {
                                    countdown -= 1
                                } else {
                                    withAnimation {
                                        complete = true
                                    }
                                }
                            }
                    }
                }
                .padding(Size.Spacing.Vertical.buttonSpace*1.7)
            }
            .edgesIgnoringSafeArea(.all)
            .onAppear {
            }
        }
    }
}

struct ParticlesView: View {
    @State var rotation1 = 0.0
    @State var rotation2 = 0.0
    @State var rotation3 = 0.0
    @State var rotation4 = 0.0
    @State var rotation5 = 0.0
    @State var rotation6 = 0.0
    var body: some View {
        ZStack {
            Image("Ring1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Size.Button.width, height: Size.Button.width)
                .rotationEffect(.degrees(rotation1))
                .onAppear {
                    withAnimation(.linear(duration: 1).speed(0.03).repeatForever(autoreverses: false)) {
                            rotation1 = 360.0
                    }
                }
            Image("Ring2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Size.Button.width*0.95, height: Size.Button.width*0.95)
                .rotationEffect(.degrees(rotation2))
                .onAppear {
                    withAnimation(.linear(duration: 1).speed(0.02).repeatForever(autoreverses: false)) {
                            rotation2 = 360.0
                    }
                }
            Image("Ring3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Size.Button.width*0.98, height: Size.Button.width*0.98)
                .rotationEffect(.degrees(rotation3))
                .onAppear {
                    withAnimation(.linear(duration: 1).speed(0.03).repeatForever(autoreverses: false)) {
                            rotation3 = 360.0
                    }
                }
            Image("Ring4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Size.Button.width, height: Size.Button.width)
                .rotationEffect(.degrees(rotation4))
                .onAppear {
                    withAnimation(.linear(duration: 1).speed(0.02).repeatForever(autoreverses: false)) {
                            rotation4 = 360.0
                    }
                }
            Image("Ring5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Size.Button.width, height: Size.Button.width)
                .rotationEffect(.degrees(rotation5))
                .onAppear {
                    withAnimation(.linear(duration: 1).speed(0.03).repeatForever(autoreverses: false)) {
                            rotation5 = 360.0
                    }
                }
            Image("Ring6")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Size.Button.width*0.95, height: Size.Button.width*0.95)
                .rotationEffect(.degrees(rotation6))
                .onAppear {
                    withAnimation(.linear(duration: 1).speed(0.02).repeatForever(autoreverses: false)) {
                            rotation6 = 360.0
                    }
                }
        }
    }
}
