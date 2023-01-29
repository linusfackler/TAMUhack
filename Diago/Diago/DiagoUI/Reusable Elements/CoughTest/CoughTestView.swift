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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
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
    @State var complete = false
    @Binding var recording: Bool
    @StateObject var audioRecorder: AudioRecorder
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width*0.99)
                .foregroundColor(.white)
                .cornerRadius(CornerRadius.Card.radius)
            ZStack {
                VStack(spacing: UIScreen.main.bounds.width*0.65) {
                    Text("Tap to start recording")
                        .font(Font.custom("Gilroy-Medium", size: Size.Font.Button.titleSize/1.5))
                    NavigationLink(destination: VitalsPromptView(image: "VitalTest", titleText: "Vital Signs Test", subText: "Sit tight and breathe normally for 15 seconds.")) {
                        ButtonView(type: .primaryStrong, text: "Submit")
                    }
                }
                ZStack {
                    Circle()
                        .frame(width: recording ? UIScreen.main.bounds.width*0.4 : UIScreen.main.bounds.width*0.294, height: recording ? UIScreen.main.bounds.width*0.4 : UIScreen.main.bounds.width*0.294)
                        .foregroundColor(.black.opacity(0.4))
                    Image("MicButtonOff")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width*0.294, height: UIScreen.main.bounds.width*0.294)
                        .onTapGesture {
                            if !recording {
                                audioRecorder.startRecording()
                            } else {
                                audioRecorder.stopRecording()
                            }
                            withAnimation {
                                recording.toggle()
                            }
                        }
                }.offset(y: -UIScreen.main.bounds.width*0.06)
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
                Image("ChevronLeft")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: (UIScreen.main.bounds.width * 0.093), height: (UIScreen.main.bounds.width * 0.093))
                
            }
            Spacer()
        }
    }
}
