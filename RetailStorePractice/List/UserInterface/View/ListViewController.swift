//
//  ListViewController.swift
//  RetailStorePractice
//
//  Created by Juan carlos De la parra on 01/03/21.
//

/*
import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxDataSources

var ListCellIdentifier = "ListCell"

class ListViewController : UIViewController, UITableViewDelegate {
    //1
    var eventHandler : ListPresenter?
    //2
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<NSNumber, Product>>()
    //3
    var dataArray: BehaviorRelay<[SectionModel<NSNumber, Product>]> = BehaviorRelay(value: [])
     
    @IBOutlet weak var tableView : UITableView!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        eventHandler?.updateView()
        
    }
    
    
    func configureView() {
        //Title
        navigationItem.title = "Products"
        
        //Table View Configuration
        let dataSource = self.dataSource
        
        dataSource.configureCell = { (_, tv, indexPath, product) in
            let cell = tv.dequeueReusableCell(withIdentifier: "ListCell") as! ListCell
            cell.configureWithProduct(product: product)
            
            return cell
        }
        
        dataSource.titleForHeaderInSection = { dataSource, sectionIndex in
            return Category(rawValue: dataSource[sectionIndex].model.intValue)?.title()
        }
        
        dataArray.asObservable()
            .bindTo(tableView.rx.items(dataSource: dataSource))
            .addDisposableTo(disposeBag)
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
 
    //MARK:
    //MARK: Other Methods
    func showProducts(sectioned data: [SectionModel<NSNumber, Product>]) {
        dataArray.accept(data)
    }
    
}
*/
