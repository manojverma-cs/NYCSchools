//
//  SchoolListViewController+Search.swift
//  NYCSchools
//
//  Created by MANOJ VERMA on 8/11/22.
//

import Foundation
import UIKit

/// SchoolListViewController extension for UISearchBarDelegate
extension SchoolListViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        searchBar.text = nil
        performSearch(for: "")
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        performSearch(for: searchText)
    }

    /// search by school name or location
    /// - Parameter searchText: String instance of search text
    func performSearch(for searchText: String) {
        let searchText = searchText.lowercased()
        if searchText.isEmpty {
            /// resetting filteredIndexes when search count is zero
            filteredIndexes.removeAll()
            tableView.reloadData()
        } else {
            /// setting filteredIndexes when search is active
            filteredIndexes.removeAll()
            var index = 0
            dataSource.forEach { school in
                if let schoolName = school.schoolName,
                   schoolName.lowercased().contains(searchText) {
                    self.filteredIndexes.append(index)
                } else if let location = school.location,
                          location.lowercased().contains(searchText) {
                    self.filteredIndexes.append(index)
                }
                index += 1
            }
            tableView.reloadData()
        }
    }
}
