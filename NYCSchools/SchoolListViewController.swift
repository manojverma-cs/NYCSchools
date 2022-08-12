//
//  SchoolListViewController.swift
//  NYCSchools
//
//  Created by MANOJ VERMA on 8/10/22.
//

import UIKit

class SchoolListViewController: UIViewController, AlertProtocol {

    // MARK: - @IBOutlets -
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var noDataLabel: UILabel!

    /// contains all schools retunred from api
    var dataSource = [SchoolModel]()
    /// contains indexes for filtered schools when search is active
    var filteredIndexes = [Int]()

    struct SchoolListViewConstants {
        static let schoolListViewCell = "SchoolListViewCell"
        static let detailViewIdentifier = "SchoolDetailViewController"
    }

    // MARK: - view life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchList()
    }

    // MARK: - private methods -
    /// setup intial UI
    private func setupUI() {
        title = "NYC Schools"
        searchBar.delegate = self
        view.backgroundColor = Color.primaryBackground.color
        noDataLabel.textColor = Color.primaryForeground.color
        setupTableView()
    }

    /// setup TableView
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: SchoolListViewConstants.schoolListViewCell, bundle: nil),
                           forCellReuseIdentifier: SchoolListViewConstants.schoolListViewCell)
    }

    /// fetch school list from server
    private func fetchList() {
        activityIndicatorView.isHidden = false
        activityIndicatorView.startAnimating()
        noDataLabel.isHidden = true
        SessionManager.shared.getSchoolsList { [weak self] schools in
            guard let self = self else { return }
            /// sort schools by school name
            self.dataSource = schools.sorted { $0.schoolName ?? "" < $1.schoolName ?? "" }
            self.filteredIndexes.removeAll()
            DispatchQueue.main.async {
                self.activityIndicatorView.isHidden = true
                self.activityIndicatorView.stopAnimating()
                self.tableView.reloadData()
            }
        } _: { error in
            debugPrint(error.localizedDescription)
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.activityIndicatorView.isHidden = true
                self.activityIndicatorView.stopAnimating()
                self.noDataLabel.isHidden = false
                self.showAlert(withTitle: "",
                               withMessage: error.localizedDescription)
            }
        }
    }
}
