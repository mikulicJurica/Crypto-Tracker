import UIKit
import SnapKit

class CoinTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: CoinTableViewCell.self)
    
    private var cellView: UIView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        buildCell()
        styleCell()
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCoin() {
        
    }
    
    private func buildCell() {
        cellView = UIView()
        addSubview(cellView)
    }
    
    private func styleCell() {
        cellView.backgroundColor = .yellow
    }
    
    private func buildConstraints() {
        cellView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
    }
    
}
