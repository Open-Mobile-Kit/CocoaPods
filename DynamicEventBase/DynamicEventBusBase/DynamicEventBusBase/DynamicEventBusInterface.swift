
// MARK: - Event Listener Protocol

/**
 * Protocol for classes that want to listen to events from the DynamicEventBus system.
 */
public protocol DynamicEventListener: AnyObject { // AnyObject for class-bound protocol
    func onEventReceived(eventType: String, eventData: Any?)
}

// MARK: - Event Bus Interface Protocol

/**
 * Protocol defining the core functionality of the DynamicEventBus system.
 * This allows for easier mocking in tests and alternative implementations.
 */
public protocol DynamicEventBusInterface: AnyObject { // AnyObject for class-bound protocol
    /**
     * Register a listener to receive events
     */
    func addEventListener(listener: DynamicEventListener)

    /**
     * Unregister a previously registered listener
     */
    func removeEventListener(listener: DynamicEventListener) throws

    /**
     * Dispatches an event with type and data to all registered listeners
     */
    func dispatch(eventType: String, eventData: Any?)
}