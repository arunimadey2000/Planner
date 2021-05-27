//
//  AddEventViewController.swift
//  Planner
//
//  Created by Arunima Dey on 10/10/20.
//  Copyright © 2020 Arunima Dey. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var categoryField: UITextField!
    
    @IBOutlet weak var dueDateField: UITextField!
    @IBOutlet weak var dueTimeField: UITextField!
    
    var category = [String]()
    let imageName = "LoadingImage.png";
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let image = UIImage(named: imageName);
//        let imageView = UIImageView(image: image!);
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: imageName)!);
        
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
