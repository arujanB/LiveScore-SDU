//
//  SceneDelegate.swift
//  LiveScore SDU
//
//  Created by Aruzhan Boranbay on 28.02.2023.
//

import UIKit
import SnapKit

final class ScoresViewController: UIViewController {
//    let titleSection: [String] = ["SDU Football league", "Cakes", "FastFoods"]
//    let subtitleSection: [String] = ["Almaty", "Shymkent", "Astana"]
    
    //MARK: - Date
    private lazy var buttonLive: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("LIVE", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
            
        return button
    }()
    
    private lazy var dateStackView: UIStackView = {
        var stackView = UIStackView()
        stackView.addArrangedSubview(buttonLive)
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        stackView.addArrangedSubview(button4)
        stackView.addArrangedSubview(button5)
        stackView.addArrangedSubview(buttonCal)
        
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var button1: UIButton = createButton(week: "THU", date: "12", titleColor: .white)
    private lazy var button2: UIButton = createButton(week: "FRI", date: "12", titleColor: .white)
    private lazy var button3: UIButton = createButton(week: "TODAY", date: "12", titleColor: .orange)
    private lazy var button4: UIButton = createButton(week: "SUN", date: "12", titleColor: .white)
    private lazy var button5: UIButton = createButton(week: "MON", date: "12", titleColor: .white)
    private lazy var buttonCal: UIButton = createButton(week: "THU", date: "12", titleColor: .white)
    
    //MARK: - TableView
    private let myTableView: UITableView = {
        var tableView = UITableView()
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.IDENTIFIER)
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    //MARK: - Main SectionButton
    private lazy var sectionButton: UIButton = {
        var button = UIButton()
        return button
    }()
    
    //MARK: - CollectionView
//    private lazy var itemCollectionView: UICollectionView = {
//        var layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.itemSize = CGSize(width: view.frame.width * 0.95, height: 70)
//
//        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.IDENTIFIER)
//        collectionView.backgroundColor = .clear
//        collectionView.showsVerticalScrollIndicator = false
////        collectionView.layer.borderColor = .init(genericGrayGamma2_2Gray: 1, alpha: 1)
//
//        return collectionView
//    }()
    
    //MARK: - BiggerView
    private lazy var biggerView: UIStackView = {
        var stackView = UIStackView()
        stackView.addArrangedSubview(dateStackView)
        stackView.addArrangedSubview(myTableView)
//        stackView.addArrangedSubview(itemCollectionView)
        
        stackView.spacing = 1
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1)
        
        setUpView()
        setUPConstrains()
        
        myTableView.dataSource = self
        myTableView.delegate = self
//        itemCollectionView.dataSource = self
        
        //navigation
        buttonLive.addTarget(self, action: #selector(nav), for: .touchUpInside)
    }
    
    //MARK: - Navigation
    @objc func nav() {
        navigationController?.pushViewController(SectionDetailViewController(),animated:true)
    }
    
    //MARK: - Function menthod for the Buttons
    func createButton(week: String, date:String, titleColor: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("\(week)\n\(date)", for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        
        return button
    }
    
}

//MARK: - tableView DataSource
extension ScoresViewController: UITableViewDataSource{
    //section
    func numberOfSections(in tableView: UITableView) -> Int {
//        titleSection.count
        Database.nameLocationDataArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        titleSection[section]
        Database.nameLocationDataArray[section].footballName
    }
    
    //sectionHeader
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SectionHearderView()
//        view.setTitleSection(with: titleSection[section])
//        view.setSubtitleSection(with: subtitleSection[section])
        view.setInfo(with: Database.nameLocationDataArray[section])
        return view
    }
    
    //cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.IDENTIFIER, for: indexPath) as! MyTableViewCell
//        cell.setNameLabel(with: row[indexPath.row])
        cell.backgroundColor = .clear
        return cell
    }

}

//MARK: - TableView Delegate
extension ScoresViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
//        return 100 * CGFloat(Database.nameLocationDataArray.count)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == SectionHearderView(){
            let vc = SectionDetailViewController()
            navigationController?.pushViewController(vc, animated: true)
            print("hi")
        }
    }
}

//MARK: - collectionView DataSource
//extension ScoresViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.IDENTIFIER, for: indexPath) as! MyCollectionViewCell
//        cell.layer.cornerRadius = 10
//        cell.layer.masksToBounds = true
//        cell.layer.borderColor = .init(red: 0.104, green: 0.104, blue: 0.104, alpha: 1)
//        cell.layer.borderWidth = 1
//
//        return cell
//    }
//
//}

//MARK: - setUpView and setUPConstrains
private extension ScoresViewController {
    func setUpView() {
        view.addSubview(biggerView)
        biggerView.addSubview(dateStackView)
    }
    
    func setUPConstrains() {
        biggerView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
        
        dateStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalToSuperview().multipliedBy(0.05)
        }
        
    }
    
}
