import UIKit
import SnapKit

class CoinTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: CoinTableViewCell.self)
    
    private var cellView: UIView!
    
    private var coinImageView: UIImageView!
    private var coinName: UILabel!
    private var coinTickerName: UILabel!
    private var coinDailyPercentageImageView: UIImageView!
    private var coinPrice: UILabel!
    private var coinDailyPercentage: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        buildCell()
        styleCell()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCoinCell(coin: String, coinTicker: String, price: Float, percentage: Float) {
        coinImageView.image = UIImage(systemName: "house")
        coinName.text = coin
        coinTickerName.text = coinTicker
        coinPrice.text = String(price) + " EUR"
        coinDailyPercentage.text = "+\(percentage)%"
    }
    
    private func buildCell() {
        cellView = UIView()
        addSubview(cellView)
        
        coinImageView = UIImageView()
        cellView.addSubview(coinImageView)
        
        coinName = UILabel()
        cellView.addSubview(coinName)
        
        coinTickerName = UILabel()
        cellView.addSubview(coinTickerName)
        
        coinDailyPercentageImageView = UIImageView()
        cellView.addSubview(coinDailyPercentageImageView)
        
        coinPrice = UILabel()
        cellView.addSubview(coinPrice)
        
        coinDailyPercentage = UILabel()
        cellView.addSubview(coinDailyPercentage)
    }
    
    private func styleCell() {
        //cellView.backgroundColor = .yellow
        
        coinName.textColor = StyleConstants.AppColors.blueColor
        coinName.font = UIFont.boldSystemFont(ofSize: 18)
        coinTickerName.textColor = StyleConstants.AppColors.cyanColor
        coinDailyPercentageImageView.image = UIImage(systemName: "arrow.up")
        coinDailyPercentageImageView.tintColor = .systemGreen
        coinPrice.font = UIFont.boldSystemFont(ofSize: 18)
        coinPrice.textColor = StyleConstants.AppColors.blueColor
        coinDailyPercentage.font = UIFont.boldSystemFont(ofSize: 18)
        coinDailyPercentage.textColor = .systemGreen
    }
    
    private func buildConstraints() {
        cellView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
        
        coinImageView.snp.makeConstraints({
            $0.leading.equalToSuperview().inset(15)
            $0.width.equalTo(80)
            $0.top.bottom.equalToSuperview().inset(15)
        })
        
        coinName.snp.makeConstraints({
            $0.leading.equalTo(coinImageView.snp.trailing).offset(15)
            $0.top.equalToSuperview().inset(18)
        })
        
        coinTickerName.snp.makeConstraints({
            $0.leading.equalTo(coinImageView.snp.trailing).offset(15)
            $0.bottom.equalToSuperview().inset(18)
        })
        
        coinPrice.snp.makeConstraints({
            $0.trailing.equalToSuperview().inset(15)
            $0.top.equalToSuperview().inset(18)
        })
        
        coinDailyPercentage.snp.makeConstraints({
            $0.trailing.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().inset(18)
        })
        
        coinDailyPercentageImageView.snp.makeConstraints({
            $0.width.equalTo(50)
            $0.trailing.equalTo(coinPrice.snp.leading).offset(-15)
            $0.top.bottom.equalToSuperview().inset(15)
        })
    }
    
}
