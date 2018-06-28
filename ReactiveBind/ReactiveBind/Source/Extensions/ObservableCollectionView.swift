//
//  ObservableCollectionView.swift
//  ReactiveBind
//
//  Created by Nader Besada on 2018-06-26.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import UIKit

public protocol ConfigurableView {
    associatedtype ConfigurableViewModelType: ViewModelDelegate
    func configure(with viewModel: ConfigurableViewModelType)
}

public protocol ViewModelDelegate {
    associatedtype ViewModelType
}

public extension ViewModelDelegate {
    typealias ViewModelType = Self
}

public protocol DataSourceViewModelDelegate: ViewModelDelegate {
    associatedtype CellViewModelType: ViewModelDelegate
    var cellCount: Int { get }
    func getCellViewModel(at indexPath: IndexPath) -> CellViewModelType
}

public protocol ConfigurableCell: ConfigurableView where Self: UICollectionViewCell {}

public class ObservableCollectionView<Cell: ConfigurableCell>: UICollectionView, UICollectionViewDataSource {
    
    let cellId: String
    
    public init(cellId: String, collectionViewLayout layout: UICollectionViewLayout) {
        self.cellId = cellId
        super.init(frame: CGRect.zero, collectionViewLayout: layout)
        self.register(Cell.self, forCellWithReuseIdentifier: cellId)
        self.dataSource = self
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    typealias CellClicked = (IndexPath) -> ()
    var cellClicked: CellClicked?
    
    typealias ViewModelAtIndexPath = (IndexPath) -> (Cell.ConfigurableViewModelType?)
    var viewModelAtIndexPath: ViewModelAtIndexPath?
    
    typealias CellCount = () -> (Int?)
    var cellCount: CellCount?
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount?() ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! Cell
        guard let viewModel = viewModelAtIndexPath?(indexPath) else { return cell }
        cell.configure(with: viewModel)
        return cell
    }
    
    @objc(collectionView:didSelectItemAtIndexPath:) func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        cellClicked?(indexPath)
    }
}

public extension ObservableCollectionView {
    
    /**
     Configure view with viewModel
     
     - parameters:
        - with: ViewModel to configure view with
    */
    
    public func configure<T: DataSourceViewModelDelegate>(with viewModel: T) where T.CellViewModelType == Cell.ConfigurableViewModelType {
        self.cellCount = {
            return viewModel.cellCount
        }
        self.viewModelAtIndexPath = { (indexPath) in
            return viewModel.getCellViewModel(at: indexPath)
        }
    }
}

