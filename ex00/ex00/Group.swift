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
		persons.append(Person(name: "Donald Pmurt", dayOfDeath: "10 June 1996 5:32:00 AM", description: "Got in an accident"))
		persons.append(Person(name: "Joffrey Baratheon", dayOfDeath: "16 October 1990 8:22:12 PM", description: "Burned out at work"))
		persons.append(Person(name: "Ben Colo", dayOfDeath: "26 March 2000 11:59:59 PM", description: "Killed by a neighbor"))
		count = 3
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
