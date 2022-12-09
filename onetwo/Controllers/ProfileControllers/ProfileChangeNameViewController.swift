//
//  ProfileChangeNameViewController.swift
//  onetwo
//
//  Created by Alex Provarenko on 17.11.2022.
//

import UIKit

class ProfileChangeNameViewController: UIViewController {
    
    private let enterNameTextFielad: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.autocapitalizationType = UITextAutocapitalizationType.none
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.textColor = UIColor.black
        tf.keyboardAppearance = .light
        tf.attributedPlaceholder = NSAttributedString(string: "Enter your name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        return tf
    }()
    
    private let underLineNameTextField: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let underLineNavigationBar: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Your name"
        view.backgroundColor = .white
        view.addSubview(enterNameTextFielad)
        view.addSubview(underLineNavigationBar)
        view.addSubview(underLineNameTextField)
        
        
        
        configureNavigationBar()
        configureConstraints()
        
    }
    
    //MARK: - Configure navigationBar
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "cancel", style: .plain, target: self, action: #selector(cancelButtonTap))
    
        navigationItem.leftBarButtonItem?.tintColor = .systemRed
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "save", style: .plain, target: self, action: #selector(saveButtonTap))
        navigationItem.rightBarButtonItem?.tintColor = .lightGray
    }
    
    //MARK: - Button target
    
    @objc func cancelButtonTap() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func saveButtonTap() {
        print("save")
    }
    
    //MARK: - Configure constraints
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            underLineNavigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            underLineNavigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            underLineNavigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            underLineNavigationBar.heightAnchor.constraint(equalToConstant: 1),
            
            enterNameTextFielad.topAnchor.constraint(equalTo: underLineNavigationBar.bottomAnchor, constant: 20),
            enterNameTextFielad.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            enterNameTextFielad.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            underLineNameTextField.topAnchor.constraint(equalTo: enterNameTextFielad.bottomAnchor, constant: 5),
            underLineNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            underLineNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            underLineNameTextField.heightAnchor.constraint(equalToConstant: 1),
            
        ])
    }
}
