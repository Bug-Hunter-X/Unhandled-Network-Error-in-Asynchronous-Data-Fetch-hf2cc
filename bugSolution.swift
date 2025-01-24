func fetchData(completion: @escaping (Result<[Data], Error>) -> Void) {
    // Simulate network request
    DispatchQueue.global().asyncAfter(deadline: .now() + 2) { 
        let success = Bool.random()
        if success {
            completion(.success([Data(count: 10), Data(count: 20)]))
        } else {
            let error = NSError(domain: "Network error", code: -1, userInfo: [NSLocalizedDescriptionKey: "Network request failed"])
            completion(.failure(error))
        }
    }
}

func handleFetchDataResult(result: Result<[Data], Error>) {
    switch result {
    case .success(let dataArray):
        // Process successful data
        print("Successfully fetched data:", dataArray.map { $0.count })
    case .failure(let error):
        // Handle errors more gracefully
        print("Error fetching data:", error.localizedDescription)
        // Implement retry logic or other error recovery mechanisms here
    }
}

fetchData { result in
    handleFetchDataResult(result: result)
}