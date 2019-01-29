//
//  DetailViewController.swift
//  Contacts
//
//  Created by Matteo Manferdini on 27/01/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
	@IBOutlet var imageView: UIImageView?
	@IBOutlet var nameLabel: UILabel?
	@IBOutlet var positionLabel: UILabel?
	@IBOutlet var emailButton: UIButton?
	@IBOutlet var phoneButton: UIButton?
	
	var contact: Contact?
	
	override func viewDidLoad() {
		super.viewDidLoad()
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
}
