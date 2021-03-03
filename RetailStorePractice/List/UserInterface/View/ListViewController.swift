//
// ListViewController.swift
// RetailStorePractice
//
// Created by Juan carlos De la parra on 01/03/21.
//


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
    //var dataSource = RxTableViewSectionedReloadDataSource<SectionModel>?
    
    private var dataSource: RxTableViewSectionedReloadDataSource<SectionModel<NSNumber, Product>>!
    
    
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
        var dataSource = self.dataSource
         dataSource = RxTableViewSectionedReloadDataSource<SectionModel<NSNumber, Product>>(
            configureCell: { dataSource, tableView, indexPath, item in
                let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell
                cell.configureWithProduct(product: item)
                
                return cell
            })
        
        
        dataSource!.titleForHeaderInSection = { dataSource, sectionIndex in
            return Category(rawValue: dataSource[sectionIndex].model.intValue)?.title()
        }
        
        print(dataSource as Any)
        print(dataArray as Any)
        
        dataArray
            .asObservable()
            .bind(to:tableView.rx.items(dataSource: dataSource!))
            .disposed(by: disposeBag)
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    //MARK:
    //MARK: Other Methods
    func showProducts(sectioned data: [SectionModel<NSNumber, Product>]) {
        print(data as Any)
        dataArray.accept(data)
    }
    
}
