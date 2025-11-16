import Foundation

func loadData() async {
    print("Loading data...")
    try? await Task.sleep(for: .seconds(1))
    print("Done loading")
}

func runTaskDemo() {
    Task {
        await loadData()
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 2))
}
