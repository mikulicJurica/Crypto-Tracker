import Foundation

struct SearchListModel: Codable {
    let coins: [SearchCoinModel]
}

struct SearchCoinModel: Codable {
    let id: String
    let name: String
    let symbol: String
    let large: String
}
