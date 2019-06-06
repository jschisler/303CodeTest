//
//  TableViewController.swift
//  303CodeTest
//
//  Created by John Schisler on 2019-06-06.
//  Copyright © 2019 Schisler Rocks. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, ApiClientDelegate {

    var persons : [Person]?
    var client : ApiClient = ApiClient()

    override func viewDidLoad() {
        super.viewDidLoad()

        client.delegate = self

        client.getJSON()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")

        cell.textLabel?.text = "\(persons![indexPath.row].firstName) \(persons![indexPath.row].lastName)"
        cell.detailTextLabel?.text = persons![indexPath.row].city

        return cell
    }

    // MARK: ApiClientDelegate

    func receivedJSON(data: Data) {
        persons = try! JSONDecoder().decode([Person].self, from: data)

        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func fetchingFailed(error: Error) {
        NSLog("Unable to fetch Person list: ", error.localizedDescription)
    }
}
