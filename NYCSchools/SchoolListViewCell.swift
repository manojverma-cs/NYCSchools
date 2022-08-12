//
//  SchoolListViewCell.swift
//  NYCSchools
//
//  Created by MANOJ VERMA on 8/11/22.
//

import CoreLocation
import Foundation
import UIKit

class SchoolListViewCell: UITableViewCell {

    // MARK: - @IBOutlets -
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var opportunitiesLabel: UILabel!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var navigateButton: UIButton!

    /// SchoolModel instance to display details of school
    var school: SchoolModel?

    /// callback method to make call tp phone number
    var phoneButtonTapped: ((SchoolModel?) -> Void)?
    /// callback method to open map with school location
    var navigateButtonTapped: ((CLLocationCoordinate2D) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        prepareForReuse()
        phoneButton.layer.cornerRadius = phoneButton.frame.size.height / 2
        backgroundColor = Color.primaryBackground.color
        nameLabel.textColor = Color.primaryForeground.color
        opportunitiesLabel.textColor = Color.primaryForeground.color
        phoneButton.setImage(phoneButton.image(for: .normal)?.withRenderingMode(.alwaysTemplate),
                             for: .normal)
        navigateButton.setImage(navigateButton.image(for: .normal)?.withRenderingMode(.alwaysTemplate),
                             for: .normal)
        phoneButton.tintColor = Color.primaryForeground.color
        navigateButton.tintColor = Color.primaryForeground.color
        phoneButton.setTitleColor(Color.primaryForeground.color, for: .normal)
        navigateButton.setTitleColor(Color.primaryForeground.color, for: .normal)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        school = nil
        nameLabel.text = ""
        opportunitiesLabel.text = ""
        phoneButton.setTitle(nil, for: .normal)
        navigateButton.setTitle(nil, for: .normal)
    }

    /// configure cell for given school
    /// - Parameter school: SchoolModel instance of school
    func configure(for school: SchoolModel) {
        self.school = school
        nameLabel.text = school.schoolName
        opportunitiesLabel.text = [school.academicopportunities1 ?? "",
                                   school.academicopportunities2 ?? ""]
            .filter { !$0.isEmpty }
            .joined(separator: "\n")
        if let location = school.location,
           let latLong = location.split(separator: "(").last?.split(separator: ")").first,
           let lat = latLong.split(separator: ",").first,
           let long = latLong.split(separator: ",").last,
           let latitude = Double(String(lat).trim()),
           let longitude = Double(String(long).trim()),
           CLLocationCoordinate2DIsValid(CLLocationCoordinate2DMake(latitude, longitude)) {
            navigateButton.isEnabled = true
        } else {
            navigateButton.isEnabled = false
        }
    }

    // MARK: - @IBActions -
    @IBAction func phoneAction(_ sender: UIButton) {
        phoneButtonTapped?(school)
    }

    @IBAction func navigateAction(_ sender: UIButton) {
        if let location = school?.location,
           let latLong = location.split(separator: "(").last?.split(separator: ")").first,
           let lat = latLong.split(separator: ",").first,
           let long = latLong.split(separator: ",").last,
           let latitude = Double(String(lat).trim()),
           let longitude = Double(String(long).trim()),
           CLLocationCoordinate2DIsValid(CLLocationCoordinate2DMake(latitude, longitude)) {
            navigateButtonTapped?(CLLocationCoordinate2DMake(latitude, longitude))
        } else {
            debugPrint("Invalid location")
        }
    }
}
