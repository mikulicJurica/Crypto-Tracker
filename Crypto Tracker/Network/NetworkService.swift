import Foundation

class NetworkService {
    
    func searchForCoin(searchString: String, completionHandler: @escaping (Result<SearchListModel, RequestError>) -> Void) {
        let url = URL(string: "https://api.coingecko.com/api/v3/search?query=\(searchString)")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        executeUrlRequest(request, completionHandler: completionHandler)
    }
    
    func getCoinData(coinId: String, completionHandler: @escaping (Result<CoinModel, RequestError>) -> Void) {
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coinId)?localization=false&tickers=false&market_data=true&community_data=false&developer_data=false&sparkline=false")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        executeUrlRequest(request, completionHandler: completionHandler)
    }
    
    private func executeUrlRequest<T: Decodable>(_ request: URLRequest, completionHandler: @escaping (Result<T, RequestError>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, err in
            guard err == nil else {
                completionHandler(.failure(.clientError))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completionHandler(.failure(.serverError))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.noDataError))
                return
            }
            guard let value = try? JSONDecoder().decode(T.self, from: data) else {
                completionHandler(.failure(.decodingError))
                return
            }
            
            DispatchQueue.main.async {
                completionHandler(.success(value))
            }
        }
        
        dataTask.resume()
    }
}
