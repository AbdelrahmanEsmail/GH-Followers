//
//  Date+Ext.swift
//  GH-Followers
//
//  Created by Abdelrahman Esmail on 09/10/2024.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyyy"
        return formatter.string(from: self)
    }
}
