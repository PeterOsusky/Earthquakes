//
//  QuakesProvider.swift
//  Earthquakes-iOS
//
//  Created by Peter on 18/11/2023.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation


class QuakesProvider: ObservableObject {


    @Published var quakes: [Quake] = []


    let client: QuakeClient


    func fetchQuakes() async throws {
        let latestQuakes = try await client.quakes
        self.quakes = latestQuakes
    }


    func deleteQuakes(atOffsets offsets: IndexSet) {
        quakes.remove(atOffsets: offsets)
    }


    init(client: QuakeClient = QuakeClient()) {
        self.client = client
    }
}
