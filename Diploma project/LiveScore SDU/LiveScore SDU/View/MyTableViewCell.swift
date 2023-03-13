//
//  MyTableViewCell.swift
//  LiveScore SDU
//
//  Created by Aruzhan Boranbay on 28.02.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    static let IDENTIFIER = "MyTableViewCell"
    
//    private lazy var nameLabel: UILabel = {
//        var label = UILabel()
//        label.textColor = .lightGray
//        return label
//    }()
    
    private lazy var myCollectionView: UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.IDENTIFIER)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
//        collectionView.layer.borderColor = .init(genericGrayGamma2_2Gray: 1, alpha: 1)
//        collectionView.isScrollEnabled = false

        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setNameLabel(with name:String) {
//        nameLabel.text = name
//    }
    
}

//MARK: - CollectionView DataSource
extension MyTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Database.gameScoreDataArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.IDENTIFIER, for: indexPath) as! MyCollectionViewCell
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.layer.borderColor = .init(red: 0.104, green: 0.104, blue: 0.104, alpha: 1)
        cell.layer.borderWidth = 1
        
        cell.setData(with: Database.gameScoreDataArray[indexPath.row])

        return cell
    }
    
}

//MARK: - CollectionView Delegate CellLayoutSize
extension MyTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width - 10, height: collectionView.frame.size.height / 4)
    }
}

//MARK: - setUpViews & setUpConstrains
extension MyTableViewCell{
    func setUpViews() {
//        contentView.addSubview(nameLabel)
        contentView.addSubview(myCollectionView)
    }
    
    func setUpConstraints(){
//        nameLabel.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//        }
        myCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
