//
//  ViewController.swift
//  ReactiveBindExample
//
//  Created by Nader Besada on 2018-06-29.
//  Copyright © 2018 Nader Besada. All rights reserved.
//

import UIKit
import ReactiveBind

class ViewController: UIViewController {
    @IBOutlet weak var reactiveLabel: UILabel!
    @IBOutlet weak var reactiveTextField: UITextField!
    @IBOutlet weak var reactiveSlider: UISlider!
    @IBOutlet weak var reactiveSwitch: UISwitch!
    @IBOutlet weak var reactiveActivityIndicator: UIActivityIndicatorView!
    
    let collectionView: ObservableCollectionView<Cell> = {
        let cv = ObservableCollectionView<Cell>(cellId: "cellId", collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .orange
        return cv
    }()
    
    let viewModel = ObservableViewModel()
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.topAnchor.constraint(equalTo: reactiveActivityIndicator.bottomAnchor, constant: 20).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        reactiveTextField.rb.text.bind(to: reactiveLabel.rb.text)
        
        reactiveSwitch.rb.isOn.bind(to: reactiveActivityIndicator.rb.isAnimating)
        
        reactiveSwitch.rb.isOn.bind(to: reactiveSlider.rb.value) { (val) -> (Float) in
            let sliderValue: Float =  val ?  1 : 0
            return sliderValue
        }
        
        reactiveSlider.rb.value.bind(to: reactiveSwitch.rb.isOn) { (val) -> (Bool) in
            return val == 1
        }
        
        collectionView.rb.reload().observableBind(to: viewModel.cellViewModels)
        
        // Has to be a DataSourceDelegate ViewModel
        
        collectionView.configure(with: viewModel)
    
    }
}

// Cell has to conform to ConfigurableCell in order to work with ObservableCollectionView<ConfigurableCell>

class Cell: UICollectionViewCell, ConfigurableCell {

    func configure(with viewModel: CellViewModel) {
        
        // MARK: - Configure cell here
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
