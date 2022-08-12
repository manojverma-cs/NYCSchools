//
//  AlertProtocol.swift
//  NYCSchools
//
//  Created by MANOJ VERMA on 8/11/22.
//

import CoreLocation
import Foundation
import UIKit

/// AlertProtocol to add common methods to UIViewController
@objc protocol AlertProtocol {
    @objc optional func showAlert(_ message: String)
}

extension AlertProtocol where Self: UIViewController {
    /// show alert with title and message
    /// - Parameters:
    ///   - title: String instance of title
    ///   - message: String instance of message
    func showAlert(withTitle title: String,
                   withMessage message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let rightButtonAction = UIAlertAction(title: "Ok",
                                              style: .cancel)
        alertController.addAction(rightButtonAction)
        self.present(alertController, animated: true, completion: nil)
    }

    /// show alert to make call
    /// - Parameter number: String instance of phone number
    func showPhoneAlert(for number: String) {
        guard let number = URL(string: "tel://" + number) else {
            showAlert(withTitle: "",
                      withMessage: "Invalid number")
            return
        }
        UIApplication.shared.open(number)
    }

    /// show alert to navigation to a location
    /// - Parameter coord: CLLocationCoordinate2D instance of Location
    func showNavigationAlert(for coord: CLLocationCoordinate2D) {
        guard let url = URL(string: "http://maps.apple.com/maps?saddr=\(coord.latitude),\(coord.longitude)") else {
            return
        }
        UIApplication.shared.open(url)
    }
}
