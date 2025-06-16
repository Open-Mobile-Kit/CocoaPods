import Foundation


// MARK: - Event Bus Connector

/**
 * A connector class for the DynamicEventBus system that provides a cleaner interface
 * for interacting with the event bus. Uses a builder pattern for configuration.
 */
public class DynamicEventBusConnector {

    private static let TAG = "EventBusConnector"

    private let eventBus: DynamicEventBusInterface
    private weak var eventListener: DynamicEventListener? // Use weak to avoid retain cycles

    private init(eventBus: DynamicEventBusInterface, eventListener: DynamicEventListener?) {
        self.eventBus = eventBus
        self.eventListener = eventListener
        if let listener = eventListener {
            self.eventBus.addEventListener(listener: listener)
        }
    }

    /**
     * Sends an event to all registered listeners
     *
     * @param eventType The type of the event
     * @param eventData The data associated with the event
     */
    public func dispatch(eventType: String, eventData: Any?) {
        eventBus.dispatch(eventType: eventType, eventData: eventData)
    }

    /**
     * Disconnects from the event bus, unregistering any listeners
     */
    public func disconnect() {
        do {
            if let listener = eventListener {
                try eventBus.removeEventListener(listener: listener)
            }
        } catch {
            // In Swift, Log.e equivalent would typically use os.Logger or a custom logging framework.
            // For simplicity, print to console.
            print("\(DynamicEventBusConnector.TAG): Error disconnecting from event bus - \\(error)")
        }
    }

    /**
     * Create a new builder for configuring a DynamicEventBusConnector
     */
    public static func builder() -> Builder {
        return Builder()
    }

    /**
     * Builder class for configuring a DynamicEventBusConnector
     */
    public class Builder {
        private var eventBus: DynamicEventBusInterface?
        private var eventListener: DynamicEventListener?

        /**
         * Set the event bus implementation to use
         */
        public func withEventBus(eventBus: DynamicEventBusInterface) -> Builder {
            self.eventBus = eventBus
            return self
        }

        /**
         * Set the event listener for receiving events
         */
        public func withEventListener(listener: DynamicEventListener) -> Builder {
            self.eventListener = listener
            return self
        }

        /**
         * Build the connector with the configured options
         * If no event bus is provided, it will throw an error.
         */
        public func build() throws -> DynamicEventBusConnector {
            guard let actualEventBus = eventBus else {
                // Swift's equivalent of IllegalStateException
                throw NSError(domain: "DynamicEventBusConnector.Builder",
                              code: 1,
                              userInfo: [NSLocalizedDescriptionKey: "DynamicEventBusInterface instance not provided."])
            }
            return DynamicEventBusConnector(eventBus: actualEventBus, eventListener: eventListener)
        }
    }
}

// Note: The EventBusProvider from Kotlin is not directly translated here.
// In Swift, dependency injection or a shared singleton instance (e.g., a static var on a class)
// are common ways to manage a shared event bus instance.
// The current Builder requires the eventBus to be explicitly provided.
