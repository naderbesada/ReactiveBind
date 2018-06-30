//
//  ObservableViewModel.swift
//  ReactiveBindExample
//
//  Created by Nader Besada on 2018-06-29.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import Foundation
import ReactiveBind

// ViewModel has to conform to DataSourceViewModelDelegate in order to be able to configure with ObservableCollectionView. DataSourceViewModelDelegate subclasses ViewModelDelegate

class ObservableViewModel: DataSourceViewModelDelegate {
    
    let cellViewModels: Observable<[CellViewModel]> = Observable([])
    
    var cellCount: Int {
        return cellViewModels.value.count
    }
    
    func getCellViewModel(at indexPath: IndexPath) -> CellViewModel {
        return cellViewModels.value[indexPath.item]
    }
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.cellViewModels.value.append(CellViewModel())
        }
    }
}
