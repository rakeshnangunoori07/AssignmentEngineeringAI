//
//  PostsDisplayDataTableView.swift
//  AssignmentEngineeringAI
//
//  Created by Rakesh-Ojas on 21/10/19.
//  Copyright © 2019 Rakesh-Ojas. All rights reserved.
//

import UIKit

class PostsDisplayDataTableView: UITableView,UITableViewDelegate,UITableViewDataSource{
    
    var numberOfRowsInTableView = NSMutableArray()
    var presentController:ViewController!
    var notFoundMessagingString:String!
    var count = 1
    func reloadTableViewData(dataDictionary:NSMutableArray,presentViewController: ViewController,witNotFoundMessage:String) {
        notFoundMessagingString = witNotFoundMessage
        numberOfRowsInTableView = dataDictionary
        presentController = presentViewController
        self.dataSource = self
        self.delegate = self
        self.separatorInset = .zero
        self.layoutMargins = .zero
        self.separatorStyle = .singleLine
        self.reloadData()
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsInTableView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! customTableViewCell
        cell.selectionStyle = .none
        if indexPath.row == numberOfRowsInTableView.count-1 {
            count += 1
            presentController.getServicePostData(count: count)
        }
        let data = numberOfRowsInTableView[indexPath.row]
        if(data as AnyObject).object(forKey: "title") as? String != nil{
            cell.lblTitle.text = (data as AnyObject).object(forKey: "title") as? String
        }
        if(data as AnyObject).object(forKey: "created_at") as? String != nil {
            cell.lblCreatedDate.text = (data as AnyObject).object(forKey: "created_at") as? String
        }
        return  cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    
}
