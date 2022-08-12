//
//  String+Ext.swift
//  NYCSchools
//
//  Created by MANOJ VERMA on 8/11/22.
//

import Foundation

extension String {
    func trim() -> String {
        trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
