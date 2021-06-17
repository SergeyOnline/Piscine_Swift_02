//
//  ViewController.swift
//  ex00
//
//  Created by Shira Broderick on 6/16/21.
//  Copyright © 2021 Shira Broderick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
	
	

	var tableVeiw: UITableView!

	let group = Group()
	
	let identifire = "note"
	
    override func viewDidLoad() {
        super.viewDidLoad()

		let frame = self.view.bounds
		tableVeiw = UITableView(frame: frame, style: .grouped)
		
		
		tableVeiw.autoresizingMask = .init(arrayLiteral: .flexibleWidth, .flexibleHeight)
		tableVeiw.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
		tableVeiw.dataSource = self
		tableVeiw.delegate = self
		self.view.addSubview(tableVeiw)
	
		self.navigationItem.title = "Death Note"
		let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBarButtonAction))
		
		addButton.tintColor = .black
		self.navigationItem.rightBarButtonItem = addButton

    }
	
	//MARK: - Actions
	
	@objc func addBarButtonAction(sender: UIBarButtonItem) {
		print("Add button")
		let edditingVC = EdditingViewController()
		self.navigationController?.pushViewController(edditingVC, animated: true)
//		self.addChild(edditingVC)
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return group.count
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
		
		if cell == nil {
			cell = UITableViewCell(style: .value1, reuseIdentifier: identifire)
		}
		
		
		let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
		nameLabel.text = group.getPersonAtIndex(indexPath.row)?.getName()
		nameLabel.autoresizingMask = .flexibleRightMargin
		
		let dateLabel = UILabel(frame: CGRect(x: 100, y: 0, width: 100, height: 20))
		dateLabel.text = group.getPersonAtIndex(indexPath.row)?.getDayOfDeath()
		dateLabel.autoresizingMask = .flexibleLeftMargin
		
		let descriptionLabel = UILabel(frame: CGRect(x: 0, y: 22, width: 300, height: 20))
		descriptionLabel.text = group.getPersonAtIndex(indexPath.row)?.getDescription()
		
		cell!.addSubview(nameLabel)
		cell!.addSubview(dateLabel)
		cell!.addSubview(descriptionLabel)
		return cell!
	}

}
