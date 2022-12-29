//
//  CreatePasswordViewController.swift
//  onetwo
//
//  Created by Alex Provarenko on 19.09.2022.
//

import UIKit

class CreatePasswordViewController: UIViewController {

    private let createPasswordBackgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Create password")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
        
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Create a password"
        label.font = UIFont(name: "Avenir", size: 40)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextFielad: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.textColor = UIColor.white
        tf.isSecureTextEntry = true
        tf.keyboardAppearance = .light
        tf.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        return tf
    }()
    
    private let underLinePasswordTextField: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nextViewControllerButton: UIButton = {
       let button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseForegroundColor = .black
        button.configuration?.baseBackgroundColor = .white
        button.configuration?.image = UIImage(systemName: "arrow.right")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(createPasswordBackgroundImage)
        createPasswordBackgroundImage.frame = view.bounds
        
        view.addSubview(titleLabel)
        view.addSubview(passwordTextFielad)
        view.addSubview(underLinePasswordTextField)
        view.addSubview(nextViewControllerButton)
        
        hideKeyboardReconiser()
        configureConstraints()
        buttonTarget()
    }
    
    //MARK: - Button Target
    
    private func buttonTarget() {
        nextViewControllerButton.addTarget(self,
                                           action: #selector(goToMainTabBarContriller),
                                           for: .touchUpInside)
    }
    
    @objc func goToMainTabBarContriller() {
        let controller = MainTabBarViewController()
        navigationController?.setViewControllers([controller], animated: true)
    }
    
    //MARK: - HideKeyboardReconizer
    
    private func hideKeyboardReconiser() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: - ConfigureConstraints
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            passwordTextFielad.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 70),
            passwordTextFielad.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextFielad.widthAnchor.constraint(equalToConstant: 300),
            passwordTextFielad.heightAnchor.constraint(equalToConstant: 40),
            
            underLinePasswordTextField.topAnchor.constraint(equalTo: passwordTextFielad.bottomAnchor, constant: 2),
            underLinePasswordTextField.widthAnchor.constraint(equalToConstant: 300),
            underLinePasswordTextField.heightAnchor.constraint(equalToConstant: 1),
            underLinePasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nextViewControllerButton.topAnchor.constraint(equalTo: underLinePasswordTextField.bottomAnchor, constant: 40),
            nextViewControllerButton.trailingAnchor.constraint(equalTo:underLinePasswordTextField.trailingAnchor),
            nextViewControllerButton.widthAnchor.constraint(equalToConstant: 70),
            nextViewControllerButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

}
