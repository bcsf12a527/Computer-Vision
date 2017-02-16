projective2d : projective2d.bc
	clang++ -std=c++14 -Wall projective2d.bc -lopencv_core -lopencv_ocl -o projective2d
projective2d.bc : projective2d.cpp
	clang++ -std=c++14 -Wall -g3 -O0 -emit-llvm -c projective2d.cpp -o projective2d.bc
