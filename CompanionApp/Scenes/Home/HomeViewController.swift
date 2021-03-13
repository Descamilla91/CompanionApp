//
//  HomeViewController.swift
//  CompanionApp
//
//  Created by Diego Escamilla on 13/03/21.
//  Copyright (c) 2021. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeDisplayInterface: class {
    func displayHome(viewModel: HomeModels.FetchHome.ViewModel)
}

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var interactor: HomeInteractorInterface?
    var router: (HomeRouterInterface & HomeDataPassing)?
    
    // MARK: - Init

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupVIPCycle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupVIPCycle()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAccessibilityIdentifers()
        
        performRequest()
    }
    
    // MARK: - Setup
    
    private func setupVIPCycle() {
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func setupUI() {
        
    }
    
    private func setupAccessibilityIdentifers() {
    
    }
    
    // MARK: - Helpers
    
    func performRequest() {
        let request = HomeModels.FetchHome.Request()
        interactor?.fetchHome(request: request)
    }
}


// MARK: - HomeDisplayLogic

extension HomeViewController: HomeDisplayInterface {
    
    func displayHome(viewModel: HomeModels.FetchHome.ViewModel) {
    }
}
