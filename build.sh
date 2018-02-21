cd src
make bfc
echo "===================================================="
echo "Make completed"
echo "====================================================";
pwd; ls -lh *.o *.a bfc;
cd ../

rm -rf test
cp -r ./test_ref test

echo "===================================================="
echo "Test txt compression"
echo "===================================================="
./runScript.sh ./test/test_txt/testFile lz



echo "===================================================="
echo "Test audio compression"
echo "===================================================="
./runScript.sh ./test/test_audio/audio1.mp3 lz
echo "===================================================="



echo "===================================================="
echo "Test image compression"
echo "===================================================="
./runScript.sh ./test/test_img/SS1.png lz
./runScript.sh ./test/test_img/SS2.png lz
./runScript.sh ./test/test_img/DL1.png lz
./runScript.sh ./test/test_img/DL2.png lz

echo "===================================================="
echo "Test random data compression"
echo "===================================================="
./runScript.sh ./test/test_bin/random lz
echo "===================================================="
