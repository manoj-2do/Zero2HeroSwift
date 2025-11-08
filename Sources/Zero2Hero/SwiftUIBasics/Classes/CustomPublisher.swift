import Foundation

class CustomPublisher<T> {
    private var observers: [UUID: (T) -> Void] = [:]
    private let lock = NSLock()

    func subscribe(_ observer: @escaping (T) -> Void) -> CustomCancellable {
        let id = UUID()
        lock.lock()
        observers[id] = observer
        lock.unlock()

        return CustomCancellable { [weak self] in 
            self?.lock.lock()
            self?.observers.removeValue(forKey: id)
            self?.lock.unlock()
        }   
    }

    func unsubscribe(_ id: UUID) {
        observers.removeValue(forKey: id)
    }

    func publish (_ value: T) {
        lock.lock()
        let currentObservers = observers.values
        lock.unlock()

        for observer: (T) -> Void in currentObservers {
            observer(value)
        }
    }
} 

final class CustomCancellable {
    private var onCancel: () -> Void
    private var isCancelled = false

    init(onCancel: @escaping () -> Void) {
        self.onCancel = onCancel;
    }

    func cancel() {
        guard !isCancelled else { return }
        isCancelled = true
        onCancel()
    }

    deinit {
        cancel()
    }
}