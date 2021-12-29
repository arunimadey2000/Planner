//
//  FirstViewController.swift
//  Planner
//
//  Created by Arunima Dey on 9/11/20.
//  Copyright © 2020 Arunima Dey. All rights reserved.
//

import UIKit
import FSCalendar


class FirstViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource{
    
    @IBOutlet weak var calendar: FSCalendar!
    
    @IBOutlet weak var addCategoryButton: UIButton!
    
    @IBOutlet weak var categoryTableView: UITableView!
    
//    var categories = [String]()
//    var colors = [UIColor]()
    
//    var times = [String]()
//    var i = 0
    
//    var colorTemp: UIColor = UIColor.white
//    var categoryTemp = ""
    
    var arr = [1,2,4,5,6]
    
    var eventArr = [Event]()
    var eventTemp = Event(name: "", category: Category(r: 0.0, g: 0.0, b: 0.0, name: ""), dueDate: "", dueTime: "", checkedOff: false, remindTimePrior1: 0.0, remindTimePrior2: 0.0)
    var categoryArr = [Category]()
    var catTemp = Category(r: 0.0, g: 0.0, b: 0.0, name: "")
    var eventDatesArr = [String]()
    var datesWithEvent = ["01/07/22", "12/09/21", "12-10-2021", "12-11-2021"]
    var datesWithMultipleEvents = ["09-03-2021", "12-09-2021", "12-10-2021", "12-13-2021"]
    var selectedDate = ""
    var eventsFromDay = [Event]()
    
//    var rT: CGFloat = 0.0
//    var gT: CGFloat = 0.0
//    var bT: CGFloat = 0.0
//
//    var r = [CGFloat]()
//    var g = [CGFloat]()
//    var b = [CGFloat]()
//
//    var colorSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let secondTab = (self.tabBarController?.viewControllers?[1])! as! SecondViewController
        secondTab.categoryArr = self.categoryArr
        secondTab.eventArr = self.eventArr
        
        calendar.dataSource = self
        calendar.delegate = self
        
        calendar.backgroundColor = UIColor(named: "blue")
        calendar.appearance.eventSelectionColor = UIColor.purple
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        
        let inserting = 3
        for i in arr{
            if( inserting < arr[i] ){
                arr.insert(inserting, at: i)
                break
            }
        }
        // Do any additional setup after loading the view.
    }

//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int  {
//        let timeFormatter = DateFormatter()
//        timeFormatter.dateStyle = .short
//        let dateString = timeFormatter.string(from: date)
//        print(dateString)
//        var x = 0
//        // datesForEvents : array of dates
//        self.eventArr.forEach({event in
//            print("the date: ", event.dueDate)
//            print("the date version: ", event.dueDate.prefix(10))
//            if (event.dueDate.prefix(10) == dateString){
//                x = 1
//            }
//        })
//        if self.datesWithEvent.contains(dateString) {
//                return 1
//            }
//        if self.datesWithMultipleEvents.contains(dateString) {
//                return 3
//            }
//        return 0
//    }
    
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let timeFormatter = DateFormatter()
        //timeFormatter.dateFormat = "MM/dd/YY"
        timeFormatter.dateStyle = .short
        let dateString = timeFormatter.string(from: date)
        if self.eventDatesArr.contains(dateString) {
            var count = 0;
            self.eventDatesArr.forEach({event in
                if(event==dateString){
                    count+=1
                }
            })
            return count // Here, We have to assign JSON count key value based on duplication it will increase dot count UI.
        }
        return 0
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventColorFor date: Date) -> UIColor? {
         //Do some checks and return whatever color you want to.
         return UIColor.purple
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]? {
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .short
        let dateString = timeFormatter.string(from: date)
        
        if self.eventDatesArr.contains(dateString) {
        //if self.datesWithEvent.contains(dateString) {
            return [UIColor.magenta, appearance.eventDefaultColor, UIColor.black]
        }
        return nil
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let timeFormatter = DateFormatter()
        //timeFormatter.dateFormat = "MM/dd/YY"
        timeFormatter.dateStyle = .short
        let dateString = timeFormatter.string(from: date)
        print("date selected: ", dateString)
        selectedDate = dateString
        eventsFromDay = []
        self.eventArr.forEach({event in
            if(event.dueDate == dateString){
                eventsFromDay.append(event)
            }
        })
        
        performSegue(withIdentifier: "dayView", sender: calendar)
        
//        let assignment = Assignment(category: "hi", color: UIColor.cyan, dueDate: date as NSDate, checkedOff: false, remindTimePrior1: 3, remindTimePrior2: 2)
//        assignmentArr.append(assignment)
//        print(assignment.checkedOff)
    }

    @IBAction func addButtonPressed(_ sender: UIButton) {
        print("add button pessed")

    }
    
    @IBAction func addCategoryPressed(_ sender: UIButton) {
//        i+=1
//        times.append("\(i)")
//        categoryTableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //UserDefaults.standard.removeObject(forKey: "events")
//        UserDefaults.standard.removeObject(forKey: "cols")
//        UserDefaults.standard.removeObject(forKey: "cat")
//        UserDefaults.standard.removeObject(forKey: "r")
//        UserDefaults.standard.removeObject(forKey: "g")
//        UserDefaults.standard.removeObject(forKey: "b")
        
        if UserDefaults.standard.object(forKey: "categories") != nil {
            categoryArr = UserDefaults.standard.codableObject(dataType: [Category].self, key: "categories")!
            if(catTemp.name != ""){
                categoryArr.append(catTemp)
            }
        }
        UserDefaults.standard.removeObject(forKey: "categories")
        UserDefaults.standard.setCodableObject(categoryArr, forKey: "categories")
        
        print("in viewDidAppear and the number of categories are: ", categoryArr.count)
        
        
        if UserDefaults.standard.object(forKey: "events") != nil {
            eventArr = UserDefaults.standard.codableObject(dataType: [Event].self, key: "events")!
            if(eventTemp.name != ""){
                eventArr.append(eventTemp)
            }
        }
        
        UserDefaults.standard.removeObject(forKey: "events")
        UserDefaults.standard.setCodableObject(eventArr, forKey: "events")
        
        let secondTab = (self.tabBarController?.viewControllers?[1])! as! SecondViewController
        secondTab.categoryArr = self.categoryArr
        secondTab.eventArr = self.eventArr
        
        self.eventArr.forEach({event in
            eventDatesArr.append(event.dueDate)
        })
//        self.eventArr.forEach({event in
//            print("the date: ", event.dueDate)
//            print("the date version: ", event.dueDate.prefix(10))
//        })
        
//        if UserDefaults.standard.object(forKey: "cat") != nil {
//            categories = UserDefaults.standard.object(forKey: "cat") as! [String]
//            if(categoryTemp != "" && !(categories.contains(categoryTemp))){
//                categories.append(categoryTemp)
//            }
//        }
//
//        UserDefaults.standard.removeObject(forKey: "cat")
//        UserDefaults.standard.set(categories, forKey: "cat")
//        //print("in viewDidLoad: \(categories)")
//
//        //print(categories.count)
//
//        if UserDefaults.standard.object(forKey: "r") != nil {
//            r = UserDefaults.standard.object(forKey: "r") as! [CGFloat]
//            if(colorSelected){
//                r.append(rT)
//            }
//        }
//        UserDefaults.standard.removeObject(forKey: "r")
//        UserDefaults.standard.set(r, forKey: "r")
//
//        if UserDefaults.standard.object(forKey: "g") != nil {
//            g = UserDefaults.standard.object(forKey: "g") as! [CGFloat]
//            if(colorSelected){
//                g.append(gT)
//            }
//        }
//        UserDefaults.standard.removeObject(forKey: "g")
//        UserDefaults.standard.set(g, forKey: "g")
//
//        if UserDefaults.standard.object(forKey: "b") != nil {
//            b = UserDefaults.standard.object(forKey: "b") as! [CGFloat]
//            if(colorSelected){
//                b.append(bT)
//            }
//        }
//        UserDefaults.standard.removeObject(forKey: "b")
//        UserDefaults.standard.set(b, forKey: "b")
        
//        if UserDefaults.standard.object(forKey: "col") != nil {
//            colors = UserDefaults.standard.object(forKey: "col") as! [UIColor]
//            if(colorTemp != UIColor.white && !(colors.contains(colorTemp))){
//                colors.append(colorTemp)
//            }
//        }
//        UserDefaults.standard.removeObject(forKey: "col")
//        UserDefaults.standard.set(colors, forKey: "col")
        calendar.reloadData()
        calendar.layoutIfNeeded()
        categoryTableView.reloadData()
        categoryTableView.layoutIfNeeded()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        /*let destVC: AddEventViewController = segue.destination as! AddEventViewController
        destVC.times = times;*/
        if let destVC = segue.destination as? AddEventViewController {
            destVC.category = self.categoryArr
            destVC.startedFromFirst = true
            
        }
        else if let destVC = segue.destination as? DayViewController {
            destVC.date = self.selectedDate
            destVC.eventArr = self.eventsFromDay
        }
        
            

    }
//   override func viewDidLayoutSubviews() {
//       categoryTableView.heightAnchor.constraint(equalToConstant:categoryTableView.contentSize.height).isActive = true
//   }
//
    
}

extension FirstViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me")
    }
    
}


extension FirstViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(categoryArr[indexPath.row].name)"
        //cell.textLabel?.text = "\(categories[indexPath.row])"
        cell.imageView?.tintColor = cellColorForIndex(indexPath: indexPath)
//        cell.backgroundColor = cellColorForIndex(indexPath: indexPath)
        //cell.backgroundColor = UIColor(red: red[indexPath.row], green: green[indexPath.row], blue: blue[indexPath.row], alpha: 1)
        
        return cell
    }
    
    
    
    func cellColorForIndex(indexPath: IndexPath) -> UIColor{
//    //cast row and section to CGFloat
//    let row = CGFloat(indexPath.row)
//    let section = CGFloat(indexPath.section)
//    //compute row as hue and section as saturation
//        let saturation  = 1.0 - row / CGFloat(categories.count)
//    let hue =  section / CGFloat(2)
//    return UIColor(hue: hue, saturation: saturation, brightness: 1.0, alpha: 1.0)
//        let color = colors[indexPath.row]
//        var color = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
//        print("r.count: \(r.count)")
//        print("g.count: \(g.count)")
//        print("b.count: \(b.count)")
//
//        print(r)
//        print(g)
//        print(b)
        
//        print(colorSelected)
        let red = self.categoryArr[indexPath.row].r
        let green = self.categoryArr[indexPath.row].g
        let blue = self.categoryArr[indexPath.row].b
        //let red = r[indexPath.row]
        //let green = g[indexPath.row]
        //let blue = b[indexPath.row]
//            let color = colorTemp
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        //let color = colorTemp
        return color
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print(indexPath.row)
            self.categoryArr.remove(at: indexPath.row)
//            if UserDefaults.standard.object(forKey: "cat") != nil {
//                categories = UserDefaults.standard.object(forKey: "cat") as! [String]
//            }
            UserDefaults.standard.removeObject(forKey: "categories")
            UserDefaults.standard.setCodableObject(categoryArr, forKey: "categories")
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        /*if editingStyle == .delete {
            self.categories.remove(at: indexPath.row)
//            if UserDefaults.standard.object(forKey: "cat") != nil {
//                categories = UserDefaults.standard.object(forKey: "cat") as! [String]
//            }
            UserDefaults.standard.removeObject(forKey: "cat")
            UserDefaults.standard.set(categories, forKey: "cat")

            self.r.remove(at: indexPath.row)
//            if UserDefaults.standard.object(forKey: "r") != nil {
//                r = UserDefaults.standard.object(forKey: "r") as! [CGFloat]
//            }
            UserDefaults.standard.removeObject(forKey: "r")
            UserDefaults.standard.set(r, forKey: "r")

            self.g.remove(at: indexPath.row)
//            if UserDefaults.standard.object(forKey: "g") != nil {
//                g = UserDefaults.standard.object(forKey: "g") as! [CGFloat]
//            }
            UserDefaults.standard.removeObject(forKey: "g")
            UserDefaults.standard.set(g, forKey: "g")

            self.b.remove(at: indexPath.row)
//            if UserDefaults.standard.object(forKey: "b") != nil {
//                b = UserDefaults.standard.object(forKey: "b") as! [CGFloat]
//            }
            UserDefaults.standard.removeObject(forKey: "b")
            UserDefaults.standard.set(b, forKey: "b")
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        
//            if UserDefaults.standard.object(forKey: "cat") != nil {
//                categories = UserDefaults.standard.object(forKey: "cat") as! [String]
//            }
//            UserDefaults.standard.set(categories, forKey: "cat")
        
        }*/
    }
}

extension UserDefaults {
  func setCodableObject<T: Codable>(_ data: T?, forKey defaultName: String) {
    let encoded = try? JSONEncoder().encode(data)
    set(encoded, forKey: defaultName)
  }
    
    func codableObject<T : Codable>(dataType: T.Type, key: String) -> T? {
        guard let userDefaultData = data(forKey: key) else {
          return nil
        }
        return try? JSONDecoder().decode(T.self, from: userDefaultData)
      }
}

