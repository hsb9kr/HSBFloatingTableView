//
//  ViewController.swift
//  HSBFloatingTableView
//
//  Created by Red on 10/12/2018.
//  Copyright (c) 2018 Red. All rights reserved.
//

import UIKit
import HSBFloatingTableView

class ViewController: UIViewController {

	let tableView = HSBFloatingTableView()
	@IBOutlet var aView: UIView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		initialize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	fileprivate func initialize() {
		initTableView()
	}
	
	fileprivate func initTableView() {
		tableView.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: TableViewCell.reuseIdentifier)
		tableView.dataSource = self
		tableView.embedView = aView
		tableView.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
		tableView.position = .bottom
		tableView.isMargin = true
		tableView.margin = 50
	}

	@IBAction func didTouchUpInsideButton(_ sender: Any) {
		
		tableView.isHidden = !tableView.isHidden
	}
}

extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath)
		
		return cell
	}
	

}
