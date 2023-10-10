//
//  NotificationView.swift
//  BeRealClone
//
//  Created by Duy Huỳnh Nguyễn Tuấn on 09/10/2023.
//

import SwiftUI

struct NotificationView: View {
    @State var mentions = false
    @State var comments = false
    @State var friendRequests = false
    @State var lateBeReal = false
    @State var realMojis = false
    @State var buttonActive = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            ZStack{
                Color.black.ignoresSafeArea()
                VStack{
                    ZStack{
                        Text("Notification")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        HStack{
                            Button{
                                dismiss()
                            }label: {
                                Image(systemName: "arrow.backward")
                                    .font(.system(size: 20))
                            }
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                }
                .foregroundColor(.white)
                VStack{
                    VStack{
                        HStack{
                            Text("On BeReal, you 're in control of your push notifications.")
                            Spacer()
                        }
                        HStack{
                            Text("You can choose the type of notifications you want to receive.")
                            Spacer()
                        }
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    VStack(spacing: 14){
                        VStack{
                            NotificationsButtonView(icon: "person.crop.square.filled.and.at.rectangle", text: "Mentions", toggle: $mentions)
                            HStack{
                                Text("Someone mentioned you on other's BeReal")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }
                        VStack{
                            NotificationsButtonView(icon: "bubble.left.fill", text: "Comments", toggle: $comments)
                            HStack{
                                Text("Someone commented on your BeReal.")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }
                        VStack{
                            NotificationsButtonView(icon: "person.2.fill", text: "Friend requests", toggle: $friendRequests)
                            HStack{
                                Text("Someone just send you a send request")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }
                        VStack{
                            NotificationsButtonView(icon: "timer", text: "Late BeReal", toggle: $lateBeReal)
                            HStack{
                                Text("Someone just posted late")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }
                        VStack{
                            NotificationsButtonView(icon: "face.smiling.fill", text: "RealMojis", toggle: $realMojis)
                            HStack{
                                Text("Someone just reacted to your BeReal")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                Spacer()
                            }
                        }
                    }
                    .padding(.top, 8)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top,50)
                VStack{
                    Spacer()
                    WhiteButtonView(buttonActive: $buttonActive, text: "Save")
                        .onChange(of: mentions || comments || friendRequests || lateBeReal || realMojis) { _ in
                            self.buttonActive = true
                        }
                }
            }
        }
    }
}

#Preview {
    NotificationView()
}
