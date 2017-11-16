//
//  ContainerVC.swift
//  OrderApp
//
//  Created by HoangLuyen on 11/16/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {
    @IBOutlet weak var slideMenu: UIView!
    @IBOutlet weak var closeSlideMenu: UIButton!
    @IBOutlet weak var leadingContraint: NSLayoutConstraint!
    
    var isSlideMenuOpen: Bool = true {
        didSet {
            self.leadingContraint.constant = self.isSlideMenuOpen ? 0 : -self.slideMenu.frame.width
            self.closeSlideMenu.isEnabled = self.isSlideMenuOpen ? true : false
            UIView.animate(withDuration: 0.35, animations: {
                self.view.layoutIfNeeded()
            } , completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        receiveOpenSlide()
        isSlideMenuOpen = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func receiveOpenSlide() {
        NotificationCenter.default.addObserver(self, selector: #selector(closeSlideMenu(_:)), name: NotificationKey.slideMenuKey, object: nil)
    }
    
    @IBAction func closeSlideMenu(_ sender: UIButton) {
        isSlideMenuOpen = !isSlideMenuOpen
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
