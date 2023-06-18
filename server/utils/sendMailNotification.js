import { sendMailPromotion } from "./mail";

// Define the Subject (mail notification system)
class MailNotificationSystem {
  constructor() {
    this.observers = [];
  }

  addObserver(observer) {
    this.observers.push(observer);
  }

  removeObserver(observer) {
    this.observers = this.observers.filter((obs) => obs !== observer);
  }

  notifyObservers(promotion) {
    this.observers.forEach((observer) => {
      observer.update(promotion);
    });
  }

  sendPromotion(promotions, mail) {
    // Code to send the promotion via email
    // ...
    sendMailPromotion(mail, promotions);
    // Notify the observers about the promotion
    this.notifyObservers(promotions);
  }
}

// Define the Observer (promotion listener)
class PromotionListener {
  constructor() {
    // Initialize any necessary properties
  }

  update(promotion) {
    // Handle the received promotion
    console.log(`Received promotion: ${promotion}`);
    // ... Perform any other desired actions
  }
}

export function sendMailNotification(promotions, email) {
  // Usage example
  const notificationSystem = new MailNotificationSystem();

  const observer1 = new PromotionListener();

  notificationSystem.addObserver(observer1);

  // Simulate sending a promotion
  // const promotion = "Get 20% off on your next purchase!";
  notificationSystem.sendPromotion(promotions);

  // Output:
  // Received promotion: Get 20% off on your next purchase!
  // Received promotion: Get 20% off on your next purchase!
}
