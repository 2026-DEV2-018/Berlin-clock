//
//  Lamp.swift
//  Berlin clock
//
//  Created by 2026-DEV2-018 on 14/01/2026.
//

import Foundation
import SwiftUI

enum Lamp: String {
    case off = "O"
    case red = "R"
    case yellow = "Y"
}

extension Lamp {
    
    var isOn: Bool {
        switch self {
        case .off: return false
        case .red, .yellow: return true
        }
    }
    
    var color: Color {
        switch self {
        case .off: return .clear
        case .red: return .red
        case .yellow: return .yellow
        }
    }
}
