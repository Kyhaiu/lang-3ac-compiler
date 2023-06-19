#!/bin/bash
echo "Compiling arithmetics.lang.."
echo -e "----------------------------------\n\n"
./bin/lang ./assets/examples/in/arithmetics.lang
echo -e "\n\n----------------------------------"
echo -e "Compiling arithmetics.lang finished\n"

echo "Compiling conditionals.lang.."
echo -e "----------------------------------\n\n"
echo "Results are stored in ./assets/examples/out/conditionals.out"
./bin/lang ./assets/examples/in/conditionals.lang
echo -e "\n\n----------------------------------"
echo -e "Compiling arithmetics.lang finished\n"

echo "Compiling loops.lang.."
echo -e "----------------------------------\n\n"
./bin/lang ./assets/examples/in/loops.lang
echo -e "\n\n----------------------------------"
echo -e "Compiling loops.lang finished\n"

echo "Compiling error.lang.."
echo -e "----------------------------------\n\n"
./bin/lang ./assets/examples/in/error.lang
echo -e "\n\n----------------------------------"
echo -e "Compiling loops.lang finished\n"