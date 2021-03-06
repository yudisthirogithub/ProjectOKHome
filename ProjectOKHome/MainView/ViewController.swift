//
//  ViewController.swift
//  ProjectOKHome
//
//  Created by Yudis Huang on 28/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    let Cell = "RepoCollectionViewCell"
    
    @IBOutlet weak var RepoCollectionView: UICollectionView!
    
    var repositories = [Repository]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        RepoCollectionView.dataSource = self
        RepoCollectionView.delegate = self
        
        // register repoCellId to the RepoCollectionView
        let nibCell = UINib(nibName: Cell, bundle: nil)
        RepoCollectionView.register(nibCell, forCellWithReuseIdentifier: Cell)

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
    

    }
    



}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell, for: indexPath) as! RepoCollectionViewCell
        
        let repository = repositories[indexPath.row]
        
        cell.name.text = repository.name
        cell.logoImage.image = UIImage(named: repository.image!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let repository = repositories[indexPath.row]
        
        print(indexPath.row)
    }
    
    
}



