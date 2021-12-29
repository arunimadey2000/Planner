//
//  AddEventViewController.swift
//  Planner
//
//  Created by Arunima Dey on 10/10/20.
//  Copyright © 2020 Arunima Dey. All rights reserved.
//
//control + drag to get Iba action thing

import UIKit

class AddEventViewController: ATabController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var categoryPickerField: UIPickerView!
    @IBOutlet weak var dueDateField: UITextField!
    
    @IBOutlet weak var dueTimeField: UITextField!
    
    let dueDatePicker = UIDatePicker()
    let dueTimePicker = UIDatePicker()
    
    var category = [Category]()
    var categoryString = [String]()
    let imageName = "LoadingImage.png";
    var startedFromFirst: Bool!
    
    var times = [String]();
    
    var catTemp = Category(r: 0.0, g: 0.0, b: 0.0, name: "")
    var event: Event!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDueDatePicker();
        categoriesToString(category: self.category)
        
        self.categoryPickerField.delegate = self
        self.categoryPickerField.dataSource = self
        
        event = Event(name: "", category: catTemp, dueDate: "", dueTime: "", checkedOff: false, remindTimePrior1: 0.0, remindTimePrior2: 0.0)
        
//        let image = UIImage(named: imageName);
//        let imageView = UIImageView(image: image!);
        // self.view.backgroundColor = UIColor(patternImage: UIImage(named: imageName)!);
        
        // Do any additional setup after loading the view.
    }
    
    func categoriesToString(category: [Category]){
        category.forEach({cat in
            categoryString.append(cat.name)
        })
    }
    
    let dateFormatter = DateFormatter()
    let timeFormatter = DateFormatter()
    func createDueDatePicker(){
        //toolbar
        let toolbar = UIToolbar()
        let toolbar2 = UIToolbar()
        //toolbar.sizeThatFits(CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2))
        toolbar.sizeToFit()
        toolbar2.sizeToFit()
        
        //bar done button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedForDueDateField))
        let doneButton2 = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressedForDueTimeField))
        toolbar.setItems([doneButton], animated: true)
        toolbar2.setItems([doneButton2], animated: true)
        
        // assign toolbar
        dueDateField.inputAccessoryView = toolbar
        dueTimeField.inputAccessoryView = toolbar2
        //assign time picker to text field
        
        dueDateField.inputView = dueDatePicker
        dueTimeField.inputView = dueTimePicker
        
        // make date
        dueDatePicker.datePickerMode = .date
        dueTimePicker.datePickerMode = .time
        //dueDatePicker.minimumDate = NSDate.now
        dueDatePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
        dueTimePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
    }
    
    @objc func donePressedForDueDateField(){
        dateFormatter.dateStyle = .short
        /*let dateString = timeFormatter.string(from: dueDatePicker.date)
        dueDateField.text = dateString
        print("the date selected is: ", dateString)*/
        //timeFormatter.timeStyle = .short
        let dateString = dateFormatter.string(from: dueDatePicker.date)
        //let dateAndTime = timeFormatter.date(from: dateAndTimeString)
        dueDateField.text = dateString
        print("the date selected is: ", dateString)
        self.view.endEditing(true)
        event.dueDate = dateString
    }
    
    @objc func donePressedForDueTimeField(){
        timeFormatter.timeStyle = .short
        let timeString = timeFormatter.string(from: dueDatePicker.date)
        dueTimeField.text = timeString
        
        print("the time  selected is: ", timeString)
        
        self.view.endEditing(true)
        event.dueTime = timeString
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        times.append("\(times.count + 1)")
        if(startedFromFirst){
            print("performing 1st segue")
            performSegue(withIdentifier: "segue", sender: sender)
        }
        else{
            print("performing 2nd segue")
            performSegue(withIdentifier: "segue", sender: sender)
        }
        
        
        //self.tabBarController?.selectedIndex = 1;
//        tabDelegate?.switchTab(to: .second);
//        if(startedFromFirst){
//            performSegue(withIdentifier: "to1", sender: sender)
//        }
//        else{
//            performSegue(withIdentifier: "to2", sender: sender)
//        }
//        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryString.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(categoryString[row])
        category.forEach({cat in
            if(cat.name == categoryString[row]){
                event.category = cat
            }
        })
       return categoryString[row]
   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let barVC = segue.destination as? UITabBarController {
            barVC.viewControllers?.forEach {
                if let destVC = $0 as? FirstViewController{
                    event.name = titleField.text!
                    destVC.eventTemp = event
                }
            }
        }
        /*let dest: TabBarController = segue.destination as! TabBarController
        dest.tabBarController?.selectedIndex = 2;*/
//        dest.vc = 2;
//        if(startedFromFirst){
//            let destVC: FirstViewController = segue.destination as! FirstViewController
//
//        }else{
//            let destVC: SecondViewController = segue.destination as! SecondViewController
//            destVC.times = times;
        
//        destVC.tabBarController?.selectedIndex = 1;
//        }

    }

}
