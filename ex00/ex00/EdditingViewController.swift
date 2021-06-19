//
//  EdditingViewController.swift
//  ex00
//
//  Created by Shira Broderick on 6/17/21.
//  Copyright © 2021 Shira Broderick. All rights reserved.
//

import UIKit

class EdditingViewController: UIViewController {

	weak var delegate: ViewControllerDelegate?
	private var name = ""
	private var dayOfdeath = ""
//	private var desc = ""
	
	var textFieldDescription: UITextView!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

		dayOfdeath = setDate(date: Date())
		self.view.backgroundColor = .systemGray5
		self.navigationItem.title = "Add a Person"
		let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBarButtonAction))
		
		doneButton.tintColor = .black
		self.navigationItem.rightBarButtonItem = doneButton
		
		
		let textFieldName = UITextField()
		textFieldName.placeholder = "name"
		textFieldName.borderStyle = .roundedRect
		textFieldName.returnKeyType = .done
		textFieldName.autocorrectionType = .no
		textFieldName.autocapitalizationType = .words
		textFieldName.clearButtonMode = .whileEditing
		textFieldName.addTarget(self, action: #selector(nameEdditingEndAction), for: .editingDidEndOnExit)
		textFieldName.addTarget(self, action: #selector(nameEdditingChangedAction), for: .editingChanged)
		
		textFieldDescription = UITextView()
		textFieldDescription.autocorrectionType = .no
		
		let datePicker = UIDatePicker()
		datePicker.calendar = .autoupdatingCurrent
		datePicker.minimumDate = Date()
		datePicker.datePickerMode = .date
		datePicker.addTarget(self, action: #selector(datePickerEdditingChangedAction), for: .valueChanged)
		
		
		let vStack = UIStackView(arrangedSubviews: [textFieldName, datePicker, textFieldDescription])
		vStack.axis = .vertical
		vStack.distribution = .equalSpacing
		vStack.spacing = 4
		vStack.translatesAutoresizingMaskIntoConstraints = false
		vStack.isBaselineRelativeArrangement = true
		
		
		textFieldName.heightAnchor.constraint(equalToConstant: 40).isActive = true
		datePicker.heightAnchor.constraint(equalToConstant: 100).isActive = true
		datePicker.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 2).isActive = true
		
		self.view.addSubview(vStack)
	
		let offset = self.navigationController!.navigationBar.frame.maxY
		
		vStack.topAnchor.constraint(equalTo: view.topAnchor, constant: offset).isActive = true
		vStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
		vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		vStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true

    }

	
	private func setDate(date: Date) -> String {
		let local = Locale.current
		let components = date.description(with: local).components(separatedBy: CharacterSet(charactersIn: " ,"))
		return components[3] + " " + components[2] + " " + components[5] + " " + components[7] + " " + components[8]
	}

	@objc func nameEdditingChangedAction(sender: UITextField) {
		self.name = sender.text ?? ""
	}
	
	@objc func datePickerEdditingChangedAction(sender: UIDatePicker) {
		self.dayOfdeath = setDate(date: sender.date)
	}
	
	
	@objc func nameEdditingEndAction(sender: UITextField) {
		self.name = sender.text ?? ""
	}
	

	@objc func doneBarButtonAction(sender: UIBarButtonItem) {
		if textFieldDescription.text.isEmpty {
			textFieldDescription.text = " "
		}
		delegate?.addPersonFromOtherVC(person: Person(name: self.name, dayOfDeath: self.dayOfdeath, description: textFieldDescription.text))
		self.navigationController?.popViewController(animated: true)
	}
	
}
