//
//  Helper.swift
//  DevStatus SwiftUi
//
//  Created by Henry Ifebunandu on 11/9/23.
//

import Foundation


func formatDate(dateString: String) -> String {
    let inputDateFormatter = DateFormatter()
    inputDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

    if let date = inputDateFormatter.date(from: dateString) {
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "MMMM d, yyyy"
        outputDateFormatter.locale = Locale(identifier: "en_US") // Set the locale for English
        
        return outputDateFormatter.string(from: date)
    } else {
        return "Invalid Date"
    }
}

func seniorityLevel(repoCount: Int) -> String {
    if(repoCount < 20) {
        return "Upcoming Open Source Engineer"
    }
    if(repoCount >= 21 && repoCount < 50 ) {
        return "Junior Open Source Engineer"
    }
    return "Senior Open Source Engineer"
}
