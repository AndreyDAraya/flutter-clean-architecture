#!/bin/bash

# Colors for messages
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Starting project compilation...${NC}\n"

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

# Analyze code
echo -e "${GREEN}3. Analyzing code...${NC}"
flutter analyze
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Code analysis completed without errors${NC}\n"
else
    echo -e "${YELLOW}⚠ There are warnings in the code analysis${NC}\n"
fi

# Build for Android
echo -e "${GREEN}4. Building APK...${NC}"
flutter build apk --release
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ APK built successfully${NC}"
    echo -e "${GREEN}  Location: build/app/outputs/flutter-apk/app-release.apk${NC}\n"
else
    echo -e "${RED}✗ Error building APK${NC}"
    exit 1
fi

echo -e "${GREEN}Build completed successfully!${NC}"
