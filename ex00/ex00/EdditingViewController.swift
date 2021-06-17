//
//  EdditingViewController.swift
//  ex00
//
//  Created by Shira Broderick on 6/17/21.
//  Copyright © 2021 Shira Broderick. All rights reserved.
//

import UIKit

class EdditingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		self.view.backgroundColor = .systemGray5
		self.navigationItem.title = "Add a Person"
		let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBarButtonAction))
		
		doneButton.tintColor = .black
		self.navigationItem.rightBarButtonItem = doneButton
		
		var height = (self.navigationController?.navigationBar.bounds.height)!
		
		height += (self.navigationController?.navigationBar.alignmentRectInsets.top)!
		
		print(height)
		
		let textFrameName = CGRect(x: 0, y: height + 44, width: self.view.bounds.width, height: 60)
		let textFieldName = UITextField(frame: textFrameName)
		textFieldName.placeholder = "name"
		textFieldName.borderStyle = .roundedRect
		textFieldName.returnKeyType = .done
		textFieldName.autocorrectionType = .no
		textFieldName.autocapitalizationType = .words
		textFieldName.clearButtonMode = .whileEditing
		textFieldName.addTarget(self, action: #selector(nameEdditingEndAction), for: .editingDidEndOnExit)
		
		
		let textFrameDescription = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200)
		let textFieldDescription = UITextField(frame: textFrameDescription)
		textFieldDescription.borderStyle = .line
		textFieldDescription.returnKeyType = .done
		textFieldDescription.autocorrectionType = .no
		textFieldDescription.clearButtonMode = .whileEditing
		textFieldDescription.addTarget(self, action: #selector(descriptionEdditingEndAction), for: .editingDidEndOnExit)
		
		
		let hStack = UIStackView(arrangedSubviews: [textFieldName, textFieldDescription])
		hStack.axis = .vertical
		hStack.distribution = .fillProportionally
		hStack.spacing = 4
//		hStack.alignment = .lastBaseline
		hStack.translatesAutoresizingMaskIntoConstraints = false
		
		self.view.addSubview(hStack)
		hStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		hStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		hStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
		hStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.75).isActive = true

    }

	@objc func nameEdditingEndAction(sender: UITextField) {
		sender.text = ""
		print("END name")
	}
	
	@objc func descriptionEdditingEndAction(sender: UITextField) {
		sender.text = ""
		print("END desc")
	}

	@objc func doneBarButtonAction(sender: UIBarButtonItem) {
		print("Done button")
	
		
		
		self.navigationController?.popViewController(animated: true)
	}
}
