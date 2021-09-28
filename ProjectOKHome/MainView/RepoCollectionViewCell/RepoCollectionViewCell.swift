//
//  RepoCollectionViewCell.swift
//  ProjectOKHome
//
//  Created by Yudis Huang on 28/09/21.
//

import UIKit

class RepoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var starNumber: UILabel!
    
    @IBOutlet weak var forkNumber: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
