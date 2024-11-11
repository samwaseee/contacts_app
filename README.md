
# Contact App

A simple and intuitive Contact Management application built with Flutter and Firebase. This app enables users to manage their contacts with features like adding, editing, deleting, and calling contacts directly from the app.

## Features

- **Add Contacts**: Add new contacts with details like name, phone number, email, and address.
- **Edit Contacts**: Edit existing contact details.
- **Delete Contacts**: Delete contacts from the list with a confirmation prompt.
- **Call Contacts**: Make direct phone calls to contacts from within the app.
- **Real-Time Data Storage**: Data is stored and retrieved in real-time using Firebase.
- **Snackbar Notifications**: User feedback with Snackbars for success and error messages.
- **Validation**: Input validation for contact details, including phone number length and optional email format.

## Technology Stack

- **Flutter**: Used for building the UI and app structure.
- **GetX**: State management, routing, and dependency injection.
- **Firebase**: Firebase Realtime Database for data storage.
- **Fluttertoast**: Notifications for user actions.

## Screenshots

![Untitled Project(4)](https://github.com/user-attachments/assets/0d1d679e-dbe0-4f99-a81a-d4fc8db68561)

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/contact-app.git
   cd contact-app
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Set up Firebase**:
    - Create a Firebase project at [Firebase Console](https://firebase.google.com/).
    - Enable Realtime Database and configure rules as needed.
    - Download the `google-services.json` file and place it in the `android/app` directory.

4. **Run the app**:
   ```bash
   flutter run
   ```

## Usage

- **Adding a Contact**: Click the "+" icon on the home page. Fill in the contact information and click "Save".
- **Editing a Contact**: Tap the "Edit" button on a contact card, make necessary changes, and save.
- **Deleting a Contact**: Click the trash icon on a contact card, confirm deletion in the popup dialog.
- **Calling a Contact**: Tap the phone icon next to a contact's phone number to initiate a call.

## Code Structure

- **Controllers**: Contains `ContactController` for managing app state and Firebase operations.
- **Models**: Defines the `Contact` model for contact data structure.
- **Pages**: Includes main UI pages (`home_page`, `add_contact_page`).
- **Theme**: Contains app-wide color scheme and styling.

## Dependencies

- `firebase_core`: ^3.6.0
- `firebase_database`: ^11.1.4
- `get`: ^4.6.6
- `fluttertoast`: ^8.2.8
- `url_launcher`: Latest version for making phone calls
