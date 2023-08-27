# CADMAS-SURF/3D-MG

# Citation

If you publish results using our code, please acknowledge our work by quoting the following paper:

Taro ARIKAWA, Huminori YAMADA, Minoru AKIYAMA, Investigation of Applicability for Tsunami Wave Forces in a 3-D Numerical Wave Tank, PROCEEDINGS OF COASTAL ENGINEERING, JSCE, 2005, Volume 52, Pages 46-50

# Related Documents

Please refer to the list of [related documents](/RelatedDocuments.md).

## Versions:  
 2022/04/09(First commit)："ver4.9.4_20180216"

## Documentation:
 1.  [Proguram manual](/Manuals/CADMAS-surf3D_Manual.pdf).
 2.  Input data creation support software [CADMAS-MESH](https://github.com/CADMAS-SURF/CADMAS-MESH).
 3.  Visualization software　[ViewKAI3D](https://github.com/CADMAS-SURF/Viewkai).
 4.  Visualization software (recommendation) [CADMAS-VR](https://github.com/CADMAS-SURF/CADMAS-VR).

## How to Compile:
 1. Type `unzip CADMAS-MG-master.zip -d CADMAS-MG-master`
 2. Type `cd  CADMAS-MG-master/ver4.9.4_20180216`
 3. Edit "Makefile" according to your calculation environment.
 4. Type `make clean`
 5. Type `make` to compile MG program
 6. If the compilation is successful, an executable file named "a.3d-mg10-opt" will be generated.
