//
//  ElementConstraints.swift
//  Diago
//
//  Created by Cesar Gamez on 1/28/23.
//

import Foundation
import SwiftUI

struct Size {
    struct Button {
        static let width: CGFloat = (UIScreen.main.bounds.width * 0.84)
        static let height: CGFloat = (UIScreen.main.bounds.width * 0.136)
    }
    struct Font {
        struct Button {
            static let strongSize: CGFloat = (UIScreen.main.bounds.width * 0.05)
            static let weakSize: CGFloat = (UIScreen.main.bounds.width * 0.04)
            static let titleSize: CGFloat = (UIScreen.main.bounds.width * 0.076)
            static let subTitleSize: CGFloat = (UIScreen.main.bounds.width * 0.033)
        }
    }
    struct Spacing {
        struct Vertical {
            static let textSpace: CGFloat = (UIScreen.main.bounds.width * 0.02)
            static let buttonSpace: CGFloat = (UIScreen.main.bounds.width * 0.035)
        }
    }
}

struct CornerRadius {
    struct Button {
        static let radius: CGFloat = (UIScreen.main.bounds.width * 0.026)
    }
    struct Card {
        static let radius: CGFloat = (UIScreen.main.bounds.width * 0.0933)
    }
}
