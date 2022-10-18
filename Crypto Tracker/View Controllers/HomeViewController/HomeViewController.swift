import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private var coinDetailView: UIView!
    
    private var coinTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        coinTableViewConfiguration()
        styleViews()
        buildConstraints()
    }
    
    private func buildViews() {
        coinDetailView = UIView()
        view.addSubview(coinDetailView)
        
        coinTableView = UITableView()
        view.addSubview(coinTableView)
        
    }
    
    private func coinTableViewConfiguration() {
        coinTableView.register(CoinTableViewCell.self, forCellReuseIdentifier: CoinTableViewCell.reuseIdentifier)
        coinTableView.rowHeight = 80
        coinTableView.dataSource = self
    }
    
    private func styleViews() {
        view.backgroundColor = StyleConstants.AppColors.whiteColor
        
        coinDetailView.backgroundColor = .red
        coinTableView.backgroundColor = StyleConstants.AppColors.whiteColor
        
    }
    
    private func buildConstraints() {
        coinDetailView.snp.makeConstraints({
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.snp.centerY)
        })
        
        coinTableView.snp.makeConstraints({
            $0.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(coinDetailView.snp.bottom)
        })
    }

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = coinTableView.dequeueReusableCell(withIdentifier: CoinTableViewCell.reuseIdentifier) as? CoinTableViewCell else {
            fatalError()
        }
        
        cell.setCoinCell(coin: "Bitcoin", coinTicker: "BTC", price: 20000, percentage: 5.8)
        
        return cell
    }
    
    
}

