#!/bin/bash

echo "Step 1: Setting up variables"
HYDRATION_PROGRESS=0
TARGET_PROGRESS=2000  # Target in milliliters
INTERVAL=2400  # Interval in seconds

while true; do
  echo "Step 2: Displaying a notification to drink water"

  # Use dunstify to display a notification with rofi buttons
  RESPONSE=$(dunstify -u critical -i "glass" -t 360000 "Hydration Reminder" "It's time to drink water!\nDid you drink 250ml of water?" --replace=101 --action="Yes,drink_water" --action="Reset,reset_water")

  echo "Waiting for user response..."
  sleep 5  # Adjust this sleep time based on the time you're willing to wait for user response
  echo "User response: $RESPONSE"

  # Check if the user responded with "Reset"
  if [[ "$RESPONSE" == *"Reset"* ]]; then
    # Reset the progress to 0
    HYDRATION_PROGRESS=0
    dunstify -u normal -i "glass" -t 4000 "Hydration Progress Reset" "Your Hydration Progress was reset to \n 0L / $TARGET_PROGRESS L"
    echo "Hydration progress reset to 0"
  else
    # Update the variable with the new progress
    HYDRATION_PROGRESS=$((HYDRATION_PROGRESS + 250))

    percentage=$((HYDRATION_PROGRESS * 100 / TARGET_PROGRESS))
    progress_liters=$(echo "scale=2; $HYDRATION_PROGRESS / 1000" | bc)
    target_liters=$(echo "scale=2; $TARGET_PROGRESS / 1000" | bc)
    echo "Current Progress: $percentage% ($progress_liters L / $target_liters L)"

    # Display a second notification with the updated progress in percentage and liters
    dunstify -u normal -i "glass" -t 4000 "Hydration Progress" "Current Progress: $percentage% ($progress_liters L / $target_liters L)" --replace=102
  fi

  echo "Waiting for $INTERVAL seconds before the next reminder..."
  sleep $INTERVAL
done

