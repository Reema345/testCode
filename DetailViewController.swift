//
//  DetailViewController.swift
//  Phunware_CodeChallenge
//
//  Created by Reema Rachel Varghese on 12/16/21.
//

import UIKit

class DetailViewController: UIViewController {
    var response = [Response]()
    var dateValue = Date()
    let gradient: CAGradientLayer = CAGradientLayer()
    
    let backgroundImageView:UIImageView = {
        let img = UIImageView(frame: .zero)
        img.contentMode = .scaleAspectFill // without this your image will shrink and looks ug
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.layer.masksToBounds = false
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
        
    lazy var locationLine1Label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var locationLine2Label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        backgroundImageView.layer.addSublayer(gradient)
        setupView()
    }
    
    override func loadView() {
        super.loadView()
        self.view.addSubview(backgroundImageView)
        self.backgroundImageView.addSubview(dateLabel)
        self.backgroundImageView.addSubview(titleLabel)
        self.backgroundImageView.addSubview(descriptionLabel)
        self.backgroundImageView.addSubview(locationLine2Label)
        self.backgroundImageView.addSubview(locationLine1Label)

        dateLabel.topAnchor.constraint(equalTo: self.backgroundImageView.topAnchor,constant: 200).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo:self.dateLabel.bottomAnchor,constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.backgroundImageView.trailingAnchor,constant: -15).isActive = true
        
        backgroundImageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo:self.view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo:self.view.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
       locationLine1Label.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor,constant: 10).isActive = true
        locationLine1Label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20).isActive = true
        locationLine1Label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        locationLine2Label.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor,constant: 10).isActive = true
        locationLine2Label.leadingAnchor.constraint(equalTo: self.locationLine1Label.trailingAnchor,constant: 3).isActive = true
        locationLine2Label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: self.locationLine2Label.topAnchor,constant: 35).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20).isActive = true
          descriptionLabel.trailingAnchor.constraint(equalTo: self.backgroundImageView.trailingAnchor,constant: -35).isActive = true
          descriptionLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -35).isActive = true
    }
    
    func setupView() {
        response.forEach { data in
            titleLabel.text = data.title
            dateLabel.text = dateValue.getFormattedDate(format: data.date!)
            locationLine1Label.text = data.locationline1
            locationLine2Label.text = data.locationLine2
            descriptionLabel.text = data.description
            
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradient.frame = backgroundImageView.bounds
    }

}
