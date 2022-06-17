#! /usr/bin/bash

VARIANTS=('Light' 'Dark')
COLORS=('fbfbfa' '3F3538')

mkdir -p aurorae/themes/

for i in "${!VARIANTS[@]}"; do
  TYPE="${VARIANTS[$i]}"

  rm -rf aurorae/themes/IMAS"$TYPE"
  cp -r materia-kde/aurorae/themes/Materia-"$TYPE" aurorae/themes/IMAS"$TYPE"
  mv aurorae/themes/IMAS"$TYPE"/Materia-"$TYPE"rc aurorae/themes/IMAS"$TYPE"/IMAS"$TYPE"rc

  sed -i 's/Materia-/IMAS/g' aurorae/themes/IMAS"$TYPE"/metadata.desktop
  sed -i 's/Materia/IMAS/g' aurorae/themes/IMAS"$TYPE"/metadata.desktop
  sed -i -E "s/style=\"fill:#.{6}\" d=/style=\"fill:#${COLORS[$i]}\" d=/g" aurorae/themes/IMAS"$TYPE"/decoration.svg
done

rm -rf plasma/desktoptheme/Materia-Color-Icon-Only
mkdir -p plasma/desktoptheme/Materia-Color-Icon-Only

SOURCE=materia-kde/plasma/desktoptheme/Materia-Color
TARGET=plasma/desktoptheme/Materia-Color-Icon-Only
cp -r $SOURCE/icons $SOURCE/AUTHORS $SOURCE/LICENSE $SOURCE/metadata.desktop $TARGET
sed -i 's/Materia Color/Materia Color Icons Only/g' $TARGET/metadata.desktop
sed -i 's/Materia-Color/Materia-Color-Icons-Only/g' $TARGET/metadata.desktop
