//
//  SchoolSATScoreModel.swift
//  NYCSchools
//
//  Created by MANOJ VERMA on 8/10/22.
//

import Foundation

/// SchoolModel codable instance to parse school SAT score response
struct SchoolSATScoreModel: Codable {
    var dbn: String
    var schoolName: String?
    var numOfSatTestTakers: String?
    var satCriticalReadingAvgScore: String?
    var satMathAvgScore: String?
    var satWritingAvgScore: String?

    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
    }
}
