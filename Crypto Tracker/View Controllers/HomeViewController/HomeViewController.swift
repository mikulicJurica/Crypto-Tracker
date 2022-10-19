import UIKit
import SnapKit
import Charts

class HomeViewController: UIViewController {
    
    private var coinDetailView: UIView!
    private var overviewLabel: UILabel!
    private var priceLabel: UILabel!
    private var lineChartView: LineChartView!
    private var buttonsStackView: UIStackView!
    private var timeRangeButtons: [UIButton]!
    private var timeRangeText = ["1H", "1D", "1W", "1M", "1Y", "ALL"]
    
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
        
        overviewLabel = UILabel()
        coinDetailView.addSubview(overviewLabel)
        
        priceLabel = UILabel()
        coinDetailView.addSubview(priceLabel)
        
        lineChartView = LineChartView()
        coinDetailView.addSubview(lineChartView)
        
        buttonsStackView = UIStackView()
        coinDetailView.addSubview(buttonsStackView)
        
        
        timeRangeButtons = [UIButton()]
        for _ in 0...5 {
            let tmpButton = UIButton()
            timeRangeButtons.append(tmpButton)
        }
        
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
        
        coinDetailView.backgroundColor = StyleConstants.AppColors.whiteColor
        coinTableView.backgroundColor = StyleConstants.AppColors.whiteColor
        
        overviewLabel.text = "Overview for Bitcoin"
        overviewLabel.textColor = StyleConstants.AppColors.cyanColor
        
        priceLabel.text = "20.000 EUR"
        priceLabel.textColor = StyleConstants.AppColors.blueColor
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        lineChartView.backgroundColor = .systemRed
        
        buttonsStackView.alignment = .fill
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.axis = .horizontal
        buttonsStackView.spacing = 0
        
        for i in 0...5 {
            timeRangeButtons[i].setTitle(timeRangeText[i], for: .normal)
            timeRangeButtons[i].addTarget(self, action: #selector(buttonRangePressed), for: .touchUpInside)
            
            if i == 0 {
                timeRangeButtons[i].setTitleColor(StyleConstants.AppColors.blueColor, for: .normal)
                timeRangeButtons[i].titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            }
            else {
                timeRangeButtons[i].setTitleColor(StyleConstants.AppColors.cyanColor, for: .normal)
                timeRangeButtons[i].titleLabel?.font = UIFont.systemFont(ofSize: 18)
            }
            
            buttonsStackView.addArrangedSubview(timeRangeButtons[i])
        }
        
    }
    
    private func buildConstraints() {
        coinDetailView.snp.makeConstraints({
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.snp.centerY)
        })
        
        overviewLabel.snp.makeConstraints({
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview()
        })
        
        priceLabel.snp.makeConstraints({
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(overviewLabel.snp.bottom).offset(5)
        })
        
        buttonsStackView.snp.makeConstraints({
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(5)
            $0.height.equalTo(25)
        })
        
        lineChartView.snp.makeConstraints({
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(priceLabel.snp.bottom).offset(5)
            $0.bottom.equalTo(buttonsStackView.snp.top).offset(-5)
        })
        
        coinTableView.snp.makeConstraints({
            $0.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.top.equalTo(coinDetailView.snp.bottom)
        })
    }
    
    @objc func buttonRangePressed(_ sender: UIButton) {
        guard let name = sender.currentTitle else {
            print("Button with no name!")
            fatalError()
        }
        
        for i in 0...5 {
            guard let tmpName = timeRangeButtons[i].currentTitle else {
                print("Button with no name!")
                fatalError()
            }
            
            if tmpName == name {
                timeRangeButtons[i].setTitleColor(StyleConstants.AppColors.blueColor, for: .normal)
                timeRangeButtons[i].titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            }
            else {
                timeRangeButtons[i].setTitleColor(StyleConstants.AppColors.cyanColor, for: .normal)
                timeRangeButtons[i].titleLabel?.font = UIFont.systemFont(ofSize: 18)
            }
        }
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

