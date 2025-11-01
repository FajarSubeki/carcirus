# 🚗 CarCircus – Car Rental Mobile App

CarCircus is a modern **car rental mobile application** built using **Flutter**, designed with a **Clean Architecture**, **reusable components**, and a **responsive UI** for an optimal user experience across devices.

---

## ✨ Features

### 🏠 Home Screen
- Displays a promotional banner.
- Highlights benefits of renting via CarCircus.
- Step-by-step guide on how to rent a car.

### 📅 Pick-Up Date
- Custom **Date Picker** for selecting rental start date.
- Styled with a consistent, reusable `DateTimePicker` component.

### 🕒 Pick-Up Time
- Custom **Cupertino Time Picker** with styled selection lines.
- Smooth and native-like scrolling experience.

### 🚘 Pick a Car
- Browse and select from available car options.
- Highlights the selected car using visual feedback.

### 💬 Custom Popup Dialog
- Reusable custom dialog component for:
  - Booking success confirmation
  - Booking restrictions (e.g., ongoing rental)
- Fully customizable title, description, and button actions.

---

## 🧱 Architecture

CarCircus is structured using **Clean Architecture**, ensuring:
- **Separation of concerns** between UI and data layers.
- **Testability** and **scalability** for future feature additions.
- **Reusability** of components across different screens.


## 🖼️ Screenshots

<div align="center">
  <img src="assets/screenshots/home.png" width="30%" />
  <img src="assets/screenshots/date_picker.png" width="30%" />
  <img src="assets/screenshots/time_picker.png" width="30%" />
</div>

<div align="center">
  <img src="assets/screenshots/pick_car.png" width="30%" />
  <img src="assets/screenshots/popup_success.png" width="30%" />
  <img src="assets/screenshots/popup_warning.png" width="30%" />
</div>

## 🛠️ Tech Stack

- **Flutter** (Dart)
- **Clean Architecture Pattern**
- **Cupertino Widgets**
- **Custom Reusable UI Components**
