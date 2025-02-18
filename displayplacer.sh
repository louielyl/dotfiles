#!/bin/bash

# Store the display arrangements in variables
DISPLAY_ARRANGEMENT_1="displayplacer \"id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1800x1169 hz:120 color_depth:8 enabled:true scaling:on origin:(0,0) degree:0\" \"id:F942DB80-D7EF-4419-80AD-EF6CAF28F036 res:1200x1920 hz:120 color_depth:8 enabled:true scaling:off origin:(1800,-72) degree:270\""

DISPLAY_ARRANGEMENT_2="displayplacer \"id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1800x1169 hz:120 color_depth:8 enabled:true scaling:on origin:(0,0) degree:0\" \"id:F942DB80-D7EF-4419-80AD-EF6CAF28F036 res:1920x1200 hz:120 color_depth:8 enabled:true scaling:off origin:(-64,-1200) degree:0\""

# ASCII art for arrangements
ARRANGEMENT_1_ART="
[1] ┌───────┐┌──┐
    │   M   ││S1│
    └───────┘│  │
             └──┘
"

ARRANGEMENT_2_ART="
[2] ┌──────┐
    │  S1  │
    └──────┘
     │ M │   
     └───┘
"

# Function to show usage
show_usage() {
    echo "This script is for applying MacOS monitor display arrangement presents"
    echo "It requires the package [displayplacer](https://github.com/jakehilborn/displayplacer?tab=readme-ov-file)"
    echo "Usage: $0 [-i|--id] <number>"
    echo "Options:"
    echo "  -i, --id    Specify arrangement ID"
    echo -e "\nAvailable arrangements:"
    echo "$ARRANGEMENT_1_ART"
    echo "$ARRANGEMENT_2_ART"
    exit 1
}

# Check if we have the correct number of arguments
if [ "$#" -ne 2 ]; then
    show_usage
fi

# Parse command line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -i|--id)
            if [[ $2 =~ ^[0-9]+$ ]]; then
                ARRANGEMENT_ID="$2"
            else
                echo "Error: ID must be a number"
                exit 1
            fi
            shift
            ;;
        *)
            echo "Unknown parameter: $1"
            show_usage
            ;;
    esac
    shift
done

# Apply the selected arrangement
echo "Applied the following display arrangement:"
case $ARRANGEMENT_ID in
    1)
        eval "$DISPLAY_ARRANGEMENT_1"
        echo "$ARRANGEMENT_1_ART"
        ;;
    2)
        eval "$DISPLAY_ARRANGEMENT_2"
        echo "$ARRANGEMENT_2_ART"
        ;;
    *)
        echo "Error: Invalid arrangement ID. Please use 1 or 2."
        show_usage
        ;;
esac
