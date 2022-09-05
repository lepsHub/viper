//
//  View.swift
//  viper
//
//  Created by Luz Nunez on 5/09/22.
//

import Foundation
import UIKit

protocol AnyView{
    var presenter: AnyPresenter? {get set}
    
    func update(with users: [User])
    func update(with error: String)
    
}

class UserViewController: UIViewController,AnyView,UITableViewDelegate, UITableViewDataSource {
    var presenter: AnyPresenter?
    
    private let tablewView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.isHidden = true
        label.text = ""
        return label
    }()
    
    var users: [User] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        
        view.backgroundColor = .systemBlue
        view.addSubview(tablewView)
        tablewView.delegate = self
        tablewView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tablewView.frame = view.bounds
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.center = view.center
    }
    
    func update(with users: [User]) {
        print("got users")
        DispatchQueue.main.async {
            self.users = users
            self.tablewView.reloadData()
            self.tablewView.isHidden = false
        }
    }
    
    func update(with error: String) {
        print(error)
        DispatchQueue.main.async {
            self.users = []
            self.label.text = error
            self.tablewView.isHidden = true
            self.label.isHidden = false
        }
    }
    
    //Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablewView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
}
