//
//  DayViewController.swift
//  Planner
//
//  Created by Arunima Dey on 12/28/21.
//  Copyright © 2021 Arunima Dey. All rights reserved.
//

import UIKit

class DayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var date = ""
    var eventArr = [Event]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        eventArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "\(eventArr[indexPath.row].name) \t @\(eventArr[indexPath.row].dueTime)"
        cell.imageView?.tintColor = cellColorForIndex(indexPath: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return date
    }
    
    func cellColorForIndex(indexPath: IndexPath) -> UIColor{
        let red = self.eventArr[indexPath.row].category.r
        let green = self.eventArr[indexPath.row].category.g
        let blue = self.eventArr[indexPath.row].category.b
        
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
        return color
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
