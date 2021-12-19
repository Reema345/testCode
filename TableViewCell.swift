//
//  TableViewCell.swift
//  Phunware_CodeChallenge
//
//  Created by Reema Rachel Varghese on 12/13/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    var dateValue = Date()
    
    static let identifier = "TableViewCell"
    
    lazy var backView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.green
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 1.0
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        //view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowRadius = 3.6
        view.layer.cornerRadius = 5
        return view
    }()
    
    let backgroundImageView: UIImageView = {
        let img = UIImageView(frame: .zero)
        img.contentMode = .scaleAspectFill //without this your image will shrink and looks ug
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 5
        img.layer.shadowColor = UIColor.lightGray.cgColor
        img.layer.shadowOpacity = 1.0
        img.clipsToBounds = true
        img.layer.shadowOffset = CGSize(width: 1, height: 1)
        img.layer.shadowRadius = 5
        return img
    }()

    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        //label.text = " Death Star Ventilation"
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        //label.text = " May 4, 2015"
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        //label.text = " at 4:30pm"
        return label
    }()
    
    lazy var locationLine1Label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        //label.text = " Conference RM"
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .clear
        self.contentView.addSubview(backgroundImageView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(dateLabel)
        self.contentView.addSubview(timeLabel)
        self.contentView.addSubview(locationLine1Label)
        self.contentView.addSubview(locationLine2Label)
        self.contentView.addSubview(descriptionLabel)
    
        
       backgroundImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 10).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant: 10).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant: -10).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -10).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 40).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 30).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    
        locationLine1Label.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor,constant: 10).isActive = true
        locationLine1Label.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 30).isActive = true
        locationLine1Label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        locationLine2Label.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor,constant: 10).isActive = true
        locationLine2Label.leadingAnchor.constraint(equalTo: self.locationLine1Label.trailingAnchor,constant: 3).isActive = true
        locationLine2Label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo:self.dateLabel.bottomAnchor,constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 30).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -15).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: self.locationLine2Label.topAnchor,constant: 35).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 30).isActive = true
          descriptionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -35).isActive = true
          descriptionLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -35).isActive = true
   }
    func updateView(response: Response) {
    
        //downloadImage(response: response)
        titleLabel.text = response.title
        dateLabel.text = dateValue.getFormattedDate(format: response.date!)
        
        //locationLine2Label.text = "," + (response.locationLine2)!
        locationLine1Label.text = (response.locationline1)!
        descriptionLabel.text = response.description
    }
    
    func downloadImage(response: Response)  {
        
        guard let imageURL = URL(string: response.image ?? "Icon1") else { return }
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async { [self] in
                        backgroundImageView.image = image
                    }
                } else if data == nil {
                       let image = UIImage(named: "Icon1")
                       backgroundImageView.image = image
               }
        }
        
    
    func dateToString(date: Date) -> String {
        let createDate = DateFormatter()
        createDate.dateStyle = .medium
        let dateString = createDate.string(from: date)
        return dateString
    }
    
    func timeToString(timeStamp:Date) -> String {
        let createDate = DateFormatter()
        createDate.timeStyle = .short
        let time = createDate.string(from: timeStamp)
       // let timeStamp = DateFormatter.localizedString(from: timeStamp, dateStyle: .medium, timeStyle: .short)
        return time
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
       }
