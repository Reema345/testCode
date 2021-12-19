//
//  Date+Extension.swift
//  Phunware_CodeChallenge
//
//  Created by Reema Rachel Varghese on 12/19/21.
//

import Foundation

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
       dateformat.dateStyle = .medium
       dateformat.timeStyle = .short
        return dateformat.string(from: self)
    }
}
