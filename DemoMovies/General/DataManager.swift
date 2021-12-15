//
//  DataManager.swift
//  DemoMovies
//
//  Created by Leidy Ingrid  on 10/12/2021.
//

import Foundation

extension Date {
    func toStringWithFormat(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "es_pe")
        let result = dateFormatter.string(from: self)
        return result
    }
}

extension String {
    func toDateWithFormat(_ format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date
    }
}
