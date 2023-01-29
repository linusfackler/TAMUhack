//
//  ButtonViews.swift
//  Diago
//
//  Created by Cesar Gamez on 1/28/23.
//

import SwiftUI

struct ButtonView: View {
    @State var type: ButtonType
    @State var text: String

    let width = Size.Button.width
    let height = Size.Button.height
    var body: some View {
        ZStack {
            switch type {
            case .primaryStrong:
                RoundedRectangle(cornerRadius: CornerRadius.Button.radius)
                    .frame(width: width, height: height)
                    .foregroundColor(Color.ui.primary)
                Text(text)
                    .font(Font.custom("Gilroy-SemiBold", size: Size.Font.Button.strongSize))
                    .foregroundColor(.white)
            case .secondaryStrong:
                RoundedRectangle(cornerRadius: CornerRadius.Button.radius)
                    .frame(width: width, height: height)
                    .foregroundColor(.white)
                Text(text)
                    .font(Font.custom("Gilroy-SemiBold", size: Size.Font.Button.strongSize))
                    .foregroundColor(Color.ui.primary)
            case .primaryWeak:
                RoundedRectangle(cornerRadius: CornerRadius.Button.radius)
                    .frame(width: width, height: height)
                    .foregroundColor(Color.ui.primaryWeak)
                Text(text)
                    .font(Font.custom("Gilroy-SemiBold", size: Size.Font.Button.strongSize))
                    .foregroundColor(.white)
            case .secondaryWeak:
                Text(text)
                    .font(Font.custom("Gilroy-Medium", size: Size.Font.Button.weakSize))
                    .foregroundColor(Color.ui.primary)
            }
        }
    }
}

enum ButtonType {
    case primaryStrong
    case secondaryStrong
    case primaryWeak
    case secondaryWeak
}
