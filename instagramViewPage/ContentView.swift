//
//  ContentView.swift
//  instagramViewPage
//
//  Created by Justyna Warzecha on 15/12/2023.
//

import SwiftUI

struct ContentView: View {
    let arrayImage: [String] = [ "Lala", "Lala2", "Lala3", "Lala4"]
    var body: some View {
        VStack{
            
            HStack{
                Text("InstaLALAgram")
                Spacer()
                Image(systemName: "heart")
                Image(systemName: "message")
               
            }
            .padding(.leading)
            .padding()
            ScrollView{
            ScrollView (.horizontal){
                HStack{
                        ZStack{
                            Text("+")
                                .foregroundStyle(.white)
                                .font(.title)
                                .zIndex(2)
                                .padding([.top, .leading], 49)
                                .padding(.bottom, 2)
                            Spacer()
                            Circle()
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                .frame(width: 35)
                                .zIndex(1)
                                .padding([.top, .leading], 50)
                            VStack{
                                Image("Lala9")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(LinearGradient(gradient: Gradient(colors: [.insta1, .insta2, .insta3]), startPoint: .top, endPoint: .bottom), lineWidth: 4))
                                Text("Ta storie")
                            }
                        }
                    
                        ForEach(arrayImage, id: \.self) {photo in
                            VStack{
                                Image(photo)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(LinearGradient(gradient: Gradient(colors: [.insta1, .insta2, .insta3]), startPoint: .top, endPoint: .bottom), lineWidth: 4))
                                Text("Laika")
                            }
                        }
                       
                           
                  
                    
                }
                .padding(.leading, 20)
                
            }
           
                PostView(image: "Lala", userName: "LaikaMange", imageName: "Lala7", description:"aujourd'hui j'ai pu gouter les meilleures friandises du monde les FriandiBoeuf. Avec le code de promo Laika50 vous avez la remise de 50 %.", ashtag: "#friandises #coolab", nbrLikes: 56)
                 PostView(image: "Lala2", userName: "LaikaLeia", imageName: "Lala6", description:"Where is Luck ?", ashtag: "", nbrLikes: 22)
//
                PostView(image: "Lala4", userName: "Lala", imageName: "Lala5", description:"Marre de ces humains, j'avais besoin de me resourcer", ashtag: "#repos #feelgood", nbrLikes: 67)
                
                PostView(image: "Lala4", userName: "Iam_Doberman", imageName: "Lala8", description:"All I want from Christam is la souris", ashtag: "espritNoel", nbrLikes: 134)
                Spacer()
            }
            }
        //.padding()
    }

}

#Preview {
    ContentView()
}

struct PostView: View {
    let image: String
    let userName: String
    let imageName: String
    let description: String
    let ashtag: String
    @State var nbrLikes: Int
    @State private var likes: Bool = false
    
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack{
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                //                        Circle()
                //                            .stroke(.green, lineWidth: 5)
                //                            .frame(width: 70)
                Text(userName)
                    .bold()
                Spacer()
            }
            .padding()
            
            
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 392)
                .clipShape(Rectangle())
                .padding(.horizontal)
            
            //Rectangle()
            //                        .stroke(.red, lineWidth: 2)
            //                        .frame(height: 250)
            HStack{
                Button(action: {
                    likes.toggle()
                    if likes {
                        nbrLikes += 1
                    } else {
                        nbrLikes -= 1
                    }
                }, label: {
                    Image(systemName: likes ? "heart.fill" : "heart") // Utilisation d'un cœur rempli si likes est vrai
                        .foregroundColor(likes ? .red : .black)
                    Text("\(nbrLikes)")
                        .foregroundStyle(.black)
                    
                })
                
                
                    //.foregroundColor(.red)
                Image(systemName: "message")
                Text("22")
                Image(systemName: "paperplane")
                Spacer()
                Image(systemName: "bookmark")
            }
            .padding(.horizontal, 23)
            
            
            Text(userName)
                .bold()
                .padding(.horizontal, 23)
            Text(description)
                .padding(.horizontal,23)
            Text(ashtag)
                .padding(.horizontal, 23)
            
            
        }
        //.padding()
    }
}
