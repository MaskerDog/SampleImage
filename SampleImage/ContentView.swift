//
//  ContentView.swift
//  SampleImage
//
//  Created by npc on 2021/09/04.
//

import SwiftUI

struct ContainerView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
    }
}

struct ContentView: View {
    
    @State var image = ContainerView {
        AnyView(
            Text("太郎の画像で学ぶaspectRatio")
            
        )
    }
    var body: some View {
        VStack {
            image
                .frame(maxHeight: UIScreen.main.bounds.size.height - 50)
                .frame(alignment: .top)
            
            
            Spacer()
            HStack {
                // fit
                Button{
                    image = ContainerView {
                        AnyView(
                            Image("Tarou2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        )
                    }
                } label: {
                    Text("fit")
                        .fontWeight(.semibold)
                        .font(.title)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(25)
                }
                Button{
                    image = ContainerView { AnyView(
                        Image("Tarou2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    )
                    }
                } label: {
                    Text("fill")
                        .fontWeight(.semibold)
                        .font(.title)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(25)
                }
                Button{
                    image = ContainerView {
                        AnyView(
                            Image("Tarou2")
                                .resizable()
                        )
                    }
                } label: {
                    Text("なし")
                        .fontWeight(.semibold)
                        .font(.title)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(25)
                }
            }
            .frame(height: 50)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
