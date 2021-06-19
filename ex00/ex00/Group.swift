//
//  Group.swift
//  ex00
//
//  Created by Shira Broderick on 6/17/21.
//  Copyright © 2021 Shira Broderick. All rights reserved.
//

import Foundation

class Group {
	
	private var persons: [Person] = []
	var count = 0
	
	init() {
		persons.append(Person(name: "Donald Pmurt", dayOfDeath: "01", description: "Some text"))
		persons.append(Person(name: "Joffrey Baratheon", dayOfDeath: "02", description: "Some text"))
		persons.append(Person(name: "Ben Colo", dayOfDeath: "03", description: "Some text"))
		persons.append(Person(name: "Test Person", dayOfDeath: "04", description: "Test text"))
		count = 4
	}
	
	func addNewPerson(_ person: Person) {
		persons.append(person)
		count += 1
	}
	
	func removePersonAtIndex(_ index: Int) {
		persons.remove(at: index)
		count -= 1
	}
	
	func getPersonAtIndex(_ index: Int) -> Person? {
		return persons[index]
	}
	
}
