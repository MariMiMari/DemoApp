//
//  SettingsViewController.swift
//  DemoApp
//
//  Created by Мария Тимофеева on 19.04.2018.
//  Copyright © 2018 MiMari. All rights reserved.
//

import UIKit
private let reuseTableIdentifier = "TableCell"
class SettingsViewController: UIViewController {
    //VIEWS
    private var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        initSubviews()
    }
    
    private func initSubviews(){
        let interval = CGFloat(10)
        let frame = CGRect.init(origin: CGPoint.init(x: 0, y: interval), size: CGSize.init(width: view.frame.width, height: view.frame.height - interval ))
        //TABLE
        tableView = UITableView.init(frame: frame)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: reuseTableIdentifier)
        
    }

}

extension SettingsViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseTableIdentifier, for: indexPath)
        cell.textLabel?.text = "Setting #" + String(indexPath.row)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10//elements.count
    }
}
