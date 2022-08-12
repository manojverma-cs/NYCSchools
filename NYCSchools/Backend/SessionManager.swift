//
//  SessionManager.swift
//  NYCSchools
//
//  Created by MANOJ VERMA on 8/10/22.
//

import Foundation

/// SchoolsListSuccess closure to handle success response
typealias SchoolsListSuccess = (([SchoolModel]) -> Void)
/// SchoolsListError closure to handle error response
typealias SchoolsListError = ((Error) -> Void)

class SessionManager {
    // MARK: - Properties -
    private let baseURL: String
    private let session = URLSession.shared

    static var shared: SessionManager = {
        let sessionManager = SessionManager(baseURL: Constants.baseURL)
        return sessionManager
    }()

    // MARK: - Initialization -
    private init(baseURL: String) {
        self.baseURL = baseURL
    }

    // MARK: - public API's -
    /// get schools list
    /// - Parameters:
    ///   - schoolsListSuccess: SchoolsListSuccess closure to handle success response
    ///   - schoolsListError: SchoolsListError closure to handle error response
    func getSchoolsList(_ schoolsListSuccess: @escaping SchoolsListSuccess,
                        _ schoolsListError: @escaping SchoolsListError) {
        guard let url = URL(string: "\(baseURL)" + HTTPApi.schoolList.endpoint) else {
            schoolsListError(BackendError.invalidUrl)
            return
        }
        let task = session.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self else { return }
            guard let data = data, error == nil else {
                schoolsListError(BackendError.invalidJson)
                return
            }
            do {
                /// parsing SchoolModel using JSONDecoder
                let schools = try JSONDecoder().decode([SchoolModel]?.self,
                                                       from: data)
                /// NOTE:  as there is no API for individual school SAT score, calling SAT scores for all schools
                self.getSchoolSATScoreList(for: schools ?? [],
                                              schoolsListSuccess,
                                              schoolsListError)
            } catch {
                schoolsListError(BackendError.invalidJson)
            }
        }
        task.resume()
    }

    /// get schools SAT scores
    /// - Parameters:
    ///   - schoolsListSuccess: SchoolsListSuccess closure to handle success response
    ///   - schoolsListError: SchoolsListError closure to handle error response
    func getSchoolSATScoreList(for schools: [SchoolModel],
                               _ schoolsListSuccess: @escaping SchoolsListSuccess,
                               _ schoolsListError: @escaping SchoolsListError) {
        guard let url = URL(string: "\(baseURL)" + HTTPApi.schoolSATScore.endpoint) else {
            schoolsListError(BackendError.invalidUrl)
            return
        }
        let task = session.dataTask(with: url) { [weak self] data, _, error in
            guard self != nil else { return }
            guard let data = data, error == nil else {
                schoolsListError(BackendError.invalidJson)
                return
            }
            do {
                /// parsing SchoolSATScoreModel using JSONDecoder
                let schoolSATScores = try JSONDecoder().decode([SchoolSATScoreModel]?.self,
                                                               from: data)
                /// taking a hasmap to update sat score for all schools. search and update will be fast due to hashmap
                var hashMap = [String: SchoolModel]()
                schools.forEach { hashMap[$0.dbn] = $0 }
                for schoolSATScore in schoolSATScores ?? [] {
                    if var school = hashMap[schoolSATScore.dbn] {
                        school.satScoreModel = schoolSATScore
                        hashMap[schoolSATScore.dbn] = school
                    }
                }
                schoolsListSuccess(Array(hashMap.values))
            } catch {
                schoolsListError(BackendError.invalidJson)
            }
        }
        task.resume()
    }
}
