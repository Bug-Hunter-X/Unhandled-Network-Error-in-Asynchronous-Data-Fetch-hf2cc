func fetchData(completion: @escaping (Result<[Data], Error>) -> Void) {
    // Simulate network request
    DispatchQueue.global().asyncAfter(deadline: .now() + 2) { 
        let success = Bool.random()
        if success {
            completion(.success([Data(count: 10), Data(count: 20)]))
        } else {
            completion(.failure(NSError(domain: "Network error", code: -1, userInfo: nil)))
        }
    }
}