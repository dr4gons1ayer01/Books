//
//  Builder.swift
//  Books
//
//  Created by Иван Семенов on 11.04.2025.
//

import UIKit

protocol BaseViewProtocol: AnyObject {
    associatedtype PresenterType
    var presenter: PresenterType? { get set }
}

class Builder {
    //view
    //presenter
    
    static private func createView<View: UIViewController & BaseViewProtocol>(viewType: View.Type, presenter: (View) -> View.PresenterType) -> UIViewController {
        let view = View()
        let presenter = presenter(view)
        view.presenter = presenter
        return view
    }
    
    static func createRegistrationView() -> UIViewController {
        return self.createView(viewType: RegistrationView.self) { view in
            RegistrationViewPresenter(view: view)
        }
    }
    
    static func createOnboardingView() -> UIViewController {
        return self.createView(viewType: OnboardingView.self) { view in
            OnboardingViewPresenter(view: view)
        }
    }
    
    static func createMainView() -> UIViewController {
        return self.createView(viewType: MainView.self) { view in
            MainViewPresenter(view: view)
        }
    }
    
    static func createDetailsView() -> UIViewController {
        return self.createView(viewType: DetailsView.self) { view in
            DetailsViewPresenter(view: view)
        }
    }
}
