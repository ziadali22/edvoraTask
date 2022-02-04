//
//  Network.swift
//  ProductsTask
//
//  Created by ziad on 02/02/2022.
//

import Foundation
class NetworkModel: ObservableObject{
    @Published var data:[DataModel] = []
    func fetch(completion: @escaping ([DataModel]) -> ()){
        guard let url = URL(string: "https://assessment-edvora.herokuapp.com") else { return  }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let productData = try JSONDecoder().decode([DataModel].self, from: data)
                DispatchQueue.main.async {
                    completion(productData)
                    self.data = productData
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}
