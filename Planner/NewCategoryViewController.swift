//
//  NewCategoryViewController.swift
//  Planner
//
//  Created by Arunima Dey on 10/6/20.
//  Copyright © 2020 Arunima Dey. All rights reserved.
//

import UIKit

class NewCategoryViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var categoryView: UIView!
    
    @IBOutlet weak var cayenneButton: UIButton!
    @IBOutlet weak var mochaButton: UIButton!
    @IBOutlet weak var asparagusButton: UIButton!
    @IBOutlet weak var tealButton: UIButton!
    @IBOutlet weak var oceanButton: UIButton!
    @IBOutlet weak var midnightButton: UIButton!
    @IBOutlet weak var eggplantButton: UIButton!
    @IBOutlet weak var plumButton: UIButton!
    
    @IBOutlet weak var marachinoButton: UIButton!
    @IBOutlet weak var tangerineButton: UIButton!
    @IBOutlet weak var limeButton: UIButton!
    @IBOutlet weak var turquoiseButton: UIButton!
    @IBOutlet weak var aquaButton: UIButton!
    @IBOutlet weak var blueberryButton: UIButton!
    @IBOutlet weak var grapeButton: UIButton!
    @IBOutlet weak var strawberryButton: UIButton!
    
    @IBOutlet weak var salmonButton: UIButton!
    @IBOutlet weak var cantaloupeButton: UIButton!
    @IBOutlet weak var bananaButton: UIButton!
    @IBOutlet weak var honeydewButton: UIButton!
    @IBOutlet weak var skyButton: UIButton!
    @IBOutlet weak var orchidButton: UIButton!
    @IBOutlet weak var lavenderButton: UIButton!
    @IBOutlet weak var carnationButton: UIButton!
    
    var color: UIColor = UIColor.white
    var category = ""
    
    var r: CGFloat = 0.0
    var g: CGFloat = 0.0
    var b: CGFloat = 0.0
    
    var colorSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.categoryView.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        category = textField.text!
    }
    
    @IBAction func cayennePressed(_ sender: UIButton) {
        cayenneButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 148/255
        g = 17/255
        b = 0/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func mochaPressed(_ sender: UIButton) {
        mochaButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 148/255
        g = 82/255
        b = 0/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func asparagusPressed(_ sender: UIButton) {
        asparagusButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 146/255
        g = 144/255
        b = 0/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
  
    @IBAction func tealPressed(_ sender: UIButton) {
        tealButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 0/255
        g = 145/255
        b = 147/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func oceanPressed(_ sender: UIButton) {
        oceanButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 0/255
        g = 84/255
        b = 147/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func midnightPressed(_ sender: UIButton) {
        midnightButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 1/255
        g = 25/255
        b = 147/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func eggplantPressed(_ sender: UIButton) {
        eggplantButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 83/255
        g = 27/255
        b = 147/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func plumPressed(_ sender: UIButton) {
        plumButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 148/255
        g = 33/255
        b = 147/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func marachinoPressed(_ sender: UIButton) {
        marachinoButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 255/255
        g = 38/255
        b = 0/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func tangerinePressed(_ sender: UIButton) {
        tangerineButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 255/255
        g = 147/255
        b = 0/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func limePressed(_ sender: UIButton) {
        limeButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 142/255
        g = 250/255
        b = 0/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func turquoisePressed(_ sender: UIButton) {
        turquoiseButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 0/255
        g = 253/255
        b = 255/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func aquaPressed(_ sender: UIButton) {
        aquaButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 0/255
        g = 150/255
        b = 255/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func blueberryPressed(_ sender: UIButton) {
        blueberryButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 4/255
        g = 51/255
        b = 255/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func grapePressed(_ sender: UIButton) {
        grapeButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 148/255
        g = 55/255
        b = 255/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func strawberryPressed(_ sender: UIButton) {
        strawberryButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 255/255
        g = 47/255
        b = 146/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func salmonPressed(_ sender: UIButton) {
        salmonButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 255/255
        g = 126/255
        b = 121/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func cantaloupePressed(_ sender: UIButton) {
        cantaloupeButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 255/255
        g = 212/255
        b = 121/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func bananaPressed(_ sender: UIButton) {
        bananaButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 255/255
        g = 252/255
        b = 121/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func honeydewPressed(_ sender: UIButton) {
        honeydewButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 212/255
        g = 251/255
        b = 121/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func skyPressed(_ sender: UIButton) {
        skyButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 118/255
        g = 214/255
        b = 255/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func orchidPressed(_ sender: UIButton) {
        orchidButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 122/255
        g = 129/255
        b = 255/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func lavenderPressed(_ sender: UIButton) {
        lavenderButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 215/255
        g = 131/255
        b = 255/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
    @IBAction func carnationPressed(_ sender: UIButton) {
        carnationButton.titleLabel?.font = UIFont(name: "Arial-MT", size: 20)
        r = 255/255
        g = 138/255
        b = 216/255
        color = UIColor.init(red: r, green: g, blue: b, alpha: 1)
        colorSelected = true
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destVC: FirstViewController = segue.destination as! FirstViewController
//        destVC.categoryTemp = self.category
//        destVC.colorTemp = self.color
//        destVC.r = self.r
//        destVC.g = self.g
//        destVC.b = self.b
//
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let barVC = segue.destination as? UITabBarController {
            barVC.viewControllers?.forEach {
                if let destVC = $0 as? FirstViewController{
                    destVC.categoryTemp = self.category
                    destVC.colorTemp = self.color
                    
                    destVC.rT = self.r
                    destVC.gT = self.g
                    destVC.bT = self.b
                    
                    destVC.colorSelected = self.colorSelected
                    
                }
            }
        }
    }
    
}
