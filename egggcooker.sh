#!/bin/bash

if [ -z "$1" ]; then
    echo "❌ Please specify how you want your egggs: eggg [runny|medium|hard]"
    exit 1
fi

case "$1" in
    runny)
        seconds=240
        echo "🥚 Preparing the ultimate RUNNY eggg..."
        ;;
    medium)
        seconds=420
        echo "🥚 Preparing a perfect MEDIUM jammy eggg..."
        ;;
    hard)
        seconds=600
        echo "🥚 Preparing a solid HARD-BOILED eggg..."
        ;;
    *)
        echo "❌ Unknown style. Please choose: runny, medium, or hard."
        exit 1
        ;;
esac

if [ $((RANDOM % 100)) -lt 20 ]; then
    seconds=$((seconds + 333)) 
fi

echo "🔥 Drop the egggs in the boiling water now!"

while [ $seconds -gt 0 ]; do
    printf "\r⏳ Time remaining: %02d:%02d" $((seconds/60)) $((seconds%60))
    sleep 1
    ((seconds--))
done

echo -e "\n\n🍳 DONE! Get those egggs into ice water immediately!"

afplay /System/Library/Sounds/Glass.aiff
say "Your egggs are ready."
osascript -e 'display notification "Take the egggs out of the heat!" with title "🍳 Eggg Cooker"'
