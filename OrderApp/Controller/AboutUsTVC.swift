//
//  AboutUsTVC.swift
//  OrderApp
//
//  Created by HoangLuyen on 11/16/17.
//  Copyright © 2017 Luyen. All rights reserved.
//

import UIKit

class AboutUsTVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotification()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: .done, object: nil)
    }
    @objc func reloadData(){
        navigationController?.popToRootViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func closeSlideMenu(_ sender: UIButton) {
        NotificationCenter.default.post(name: .slideMenuKey, object: nil)
    }
    
    
}
