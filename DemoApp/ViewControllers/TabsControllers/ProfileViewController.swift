//
//  ProfileViewController.swift
//  DemoApp
//
//  Created by Мария Тимофеева on 19.04.2018.
//  Copyright © 2018 MiMari. All rights reserved.
//

import UIKit
private let reuseTableIdentifier = "TableCell"
class ProfileViewController: UIViewController {

    //VIEWS
    private var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        initSubviews()
    }
    
    private func initSubviews(){
        let interval = CGFloat(10)
        let frame = CGRect.init(origin: CGPoint.init(x: 0, y: interval), size: CGSize.init(width: view.frame.width, height: view.frame.height - interval ))
        //TABLE
        tableView = UITableView.init(frame: frame, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(tableView)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: reuseTableIdentifier)
        
    }
    
}

extension ProfileViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseTableIdentifier, for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text =  "Profile parametr #" + String(indexPath.row)
        }
        else {
            cell.textLabel?.text = "Logout"
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 10 : 1//elements.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Parametrs" : nil
    }
}
