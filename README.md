# ✈️ TravelBuddy

A modern iOS travel planning application built with **SwiftUI**, **Firebase**, and **Apple MapKit**. TravelBuddy allows users to securely manage trips, visualize travel routes on a map, and organize their journeys with a clean and intuitive interface.

---

## 📱 Screenshots

### Authentication

| Login | Register |
|--------|----------|
| ![Login Screen](<img width="277" height="579" alt="Screenshot 2026-07-16 at 11 04 48 AM" src="https://github.com/user-attachments/assets/82f40a0a-70f3-49d9-8ef3-1c27e228f95e" />
) | ![Register Screen](<img width="280" height="577" alt="Screenshot 2026-07-16 at 11 05 37 AM" src="https://github.com/user-attachments/assets/c469a191-1f0e-4899-a524-7da8548a3a64" />
) |

---

### Add Trip

| Add Trip |
|----------|
| ![Add Trip](<img width="278" height="578" alt="Screenshot 2026-07-16 at 11 07 59 AM" src="https://github.com/user-attachments/assets/d84d96de-3a03-4418-a24f-1889ac2a84cb" />
) |

---

## ✨ Features

### 🔐 Authentication
- Email & Password Authentication
- Google Sign-In
- User Registration
- Secure Logout using Firebase Authentication

### 🧳 Trip Management
- Create New Trips
- View Trip Details
- Update Existing Trips
- Delete Trips
- Cloud Firestore Data Storage

### 🗺️ Apple Maps Integration
- Search Start Location
- Search Destination
- Apple Maps Search Suggestions
- Route Visualization
- Start & Destination Markers
- Travel Distance Calculation

### 📋 Trip Information
- Trip Title
- Budget
- Start & Destination
- Travel Dates
- Notes

### 🎨 User Experience
- Clean SwiftUI Interface
- Reusable Components
- Form Validation
- Save Button Validation
- Responsive Card-Based Layout
- Real-time Firestore Updates

---

## 🛠️ Tech Stack

- Swift
- SwiftUI
- Firebase Authentication
- Cloud Firestore
- Apple MapKit
- MVVM-inspired Architecture

---

## 📂 Project Structure

```text
TravelBuddy
│
├── Managers
│   ├── AuthManager.swift
│   ├── TripManager.swift
│   ├── SearchManager.swift
│   └── MapManager.swift
│
├── Models
│   └── Trip.swift
│
├── Views
│   ├── Authentication
│   │   ├── LoginView.swift
│   │   └── RegisterView.swift
│   │
│   ├── Home
│   │   ├── HomeView.swift
│   │   ├── TripCardView.swift
│   │   └── TripDetailView.swift
│   │
│   ├── Trip
│   │   └── AddTripView.swift
│   │
│   └── Components
│       ├── CustomTextField.swift
│       ├── PrimaryButton.swift
│       ├── LocationSearchView.swift
│       └── RouteMapView.swift
│
├── Assets.xcassets
├── GoogleService-Info.plist
└── TravelBuddyApp.swift
```

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/TravelBuddy.git
```

### 2. Open the Project

Open `TravelBuddy.xcodeproj` in **Xcode**.

### 3. Configure Firebase

- Create a Firebase Project
- Add an iOS App
- Download `GoogleService-Info.plist`
- Add the file to the Xcode project

Enable:

- Email/Password Authentication
- Google Authentication
- Cloud Firestore

### 4. Build & Run

Run the application on an iOS Simulator or a physical device.

---

## 📚 Concepts Implemented

- SwiftUI
- NavigationStack
- Forms
- Lists
- Custom Views
- State Management
- Singleton Pattern
- ObservableObject
- MVVM-inspired Architecture
- Firebase Authentication
- Cloud Firestore CRUD Operations
- Apple MapKit
- MKLocalSearch
- MKDirections
- Route Rendering
- Form Validation

---

## 🔮 Future Improvements

- Edit Trip Details
- Grid/List Toggle
- Search & Filter Trips
- Trip Images
- Favorite Trips
- Travel Expense Tracking
- Weather Forecast Integration
- Offline Data Support
- Dark Mode Enhancements

---

## 👩‍💻 Author

**Anjali Minakshi**

This project was built as a hands-on learning project to strengthen iOS development skills using **SwiftUI**, **Firebase**, and **Apple MapKit** while implementing real-world application architecture and features.

---

### ⭐ If you found this project useful, consider giving it a star!
