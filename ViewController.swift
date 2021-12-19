//
//  ViewController.swift
//  Phunware_CodeChallenge
//
//  Created by Reema Rachel Varghese on 12/13/21.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tableView = UITableView()
    let apiService = APIService()
    var responseData = [Response]()
   
    
   lazy var headerLabel: UILabel = {
       let label = UILabel(frame: .zero)
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Phun App"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAPIData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func loadView() {
        super.loadView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 240
        tableView.separatorColor = UIColor.clear
        tableView.backgroundColor = .clear
        self.view.addSubview(headerLabel)
        self.view.addSubview(tableView)
    
       headerLabel.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 30).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 15).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        tableView.topAnchor.constraint(equalTo:self.view.topAnchor,constant: 80).isActive = true
        tableView.leftAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
    }
       
     func getAPIData() {
         apiService.downloadResponseData(completionBlock: { [self]
            result in
                switch result {
                case .success(let response):
                    responseData = response
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    break
                case .failure(let error):
                    print(error)
                }
        })
    }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        let response = self.responseData[indexPath.row]
        if let image = response.image {
           cell.backgroundImageView.setImage(urlString: image, placeholder: UIImage(named: "Icon1"))
        }
        
        cell.updateView(response: response)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var vc = DetailViewController()
        vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        vc.backgroundImageView.setImage(urlString: self.responseData[indexPath.row].image!, placeholder: UIImage(named: "Icon1"))
        vc.response.append(self.responseData[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
        
}

