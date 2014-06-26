//
//  Btnenum.swift
//  MySwiftTable
//
//  Created by yong.pan on 14-6-24.
//  Copyright (c) 2014年 yong.pan. All rights reserved.
//

import Foundation

enum Btnenum: Int {
    case Zero = 0
    case One, Two, Three, Four, Five, Six, Seven, Eight, Nine
    case Plus, Dot, Back, Clear,Done
    func simpleDescription() -> String {
        switch self {
        case .Plus:
            return "+"
        case .Dot:
            return "."
        case .Back:
            return "Back"
        case .Clear:
            return "Clear"
        case .Done:
            return "Done"
        default:
            return "Number"
        }
    }
}
