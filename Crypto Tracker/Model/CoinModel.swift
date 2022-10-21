import Foundation

struct CoinModel: Codable {
    let id: String
    let symbol: String
    let name: String
    let marketCapRank: Int
    let marketData: MarketData
    
    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case marketCapRank = "market_cap_rank"
        case marketData = "market_data"
    }
}

struct MarketData: Codable {
    let priceChange: Float
    let currentPrice: CurrentPrice
    let allTimeHighPrice: AllTimeHighPrice
    let allTimeHighPercentage: AllTimeHighPercentage
    
    let priceChangePercentage1W: Float
    let priceChangePercentage1M: Float
    let priceChangePercentage2M: Float
    let priceChangePercentage200D: Float
    let priceChangePercentage1Y: Float
    
    let totalSupply: Float
    let circulatingSupply: Float
    
    enum CodingKeys: String, CodingKey {
        case priceChange = "price_change_percentage_24h"
        case currentPrice = "current_price"
        case allTimeHighPrice = "ath"
        case allTimeHighPercentage = "ath_change_percentage"
        
        case priceChangePercentage1W = "price_change_percentage_7d"
        case priceChangePercentage1M = "price_change_percentage_30d"
        case priceChangePercentage2M = "price_change_percentage_60d"
        case priceChangePercentage200D = "price_change_percentage_200d"
        case priceChangePercentage1Y = "price_change_percentage_1y"
        
        case totalSupply = "total_supply"
        case circulatingSupply = "circulating_supply"
    }
}

struct CurrentPrice: Codable {
    let chf: Float
    let eur: Float
    let usd: Float
}

struct AllTimeHighPrice: Codable {
    let chf: Float
    let eur: Float
    let usd: Float
}

struct AllTimeHighPercentage: Codable {
    let chf: Float
    let eur: Float
    let usd: Float
}
