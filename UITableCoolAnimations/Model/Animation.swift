//
//  Animation.swift
//  UITableCoolAnimations
//
//  Created by Julio Collado on 1/11/20.
//  Copyright © 2020 Julio Collado. All rights reserved.
//

import Foundation

enum Animations: Int, CaseIterable {
    case Fade,BounceUp,FadeUp,SlideIn,ScaleOut
    
    var description: String {
        switch self {
        case .Fade:
            return "Fade"
        case .BounceUp:
            return "Bounce Up"
        case .FadeUp:
            return "Fade Up"
        case .SlideIn:
            return "Slide In"
        case .ScaleOut:
            return "Scale Out"
        }
    }
    
}

