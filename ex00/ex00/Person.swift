//
//  Person.swift
//  ex00
//
//  Created by Shira Broderick on 6/17/21.
//  Copyright © 2021 Shira Broderick. All rights reserved.
//

import UIKit

class Person {
	private let name: String
	private let dayOfDeath: String
	private let description: String
	
	init(name: String, dayOfDeath: String, description: String) {
		self.name = name
		self.dayOfDeath = dayOfDeath
		self.description = description
	}
	
	func getName() -> String {
		return name
	}
	
	func getDayOfDeath() -> String {
		return dayOfDeath
	}
	
	func getDescription() -> String {
		description
	}
}


