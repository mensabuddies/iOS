//
//  OpeningHours.swift
//  Mensa
//
//  Created by Timo Reusch on 28.10.22.
//

import Foundation

struct OpeningHours: Identifiable {
    var id: UUID
    let monday: OpeningHoursItem
    let tuesday: OpeningHoursItem
    let wednesday: OpeningHoursItem
    let thursday: OpeningHoursItem
    let friday: OpeningHoursItem
}

struct OpeningHoursItem: Identifiable {
    var id: UUID
    var opensAt: String
    var closesAt: String
    var getFoodTill: String
    var isOpen: Bool
}
