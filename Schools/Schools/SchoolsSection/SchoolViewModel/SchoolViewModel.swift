import Foundation
import Combine
import SwiftUI

class SchoolViewModel:ObservableObject{
   // var cancellabel: Set<Cancellable>?
    var cancell = Set<AnyCancellable>()
    @Published var list:[School] = []
    func fetch(){
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")  else{
            print("Linked is not valid")
            return
        }
        URLSession.shared.dataTaskPublisher(for: url).map{$0.data}.decode(type: [School].self, decoder: JSONDecoder()).receive(on: DispatchQueue.main).sink(receiveCompletion: { commpletion in
            switch commpletion{
            case .finished:
                print("done")
                break
            case .failure(let error):
                print(" we got error \(error)")
            }
        }, receiveValue: {[weak self] list in
            self?.list = list
        }).store(in: &cancell)
    }
}
