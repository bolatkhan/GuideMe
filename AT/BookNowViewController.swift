//
//  BookNowViewController.swift
//  AT
//
//  Created by Askhat Bolatkhan on 4/21/17.
//  Copyright © 2017 Askhat Bolatkhan. All rights reserved.
//

import UIKit
import EasyPeasy
import Moya

class BookNowViewController: UIViewController {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.avenirMedium(fontSize: 20)
        label.textAlignment = .center
        label.textColor = .darkText
        label.numberOfLines = 0
        label.text = "Fill out the form"
        return label
    }()
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1 / UIScreen.main.scale
        view.layer.borderColor = UIColor(white: 0.8, alpha: 1.0).cgColor
        return view
    }()
    private lazy var borderView1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        return view
    }()
    private lazy var borderView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        return view
    }()
    private lazy var borderView3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.8, alpha: 1.0)
        return view
    }()
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        let attr = [NSForegroundColorAttributeName : UIColor(white: 0.8, alpha: 1.0),
                    NSFontAttributeName: UIFont.avenirUltraLight(fontSize: 12)]
        textField.attributedPlaceholder = NSAttributedString(string: "Full name", attributes: attr)
        textField.font = UIFont.avenirMedium(fontSize: 14)
        textField.textColor = UIColor.lightGray
        textField.delegate = self
        return textField
    }()
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        let attr = [NSForegroundColorAttributeName : UIColor(white: 0.8, alpha: 1.0),
                    NSFontAttributeName: UIFont.avenirUltraLight(fontSize: 12)]
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: attr)
        textField.font = UIFont.avenirMedium(fontSize: 14)
        textField.textColor = UIColor.lightGray
        textField.delegate = self
        return textField
    }()
    private lazy var numberTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        let attr = [NSForegroundColorAttributeName : UIColor(white: 0.8, alpha: 1.0),
                    NSFontAttributeName: UIFont.avenirUltraLight(fontSize: 12)]
        textField.attributedPlaceholder = NSAttributedString(string: "Phone number", attributes: attr)
        textField.font = UIFont.avenirMedium(fontSize: 14)
        textField.textColor = UIColor.lightGray
        textField.delegate = self
        return textField
    }()
    private lazy var msgTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        let attr = [NSForegroundColorAttributeName : UIColor(white: 0.8, alpha: 1.0),
                    NSFontAttributeName: UIFont.avenirUltraLight(fontSize: 12)]
        textField.attributedPlaceholder = NSAttributedString(string: "Additional information", attributes: attr)
        textField.font = UIFont.avenirMedium(fontSize: 14)
        textField.textColor = UIColor.lightGray
        textField.delegate = self
        return textField
    }()
    private lazy var submitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.appColor
        button.setTitle("Request", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(submit), for: .touchUpInside)
        return button
    }()
    private func setupViews(){
        view.backgroundColor = UIColor.white
        [titleLabel,
         containerView,
         submitButton].forEach{
                view.addSubview($0)
        }
        [borderView1,
         borderView2,
         borderView3,
         nameTextField,
         emailTextField,
         numberTextField,
         msgTextField].forEach{
            containerView.addSubview($0)
        }
    }
    private func setupConstraints(){
        titleLabel <- [
            Left(10),
            Right(10),
            Bottom(10).to(containerView)
        ]
        containerView <- [
            Height(201),
            Width(300),
            Top(64+44),
            CenterX(0)
        ]
        nameTextField <- [
            Height(49),
            Top(1),
            Left(10),
            Right(10)
        ]
        borderView1 <- [
            Top(1).to(nameTextField),
            Left(10),
            Right(10),
            Height(1 / UIScreen.main.scale)
        ]
        
        emailTextField <- [
            Height(49),
            Top(1).to(borderView1),
            Left(10),
            Right(10)
        ]
        borderView2 <- [
            Top(1).to(emailTextField),
            Left(10),
            Right(10),
            Height(1 / UIScreen.main.scale)
        ]
        numberTextField <- [
            Height(49),
            Top(1).to(borderView2),
            Left(10),
            Right(10)
        ]
        borderView3 <- [
            Top(1).to(numberTextField),
            Left(10),
            Right(10),
            Height(1 / UIScreen.main.scale)
        ]
        msgTextField <- [
            Height(49),
            Top(1).to(borderView3),
            Left(10),
            Right(10)
        ]
        submitButton <- [
            Top(10).to(containerView),
            Width(300),
            Height(50),
            CenterX(0)
        ]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Book now"
        setupViews()
        setupConstraints()
    }
    func submit(){
        if !(nameTextField.text!.isEmpty && emailTextField.text!.isEmpty&&numberTextField.text!.isEmpty&&msgTextField.text!.isEmpty) {
            let provider = MoyaProvider<ATapi>()
            provider.request(.makeRequest(fullName: nameTextField.text!, email: emailTextField.text! , phoneNumber: numberTextField.text! , message: msgTextField.text!, tour: 1)) { result in
                switch result {
                case let .success(response):
                    do {
                        let data = try response.mapJSON()
                        let statusCode = response.statusCode
                        print("Status code: \(statusCode)")
                        if statusCode == 201 {
                            let alertController = UIAlertController(title: "Success", message: "Your request successfully submitter, we will contact your soon", preferredStyle: .alert)
                            let OKaction = UIAlertAction(title: "OK", style: .default, handler: nil)
                            alertController.addAction(OKaction)
                            self.present(alertController, animated: true, completion: nil)
                            self.nameTextField.text = ""
                            self.emailTextField.text = ""
                            self.numberTextField.text = ""
                            self.msgTextField.text = ""
                            
                        }
                        print("Response data \(data)")
                        let alertController = UIAlertController(title: "Error", message: "Enter a valid email address.", preferredStyle: .alert)
                        let OKaction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alertController.addAction(OKaction)
                        self.present(alertController, animated: true, completion: nil)

                    }catch{
                        print("Sorry, ")
                        }
                case .failure(_):
                    // TODO: handle the error == best. comment. ever.
                    print("error")
                }
                }
            }else{
            let alertController = UIAlertController(title: "Error", message: "All fields are required", preferredStyle: .alert)
            let OKaction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(OKaction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
extension BookNowViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
