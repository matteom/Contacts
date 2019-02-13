//
//  UIStoryboardSegue.swift
//  Contacts
//
//  Created by Matteo Manferdini on 02/02/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import UIKit

extension UIStoryboardSegue {
	func forward(_ contact: Contact?, to destination: UIViewController) {
		if let navigationController = destination as? UINavigationController {
			let root = navigationController.viewControllers[0]
			forward(contact, to: root)
		}
		if let detailViewController = destination as? DetailViewController {
			detailViewController.contact = contact
		}
		if let editContactViewController = destination as? EditContactViewController {
			editContactViewController.contact = contact
		}
	}
}
