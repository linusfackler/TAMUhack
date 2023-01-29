//
//  CoughTestView.swift
//  Diago
//
//  Created by Cesar Gamez on 1/28/23.
//

import SwiftUI
import DSWaveformImage
import AVKit

struct CoughTestView: View {
    @State var recording = false
    @StateObject var audioRecorder: AudioRecorder = AudioRecorder()
    var body: some View {
        NavigationView {
            ZStack {
                Color.ui.primary
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: UIScreen.main.bounds.width * 0.05) {
                    VStack(spacing: UIScreen.main.bounds.width * 0.05) {
                        BackNavButton()
                        TitleTextsView(focusText: "Record your cough", trailText: "Respiration Test")
                    }.padding()
                    Spacer()
                    MicrophoneView(recording: $recording, audioRecorder: audioRecorder)
                }
            }.edgesIgnoringSafeArea(.bottom)
        }.navigationBarHidden(true)
    }
}

struct MicrophoneView: View {
    @Binding var recording: Bool
    @StateObject var audioRecorder: AudioRecorder
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width*0.99)
                .foregroundColor(.white)
                .cornerRadius(CornerRadius.Card.radius)
            VStack {
                if !recording {
                    Text("Tap to start recording")
                        .font(Font.custom("Gilroy-Medium", size: Size.Font.Button.titleSize/1.5))
                }
                
                if recording {
                    Image("MicButtonOn")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width*0.49, height: UIScreen.main.bounds.width*0.49)
                        .onTapGesture {
                            recording = false
                        }
                } else {
                    Image("MicButtonOff")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width*0.294, height: UIScreen.main.bounds.width*0.294)
                        .onTapGesture {
                            recording = true
                        }
                }
            }
        }
    }
}

struct BackNavButton: View {
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .foregroundColor(Color.ui.primaryWeak)
                    .frame(width: (UIScreen.main.bounds.width * 0.123), height: (UIScreen.main.bounds.width * 0.123))
            }
            Spacer()
        }
    }
}
