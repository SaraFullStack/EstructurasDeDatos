@echo off

REM === Mensaje bienvenida
echo Se va a compilar la practica 2022/2023 con las dependencias y restricciones


REM === Inputs ===
set SRC_DIR=%cd%\src
set BIN_DIR=\bin
set MAIN=es/uned/lsi/eped/pract2022_2023/Main
set JAVA_HOME_JDK=""
set TMP_FOLDER=%cd%\juego_de_pruebas_2023\tmp

IF %JAVA_HOME_JDK%=="" (

	IF "%JAVA_HOME%" == "" (
	    echo Modifica la variable del archivo bat JAVA_HOME_JDK 
	    pause
	    exit
	) ELSE (
	    set JAVA_HOME_JDK="%JAVA_HOME%"
	)
)


REM === Mostramos variables ===
echo Carpeta codigo = %SRC_DIR%
echo Carpeta bin = %BIN_DIR%
echo Clase principal = %MAIN%
echo JAVA_HOME_JDK = %JAVA_HOME_JDK%
echo. 
echo.


REM === Clean and make temp dir ===
echo Limpiando compilacion anterior 
rd /q /s "%TMP_FOLDER%"
pause
if not exist "%TMP_FOLDER%" mkdir "%TMP_FOLDER%" 
mkdir "%TMP_FOLDER%%BIN_DIR%"
mkdir "%TMP_FOLDER%\src"
mkdir "%TMP_FOLDER%\src\es"
mkdir "%TMP_FOLDER%\src\es\uned"
mkdir "%TMP_FOLDER%\src\es\uned\lsi"
mkdir "%TMP_FOLDER%\src\es\uned\lsi\eped"
mkdir "%TMP_FOLDER%\src\es\uned\lsi\eped\pract2022_2023"
xcopy /s/q "%SRC_DIR%\es\uned\lsi\eped\pract2022_2023" "%TMP_FOLDER%\src\es\uned\lsi\eped\pract2022_2023"
xcopy /s/y/q "juego_de_pruebas_2023\lib\src" "%TMP_FOLDER%\src\es\uned\lsi\eped\pract2022_2023"
echo.
echo.
pause


REM ===

REM ===========================================
REM === Comprobacion uso TAD equipo docente ===
REM ===========================================
echo Comprobando el uso de estructuras de datos del equipo docente
cd "%TMP_FOLDER%\src\es\uned\lsi\eped\pract2022_2023"
find "import" StockSequence.java StockTree.java | find /v "ejemplo"
cd "../../../../../../../../"
echo Si se muestra algun "import" en el mensaje anterior es posible que no se este haciendo uso de las estructuras de datos del equipo docente
echo. 
echo.
pause


REM ===

REM ===============
REM === Compile ===
REM ===============
echo Compilando en carpeta temporal
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\javac" -d "%TMP_FOLDER%%BIN_DIR%" -sourcepath "%TMP_FOLDER%\src" -cp "juego_de_pruebas_2023/lib/TAD_modified.jar" "%TMP_FOLDER%\src\%MAIN%.java"

%JAVA_HOME_JDK%"\bin\javac" -d "%TMP_FOLDER%%BIN_DIR%" -sourcepath "%TMP_FOLDER%\src" -cp "juego_de_pruebas_2023/lib/TAD_modified.jar" "%TMP_FOLDER%\src\%MAIN%.java"
if errorlevel 1 (
	echo Compilacion con errores
	pause
	exit /B 1
)

echo Compilacion sin errores
echo.
echo.
pause

REM ===

REM ==============================================================================

REM =============================
REM === Run SEQUENCE Estudiantes 01 ===
REM =============================
echo Ejecutando el programa con secuencia (prueba 1)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2023/lib/TAD_modified.jar" "%MAIN%" SEQUENCE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_01.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01_SEQUENCE.dat"

%JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2023/lib/TAD_modified.jar" "%MAIN%" SEQUENCE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_01.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01_SEQUENCE.dat"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)

echo Ejecucion sin errores
echo. 
echo.
pause


REM === Comprobacion Estudiantes 01 ===
echo Comprobando bateria de pruebas para secuencia (prueba 1)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01.dat" "errores_01_S.txt"

%JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01_SEQUENCE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01.dat" "errores_01_S.txt"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)
echo. 
echo.
pause


REM ==============================================================================

REM =============================
REM === Run TREE Estudiantes 01 ===
REM =============================
echo Ejecutando el programa con arbol general (prueba 1)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2023/lib/TAD_modified.jar" "%MAIN%" TREE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_01.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01_TREE.dat"

%JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2023/lib/TAD_modified.jar" "%MAIN%" TREE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_01.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01_TREE.dat"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)

echo Ejecucion sin errores
echo. 
echo.
pause

REM === Comprobacion Estudiantes 01 ===
echo Comprobando bateria de pruebas para arbol general (prueba 1)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01_TREE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01.dat" "errores_01_T.txt"

%JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01_TREE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01.dat" "errores_01_T.txt"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)
echo. 
echo.
pause


REM ==============================================================================

REM =============================
REM === Run SEQUENCE Estudiantes 02 ===
REM =============================
echo Ejecutando el programa con secuencia (prueba 2)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2023/lib/TAD_modified.jar" "%MAIN%" SEQUENCE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_02.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02_SEQUENCE.dat"

%JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2023/lib/TAD_modified.jar" "%MAIN%" SEQUENCE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_02.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02_SEQUENCE.dat"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)

echo Ejecucion sin errores
echo. 
echo.
pause


REM === Comprobacion Estudiantes 02 ===
echo Comprobando bateria de pruebas para secuencia (prueba 2)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02_SEQUENCE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02.dat" "errores_02_S.txt"

%JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02_SEQUENCE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02.dat" "errores_02_S.txt"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)
echo. 
echo.
pause


REM ==============================================================================

REM =============================
REM === Run TREE Estudiantes 02 ===
REM =============================
echo Ejecutando el programa con arbol general (prueba 2)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2023/lib/TAD_modified.jar" "%MAIN%" TREE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_02.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02_TREE.dat"

%JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2023/lib/TAD_modified.jar" "%MAIN%" TREE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_02.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02_TREE.dat"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)

echo Ejecucion sin errores
echo. 
echo.
pause

REM === Comprobacion Estudiantes 02 ===
echo Comprobando bateria de pruebas para arbol general (prueba 2)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02_TREE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02.dat" "errores_02_T.txt"

%JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02_TREE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02.dat" "errores_02_T.txt"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)
echo. 
echo.
pause

REM =========================================


REM ==============================================================================

REM =============================
REM === Run SEQUENCE Estudiantes 03 ===
REM =============================
echo Ejecutando el programa con secuencia (prueba 3)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2023/lib/TAD_modified.jar" "%MAIN%" SEQUENCE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_03.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03_SEQUENCE.dat"

%JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2023/lib/TAD_modified.jar" "%MAIN%" SEQUENCE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_03.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03_SEQUENCE.dat"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)

echo Ejecucion sin errores
echo. 
echo.
pause


REM === Comprobacion Estudiantes 03 ===
echo Comprobando bateria de pruebas para secuencia (prueba 3)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03_SEQUENCE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03.dat" "errores_03_S.txt"

%JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03_SEQUENCE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03.dat" "errores_03_S.txt"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)
echo. 
echo.
pause


REM ==============================================================================

REM =============================
REM === Run TREE Estudiantes 03 ===
REM =============================
echo Ejecutando el programa con arbol general (prueba 3)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2023/lib/TAD_modified.jar" "%MAIN%" TREE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_03.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03_TREE.dat"

%JAVA_HOME_JDK%"\bin\java" -cp "%TMP_FOLDER%%BIN_DIR%;juego_de_pruebas_2023/lib/TAD_modified.jar" "%MAIN%" TREE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_03.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03_TREE.dat"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)

echo Ejecucion sin errores
echo. 
echo.
pause

REM === Comprobacion Estudiantes 03 ===
echo Comprobando bateria de pruebas para arbol general (prueba 3)
REM === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
REM echo %JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03_TREE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03.dat" "errores_03_T.txt"

%JAVA_HOME_JDK%"\bin\java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03_TREE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03.dat" "errores_03_T.txt"

if errorlevel 1 (
	echo Ejecucion con errores
	pause
	exit /B 1
)
echo. 
echo.
pause

REM =========================================


