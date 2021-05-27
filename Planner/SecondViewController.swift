//
//  SecondViewController.swift
//  Planner
//
//  Created by Arunima Dey on 9/11/20.
//  Copyright © 2020 Arunima Dey. All rights reserved.
//

//ListView screen

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var b = 0
    
    var times = [String]()
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func addButtonPressed(_ sender: UIButton) {
        i+=1
        times.append("\(i)")
        tableView.reloadData()
    }
    
}


//when row is selected
extension SecondViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(times[0] != nil){
            tableView.cellForRow(at: indexPath)?.textLabel?.attributedText = times[indexPath.row].strikeThrough()
        }
        
    }
    
    
    
}

extension SecondViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = times[indexPath.row]
        cell.isEditing = true
        
        return cell
    }
    
}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
               value: NSUnderlineStyle.single.rawValue,
                   range:NSMakeRange(0,attributeString.length))
        return attributeString
    }
}
