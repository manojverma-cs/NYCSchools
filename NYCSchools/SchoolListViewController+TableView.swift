//
//  ListViewController+TableView.swift
//  NYCSchools
//
//  Created by MANOJ VERMA on 8/10/22.
//

import CoreLocation
import Foundation
import UIKit

/// SchoolListViewController extension for UITableViewDataSource and UITableViewDelegate
extension SchoolListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // taking filteredIndexes count if search is active
        filteredIndexes.isEmpty ? dataSource.count : filteredIndexes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: SchoolListViewConstants.schoolListViewCell,
                                                    for: indexPath) as? SchoolListViewCell {
            // taking model from filteredIndexes count if search is active
            let model = filteredIndexes.isEmpty ?
            dataSource[indexPath.row] :
            dataSource[filteredIndexes[indexPath.row]]

            cell.configure(for: model)
            cell.phoneButtonTapped = { school in
                self.showPhoneAlert(for: school?.phoneNumber ?? "")
            }
            cell.navigateButtonTapped = { location in
                self.showNavigationAlert(for: location)
            }
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let destination = storyboard?.instantiateViewController(withIdentifier:
                                                                    SchoolListViewConstants.detailViewIdentifier)
            as? SchoolDetailViewController {
            // taking model from filteredIndexes count if search is active
            let model = filteredIndexes.isEmpty ?
            dataSource[indexPath.row] :
            dataSource[filteredIndexes[indexPath.row]]
            destination.dataSource = model
            self.navigationController?.pushViewController(destination, animated: true)
        }
    }
}
