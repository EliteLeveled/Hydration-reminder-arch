# Hydration-reminder-arch
A simple, automatic bash script serving as a hydration reminder tool that notifies the user to drink water at regular 40min intervals.

## IMPORTANT
- This is one of my first projects so i used chatgpt to help me make the code understandable and add echo and comments
- You must have `dunstify` installed on your system for displaying notifications.
- You can adjust the sleep time i.e. the time in which the notification will be displayed again its by default set to 40min
- The process to autorun this script can vary, so please google 
## Features
- **Automatic Reminders:** Receive notifications that remind you to take a break and drink water.
- **Customizable Target:** Set your hydration goal in milliliters to match your personal needs its by default set to 2000ml.
- **User Interaction:** This script allows user interaction by sending a notification with 2 options i.e. first to confirm water intake and second to reset hydration progress.

## Usage
1. **Set up Variables:**
   - Adjust the `TARGET_PROGRESS` variable to your desired daily water intake goal in milliliters.
   - Modify the `INTERVAL` variable to change the reminder interval in seconds.

2. **Run the Script:**
   - Execute the below mentioned code in your terminal to start receiving hydration reminders.

```bash
chmod +x hydration-reminder.sh
```
```bash
./hydration-reminder.sh
```


















Feel free to contribute, modify, or customize the script according to your needs. Stay hydrated and stay healthy!
