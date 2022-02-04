//
//  ContentView.swift
//  ProductsTask
//
//  Created by ziad on 01/02/2022.
//

import SwiftUI
struct ContentView: View {
    @State var products: [DataModel] = []
    @State var isloading = true
    let coulmens: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    @EnvironmentObject var network: NetworkModel
    var body: some View {
        ZStack{
            Color(.displayP3, red: 0.16249999403953552, green: 0.16249999403953552, blue: 0.16249999403953552, opacity: 1)
                .edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false){
                VStack(spacing: 16){
                    HStack{
                        Text("Edvora")
                            .font(.system(size: 35))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, x: 0, y: 4)
                            .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    HStack{
                        Menu{
                            Button(action: {}, label: {
                                Label(title: {Text("Products")},
                                      icon: {Image("arrowDown")})
                                Menu{
                                    ForEach(network.data){ item in
                                        Text(item.brandName)
                                    }
                                }label: {
                                    Label(title: {Text("Filters")},
                                          icon: {Image("arrowDown")})
                                }.font(.system(size: 20))
                            })
                            Button(action: {}, label: {
                                Label(title: {Text("State")},
                                      icon: {Image("arrowDown")})
                                Menu{
                                    ForEach(network.data){ item in
                                        Text(item.address.state)
                                    }
                                }label: {
                                    Label(title: {Text("Filters")},
                                          icon: {Image("arrowDown")})
                                }.font(.system(size: 20))
                            })
                            Button(action: {}, label: {
                                Label(title: {Text("City")},
                                      icon: {Image("arrowDown")})
                                Menu{
                                    ForEach(network.data){ item in
                                        Text(item.address.city)
                                    }
                                }label: {
                                    Label(title: {Text("Filters")},
                                          icon: {Image("arrowDown")})
                                }.font(.system(size: 20))
                            })
                        }
                    label: {
                        Label(title: {Text("Filters")},
                              icon: {Image("arrowDown")})
                    }.font(.system(size: 20))
                        
                            .foregroundColor(Color(red: 0.65, green: 0.65, blue: 0.65, opacity: 1))
                            .padding()
                            .frame(width: 168.45, height: 37.5, alignment: .leading)
                            .background(Color.black.opacity(0.4))
                            .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                        Spacer()
                        Button(action: {}, label: {
                            Text("Clear Filter")
                                .font(.system(size: 16))
                        })
                            .foregroundColor(.white)
                        
                            .frame(width: 80, height: 30)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                        
                    }.padding(.all)
                    VStack(spacing: 0){
                        VStack{
                            
                            Text("Shoes")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Divider().background(Color.white).padding()
                            let layout = [
                                GridItem(.flexible(minimum: 250)),
                                
                            ]
                            ScrollView(.horizontal, showsIndicators: false){
                                LazyHGrid(rows: layout, spacing: 20){
                                    ForEach(network.data) { item in
                                        VStack(alignment: .leading){
                                            HStack(alignment: .top ){
                                                Image("first")
                                                    .data(url: URL(string: item.image)!)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                                    .frame(width: 70, height: 70)
                                                    .padding(.horizontal)
                                                Spacer()
                                                VStack(alignment: .leading, spacing: 8){
                                                    Text(item.productName)
                                                        .lineLimit(0)
                                                    Text(item.brandName)
                                                        .foregroundColor(.gray)
                                                    Text("$\(item.price)")
                                                    
                                                }
                                                .foregroundColor(.white)
                                                
                                            }
                                            .padding()
                                            HStack{
                                                Text(item.address.city)
                                                Spacer()
                                                Text("Date:\(item.date)")
                                                    .font(.system(size: 11))
                                            }
                                            .foregroundColor(.gray)
                                            .padding(10)
                                            Text(item.discription)
                                                .padding()
                                                .foregroundColor(.gray)
                                        }
                                        .background(Color.black)
                                        .cornerRadius(10)
                                        .padding(20)
                                        
                                    }
                                }
                            }
                            Text("Shoes")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Divider().background(Color.white).padding()
                            ScrollView(.horizontal, showsIndicators: false){
                                LazyHGrid(rows: layout, spacing: 20){
                                    ForEach(products ) { item in
                                        VStack(alignment: .leading){
                                            HStack(alignment: .top ){
                                                Image("first")
                                                    .data(url: URL(string: item.image)!)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                                    .frame(width: 70, height: 70)
                                                    .padding(.horizontal)
                                                Spacer()
                                                VStack(alignment: .leading, spacing: 8){
                                                    Text(item.productName)
                                                        .lineLimit(0)
                                                    Text(item.brandName)
                                                        .foregroundColor(.gray)
                                                    Text("$\(item.price)")
                                                    
                                                }
                                                .foregroundColor(.white)
                                                
                                            }
                                            .padding()
                                            HStack{
                                                Text(item.address.city)
                                                Spacer()
                                                Text("Date:\(item.date)")
                                                    .font(.system(size: 11))
                                            }
                                            .foregroundColor(.gray)
                                            .padding(10)
                                            Text(item.discription)
                                                .padding()
                                                .foregroundColor(.gray)
                                        }
                                        .background(Color.black)
                                        .cornerRadius(10)
                                        .padding(20)
                                        
                                    }
                                }
                            }
                        }
                        
                        if isloading{
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .scaleEffect(3)
                        }
                        
                        
                        
                        
                    }
                }
            }
            
        }
        .onAppear {
            network.fetch { pro in
                self.products = pro
                self.isloading = false
            }
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(NetworkModel())
    }
}
