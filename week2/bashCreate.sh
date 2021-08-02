#!/bin/bash
#Purpose: This script is to create a bash script file with default headers
#Author: David Wilkinson
#Version:1.4
#Created Date:21/06/2021 18:00


# start #

echo "What would you like to call your new script?"
echo -e ".sh will be added automatically! \c"
read -r file
echo -e "What week# folder would you like to put this in? \c"
read -r week

touch ~/student/scripts/portfolio/$week/$file.sh

echo '#!/bin/bash' >> ~/student/scripts/portfolio/$week/$file.sh
echo '# Purpose:' >> ~/student/scripts/portfolio/$week/$file.sh
echo '# Author: David Wilkinson' >> ~/student/scripts/portfolio/$week/$file.sh
# had to set the timezone to make it more aligned to Brisbane not UTC
echo '# Created Date' `TZ=Australia/Brisbane date` >> ~/student/scripts/portfolio/$week/$file.sh
echo '# start #' >> ~/student/scripts/portfolio//$week/$file.sh
echo '# finish #' >> ~/student/scripts/portfolio/$week/$file.sh

chmod +x $file.sh # to get it ready to execute

exit 0

# finish #

#credit to (Tech Arkit 2021 ) Complete Shell Scripting Tutorial in Single Video 2021, YouTube
#https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjQmen_2vPxAhVZxTgGHeAOD0AQtwIwAHoECAcQAw&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DuI-xHPk4tO0&usg=AOvVaw20oKz002huc3Mdz9dPjqJD 
