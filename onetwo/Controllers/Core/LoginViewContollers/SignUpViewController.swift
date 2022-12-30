//
//  SignUpViewController.swift
//  onetwo
//
//  Created by Alex Provarenko on 20.09.2022.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private let signUpBackgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Sign Up")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Create an account"
        label.font = UIFont(name: "Avenir", size: 40)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    private let confirmPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.font = UIFont.systemFont(ofSize: 16)
        tf.textColor = UIColor.white
        tf.attributedPlaceholder = NSAttributedString(string: "confirm password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        return tf
    }()
    
    private let underLineConfirmPassword: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let signUpWidthLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up with"
        label.font = UIFont(name: "Avenir", size: 15)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let leftLineSignUpWidth: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let rightLineSignUpWidth: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let googleButton: UIButton = {
       let button = UIButton()
        button.configuration = .filled()
        button.configuration?.baseForegroundColor = .white
        button.configuration?.baseBackgroundColor = .systemFill
        button.configuration?.image = UIImage(named: "google")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()

    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(signUpBackgroundImage)
        signUpBackgroundImage.frame = view.bounds
        
        view.addSubview(titleLabel)
        view.addSubview(emailTextFielad)
        view.addSubview(passwordTextFielad)
        view.addSubview(confirmPasswordTextField)
        view.addSubview(underLineEmailTextField)
        view.addSubview(underLinePasswordTextField)
        view.addSubview(underLineConfirmPassword)
        view.addSubview(signUpButton)
        view.addSubview(signUpWidthLabel)
        view.addSubview(leftLineSignUpWidth)
        view.addSubview(rightLineSignUpWidth)
        view.addSubview(googleButton)
        
        hideKeyboardReconiser()
        configureButtons() 
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
    
    private func configureButtons() {
        googleButton.addTarget(self, action: #selector(nexController), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(goToMainTabBarVC), for: .touchUpInside)
    }
    
    @objc func goToMainTabBarVC() {
        let registerUserRequest = RegisterUserRequest(email: self.emailTextFielad.text ?? "",
                                                      password: self.passwordTextFielad.text ?? "",
                                                      confirmPassword: self.confirmPasswordTextField.text ?? "")
        
        // Email check
        if !Validation.isValidemail(for: registerUserRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        // Password check
        if !Validation.isValidPswword(for: registerUserRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        //ConfirmPassword
        if !Validation.isValidConfirmPswword(for: registerUserRequest.confirmPassword) {
            AlertManager.showConfirmPasswordAlert(on: self)
            return
        }
        
        AuthService.shared.registerUser(with: registerUserRequest) { [weak self]
            wasRegistered, error in
            guard let self = self else { return }
            if let error = error {
                AlertManager.showRegistrationError(on: self, with: error)
            }
            
            if wasRegistered {
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.checkAuthentification()
                }
            } else {
                AlertManager.showRegistrationErrorAlert(on: self)
            }
        }
    }
    
    @objc func nexController() {
        let controller = SignUpWithViewController()
        navigationController?.setViewControllers([controller], animated: true)
    }
        
    //MARK: - ConfigureConstraints
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailTextFielad.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 80),
            emailTextFielad.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextFielad.widthAnchor.constraint(equalToConstant: 300),
            emailTextFielad.heightAnchor.constraint(equalToConstant: 40),
            
            underLineEmailTextField.topAnchor.constraint(equalTo: emailTextFielad.bottomAnchor, constant: 2),
            underLineEmailTextField.widthAnchor.constraint(equalToConstant: 300),
            underLineEmailTextField.heightAnchor.constraint(equalToConstant: 1),
            underLineEmailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            passwordTextFielad.topAnchor.constraint(equalTo: underLineEmailTextField.bottomAnchor, constant: 20),
            passwordTextFielad.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextFielad.widthAnchor.constraint(equalToConstant: 300),
            passwordTextFielad.heightAnchor.constraint(equalToConstant: 40),
            
            underLinePasswordTextField.topAnchor.constraint(equalTo: passwordTextFielad.bottomAnchor, constant: 2),
            underLinePasswordTextField.widthAnchor.constraint(equalToConstant: 300),
            underLinePasswordTextField.heightAnchor.constraint(equalToConstant: 1),
            underLinePasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: underLinePasswordTextField.bottomAnchor, constant: 20),
            confirmPasswordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmPasswordTextField.widthAnchor.constraint(equalToConstant: 300),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 40),

            underLineConfirmPassword.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 2),
            underLineConfirmPassword.widthAnchor.constraint(equalToConstant: 300),
            underLineConfirmPassword.heightAnchor.constraint(equalToConstant: 1),
            underLineConfirmPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            signUpButton.topAnchor.constraint(equalTo: underLineConfirmPassword.bottomAnchor, constant: 30),
            signUpButton.widthAnchor.constraint(equalToConstant: 300),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            signUpWidthLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 50),
            signUpWidthLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            leftLineSignUpWidth.trailingAnchor.constraint(equalTo: signUpWidthLabel.leadingAnchor, constant: -5),
            leftLineSignUpWidth.centerYAnchor.constraint(equalTo: signUpWidthLabel.centerYAnchor),
            leftLineSignUpWidth.widthAnchor.constraint(equalToConstant: 70),
            leftLineSignUpWidth.heightAnchor.constraint(equalToConstant: 1),
        
            rightLineSignUpWidth.leadingAnchor.constraint(equalTo: signUpWidthLabel.trailingAnchor, constant: 5),
            rightLineSignUpWidth.centerYAnchor.constraint(equalTo: signUpWidthLabel.centerYAnchor),
            rightLineSignUpWidth.widthAnchor.constraint(equalToConstant: 70),
            rightLineSignUpWidth.heightAnchor.constraint(equalToConstant: 1),
           
            googleButton.topAnchor.constraint(equalTo: signUpWidthLabel.bottomAnchor, constant: 25),
            googleButton.centerXAnchor.constraint(equalTo: signUpWidthLabel.centerXAnchor),
            googleButton.widthAnchor.constraint(equalToConstant: 300),
            googleButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
