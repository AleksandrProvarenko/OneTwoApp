//
//  LoginPopUp.swift
//  onetwo
//
//  Created by Alex Provarenko on 12.12.2022.
//

import UIKit

class LoginPopUpViewController: UIViewController {

    private let popUpView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let backgroundImagePopUpView: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "Login")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let goToRegistrationImageView: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "Go to registration")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "To add your own video and use the application to the fullest, you need to register in profile"
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ok", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(popUpView)
        view.addSubview(backgroundImagePopUpView)
        view.addSubview(goToRegistrationImageView)
        view.addSubview(descriptionLabel)
        view.addSubview(loginButton)
    
        battonTarget()
        constraints()
        configureView()
    }
    
    //MARK: - Configuration View
    
    func configureView() {
        self.view.backgroundColor = .clear
        self.view.alpha = 0
        self.popUpView.alpha = 0
    }
    
    //MARK: - Button Target
    
    private func battonTarget() {
        loginButton.addTarget(self, action: #selector(shignUP), for: .touchUpInside)
    }
    
    @objc func shignUP() {
        hidePopUp()
    }
    
    //MARK: - Сalling this function in HomeViewContoller in viewDidLoad
    
    func appear(sender: UIViewController) {
        sender.modalPresentationStyle = .fullScreen
        sender.present(self, animated: false) {
        self.showPopUp()
        }
    }
    
    //MARK: - Show PopUp

   private func showPopUp() {
       UIView.animate(withDuration: 1, delay: 0) {
           self.view.alpha = 1
           self.popUpView.alpha = 1
       }
    }
    
    //MARK: - Hide PopUp
    
    func hidePopUp() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut) {
            self.view.alpha = 0
            self.popUpView.alpha = 0
        } completion: { _ in
            self.dismiss(animated: true)
            self.removeFromParent()
        }

    }
    
    //MARK: - Configure Constraints

  public func constraints() {
        NSLayoutConstraint.activate([
            popUpView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popUpView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            popUpView.widthAnchor.constraint(equalToConstant: 350),
            popUpView.heightAnchor.constraint(equalToConstant: 300),
            
            backgroundImagePopUpView.topAnchor.constraint(equalTo: popUpView.topAnchor),
            backgroundImagePopUpView.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor),
            backgroundImagePopUpView.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor),
            backgroundImagePopUpView.bottomAnchor.constraint(equalTo: popUpView.bottomAnchor),
            
            goToRegistrationImageView.topAnchor.constraint(equalTo: backgroundImagePopUpView.topAnchor, constant: 15),
            goToRegistrationImageView.centerXAnchor.constraint(equalTo: backgroundImagePopUpView.centerXAnchor),
            goToRegistrationImageView.widthAnchor.constraint(equalToConstant: 250),
            goToRegistrationImageView.heightAnchor.constraint(equalToConstant: 70),
            
            descriptionLabel.topAnchor.constraint(equalTo: goToRegistrationImageView.bottomAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: backgroundImagePopUpView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: backgroundImagePopUpView.trailingAnchor, constant: -20),
            
            loginButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            loginButton.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 250),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        
    }
    
}
