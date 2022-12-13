//
//  LoginPopUp.swift
//  onetwo
//
//  Created by Alex Provarenko on 12.12.2022.
//

import UIKit

class LoginPopUp: UIViewController {
  
    private let backgroundView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let button: UIButton = {
       let btn = UIButton()
        btn.setTitle("Dismis", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = .green
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let popUpView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundView)
        view.addSubview(button)
        view.addSubview(popUpView)
        popUpView.addSubview(button)
        
        constraints()
        configureView()
    }
    
    func configureView() {
        self.view.backgroundColor = .clear
        self.modalPresentationStyle = .fullScreen
        self.backgroundView.backgroundColor = .black.withAlphaComponent(0.6)
        self.backgroundView.alpha = 0
        self.popUpView.alpha = 0
    }
    
    func apper(sender: UIViewController) {
        sender.present(self, animated: false) {
        self.show()
        }
    }
    
   private func show() {
       UIView.animate(withDuration: 1, delay: 0) {
           self.backgroundView.alpha = 1
           self.popUpView.alpha = 1
       }
    }
    
    
    
//    func hide() {
//        UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseOut) {
//            self.backgroundView.alpha = 0
//            self.popUpView.alpha = 0
//        } completion: { _ in
//            
//            self.dismiss(animated: false)
//            self.removeFromParent()
//        }
//
//    }

  public func constraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            popUpView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            popUpView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            popUpView.widthAnchor.constraint(equalToConstant: 400),
            popUpView.heightAnchor.constraint(equalToConstant: 300),
            
            button.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: popUpView.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
}
