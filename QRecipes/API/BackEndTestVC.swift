//
//  APITestVC.swift
//  QRecipes
//
//  Created by Kyo on 9/8/20.
//  Copyright © 2020 Kyo. All rights reserved.
//

import Firebase
import FirebaseAuth
import SnapKit
import UIKit

class BackEndTestVC: UIViewController {
    //MARK:- Properties
    private let sampleLable = UILabel()

    private let signUp = UIButton()
    
    private var recipes = [Recipe](){
        didSet {
            sampleLable.text = recipes[0].name
        }
    }
    
    //MARK:- LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureUI()
    }
    
    private func configure() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .white
    }
    
    //MARK:- Helpers
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(sampleLable)
        sampleLable.text = "This is BackEndTestViewController"
        sampleLable.font = UIFont.systemFont(ofSize: 20)
        sampleLable.textColor = .black
        sampleLable.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
        
        view.addSubview(signUp)
        signUp.addTarget(self, action: #selector(fetchRecipes), for: .touchUpInside)
        signUp.setTitle("Sign-Up", for: .normal)
        signUp.setTitleColor(.white, for: .normal)
        signUp.backgroundColor = .black
        signUp.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        signUp.layer.cornerRadius = 5
        signUp.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(50)
            make.right.equalTo(sampleLable.snp.centerX).offset(-20)
            make.top.equalTo(sampleLable.snp.bottom).offset(20)
        }
        
    }
    
    //MARK:- Selectors
    
    @objc func createNewAccount() {
        let email = "test@gmail.com"
        let password = "test1234"
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          if error != nil {
              print("DEBUG:- Error!")
          } else {
              print("DEBUG:- A new account is created!")
          }
        }
    }
    
    @objc func uploadNewRecipe(){
        let recipe = newRecipe(
                        name: "Warm Caramel Banana",
                        restaurant: "AAA Kitchen",
                        level: "1",
                        cookTime: "15 MIN",
                        price: "$8",
                        tags: ["Banana", "Caramel", "Dessert"],
                        ingrediants: ["Banana", "Sour cream", "Caremel sause"],
                        recipeImage: UIImage(named: "banana")!)
            
        API.uploadRecipe(recipe: recipe) { [weak self] (error, ref) in
                guard let strongSelf = self else { return }
                if let error = error {
                    print("failed to upload new recipe")
                } else {
                    print("Uploaded")
                }
            }
    }
    @objc func fetchRecipes() {
        API.fetchRecipes{ recipes in
            self.recipes = recipes
        }
    }
}
