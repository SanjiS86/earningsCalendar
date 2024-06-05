import SwiftUI

struct EarningsRowView: View {
    var earning: EarningsCalendar
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(earning.symbol)
                .font(.headline)
                .foregroundColor(.primary)
            Text("Date: \(earning.date)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("EPS: \(earning.eps ?? 0)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            if let revenue = earning.revenue {
                Text("Revenue: \(revenue)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            if let epsEstimated = earning.epsEstimated {
                Text("EPS Estimated: \(epsEstimated)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            if let revenueEstimated = earning.revenueEstimated {
                Text("Revenue Estimated: \(revenueEstimated ?? 0)") 
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Text("Fiscal Date Ending: \(earning.fiscalDateEnding)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("Updated From Date: \(earning.updatedFromDate)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(UIColor.systemBackground)))
        .shadow(color: .gray, radius: 5, x: 0, y: 2)
    }
}
