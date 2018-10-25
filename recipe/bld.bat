mkdir build
cd build

cmake -G "NMake Makefiles" ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_BUILD_TYPE:STRING=Release ^
	  -DBUILD_SHARED_LIBS=ON ^
      %SRC_DIR%
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1


nmake install
if errorlevel 1 exit 1

mkdir -p %LIBRARY_PREFIX%\share\nitro
copy "%RECIPE_DIR%\target\modules\c\nitf\shared\*.dll %LIBRARY_LIB%\%LIBRARY_PREFIX%\lib\nitroplugins\ || exit 1
if errorlevel 1 exit 1

set ACTIVATE_DIR=%PREFIX%\etc\conda\activate.d
set DEACTIVATE_DIR=%PREFIX%\etc\conda\deactivate.d
mkdir %ACTIVATE_DIR%
mkdir %DEACTIVATE_DIR%

copy %RECIPE_DIR%\scripts\activate.bat %ACTIVATE_DIR%\nitro-activate.bat
if errorlevel 1 exit 1

copy %RECIPE_DIR%\scripts\deactivate.bat %DEACTIVATE_DIR%\nitro-deactivate.bat
if errorlevel 1 exit 1

