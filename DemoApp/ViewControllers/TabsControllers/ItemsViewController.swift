//
//  TableViewController.swift
//  DemoApp
//
//  Created by Мария Тимофеева on 18.04.2018.
//  Copyright © 2018 MiMari. All rights reserved.
//

import UIKit

private let reuseTableIdentifier = "TableCell"
private let reuseCollectionIdentifier = "CollectionCell"

class ItemsViewController: UIViewController {
    
    private var elements = [AnyObject]()
    
    //VIEWS
    private var tableView : UITableView!
    private var collectionView : UICollectionView!
    private var segmentControl : UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubviews()
    }
    
    private func initSubviews(){
        let sizeSegmenet = CGSize.init(width: CGFloat(150), height: CGFloat(40))
        let interval = CGFloat(10)
        //SEGMENT
        segmentControl = UISegmentedControl.init(frame: CGRect.init(origin: CGPoint.init(x:(view.frame.width - sizeSegmenet.width)/2 , y: interval), size: sizeSegmenet))
        segmentControl.insertSegment(withTitle: "Collection", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "Table", at: 1, animated: true)
        segmentControl.addTarget(self, action: #selector(segmentControlChangeState), for: .valueChanged)
        view.addSubview(segmentControl)
        
        let frame = CGRect.init(origin: CGPoint.init(x: 0, y: sizeSegmenet.height + interval*2), size: CGSize.init(width: view.frame.width, height: view.frame.height - sizeSegmenet.height - interval * 2))
        //TABLE
        tableView = UITableView.init(frame: frame)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
//        tableView.regi
        tableView.register(TableViewCell.self, forCellReuseIdentifier: reuseTableIdentifier)

        //COLLECTION
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        // Register cell classes
        collectionView = UICollectionView.init(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.lightGray
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseCollectionIdentifier)
        
        view.addSubview(collectionView)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

 // MARK: UISegmentControl
extension ItemsViewController {
    
    @objc private func segmentControlChangeState(){
       let isCollection = segmentControl.selectedSegmentIndex == 0
            UIView.animate(withDuration: 1) {
                self.tableView.isHidden = isCollection
                self.collectionView.isHidden = !isCollection
            }
    }
}

// MARK: Navugation
extension ItemsViewController {
    private func openDetailVCFor(item : AnyObject){
        
    }
}

extension ItemsViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseTableIdentifier, for: indexPath)
        cell.textLabel?.text = String(indexPath.row)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10//elements.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = elements[indexPath.row]
        openDetailVCFor(item: item)
    }
}

extension ItemsViewController : UICollectionViewDelegate ,  UICollectionViewDataSource {
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseCollectionIdentifier, for: indexPath)
        cell.backgroundColor = .white
        let label = UILabel.init(frame: CGRect.zero)
        label.text = String(indexPath.row)
        label.sizeToFit()
        cell.addSubview(label)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = elements[indexPath.row]
        openDetailVCFor(item: item)
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
