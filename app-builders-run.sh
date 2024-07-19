#!/bin/bash
# App Builders
# Command line build / launch and desktop launch wrapper
# Use the '-?'' option at the end or see the document
# 'Building Apps' for more information
echo "Running app-builders in:"
echo $( pwd )
echo $( /app/jre/bin/java -version )
# echo $( /app/jdk17.0.11/bin/javac -version )
echo $( python3 --version )
echo $( which python3 )
# echo $( python3 -m aeneas.diagnostics )
echo " "
echo "$@"
echo " "
# App select
if [[ -n $1 ]]; then

    PACKAGE="$1"
    
    if [[ ("$PACKAGE" == " " || "$PACKAGE" == -*) ]]; then
        exec /app/jre/bin/java --module-path "/app/lib/sdk" --add-modules javafx.web,javafx.fxml,javafx.swing,javafx.media --add-opens=javafx.fxml/javafx.fxml=ALL-UNNAMED -jar /app/app-builders/bin/scripture-app-builder.jar $@
    elif [[ "$PACKAGE" = "scripture-app-builder" ]]; then
        shift
        exec /app/jre/bin/java --module-path "/app/lib/sdk" --add-modules javafx.web,javafx.fxml,javafx.swing,javafx.media --add-opens=javafx.fxml/javafx.fxml=ALL-UNNAMED -jar /app/app-builders/bin/$PACKAGE.jar $@
    elif [[ "$PACKAGE" == "reading-app-builder" ]]; then
        shift
        exec /app/jre/bin/java --module-path "/app/lib/sdk" --add-modules javafx.web,javafx.fxml,javafx.swing,javafx.media --add-opens=javafx.fxml/javafx.fxml=ALL-UNNAMED -jar /app/app-builders/bin/$PACKAGE.jar $@
    elif [[ "$PACKAGE" == "keyboard-app-builder" ]]; then
        shift
        exec /app/jre/bin/java --module-path "/app/lib/sdk" --add-modules javafx.web,javafx.fxml,javafx.swing,javafx.media --add-opens=javafx.fxml/javafx.fxml=ALL-UNNAMED -jar /app/app-builders/bin/$PACKAGE.jar $@
    elif [[ "$PACKAGE" == "dictionary-app-builder" ]]; then
        shift
        exec /app/jre/bin/java --module-path "/app/lib/sdk" --add-modules javafx.web,javafx.fxml,javafx.swing,javafx.media --add-opens=javafx.fxml/javafx.fxml=ALL-UNNAMED -jar /app/app-builders/bin/$PACKAGE.jar $@
    else
        echo "Did you misspell something?"
        echo "Launch options : (use '-?' after app name for info on '-COMMANDS')"
        echo "... org.sil.app-builders (default: sab)"
        echo "... org.sil.app-builders [-COMMANDS]..."
        echo "... org.sil.app-builders scripture-app-builder"
        echo "... org.sil.app-builders scripture-app-builder [-COMMANDS']..."
        echo "... org.sil.app-builders reading-app-builder"
        echo "... org.sil.app-builders reading-app-builder [-COMMANDS']..."
        echo "... org.sil.app-builders keyboard-app-builder"
        echo "... org.sil.app-builders keyboard-app-builder [-COMMANDS']..."
        echo "... org.sil.app-builders dictionary-app-builder"
        echo "... org.sil.app-builders dictionary-app-builder [-COMMANDS']..."
    fi

else
    exec /app/jre/bin/java --module-path "/app/lib/sdk" --add-modules javafx.web,javafx.fxml,javafx.swing,javafx.media --add-opens=javafx.fxml/javafx.fxml=ALL-UNNAMED -jar /app/app-builders/bin/scripture-app-builder.jar $@
fi
