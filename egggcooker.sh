#!/bin/bash

# 1. Check if you forgot to type an argument
if [ -z "$1" ]; then
    echo "❌ Please specify how you want your egggs: eggg [runny|medium|hard]"
    exit 1
fi

# 2. Map the egg type to seconds
case "$1" in
    runny)
        seconds=240 # 4 minutes
        echo "🥚 Preparing the ultimate RUNNY eggg..."
        ;;
    medium)
        seconds=420 # 7 minutes
        echo "🥚 Preparing a perfect MEDIUM jammy eggg..."
        ;;
    hard)
        seconds=600 # 10 minutes
        echo "🥚 Preparing a solid HARD-BOILED eggg..."
        ;;
    *)
        echo "❌ Unknown style. Please choose: runny, medium, or hard."
        exit 1
        ;;
esac

echo "🔥 Drop the egggs in the boiling water now!"

# 3. The Countdown Loop
while [ $seconds -gt 0 ]; do
    # Formats the seconds into a nice MM:SS clock format updated in-place
    printf "\r⏳ Time remaining: %02d:%02d" $((seconds/60)) $((seconds%60))
    sleep 1
    ((seconds--))
done

# 4. The Finish Alerts (macOS specific)
echo -e "\n\n🍳 DONE! Get those egggs into ice water immediately!"

# Play a system chime
afplay /System/Library/Sounds/Glass.aiff
# Mac text-to-speech voice
say "Your egggs are ready."
# Send a desktop notification banner
osascript -e 'display notification "Take the egggs out of the heat!" with title "🍳 Eggg Cooker"'
