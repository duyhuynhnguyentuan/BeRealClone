//
//  EditProfile.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 06/10/2023.
//

import SwiftUI
import Kingfisher

struct EditProfileView: View {
    //@State :  SwiftUI is responsible for updating the state and ensuring the views are re-rendered appropriately when these properties change
    @State var width = UIScreen.main.bounds.width
    @State var fullname: String
    @State var username: String
    @State var bio: String
    @State var location: String
    @State private var selectedImage: UIImage?
    @State var profileImage: Image?
    //@Environment(\.dismiss) is a property wrapper in SwiftUI that allows you to dismiss a view programmatically. It is used to dismiss a view that was presented modally using the sheet() modifier
    let currentUser: User
        //The underscore allows you to create a two-way binding between the state variable and the UI. When you pass a state variable with an underscore to a child view, you are essentially passing a binding to the child view. This binding enables the child view to read and modify the state variable.
    init(currentUser: User){
        self.currentUser = currentUser
        self._fullname = State(initialValue: currentUser.name)
        self._bio = State(initialValue: currentUser.bio ?? "")
        //the ?? means that if the var that is optional is not used then it would be empty
        self._username = State(initialValue: currentUser.username ?? "")
        self._location = State(initialValue: currentUser.location ?? "")
    }
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @State var imagePickerPresented = false
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                VStack{
                    ZStack{
                        HStack{
                            Button{
                                dismiss()
                            }label: {
                                Text("Cancel")
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            Button{
                                //Task is used to handle asynchronus func
                                Task{ await saveData() }
                                dismiss()
                            }label: {
                                Text("Save")
                                    .foregroundColor(.gray)
                            
                            }
                        }
                        .padding(.horizontal, width * 0.05)
                        Text("Edit profile")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                    }
                    HStack{
                        Spacer()
                        Rectangle()
                            .frame(width: width * 0.95 , height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.5)
                    }
                Spacer()
                }
                VStack{
                    VStack{
                        Button{
                            self.imagePickerPresented.toggle()
                        }label: {
                            ZStack(alignment: .bottomTrailing){
    //                            Image("dudu")
    //                                .resizable()
    //                                .scaledToFill()
    //                                .frame(width: 120,height: 120)
    //                                .cornerRadius(60)
                                if currentUser.profileImageUrl != nil && profileImage == nil {
                                    if let profileImageUrl = currentUser.profileImageUrl {
                                        KFImage(URL(string: profileImageUrl))
                                            .resizable()
                                            .frame(width: 120, height: 120)
                                            .cornerRadius(60)
                                    }
                                }
                                else if let image = profileImage {
                                    image
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                        .cornerRadius(60)
                                     
                                }else{
                                    Circle()
                                        .frame(width: 120,height: 120)
                                        .cornerRadius(60)
                                        .foregroundColor(Color(red: 152/255, green: 163/255, blue: 16/255))
                                        .overlay(
                                            Text(viewModel.currentUser!.name.prefix(1).uppercased())
                                                .foregroundColor(.white)
                                                .font(.system(size: 55))
                                        )
                                }
                                ZStack{
                                    ZStack{
                                        Circle()
                                            .frame(width: 34, height: 34)
                                            .foregroundColor(.black)
                                        Circle()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.white)
                                        Circle()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.black)
                                            .opacity(0.1)
                                    }
                                    Image(systemName: "camera.fill")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16))
                                        .shadow(color: .white ,radius: 1, x: 1, y: 1)
                                }
                            }
                        }
                        .sheet(isPresented: $imagePickerPresented){
                            loadImage()
                        } content: {
                            ImagePicker(image: $selectedImage)
                        }
                    }
                    //MENU
                    VStack{
                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        HStack{
                            HStack{
                                Text("Full Name")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .frame(width: width * 0.22)
                            HStack{
                                TextField("", text: $fullname)
                                    .font(.system(size: 16))
                                    .placeholder(when: fullname.isEmpty){
                                        Text(viewModel.currentUser!.name)
                                            .foregroundStyle(
                                                .linearGradient(
                                                    colors: [.purple, .blue], startPoint: .leading,
                                                    endPoint: .trailing
                                                )
                                            )
                                            .opacity(0.7)                                 
                                    }
                                    .foregroundColor(.white)
                                    .padding(.leading, width * 0.05)
                                Spacer()
                            }
                            .frame(width: width * 0.63)
                        }
                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        HStack{
                            HStack{
                                Text("Username")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .frame(width: width * 0.22)
                            HStack{
                                TextField("", text: $username)
                                    .font(.system(size: 16))
                                    .placeholder(when: username.isEmpty){
                                        Text(viewModel.currentUser!.username ?? viewModel.currentUser!.name.uppercased())
                                            .foregroundColor(.white)
                                            .font(.system(size: 16))
                                    }
                                    .foregroundColor(.white)
                                    .padding(.leading, width * 0.05)
                                Spacer()
                            }
                            .frame(width: width * 0.63)
                        }
                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        HStack(alignment: .top){
                            HStack{
                                Text("Bio")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .padding(.leading, -4)
                            .frame(width: width * 0.2 )
                            //The .scrollContentBackground is only available on ios 16 or later
                            if #available(iOS 16, *){
                                TextEditor(text: $bio)
                                    .foregroundColor(.white)
                                    .background(.black)
                                    .scrollContentBackground(.hidden)
                                    .frame(height: 100)
                                    .padding(.leading, width * 0.05)
                                    .overlay(
                                        VStack{
                                            HStack{
                                                if currentUser.bio == "" {
                                                    Text("Bio")
                                                        .foregroundColor(.gray)
                                                        .font(.system(size: 16))
                                                        .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                                                        .padding(.top, 8)
                                                        .padding(.leading, 24)
                                                }
                                                Spacer()
                                            }
                                            Spacer()
                                        }
                                    )
                                    .padding(.top, -5)
                                    .frame(width: width * 0.63)
                            }
                        }
                        Rectangle()
                            .frame(width: width * 0.9, height: 0.7)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        HStack{
                            HStack{
                                Text("Location")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                Spacer()
                            }
                            .frame(width: width * 0.22)
                            HStack{
                                TextField("", text: $location)
                                    .font(.system(size: 16))
                                    .placeholder(when: location.isEmpty){
                                        Text("Location")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 16))
                                    }
                                    .foregroundColor(.white)
                                    .padding(.leading, width * 0.05)
                                Spacer()
                            }
                            .frame(width: width * 0.63)
                        }
                    }
                    .padding(.horizontal, width * 0.05)
                    .padding(.top, 24)
                    Spacer()
                }
                .padding(.top, UIScreen.main.bounds.height * 0.08)
            }
        }
    }
    func saveData() async {
        if viewModel.currentUser!.name != self.fullname && !self.fullname.isEmpty {
            viewModel.currentUser!.name = self.fullname
             await viewModel.saveUserData(data: ["name": self.fullname])
        }
        if viewModel.currentUser!.username != self.username && !self.username.isEmpty {
            viewModel.currentUser!.username = self.username
            await viewModel.saveUserData(data: ["username" : self.username])
        }
        if viewModel.currentUser!.bio != self.bio && !self.bio.isEmpty {
            viewModel.currentUser!.bio = self.bio
            await viewModel.saveUserData(data: ["bio" : self.bio])
        }
        if viewModel.currentUser!.location != self.location && !self.location.isEmpty {
            viewModel.currentUser!.location = self.location
            await viewModel.saveUserData(data: ["location" : self.location])
        }
        if selectedImage != nil {
            viewModel.uploadProfileImage(image: selectedImage!) { url in
                do{
                    Task{
                        viewModel.currentUser!.profileImageUrl = url
                        await viewModel.saveUserData(data: ["profileImageUrl" : url])
                    }
                }
                catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    func loadImage(){
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)
    }
}
//
//#Preview {
//    EditProfileView()
//}
