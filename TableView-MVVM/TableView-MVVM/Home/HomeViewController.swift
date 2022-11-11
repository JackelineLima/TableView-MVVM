//
//  ViewController.swift
//  TableView-MVVM
//
//  Created by Jackeline Pires De Lima on 10/11/22.
//

import UIKit

class HomeViewController: UIViewController {

    let viewModel = HomeViewModel()
    let homeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        homeView.delegate = self
        homeView.setup(model: viewModel.setupModel())
        view = homeView
    }
}

extension HomeViewController: HomeViewDelegate {
    
    func didTapCell(name: String, type: Nameable) {
        if type is IMC {
            let controller = IMCViewController()
            navigationController?.pushViewController(controller, animated: true)
            return
        }
        
        let alert = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "0K", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}
