//
//  ReactiveNewsTableViewController.swift
//  ReactiveNewsApp
//
//  Created by Adriano Ramos on 24/06/20.
//  Copyright © 2020 Adriano Ramos. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ReactiveNewsTableViewController: UITableViewController {
    private let disposeBag = DisposeBag()
    private var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setupNews()
    }

    private func setupNews() {
//        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=753d2ced1d4840c9b044c2c7b4b892fd")!
//        let resource =  Resource<ArticleList>(url: url)
//        URLRequest.load(resource: resource)
        
        URLRequest.load(resource: ArticleList.all)
            .subscribe(onNext: { [weak self] result in
                if let result = result {
                    self?.articles = result.articles
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            }).disposed(by: disposeBag)
        
//        Observable.from(optional: url)
//            .flatMap { url -> Observable<Data> in
//                let request = URLRequest(url: url)
//                return URLSession.shared.rx.data(request: request)
//            }
//            .map { data -> [Article]? in
//                return try? JSONDecoder().decode(ArticleList.self, from: data).articles
//            }
//            .subscribe(onNext: { [weak self] articles in
//                if let articles = articles {
//                    self?.articles = articles
//                    DispatchQueue.main.async {
//                        //do something
//                        self?.tableView.reloadData()
//                    }
//                }
//            }).disposed(by: disposeBag)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as? ArticleTableViewCell else { return UITableViewCell()}
        
        cell.titleLabel.text = self.articles[indexPath.row].title
        cell.descriptionLabel.text = self.articles[indexPath.row].description
        
        
        return cell
    }
}
