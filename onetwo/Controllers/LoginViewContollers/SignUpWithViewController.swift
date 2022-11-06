//
//  SignUpWithViewController.swift
//  onetwo
//
//  Created by Alex Provarenko on 19.09.2022.
//

import UIKit

class SignUpWithViewController: UIViewController {

    private let signUpWithBackgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Sign Up with")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
        
    }()
    
    private let segmentControl: UISegmentedControl = {
       let sc = UISegmentedControl(items: ["phone", "email"])
        sc.backgroundColor = .systemFill
        sc.tintColor = UIColor(white: 1, alpha: 0.80)
        sc.backgroundColor = .systemBackground
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.selectedSegmentIndex = 0
        return sc
        
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
    
    private let emailTextFielad: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.textColor = UIColor.white
        tf.keyboardAppearance = .light
        tf.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        return tf
        
    }()
    
    private let underLineEmailTextField: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()

    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(signUpWithBackgroundImage)
        signUpWithBackgroundImage.frame = view.bounds
        
        view.addSubview(segmentControl)
        view.addSubview(emailTextFielad)
        view.addSubview(underLineEmailTextField)
        view.addSubview(nextViewControllerButton)
        
        hideKeyboardReconiser()
        configureButton()
        configureConstraints()
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
    
    //MARK: - ButtonTarget
    
    private func configureButton() {
        nextViewControllerButton.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
    }
    
    @objc func nextVC() {
        let controller = CreatePasswordViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    //MARK: - ConfigureConstraints
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            segmentControl.widthAnchor.constraint(equalToConstant: 300),
            segmentControl.heightAnchor.constraint(equalToConstant: 35),
            segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailTextFielad.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 70),
            emailTextFielad.widthAnchor.constraint(equalToConstant: 300),
            emailTextFielad.heightAnchor.constraint(equalToConstant: 40),
            emailTextFielad.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            underLineEmailTextField.topAnchor.constraint(equalTo: emailTextFielad.bottomAnchor, constant: 2),
            underLineEmailTextField.widthAnchor.constraint(equalToConstant: 300),
            underLineEmailTextField.heightAnchor.constraint(equalToConstant: 1),
            underLineEmailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nextViewControllerButton.topAnchor.constraint(equalTo: underLineEmailTextField.bottomAnchor, constant: 40),
            nextViewControllerButton.trailingAnchor.constraint(equalTo: underLineEmailTextField.trailingAnchor),
            nextViewControllerButton.widthAnchor.constraint(equalToConstant: 70),
            nextViewControllerButton.heightAnchor.constraint(equalToConstant: 30)
            
        ])
        
    }
    
}
