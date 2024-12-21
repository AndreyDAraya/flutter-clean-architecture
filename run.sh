#!/bin/bash

# Colors for messages
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Starting project in development mode...${NC}\n"

# Update dependencies
echo -e "${GREEN}1. Updating dependencies...${NC}"
flutter pub get
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Dependencies updated successfully${NC}\n"
else
    echo -e "${RED}✗ Error updating dependencies${NC}"
    exit 1
fi

# Generate code
echo -e "${GREEN}2. Generating code...${NC}"
dart run build_runner build --delete-conflicting-outputs
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Code generated successfully${NC}\n"
else
    echo -e "${RED}✗ Error generating code${NC}"
    exit 1
fi

# Run the application in development mode
echo -e "${GREEN}3. Starting the application...${NC}"
flutter run --debug
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Application started successfully${NC}\n"
else
    echo -e "${RED}✗ Error starting the application${NC}"
    exit 1
fi
