//
//  Topics.swift
//  VoicesAI
//
//  Created by User50 on 24/04/24.
//

import Foundation

enum Topics: String, CaseIterable, Identifiable {
    var id: Topics { self }
    case persahabatan = "Persahabatan"
    case petualangan = "Petualangan"
    case motivasi = "Motivasi"
    case horror = "Horror"
}
enum Mood: String, CaseIterable, Identifiable {
    case bahagia = "Bahagia"
    case sedih = "Sedih"
    var id: Mood { self }
}
