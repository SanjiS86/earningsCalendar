


import SwiftUI

struct EarningsCalendar: Codable, Identifiable {
    let id = UUID()
    let date: String
    let symbol: String
    let eps: Double?
    let epsEstimated: Double?
    let time: String
    let revenue: Double?
    let revenueEstimated: Double? 
    let fiscalDateEnding: String
    let updatedFromDate: String
    
    enum CodingKeys: String, CodingKey {
        case date, symbol, eps, epsEstimated, time, revenue, revenueEstimated, fiscalDateEnding, updatedFromDate
    }
}


