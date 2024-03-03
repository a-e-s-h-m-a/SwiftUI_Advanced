//
//  ErrorAlertBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2024-03-03.
//

import SwiftUI

protocol AppAlert {
    var title: String { get }
    var subTitle: String? { get }
    var buttons: AnyView { get }
}

extension View {
    func showCustomAlert<T: AppAlert>(alert: Binding<T?>) -> some View {
        self
            .alert(alert.wrappedValue?.title ?? "Error", isPresented: Binding(value: alert), actions: {
                alert.wrappedValue?.buttons
            }, message: {
                if let subTitle = alert.wrappedValue?.subTitle {
                    Text(subTitle)
                }
            })
    }
}

struct ErrorAlertBootcamp: View {
    
    @State private var alert: MyCustomAlert? = nil
    @State private var showError: Bool = false
    
    var body: some View {
        Button("CLICK ME!") {
            saveData()
        }
        .showCustomAlert(alert: $alert)
        
        
//        .alert(alert?.title ?? "Error", isPresented: Binding(value: $alert), actions: {
//            alert?.getButtonsForAlert
//        }, message: {
//            if let subTitle = alert?.subTitle {
//                Text(subTitle)
//            }
//        })
        
        
//        .alert(error?.localizedDescription ?? "Error", isPresented: Binding(value: $error)) { // from last video
//            Button("OK") {
//                
//            }
//        }
    }
    
//    // custom errors
//    enum MyCustomError: Error, LocalizedError {
//        case noInternetConnection
//        case dataNotFound
//        case urlError(error: Error)
//        
//        var errorDescription: String? {
//            switch self {
//            case .noInternetConnection:
//                return "Please check your internet connection and try again."
//            case .dataNotFound:
//                return "No data found."
//            case .urlError(error: let error):
//                return "Error: \(error.localizedDescription)"
//            }
//        }
//    }
    
    // custom errors
    enum MyCustomAlert: Error, LocalizedError, AppAlert {
        case noInternetConnection(onOKPressed: () -> (), onRetryPressed: () -> ())
        case dataNotFound
        case urlError(error: Error)
        
        var errorDescription: String? {
            switch self {
            case .noInternetConnection:
                return "Please check your internet connection and try again."
            case .dataNotFound:
                return "No data found."
            case .urlError(error: let error):
                return "Error: \(error.localizedDescription)"
            }
        }
        
        var title: String {
            switch self {
            case .noInternetConnection:
                return "No Internet connection"
            case .dataNotFound:
                return "No data"
            case .urlError(error: let error):
                return "Error"
            }
        }
        
        var subTitle: String? {
            switch self {
            case .noInternetConnection:
                return "No Internet connection"
            case .dataNotFound:
                return nil
            case .urlError(error: let error):
                return "Error"
            }
        }
        
        var buttons: AnyView {
            AnyView(getButtonsForAlert)
        }
        
        @ViewBuilder
        var getButtonsForAlert: some View {
            switch self {
            case .noInternetConnection(let onOKPressed, let onRetryPressed):
                Button("OK") {
                    onOKPressed()
                }
                Button("RETRY") {
                    onRetryPressed()
                }
            case .dataNotFound:
                Button("RETRY") {
                    
                }
            default:
                Button("Delete", role: .destructive) {
                    
                }
            }
        }
    }
    
    private func saveData() {
        let isSuccessful: Bool = false
        
        if isSuccessful {
            // do something
        } else {
            // error
            //errorTitle = "An error occured"
            //showError.toggle()
            
           // let myError: Error = MyCustomAlert.urlError(error: URLError(.badURL))
            
            alert = .noInternetConnection(onOKPressed: {
                
            }, onRetryPressed: {
                
            })
            
        }
    }
}

#Preview {
    ErrorAlertBootcamp()
}
