import Foundation

/**
 * Singleton provider for the event bus.
 * This allows setting the event bus before starting the app,
 * and other parts of the app can retrieve it when needed.
 */
public class EventBusProvider {
    private static var instance: DynamicEventBusInterface?

    /**
     * Set the event bus instance to be used.
     */
    public static func setEventBus(eventBus: DynamicEventBusInterface) {
        instance = eventBus
    }

    /**
     * Get the current event bus instance, if available.
     */
    public static func getEventBus() -> DynamicEventBusInterface? {
        return instance
    }

    // Private initializer to prevent direct instantiation
    private init() {}
}

