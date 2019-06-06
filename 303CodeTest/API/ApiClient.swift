//
//  ApiClient.swift
//  303CodeTest
//
//  Created by John Schisler on 2019-06-06.
//  Copyright © 2019 Schisler Rocks. All rights reserved.
//

import Foundation

protocol ApiClientDelegate {
    func receivedJSON(data: Data)
    func fetchingFailed(error: Error)
}

class ApiClient {
    var delegate : ApiClientDelegate?

    func getJSON() {
        let url = URL(string: "http://www.filltext.com/?rows=100&fname=%7BfirstName%7D&lname=%7BlastName%7D&city=%7Bcity%7D&pretty=true")!

        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                self.delegate?.fetchingFailed(error: error)
            } else {
                self.delegate?.receivedJSON(data: data!)
            }
        })

        task.resume()
    }
}
