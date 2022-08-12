//
//  SchoolModel.swift
//  NYCSchools
//
//  Created by MANOJ VERMA on 8/10/22.
//

import Foundation

/// SchoolModel codable instance to parse school response
struct SchoolModel: Codable {
    var dbn: String
    var schoolName: String?
    var boro: String?
    var overviewParagraph: String?
    var school10thSeats: String?
    var academicopportunities1: String?
    var academicopportunities2: String?
    var ellPrograms: String?
    var neighborhood: String?
    var buildingCode: String?
    var location: String?
    var phoneNumber: String?
    var faxNumber: String?
    var schoolEmail: String?
    var website: String?
    var subway: String?
    var bus: String?
    var grades2018: String?
    var finalgrades: String?
    var totalStudents: String?
    var extraCurricularActivities: String?
    var schoolSports: String?
    var attendanceRate: String?
    var pctStuEnoughVariety: String?
    var pctStuSafe: String?
    var schoolAccessibilityDescription: String?
    var directions1: String?
    var requirement1: String?
    var requirement2: String?
    var requirement3: String?
    var requirement4: String?
    var requirement5: String?
    var offerRate1: String?
    var program1: String?
    var code1: String?
    var interest1: String?
    var method1: String?
    var seats9ge1: String?
    var grade9gefilledflag1: String?
    var grade9geapplicants1: String?
    var seats9swd1: String?
    var grade9swdfilledflag1: String?
    var grade9swdapplicants1: String?
    var seats101: String?
    var admissionspriority11: String?
    var admissionspriority21: String?
    var admissionspriority31: String?
    var grade9geapplicantsperseat1: String?
    var grade9swdapplicantsperseat1: String?
    var primaryAddressLine1: String?
    var city: String?
    var zip: String?
    var stateCode: String?
    var latitude: String?
    var longitude: String?
    var communityBoard: String?
    var councilDistrict: String?
    var censusTract: String?
    var bin: String?
    var bbl: String?
    var nta: String?
    var borough: String?
    var satScoreModel: SchoolSATScoreModel?

    enum CodingKeys: String, CodingKey {
        case dbn
        case boro
        case academicopportunities1
        case academicopportunities2
        case neighborhood
        case location
        case website
        case subway
        case bus
        case grades2018
        case finalgrades
        case directions1
        case program1
        case code1
        case interest1
        case method1
        case seats9ge1
        case grade9gefilledflag1
        case grade9geapplicants1
        case seats9swd1
        case grade9swdfilledflag1
        case grade9swdapplicants1
        case seats101
        case admissionspriority11
        case admissionspriority21
        case admissionspriority31
        case grade9geapplicantsperseat1
        case grade9swdapplicantsperseat1
        case city
        case zip
        case latitude
        case longitude
        case bin
        case bbl
        case nta
        case borough
        case satScoreModel

        case schoolName = "school_name"
        case overviewParagraph = "overview_paragraph"
        case school10thSeats = "school_10th_seats"
        case ellPrograms = "ell_programs"
        case buildingCode = "building_code"
        case phoneNumber = "phone_number"
        case faxNumber = "fax_number"
        case schoolEmail = "school_email"
        case totalStudents = "total_students"
        case extraCurricularActivities = "extracurricular_activities"
        case schoolSports = "school_sports"
        case attendanceRate = "attendance_rate"
        case pctStuEnoughVariety = "pct_stu_enough_variety"
        case pctStuSafe = "pct_stu_safe"
        case schoolAccessibilityDescription = "school_accessibility_description"
        case requirement1 = "requirement1_1"
        case requirement2 = "requirement2_1"
        case requirement3 = "requirement3_1"
        case requirement4 = "requirement4_1"
        case requirement5 = "requirement5_1"
        case offerRate1 = "offer_rate1"
        case primaryAddressLine1 = "primary_address_line_1"
        case stateCode = "state_code"
        case communityBoard = "community_board"
        case councilDistrict = "council_district"
        case censusTract = "census_tract"
    }
}
