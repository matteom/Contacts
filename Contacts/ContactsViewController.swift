//
//  ContactsViewController.swift
//  Contacts
//
//  Created by Matteo Manferdini on 27/01/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import UIKit

class ContactsViewController: UITableViewController {
	var stateController: StateController?
	var favoritesOnly = false
	
	var contacts: [Contact] {
		if favoritesOnly {
			return stateController?.favorites ?? []
		}
		return stateController?.contacts ?? []
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		tableView.reloadData()
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return contacts.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let contact = contacts[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactCell
		cell.photoImageView?.image = contact.photo
		cell.nameLabel?.text = contact.name
		cell.positionLabel?.text = contact.position
		return cell
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let detailViewController = segue.destination as? DetailViewController,
			let index = tableView.indexPathForSelectedRow?.row
			else {
				return
		}
		detailViewController.contact = contacts[index]
		detailViewController.delegate = self
	}
	
	override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
		let favoriteAction = UITableViewRowAction(style: .default, title: "Favorite") { [weak self](_, indexPath) in
			guard let favorite = self?.stateController?.contacts[indexPath.row] else {
				return
			}
			self?.stateController?.favorites.append(favorite)
		}
		return [favoriteAction]
	}
}

extension ContactsViewController: DetailViewControllerDelegate {
	func update(_ contact: Contact) {
		stateController?.update(contact)
	}
}

class ContactCell: UITableViewCell {
	@IBOutlet var photoImageView: UIImageView?
	@IBOutlet var nameLabel: UILabel?
	@IBOutlet var positionLabel: UILabel?
}
