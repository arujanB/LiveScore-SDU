//
//  SectionHerderView.swift
//  LiveScore SDU
//
//  Created by Aruzhan Boranbay on 04.03.2023.
//

import UIKit

final class SectionHearderView: UIView {

    private lazy var titleSection: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textAlignment = .left
        label.textColor = .white
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var subtitleSection: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .left
        label.textColor = .gray
        label.backgroundColor = .clear
        return label
    }()
    
    private lazy var img: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "sdu")
        return img
    }()
    
    private lazy var stackViewVertical: UIStackView = {
        var stackView = UIStackView()
        stackView.addArrangedSubview(titleSection)
        stackView.addArrangedSubview(subtitleSection)
        
        stackView.axis = .vertical
        stackView.spacing = 1
        return stackView
    }()
    
//    private lazy var stackViewHorizontal: UIStackView = {
//        var stackView = UIStackView()
//        stackView.addArrangedSubview(img)
//        stackView.addArrangedSubview(stackViewVertical)
//
//        stackView.axis = .horizontal
//        stackView.spacing = 10
//        return stackView
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
        setUpConstrains()
        
        backgroundColor = UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setTitleSection(with titleSection: String) {
//        self.titleSection.text = titleSection
//    }
//
//    func setSubtitleSection(with subtitleSection: String) {
//        self.subtitleSection.text = subtitleSection
//    }
    
    func setInfo(with data: NameLocationData) {
        titleSection.text = data.footballName
        subtitleSection.text = data.location
        img.image = UIImage(named: data.logo)
    }

}

private extension SectionHearderView {
    func setUpViews(){
//        addSubview(stackViewHorizontal)
        addSubview(img)
        addSubview(stackViewVertical)
    }
    
    func setUpConstrains(){
//        stackViewHorizontal.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//            make.bottom.equalToSuperview().inset(20)
//        }
        
        img.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(-7)
            make.width.height.equalTo(20)
        }
        
        stackViewVertical.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.top.equalToSuperview().inset(-10)
            make.leading.equalTo(img.snp.trailing).inset(-10)
        }
    }
}

