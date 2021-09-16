WD="`pwd`"

if [ $1 = "--with-core" ]; then
    cd ../fitlayout-core
    ./build.sh
    cd $WD
fi

cd ../fitlayout-server
./build.sh
cd $WD

cd ../fitlayout-frontend
./build.sh
cd $WD

cd ../fitlayout-auth-server
./build.sh
cd $WD

cd ../fitlayout-auth-gui
./build.sh
cd $WD
