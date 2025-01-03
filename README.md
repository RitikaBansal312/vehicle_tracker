# 🚗 **Vehicle Tracker App**

Real-time vehicle tracking application built with **Flutter**, integrated with **Firebase Realtime Database** and **GetX** for state management. The app provides live updates of vehicle locations on a map without requiring screen refresh.

---

## 📋 **Features**
- 📍 **Real-Time Vehicle Location Tracking**: Displays live vehicle locations on an interactive map.
- 🔄 **Live Updates**: Automatic updates without manual screen refresh.
- 🔑 **Firebase Authentication**: Secure login and user management.
- 🔔 **Firebase Notifications**: Real-time alerts and notifications.
- 🗺️ **Custom Map Markers**: Display vehicle-specific icons and details.

---

## 🛠️ **Technologies Used**
- **Flutter** (Frontend UI)
- **Firebase Realtime Database** (Data Storage)
- **GetX** (State Management)
- **Google Maps API** (Map Integration)

---

## 📂 **Folder Structure**
```plaintext
lib/
├── controllers/      # GetX Controllers
├── models/           # Data Models
├── views/            # UI Screens
├── services/         # Firebase and Backend Services
├── utils/            # Utility Functions and Constants
├── main.dart         # Entry Point
```

---

## 🚀 **Getting Started**

### Prerequisites
- Flutter SDK
- Firebase Project Set Up
- Google Maps API Key

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/RitikaBansal312/vehicle_tracker.git
   ```
2. Navigate to the project directory:
   ```bash
   cd vehicle_tracker
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Configure Firebase in your app:
   - Add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS).
5. Run the app:
   ```bash
   flutter run
   ```

---

## ⚙️ **Firebase Realtime Database Structure**
```json
{
  "vehicles": {
    "vehicle_id": {
      "name": "Vehicle Name",
      "latitude": 12.3456,
      "longitude": 78.9012,
      "icon": "icon_url"
    }
  }
}
```

---

## 🐞 **Known Issues**
- Ensure stable internet connection for real-time updates.
- Properly configure Firebase permissions.

---

## 🤝 **Contributing**
Feel free to fork the repository and submit pull requests. Contributions are always welcome!

---

## 📄 **License**
This project is licensed under the **MIT License**.

---

## 📬 **Contact**
- **Developer:** Ritika Bansal
- **Email:** [Your Email Address]
- **GitHub:** [https://github.com/RitikaBansal312](https://github.com/RitikaBansal312)

Happy Tracking! 🚀🌍
