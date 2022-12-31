//
//  ViewController.swift
//  onetwo
//
//  Created by Alex Provarenko on 19.09.2022.
//

import UIKit

class LoginViewController: UIViewController {
   
    private let loginBackgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Login")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private let logoImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "Logo.png")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
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
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign in", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let atributedTitle = NSMutableAttributedString(string: "No account yet? ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15),NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        atributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .semibold), NSAttributedString.Key.foregroundColor: UIColor.systemBlue]))
        button.setAttributedTitle(atributedTitle, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let loginWidthLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign in with"
        label.font = UIFont(name: "Avenir", size: 15)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let leftLineLoginWidth: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let rightLineLoginWidth: UIView = {
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
        view.addSubview(loginBackgroundImage)
        loginBackgroundImage.frame = view.bounds
        view.addSubview(logoImage)
        view.addSubview(emailTextFielad)
        view.addSubview(underLineEmailTextField)
        view.addSubview(passwordTextFielad)
        view.addSubview(underLinePasswordTextField)
        view.addSubview(loginButton)
        view.addSubview(dontHaveAccountButton)
        view.addSubview(loginWidthLabel)
        view.addSubview(leftLineLoginWidth)
        view.addSubview(rightLineLoginWidth)
        view.addSubview(googleButton)
        
        hideKeyboardReconiser()
        configureNavigatonBar()
        configureButtons()
        configureConstraints()
    }
    
    //MARK: - ConfigeureNavigayionBar
    
    private func configureNavigatonBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .default
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
        dontHaveAccountButton.addTarget(self, action: #selector(signUpVC), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(mainTapBarController), for: .touchUpInside)
    }
    
    @objc func signUpVC() {
        let controller = SignUpViewController()
        navigationController?.setViewControllers([controller], animated: true)
        
    }
    
    @objc func mainTapBarController() {
        let loginRequest = LogInUserRequest(email: self.emailTextFielad.text ?? "",
                                            password: self.passwordTextFielad.text ?? "")
        
        // Email check
        if !Validation.isValidemail(for: loginRequest.email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        // Password check
        if !Validation.isValidPswword(for: loginRequest.password) {
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        AuthService.shared.logInUser(with: loginRequest) { error in
            if let error = error {
                AlertManager.showSignInErrorAlert(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                sceneDelegate.checkAuthentification()
            }
        }
    }
    
    //MARK: - ConfigureConstraints
        
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 180),
            
            emailTextFielad.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 70),
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
            
            loginButton.topAnchor.constraint(equalTo: underLinePasswordTextField.bottomAnchor, constant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 300),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            dontHaveAccountButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 15),
            dontHaveAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginWidthLabel.topAnchor.constraint(equalTo: dontHaveAccountButton.bottomAnchor, constant: 40),
            loginWidthLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            leftLineLoginWidth.trailingAnchor.constraint(equalTo: loginWidthLabel.leadingAnchor, constant: -5),
            leftLineLoginWidth.centerYAnchor.constraint(equalTo: loginWidthLabel.centerYAnchor),
            leftLineLoginWidth.widthAnchor.constraint(equalToConstant: 70),
            leftLineLoginWidth.heightAnchor.constraint(equalToConstant: 1),

            rightLineLoginWidth.leadingAnchor.constraint(equalTo: loginWidthLabel.trailingAnchor, constant: 5),
            rightLineLoginWidth.centerYAnchor.constraint(equalTo: loginWidthLabel.centerYAnchor),
            rightLineLoginWidth.widthAnchor.constraint(equalToConstant: 70),
            rightLineLoginWidth.heightAnchor.constraint(equalToConstant: 1),
            
            googleButton.topAnchor.constraint(equalTo: loginWidthLabel.bottomAnchor, constant: 25),
            googleButton.centerXAnchor.constraint(equalTo: loginWidthLabel.centerXAnchor),
            googleButton.widthAnchor.constraint(equalToConstant: 300),
            googleButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
}

