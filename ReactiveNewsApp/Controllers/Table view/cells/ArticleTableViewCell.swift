//
//  ArticleTableViewCell.swift
//  ReactiveNewsApp
//
//  Created by Adriano Ramos on 24/06/20.
//  Copyright © 2020 Adriano Ramos. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ArticleTableViewCell: UITableViewCell {
    private let identifier = "articleCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
