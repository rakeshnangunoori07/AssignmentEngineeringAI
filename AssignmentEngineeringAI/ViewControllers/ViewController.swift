//
//  ViewController.swift
//  AssignmentEngineeringAI
//
//  Created by Rakesh-Ojas on 21/10/19.
//  Copyright © 2019 Rakesh-Ojas. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var displayDataTableView: PostsDisplayDataTableView!
    
    var refreshController = UIRefreshControl()
    var dataArrary = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayDataTableView.rowHeight = UITableView.automaticDimension
        self.displayDataTableView.estimatedRowHeight = 80
        
        self.navigationItem.title = String(format:"Selected Posts 0")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.getServicePostData(count:1)
    }

    func getServicePostData(count:Int){
        let service =  ApiServices.init()
        service.startActivityIndictor()
        
        let url =  "https://hn.algolia.com/api/v1/search_by_date?tags=story&page="
        let finalString = url + String(count)
        Alamofire.request(finalString, method: .get, parameters: ["": ""], encoding: URLEncoding.default, headers: nil).responseJSON { (response: DataResponse<Any>) in
            switch response.result {
            case .success:
                service.stopActivityIndicator()
                if response.result.value != nil {
                    let dict:NSDictionary! = response.result.value as? NSDictionary
                    self.dataArrary.addObjects(from: (dict.value(forKey: "hits") as! [Any]))
                    self.navigationItem.title = String(format: "Total Displaying Posts %d",self.dataArrary.count)
                    if dict.value(forKey: "nbPages") as! Int != 0 {
                        self.displayDataTableView.reloadTableViewData(dataDictionary: (self.dataArrary as NSArray).mutableCopy() as! NSMutableArray, presentViewController: self, witNotFoundMessage: "")
                        
                    }
                }
            case .failure:
                service.stopActivityIndicator()
            }
        }
        }
    
}

