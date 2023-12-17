//
//  UIViewControllerRepresentableBootcamp.swift
//  AdvancedLearning
//
//  Created by Malith Madhushanka on 2023-12-17.
//

import SwiftUI

struct UIViewControllerRepresentableBootcamp: View {
    
    @State private var showScreen: Bool = false
    
    var body: some View {
        VStack {
            Text("Hi")
            Button(action: {
                showScreen.toggle()
            }, label: {
                Text("Click here")
            })
            .sheet(isPresented: $showScreen, content: {
                BasicUIViewControllerRepresentable(labelString: "new text")
            })
        }
    }
}

#Preview {
    UIViewControllerRepresentableBootcamp()
}

struct BasicUIViewControllerRepresentable: UIViewControllerRepresentable {
    
    let labelString: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = MyFirstUIViewController()
        vc.labelText = labelString
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

class MyFirstUIViewController: UIViewController {
    
    var labelText: String = "Starting value"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        let label = UILabel()
        label.text = labelText
        label.textColor = .white
        
        view.addSubview(label)
        label.frame = view.frame
    }
}
