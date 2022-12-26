//
//  HomeCommentsSheetPresentController.swift
//  onetwo
//
//  Created by Alex Provarenko on 24.10.2022.
//

import UIKit

class HomeCommentsPresentationControllerTableView: UIViewController {
    
    private let mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(HomeCommentsPresentationControllerTableViewCell.self, forCellReuseIdentifier: HomeCommentsPresentationControllerTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        return tableView
    }()
    
    private let backgroundViewForTextView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let replyCommentsTextView: UITextView = {
        let tv = UITextView()
        tv.layer.cornerRadius = 20
        tv.contentInset = UIEdgeInsets(top: 2, left: 5, bottom: 2, right: 5)
        tv.backgroundColor = .secondarySystemFill
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.font = UIFont.systemFont(ofSize: 13)
        tv.textColor = UIColor.black
        tv.keyboardAppearance = .light
        tv.text = "Add comment"
        return tv
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainTableView)
        view.addSubview(replyCommentsTextView)
        view.addSubview(backgroundViewForTextView)
        backgroundViewForTextView.addSubview(replyCommentsTextView)
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        configureKeyboard()
        hideKeyboardReconiser()
        configureConstraints()
    }
    
    //MARK: - Hide Keyboard with touch
    
    private func hideKeyboardReconiser() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: - Show and Hide Keyboard
    
    private func configureKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= keyboardFrame.height
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    //MARK: - Add Constraints
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: view.topAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            backgroundViewForTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundViewForTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundViewForTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundViewForTextView.heightAnchor.constraint(equalToConstant: 80),
            
            replyCommentsTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            replyCommentsTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            replyCommentsTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            replyCommentsTextView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}

//MARK: - TableView Extantions

extension HomeCommentsPresentationControllerTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeCommentsPresentationControllerTableViewCell.identifier, for: indexPath) as? HomeCommentsPresentationControllerTableViewCell else { return UITableViewCell() }
        
        cell.delegate = self
        return cell
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainTableView.deselectRow(at: indexPath, animated: true)
    }
    
}

//MARK: - PresentationControllerTableView

extension HomeCommentsPresentationControllerTableView: HomeCommentsPresentationControllerDelegate {
    func userAvatarImageTap() {
        let vc =  ProfileGuestViewController()
        vc.modalPresentationStyle = .automatic
        self.present(vc, animated: true, completion: nil)
    }
    
    func userGuestAvatarImageTap() {
        let vc = ProfileGuestViewController()
        vc.modalPresentationStyle = .automatic
        self.present(vc, animated: true, completion: nil)
    }
    
}
