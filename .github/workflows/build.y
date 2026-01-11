name: Build Fabric Mod

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-java@v4
        with:
          distribution: 'temurin'
          java-version: '17'
      - name: Grant execute permission
        run: chmod +x gradlew
      - name: Build
        run: ./gradlew build
      - name: Upload Jar
        uses: actions/upload-artifact@v4
        with:
          name: mod-jar
          path: build/libs/*.jar
