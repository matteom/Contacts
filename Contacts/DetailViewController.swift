//
//  DetailViewController.swift
//  Contacts
//
//  Created by Matteo Manferdini on 27/01/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
	func update(_ contact: Contact)
}

class DetailViewController: UITableViewController {
	@IBOutlet var imageView: UIImageView?
	@IBOutlet var nameLabel: UILabel?
	@IBOutlet var positionLabel: UILabel?
	@IBOutlet var emailButton: UIButton?
	@IBOutlet var phoneButton: UIButton?
	
	var contact: Contact?
	weak var delegate: DetailViewControllerDelegate?
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		imageView?.image = contact?.photo
		nameLabel?.text = contact?.name
		positionLabel?.text = contact?.position
		emailButton?.setTitle(contact?.email, for: .normal)
		phoneButton?.setTitle(contact?.phone, for: .normal)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let navigationController = segue.destination as? UINavigationController,
			let editContactViewController = navigationController.viewControllers.first as? EditContactViewController {
			editContactViewController.contact = contact
		}
	}
	
//	@IBAction func login(_ sender: Any) {
//		guard let contact = contact else {
//			return
//		}
//		let editViewController = EditContactViewController(contact: contact)
//		let navigationViewController = UINavigationController(rootViewController: editViewController)
//		show(navigationViewController, sender: nil)
//	}
	
	@IBAction func cancel(_ unwindSegue: UIStoryboardSegue) {}
	
	@IBAction func save(_ unwindSegue: UIStoryboardSegue) {
		if let editViewController = unwindSegue.source as? EditContactViewController {
			contact = editViewController.contact
			if let contact = contact {
				delegate?.update(contact)
			}
		}
	}
}
