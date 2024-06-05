import SwiftUI

class EarningsViewModel: ObservableObject {
    @Published var earnings: [EarningsCalendar] = []
    
    func fetchEarnings(fromDate: Date, toDate: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let fromDateString = dateFormatter.string(from: fromDate)
        let toDateString = dateFormatter.string(from: toDate)
        
        guard let url = URL(string: "https://financialmodelingprep.com/api/v3/earning_calendar?from=\(fromDateString)&to=\(toDateString)&apikey= input your API key") else { return }
        
        let decoder = JSONDecoder()
        decoder.nonConformingFloatDecodingStrategy = .convertFromString(positiveInfinity: "Inf", negativeInfinity: "-Inf", nan: "NaN")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    self.earnings = try decoder.decode([EarningsCalendar].self, from: data)
                } catch {
                    print("Failed to decode JSON: \(error)")
                }
            } else if let error = error {
                print("Failed to fetch data: \(error)")
            }
        }.resume()
    }
}

