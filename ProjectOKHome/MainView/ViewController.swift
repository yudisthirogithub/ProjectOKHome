//
//  ViewController.swift
//  ProjectOKHome
//
//  Created by Yudis Huang on 28/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var RepoCollectionView: UICollectionView!
    
    let repoCellId = "RepoCollectionViewCell"
    
    var repositories = [Repository]()
    
    
    override func viewDidLoad() {
        
 
        
        // register repoCellId to the RepoCollectionView
        let nibCell = UINib(nibName: repoCellId, bundle: nil)
        RepoCollectionView.register(nibCell, forCellWithReuseIdentifier: repoCellId)

        // init repo
        for _ in 1...10{
            let repos = Repository()
            
            repos.image = "test"
            repos.name = "Sketch Swift"
            repos.fork = 10
            repos.star = 7
            repositories.append(repos)
            
           
            // Do any additional setup after loading the view.
            
        }
        RepoCollectionView.reloadData()
        
        super.viewDidLoad()
    

    }
    



}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return repositories.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "repoCellId", for: indexPath) as! RepoCollectionViewCell
        
        let repository = repositories[indexPath.row]
        
        cell.name.text = repository.name
        cell.logoImage.image = UIImage(named: repository.image!)
        
        return cell
    }
    
    
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    
}



