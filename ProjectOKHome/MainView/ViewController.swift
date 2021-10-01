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

        Services.shared.getResults(repositoryName: "Swift") { result in
            switch result {
            case .success(let results):
            print("success")
            print(results)
            case .failure(let error):
            print("error nih")
            print(error)
            }
        }
        
        // init repo
        for _ in 1...10{
            let repos = Repository()
            
            repos.image = "test"
            repos.name = "Sketch Swift"
            repos.fork = "10"
            repos.star = "7"
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
        cell.forkNumber.text = repository.fork
        cell.starNumber.text = repository.star
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let repository = repositories[indexPath.row]
        
        print(indexPath.row)
        
        performSegue(withIdentifier: "goToSecondView", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSecondView" {
            guard let vc = segue.destination as? SecondViewController else { return }
            
            
            
        }
    }

}



