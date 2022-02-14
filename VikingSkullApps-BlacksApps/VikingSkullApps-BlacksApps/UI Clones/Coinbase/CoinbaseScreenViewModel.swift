import SwiftUI

class CoinbaseScreenViewModel: ObservableObject {
    @Published var yPoints: [Double] = CoinbaseScreenViewModel.randomPoints
    
    let data: [Cryptocoin] = Faked.Cryptocoins
    
    func percentageString(_ percentageDouble: Double) -> String {
        let prefix = percentageDouble >= 0.0 ? "+" : ""
        return "\(prefix)\(percentageDouble)%"
    }
    
    func percentageColor(_ percentageDouble: Double) -> Color {
        return percentageDouble >= 0.0 ? .green : .red
    }
    
    static var randomPoints: [Double] {
        (1...10).map { i in
            Double.random(in: 0.0...1.0)
        }
    }
}
