#######################################################################
# LANGUAGES SUPPORT
# Using this file you can manage configuration for
# language managers, like ASDF, PyENV, NodeEnv, etc.
#######################################################################

## ASDF -- Multi-runtime manager
source "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit
export PATH="$HOME/.asdf/shims:$HOME/.asdf/bin:$PATH"

## Where is your Android Studio folder?
#export ANDROID_STUDIO_HOME="/opt/android-studio"
#export ANDROID_HOME="/opt/android-sdk"

## Ok, don't change this
#export ANDROID_BINDIRS="$ANDROID_STUDIO_HOME/bin"
#export ANDROID_BINDIRS="$ANDROID_BINDIRS:$ANDROID_HOME/tools"
#export ANDROID_BINDIRS="$ANDROID_BINDIRS:$ANDROID_HOME/tools/bin"
#export ANDROID_BINDIRS="$ANDROID_BINDIRS:$ANDROID_HOME/platform-tools"
#export PATH="$ANDROID_BINDIRS:$PATH"

## Where is your JDK folder?
#export JDK_HOME="/usr/lib/jvm/java-1.11.0-openjdk-amd64"
#export JDK_HOME="/usr/lib/jvm/java-1.8.0-openjdk-amd64"
## Ok, don't change this
#export SDK_HOME="$JDK_HOME"
#export JAVA_HOME="$JDK_HOME"
#export JAVA_ROOT="$JDK_HOME"
#export JRE_HOME="$JDK_HOME/jre"
#export JAVA_BINDIR="$JDK_HOME/bin"
#export PATH="$JAVA_BINDIR:$PATH"

## Flutter and Dart configs
#export PATH="$PATH:/opt/flutter/bin"
#export PATH="$PATH:$HOME/.pub-cache/bin"
