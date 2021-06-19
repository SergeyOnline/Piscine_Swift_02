//
//  ViewController.swift
//  ex00
//
//  Created by Shira Broderick on 6/16/21.
//  Copyright © 2021 Shira Broderick. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ViewControllerDelegate {
	
	var tableVeiw: UITableView!

	let group = Group()
	
	var identifire = "cell"
	
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

		tableVeiw.reloadData()
    }
	
	func addPersonFromOtherVC(person: Person) {
		
		if !person.getName().isEmpty && !person.getDayOfDeath().isEmpty {
			group.addNewPerson(person)
			tableVeiw.reloadData()
		}
	}
	
	//MARK: - Actions
	
	@objc func addBarButtonAction(sender: UIBarButtonItem) {
		print("Add button")
		let edditingVC = EdditingViewController()
		edditingVC.delegate = self
		self.navigationController?.pushViewController(edditingVC, animated: true)
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
		
		
		
		let cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
		
		for value in cell!.subviews {
			if value.isKind(of: UIStackView.self) {
				value.removeFromSuperview()
				break
			}
		}
		
//		if cell == nil {
//			cell = UITableViewCell()
//			identifire = cell!.reuseIdentifier!
//			cell = UITableViewCell(style: .value2, reuseIdentifier: identifire)
//		}
		
		
		let nameLabel = UILabel()
		nameLabel.text = group.getPersonAtIndex(indexPath.row)?.getName()
		nameLabel.translatesAutoresizingMaskIntoConstraints = false

		
		let dateLabel = UILabel()
		dateLabel.text = group.getPersonAtIndex(indexPath.row)?.getDayOfDeath()
		
		let descriptionLabel = UILabel()
		descriptionLabel.text = group.getPersonAtIndex(indexPath.row)?.getDescription()
		descriptionLabel.font = UIFont(name: descriptionLabel.font.familyName, size: 15)
		
		
		let hStack = UIStackView(arrangedSubviews: [nameLabel, dateLabel])
		hStack.axis = .horizontal
		hStack.distribution = .fillEqually
		hStack.spacing = 2
		hStack.translatesAutoresizingMaskIntoConstraints = false
		
		
		let vStack = UIStackView(arrangedSubviews: [hStack, descriptionLabel])
		vStack.axis = .vertical
		vStack.distribution = .equalSpacing
		vStack.spacing = 2
		vStack.translatesAutoresizingMaskIntoConstraints = false
		
		cell!.addSubview(vStack)
		
		vStack.heightAnchor.constraint(equalTo: cell!.heightAnchor, multiplier: 0.95).isActive = true
		vStack.leftAnchor.constraint(equalTo: cell!.leftAnchor, constant: 30).isActive = true
		vStack.rightAnchor.constraint(equalTo: cell!.rightAnchor, constant: -20).isActive = true
		
		return cell!
	}

}


protocol ViewControllerDelegate: class {
	func addPersonFromOtherVC(person: Person)
}

