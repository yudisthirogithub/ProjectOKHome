//
//  ViewController.swift
//  ProjectOKHome
//
//  Created by Yudis Huang on 28/09/21.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchRepo: UISearchBar!
    
    @IBOutlet weak var RepoCollectionView: UICollectionView!
    
    var changeThisIntoAPIData = [Repository]()
    
    let Cell = "RepoCollectionViewCell"
    
    var filteredData : [Repository]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        RepoCollectionView.dataSource = self
        RepoCollectionView.delegate = self
        
        searchRepo.delegate = self
        
        
        // register repoCellId to the RepoCollectionView
        let nibCell = UINib(nibName: Cell, bundle: nil)
        RepoCollectionView.register(nibCell, forCellWithReuseIdentifier: Cell)

        Services.shared.getResults(repositoryName: "Swift") { result in
            switch result {
            case .success(let results):
            print(results)
            case .failure(let error):
            print(error)
            }
        }
        
        
        
        // init repo
        for _ in 0...9{
            let repos = Repository()
            
            repos.image = "test"
            repos.name = "Sketch Swift"
            repos.fork = "10"
            repos.star = "7"
            changeThisIntoAPIData.append(repos)
            
        }
        filteredData = changeThisIntoAPIData
        RepoCollectionView.reloadData()
    
        


    }
    
    
    



}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell, for: indexPath) as! RepoCollectionViewCell
        
        let repository = filteredData[indexPath.row]
        
        cell.name.text = repository.name
        cell.logoImage.image = UIImage(named: repository.image!)
        cell.forkNumber.text = repository.fork
        cell.starNumber.text = repository.star
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let repository = filteredData[indexPath.row]
        
        print(indexPath.row)
        
        performSegue(withIdentifier: "goToSecondView", sender: self)
        
        
    }
    
    //MARK Segue to SecondViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondView" {
            guard let vc = segue.destination as? SecondViewController else { return }
            
            
            
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        
        if searchText == ""{
            filteredData = changeThisIntoAPIData
        }else{
            for repo in changeThisIntoAPIData {
                if repo.name!.lowercased().contains(searchText.lowercased()){
                    filteredData.append(repo)
                }
            }
        }
        self.RepoCollectionView.reloadData()
    }
    

}



