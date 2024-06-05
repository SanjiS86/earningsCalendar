import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = EarningsViewModel()
    @State private var fromDate = Date()
    @State private var toDate = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Input FROM and TO dates")
                    .font(.headline)
                    .padding()
                
                DatePicker("From Date", selection: $fromDate, displayedComponents: .date)
                    .padding()
                
                DatePicker("To Date", selection: $toDate, displayedComponents: .date)
                    .padding()
                
                Button("Fetch Earnings") {
                    viewModel.fetchEarnings(fromDate: fromDate, toDate: toDate)
                }
                .padding()
                
                if !viewModel.earnings.isEmpty {
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(viewModel.earnings) { earning in
                                EarningsRowView(earning: earning)
                            }
                        }
                        .padding()
                    }
                } else {
                    ProgressView()
                        .padding()
                }
            }
            .navigationTitle("Earnings Calendar")
        }
    }
}

