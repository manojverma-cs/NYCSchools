//
//  HTTPApi.swift
//  NYCSchools
//
//  Created by MANOJ VERMA on 8/10/22.
//

import Foundation

/// HTTPApi to create all api and required parameters
enum HTTPApi {
    case schoolList
    case schoolSATScore

    var endpoint: String {
        switch self {
        case .schoolList:
            return "/97mf-9njv.json"
        case .schoolSATScore:
            return "/734v-jeq5.json"
        }
    }

    var httpMethod: String {
        "GET"
    }

    var requestHeaders: [String: String]? {
        nil
    }

    var requestBody: Data? {
        nil
    }
}
