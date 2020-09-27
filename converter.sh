#!/bin/bash

package="imagemagick"

converter () {
    echo -e "\nPerforming Image conversion. Please be patient...\n"

    mogrify -format png *.jpg

    if [ -d ~/Desktop/Image ]; then

        mv *.png ~/Desktop/Image

        echo -e "Image conversion successful. Please check ~/Desktop/Image directory\n"

    elif [ ! -d ~/Desktop/Image ]; then

        mkdir ~/Desktop/Image
        mv *.png ~/Desktop/Image

        echo -e "Image conversion successful. Please check ~/Desktop/Image directory\n"

    else
        echo -e "Error Occured!\n"
    fi
}

dpkg -s $package &> /dev/null

if [ $? -eq 0 ]; then
    echo "'Imagemagick' package is installed in the System!"
    
    converter

else
    echo "'Imagemagick' package is not installed!"
    
    echo -e "\nThe program wants to install the 'Imagemagick' package. Please enter your password to perform Update and Install the package.\n"

    sudo apt-get update
    sudo apt-get install $package -y

    converter
    
fi