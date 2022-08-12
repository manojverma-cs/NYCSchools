//
//  SchoolDetailViewController.swift
//  NYCSchools
//
//  Created by MANOJ VERMA on 8/11/22.
//

import Foundation
import UIKit

class SchoolDetailViewController: UIViewController, AlertProtocol {

    // MARK: - Properties -
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var numOfSatTestTakersLabel: UILabel!
    @IBOutlet weak var satCriticalReadingAvgScoreLabel: UILabel!
    @IBOutlet weak var satMathAvgScoreLabel: UILabel!
    @IBOutlet weak var satWritingAvgScoreLabel: UILabel!

    /// SchoolModel instance to populate UI
    var dataSource: SchoolModel?

    // MARK: - view life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - private methods -
    func setupUI() {
        overviewLabel.textColor = Color.primaryForeground.color
        numOfSatTestTakersLabel.textColor = Color.primaryForeground.color
        satCriticalReadingAvgScoreLabel.textColor = Color.primaryForeground.color
        satMathAvgScoreLabel.textColor = Color.primaryForeground.color
        satWritingAvgScoreLabel.textColor = Color.primaryForeground.color
        title = dataSource?.schoolName ?? ""
        overviewLabel.text = dataSource?.location ?? ""
        if let value = dataSource?.satScoreModel?.numOfSatTestTakers,
           !value.trim().isEmpty {
            numOfSatTestTakersLabel.text = "\(numOfSatTestTakersLabel.text ?? ""): \(value)"
        } else {
            numOfSatTestTakersLabel.text = "\(numOfSatTestTakersLabel.text ?? ""): NA"
        }
        if let value = dataSource?.satScoreModel?.satCriticalReadingAvgScore,
           !value.trim().isEmpty {
            satCriticalReadingAvgScoreLabel.text = "\(satCriticalReadingAvgScoreLabel.text ?? ""): \(value)"
        } else {
            satCriticalReadingAvgScoreLabel.text = "\(satCriticalReadingAvgScoreLabel.text ?? ""): NA"
        }
        if let value = dataSource?.satScoreModel?.satMathAvgScore,
           !value.trim().isEmpty {
            satMathAvgScoreLabel.text = "\(satMathAvgScoreLabel.text ?? ""): \(value)"
        } else {
            satMathAvgScoreLabel.text = "\(satMathAvgScoreLabel.text ?? ""): NA"
        }
        if let value = dataSource?.satScoreModel?.satWritingAvgScore,
           !value.trim().isEmpty {
            satWritingAvgScoreLabel.text = "\(satWritingAvgScoreLabel.text ?? ""): \(value)"
        } else {
            satWritingAvgScoreLabel.text = "\(satWritingAvgScoreLabel.text ?? ""): NA"
        }
    }
}
