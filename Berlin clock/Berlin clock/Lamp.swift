//
//  Lamp.swift
//  Berlin clock
//
//  Created by 2026-DEV2-018 on 14/01/2026.
//

import Foundation

enum Lamp {
    case off
    case red
    case yellow
}

extension Lamp {
    
    var isOn: Bool {
        if self == .off {
            return false
        }
        
        if self == .red {
            return true
        }
        
        if self == .yellow {
            return true
        }
        
        return false
    }
}
