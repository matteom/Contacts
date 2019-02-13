//
//  EditContactViewController.swift
//  Contacts
//
//  Created by Matteo Manferdini on 27/01/2019.
//  Copyright © 2019 Matteo Manferdini. All rights reserved.
//

import UIKit

class EditContactViewController: UITableViewController {
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var positionTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var phoneTextField: UITextField!
	
	var contact: Contact?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		imageView.image = contact?.photo
		nameTextField.text = contact?.name
		positionTextField.text = contact?.position
		emailTextField.text = contact?.email
		phoneTextField.text = contact?.phone
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let photo = imageView.image,
		let name = nameTextField.text,
		let position = positionTextField.text,
		let email = emailTextField.text,
		let phone = phoneTextField.text {
			contact = Contact.init(photo: photo, name: name, position: position, email: email, phone: phone)
		}
	}
}

