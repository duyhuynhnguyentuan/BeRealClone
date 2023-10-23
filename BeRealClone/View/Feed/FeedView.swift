//
//  Feed.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 01/10/2023.
//

import SwiftUI
import Kingfisher
struct FeedView: View {
    @Binding var mainMenu: String
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State var cameraViewPresented = false
    @ObservedObject var feedModel: FeedViewModel
    init(feedModel: FeedViewModel, menu: Binding<String>) {
        self.feedModel = feedModel
        self._mainMenu = menu
    }
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                ZStack{
                    ScrollView{
                        VStack{
                            VStack{
                                ZStack{
                                    VStack(alignment:.leading){
                                        Image("back")
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(5)
                                    }
                                    VStack{
                                        HStack{
                                            Image("front")
                                                .resizable()
                                                .scaledToFit()
                                                .border(.black)
                                                .cornerRadius(2)
                                                .frame(width: 20, height: 40)
                                                .padding(.leading,5)
                                                .padding(.bottom,80)
                                            Spacer()
                                        }
                                    }
                                }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                            }
                            VStack{
                                Text("Add a caption...")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                Text("View comment")
                                    .foregroundColor(.gray)
                                HStack{
                                    Text("Dong Xoai, Binh Phuoc • 1 hr late")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12))
                                    ThreeDots(size: 3, color: .gray)
                                }
                            }
                            ForEach(self.feedModel.bereals, id: \.backImageUrl ){ bereal in
                                FeedCell()
                                    .onAppear{
                                        print("Bereal: \(bereal.username)")
                                    }
                            }
                        }
                        .padding(.top, 80)
                    }
                    VStack{
                        VStack{
                            HStack{
                                Button{
                                    withAnimation{
                                        self.mainMenu = "left"
                                    }
                                }label: {
                                    Image(systemName: "person.2.fill").foregroundColor(.white)
                                }
                                Spacer()
                                
                                Text("BeReal.").foregroundColor(.white)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .font(.system(size: 22))
                                Spacer()
                                Button{
                                    withAnimation{
                                        self.mainMenu = "profile"
                                    }
                                }label: {
                                    if let profileImageUrl = viewModel.currentUser!.profileImageUrl {
                                        KFImage(URL(string: profileImageUrl))
                                            .resizable()
                                            .frame(width: 35, height: 35)
                                            .cornerRadius(17.5)
                                    }else{
                                        Circle()
                                            .frame(width: 35, height: 35)
                                            .cornerRadius(17.5)
                                            .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                                            .overlay(
                                                Text(viewModel.currentUser!.name.prefix(1).uppercased())
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 15))
                                            )
                                    }
                                    //                                Image("dudu")
                                    //                                    .resizable()
                                    //                                    .frame(width: 35, height: 35)
                                    //                                    .cornerRadius(17.5)
                                }
                            }.padding(.horizontal)
                            HStack{
                                Text("My Friends")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                Text("Discovery")
                                    .foregroundColor(.gray)
                            }
                        }
                   
                        Spacer()
                        
                        HStack{
                            VStack{
                                Image(systemName: "circle")
                                    .font(.system(size: 80))
                                Text("Post a late BeReal.")
                                    .font(.system(size: 14))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            }
                            .foregroundColor(.white)
                            .padding(.bottom, 12)
                            .onTapGesture {
                                self.cameraViewPresented.toggle()
                            }
                        }
                    }
                }
                .onAppear{
                    KingfisherManager.shared.cache.clearMemoryCache()
                }
            }.fullScreenCover(isPresented: $cameraViewPresented) {
                
            } content: {
                CameraView(viewModel: CameraViewModel(user: AuthenticationViewModel.shared.currentUser!))
            }
        }
    }
}

//#Preview {
//    FeedView(mainMenu: .constant("feed"))
//}