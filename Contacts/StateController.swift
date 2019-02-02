//
//  StateController.swift
//  Contacts
//
//  Created by Matteo Manferdini on 29/01/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import Foundation

class StateController {
	private(set) var contacts: [Contact] = [
		Contact(photo: #imageLiteral(resourceName: "Madison"), name: "Madison Thompson", position: "Sales, Gale Foods", email: "madison@galefoods.com", phone: "4-(968) 705-1370"),
		Contact(photo: #imageLiteral(resourceName: "Tyler"), name: "Tyler Porter", position: "Software developer, Prophecy", email: "tyles@propehcy.com", phone: "2-(513) 832-7517"),
		Contact(photo: #imageLiteral(resourceName: "Katherine"), name: "Katherine Price", position: "Marketing, Golden Roads", email: "katherine@goldenroads.com", phone: "1-(722) 844-1495"),
		Contact(photo: #imageLiteral(resourceName: "Gary"), name: "Gary Edwards", position: "Web Developer, Bluewares", email: "gary@bluewares.com", phone: "9-(687) 559-3525"),
		Contact(photo: #imageLiteral(resourceName: "Rebecca"), name: "Rebecca Rogers", position: "HR, Globaviations", email: "rebecca@globaviations.com", phone: "3-(710) 249-5471")
	]
	
	var favorites: [Contact] = []
	
	func update(_ contact: Contact) {
		for (index, old) in contacts.enumerated() {
			if old.name == contact.name {
				contacts[index] = contact
				break
			}
		}
	}
}
