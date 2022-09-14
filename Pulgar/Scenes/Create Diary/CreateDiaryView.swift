//
//  NewDiaryView.swift
//  Pulgar
//
//  Created by iOS Developer on 9/14/22.
//

import SwiftUI

struct CreateDiaryView: View {
    
    @StateObject private var viewModel: CreateDiaryViewModel
    
    init(_ viewModel: CreateDiaryViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var mainView: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                
                HStack {
                    Text("Add to site diary")
                        .foregroundColor(Color.black)
                        .font(.system(size: 20))
                    Spacer()
                    Image("help")
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("gray"))
                }
                
                PhotosItemView()
                    .environmentObject(viewModel)
                
                CommentRowView()
                    .environmentObject(viewModel)
                
                DetailsItemView()
                    .environmentObject(viewModel)
                
                EventsItemView()
                    .environmentObject(viewModel)
                
                Button(action: {
                    viewModel.createSiteDiary()
                }, label: {
                    Text(Constants.next)
                        .foregroundColor(.white)
                }).buttonStyle(ButtonDefault())
            }.padding(20)
            
        }
        .sheet(isPresented: $viewModel.openCameraRoll) {
            ImagePicker(completionHandler: {
                viewModel.photos.append($0)
            }, sourceType: .camera)
        }.alert(viewModel.message, isPresented: $viewModel.showAlertMessage) {
            Button("OK", role: .cancel) { }
        }
    }
    
    var body: some View {
        CustomNavBar(title: "Custom Nav", content:
            mainView
        )
    }
}


struct CreateDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = CreateDiaryViewModel(createSiteDiaryUseCase: NetworkUseCaseProvider().makeDiaryUseCase())
        CreateDiaryView(viewModel)
    }
}
