//
//  ViewController.swift
//  SegmentedController
//
//  Created by Aplimovil on 19/05/17.
//  Copyright © 2017 Aplimovil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var container: UIView!
    var pantalla1:UIViewController!
    var pantalla2:UIViewController!
    var prev:UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pantalla1 = storyboard!.instantiateViewController(withIdentifier: "pantalla1")
        pantalla2 = storyboard!.instantiateViewController(withIdentifier: "pantalla2")
        prev = pantalla1
        addController(content: pantalla1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectContent(_ sender: UISegmentedControl) {
        let pos = sender.selectedSegmentIndex
        removeController(content: prev)
        if pos == 0{
            addController(content: pantalla1)
            prev = pantalla1
        }else{
            addController(content: pantalla2)
            prev = pantalla2
        }
    }
    
    func addController(content:UIViewController){
        addChildViewController(content)
        content.view.frame.size = container.frame.size
        content.view.frame.origin = CGPoint(x: 0, y: 0)
        container.addSubview(content.view)
        content.didMove(toParentViewController: self)
    }
    
    func removeController(content:UIViewController){
        content.willMove(toParentViewController: nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }
}

