//
//  Color.swift
//  NYCSchools
//
//  Created by MANOJ VERMA on 8/11/22.
//

import Foundation
import UIKit

enum Color {
    case primaryBackground
    case primaryForeground

    var color: UIColor? {
        switch self {
        case .primaryBackground:
            return UIColor(named: "primaryBackground")
        case .primaryForeground:
            return UIColor(named: "primaryForeground")
        }
    }
}
