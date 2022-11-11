//
//  HomeView.swift
//  TableView-MVVM
//
//  Created by Jackeline Pires De Lima on 10/11/22.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func didTapCell(name: String, type: Nameable)
}

final class HomeView: UIView {
    
    weak var delegate: HomeViewDelegate?
    private var model: [Nameable] = []
    
    private lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.delegate = self
        tb.dataSource = self
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func setup(model: [Nameable]) {
        self.model = model
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = model[indexPath.row]

        delegate?.didTapCell(name: indexPath.name, type: indexPath)
    }
}
