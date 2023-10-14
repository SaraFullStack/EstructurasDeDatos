#!/bin/bash
# === Mensaje bienvenida
echo Se va a compilar la practica 2022\/2023 con las dependencias y restricciones


# === Inputs ===
SRC_DIR=$PWD/src
BIN_DIR=/bin
MAIN=es/uned/lsi/eped/pract2022_2023/Main
JAVA_HOME_JDK=/usr/lib/jvm/default-java
TMP_FOLDER=$PWD/juego_de_pruebas_2023/tmp

if [ -z "$JAVA_HOME_JDK" ] 
    then
        if [ -z "$JAVA_HOME" ] 
            then 
	        echo Modifica la variable del archivo .sh JAVA_HOME_JDK 
	        read -rsp $'Press any key to continue...\n' -n 1 key
	        exit
	 else
	    JAVA_HOME_JDK="$JAVA_HOME"
	 fi
fi


# === Mostramos variables ===
echo Carpeta codigo = $SRC_DIR
echo Carpeta bin = $BIN_DIR
echo Clase principal = $MAIN
echo JAVA_HOME_JDK = $JAVA_HOME_JDK
echo  
echo 


# === Clean and make temp dir ===
echo Limpiando compilacion anterior
rm -rf "$TMP_FOLDER"
read -rsp $'Press any key to continue...\n' -n 1 key
echo Copiando archivos
if [ ! -e "$TMP_FOLDER" ]
    then
        mkdir "$TMP_FOLDER" 
fi 
mkdir "$TMP_FOLDER$BIN_DIR"
mkdir "$TMP_FOLDER/src"
mkdir "$TMP_FOLDER/src/es"
mkdir "$TMP_FOLDER/src/es/uned"
mkdir "$TMP_FOLDER/src/es/uned/lsi"
mkdir "$TMP_FOLDER/src/es/uned/lsi/eped"
mkdir "$TMP_FOLDER/src/es/uned/lsi/eped/pract2022_2023"
cp -r "$SRC_DIR/es/uned/lsi/eped/pract2022_2023/"* "$TMP_FOLDER/src/es/uned/lsi/eped/pract2022_2023"
cp -v "juego_de_pruebas_2023/lib/src/"* "$TMP_FOLDER/src/es/uned/lsi/eped/pract2022_2023"
echo
echo
read -rsp $'Press any key to continue...\n' -n 1 key
# ===


# ===========================================
# === Comprobacion uso TAD equipo docente ===
# ===========================================
echo Comprobando el uso de estructuras de datos del equipo docente
cd "$TMP_FOLDER/src/es/uned/lsi/eped/pract2022_2023"
grep "import" StockSequence.java StockTree.java | grep -v "ejemplo"
cd "../../../../../../../../"
echo Si se muestra algun \"import\" en el mensaje anterior es posible que no se este haciendo uso de las estructuras de datos del equipo docente
echo
echo
read -rsp $'Press any key to continue...\n' -n 1 key
# ===


# =============================
# === Compile ===
# =============================
echo Compilando en carpeta temporal
# === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
# echo "$JAVA_HOME_JDK/bin/javac" -d "$TMP_FOLDER$BIN_DIR" -sourcepath "$TMP_FOLDER/src" -cp "juego_de_pruebas_2023/lib/TAD_modified.jar" "$TMP_FOLDER/src/"$MAIN".java"

"$JAVA_HOME_JDK/bin/javac" -d "$TMP_FOLDER$BIN_DIR" -sourcepath "$TMP_FOLDER/src" -cp "juego_de_pruebas_2023/lib/TAD_modified.jar" "$TMP_FOLDER/src/"$MAIN".java"

if [ $? -eq 1 ] 
    then
	echo Compilacion con errores
	read -rsp $'Press any key to continue...\n' -n 1 key
	exit 1
fi

echo Compilacion sin errores
echo
echo
read -rsp $'Press any key to continue...\n' -n 1 key
# ===

# ==========================================================================================
# ===================================
# === Run SEQUENCE Estudiantes 01 ===
# ===================================
echo Ejecutando el programa con secuencia \(prueba 1\)
# === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
# echo "$JAVA_HOME_JDK/bin/java" -cp "$TMP_FOLDER$BIN_DIR:juego_de_pruebas_2023/lib/TAD_modified.jar" "$MAIN" SEQUENCE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_01.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01_SEQUENCE.dat"

"$JAVA_HOME_JDK/bin/java" -cp "$TMP_FOLDER$BIN_DIR:juego_de_pruebas_2023/lib/TAD_modified.jar" "$MAIN" SEQUENCE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_01.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01_SEQUENCE.dat"

if [ $? -eq 1 ] 
    then
	echo Ejecucion con errores
	read -rsp $'Press any key to continue...\n' -n 1 key
	exit 1
fi

echo Ejecucion sin errores
read -rsp $'Press any key to continue...\n' -n 1 key

# === Comprobacion Estudiantes 01 ===
echo Comprobando bateria de pruebas para secuencia \(prueba 1\)
# === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
# echo "$JAVA_HOME_JDK/bin/java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01_SEQUENCE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01.dat" "errores_01_S.txt"

"$JAVA_HOME_JDK/bin/java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01_SEQUENCE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01.dat" "errores_01_S.txt"

if [ $? -eq 1 ] 
    then
	echo Ejecucion con errores
	read -rsp $'Press any key to continue...\n' -n 1 key
	exit 1
fi

echo
echo
read -rsp $'Press any key to continue...\n' -n 1 key
# ===


# ==========================================================================================
# ================================
# === Run TREE Estudiantes 01 ===
# ================================
echo Ejecutando el programa con arbol general \(prueba 1\)
# === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
# echo "$JAVA_HOME_JDK/bin/java" -cp "$TMP_FOLDER$BIN_DIR:juego_de_pruebas_2023/lib/TAD_modified.jar" "$MAIN" TREE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_01.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01_TREE.dat"

"$JAVA_HOME_JDK/bin/java" -cp "$TMP_FOLDER$BIN_DIR:juego_de_pruebas_2023/lib/TAD_modified.jar" "$MAIN" TREE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_01.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01_TREE.dat"

if [ $? -eq 1 ] 
    then
	echo Ejecucion con errores
	read -rsp $'Press any key to continue...\n' -n 1 key
	exit 1
fi

echo Ejecucion sin errores
read -rsp $'Press any key to continue...\n' -n 1 key

# === Comprobacion Estudiantes 01 ===
echo Comprobando bateria de pruebas para arbol general \(prueba 1\)
# === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
# echo "$JAVA_HOME_JDK/bin/java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01_TREE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01.dat" "errores_01_T.txt"

"$JAVA_HOME_JDK/bin/java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01_TREE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_01.dat" "errores_01_T.txt"

if [ $? -eq 1 ] 
    then
	echo Ejecucion con errores
	read -rsp $'Press any key to continue...\n' -n 1 key
	exit 1
fi

echo
echo
read -rsp $'Press any key to continue...\n' -n 1 key
# ===



# ==========================================================================================
# ===================================
# === Run SEQUENCE Estudiantes 02 ===
# ===================================
echo Ejecutando el programa con secuencia \(prueba 2\)
# === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
# echo "$JAVA_HOME_JDK/bin/java" -cp "$TMP_FOLDER$BIN_DIR:juego_de_pruebas_2023/lib/TAD_modified.jar" "$MAIN" SEQUENCE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_02.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02_SEQUENCE.dat"

"$JAVA_HOME_JDK/bin/java" -cp "$TMP_FOLDER$BIN_DIR:juego_de_pruebas_2023/lib/TAD_modified.jar" "$MAIN" SEQUENCE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_02.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02_SEQUENCE.dat"

if [ $? -eq 1 ] 
    then
	echo Ejecucion con errores
	read -rsp $'Press any key to continue...\n' -n 1 key
	exit 1
fi

echo Ejecucion sin errores
read -rsp $'Press any key to continue...\n' -n 1 key

# === Comprobacion Estudiantes 02 ===
echo Comprobando bateria de pruebas para secuencia \(prueba 2\)
# === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
# echo "$JAVA_HOME_JDK/bin/java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02_SEQUENCE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02.dat" "errores_02_S.txt"

"$JAVA_HOME_JDK/bin/java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02_SEQUENCE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02.dat" "errores_02_S.txt"

if [ $? -eq 1 ] 
    then
	echo Ejecucion con errores
	read -rsp $'Press any key to continue...\n' -n 1 key
	exit 1
fi

echo
echo
read -rsp $'Press any key to continue...\n' -n 1 key
# ===


# ==========================================================================================
# ===============================
# === Run TREE Estudiantes 02 ===
# ===============================
echo Ejecutando el programa con arbol general \(prueba 2\)
# === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
# echo "$JAVA_HOME_JDK/bin/java" -cp "$TMP_FOLDER$BIN_DIR:juego_de_pruebas_2023/lib/TAD_modified.jar" "$MAIN" TREE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_02.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02_TREE.dat"

"$JAVA_HOME_JDK/bin/java" -cp "$TMP_FOLDER$BIN_DIR:juego_de_pruebas_2023/lib/TAD_modified.jar" "$MAIN" TREE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_02.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02_TREE.dat"

if [ $? -eq 1 ] 
    then
	echo Ejecucion con errores
	read -rsp $'Press any key to continue...\n' -n 1 key
	exit 1
fi

echo Ejecucion sin errores
read -rsp $'Press any key to continue...\n' -n 1 key

# === Comprobacion Estudiantes 02 ===
echo Comprobando bateria de pruebas para arbol general \(prueba 2\)
# === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
# echo "$JAVA_HOME_JDK/bin/java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02_TREE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02.dat" "errores_02_T.txt"

"$JAVA_HOME_JDK/bin/java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02_TREE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_02.dat" "errores_02_T.txt"

if [ $? -eq 1 ] 
    then
	echo Ejecucion con errores
	read -rsp $'Press any key to continue...\n' -n 1 key
	exit 1
fi

echo
echo
read -rsp $'Press any key to continue...\n' -n 1 key
# ===


# ==========================================================================================
# ===================================
# === Run SEQUENCE Estudiantes 03 ===
# ===================================
echo Ejecutando el programa con secuencia \(prueba 3\)
# === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
# echo "$JAVA_HOME_JDK/bin/java" -cp "$TMP_FOLDER$BIN_DIR:juego_de_pruebas_2023/lib/TAD_modified.jar" "$MAIN" SEQUENCE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_03.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03_SEQUENCE.dat"

"$JAVA_HOME_JDK/bin/java" -cp "$TMP_FOLDER$BIN_DIR:juego_de_pruebas_2023/lib/TAD_modified.jar" "$MAIN" SEQUENCE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_03.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03_SEQUENCE.dat"

if [ $? -eq 1 ] 
    then
	echo Ejecucion con errores
	read -rsp $'Press any key to continue...\n' -n 1 key
	exit 1
fi

echo Ejecucion sin errores
read -rsp $'Press any key to continue...\n' -n 1 key

# === Comprobacion Estudiantes 03 ===
echo Comprobando bateria de pruebas para secuencia \(prueba 3\)
# === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
# echo "$JAVA_HOME_JDK/bin/java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03_SEQUENCE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03.dat" "errores_03_S.txt"

"$JAVA_HOME_JDK/bin/java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03_SEQUENCE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03.dat" "errores_03_S.txt"

if [ $? -eq 1 ] 
    then
	echo Ejecucion con errores
	read -rsp $'Press any key to continue...\n' -n 1 key
	exit 1
fi

echo
echo
read -rsp $'Press any key to continue...\n' -n 1 key
# ===


# ==========================================================================================
# ===============================
# === Run TREE Estudiantes 03 ===
# ===============================
echo Ejecutando el programa con arbol general \(prueba 3\)
# === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
# echo "$JAVA_HOME_JDK/bin/java" -cp "$TMP_FOLDER$BIN_DIR:juego_de_pruebas_2023/lib/TAD_modified.jar" "$MAIN" TREE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_03.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03_TREE.dat"

"$JAVA_HOME_JDK/bin/java" -cp "$TMP_FOLDER$BIN_DIR:juego_de_pruebas_2023/lib/TAD_modified.jar" "$MAIN" TREE "juego_de_pruebas_2023/pruebas/JuegoPruebas_Estudiantes_03.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03_TREE.dat"

if [ $? -eq 1 ] 
    then
	echo Ejecucion con errores
	read -rsp $'Press any key to continue...\n' -n 1 key
	exit 1
fi

echo Ejecucion sin errores
read -rsp $'Press any key to continue...\n' -n 1 key

# === Comprobacion Estudiantes 03 ===
echo Comprobando bateria de pruebas para arbol general \(prueba 3\)
# === DESCOMENTAR LA SIGUIENTE LINEA SI SE QUIERE IMPRIMIR LA ORDEN === 
# echo "$JAVA_HOME_JDK/bin/java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03_TREE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03.dat" "errores_03_T.txt"

"$JAVA_HOME_JDK/bin/java" -jar "juego_de_pruebas_2023/lib/Comparator.jar" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03_TREE.dat" "juego_de_pruebas_2023/salida/Salida_Estudiantes_03.dat" "errores_03_T.txt"

if [ $? -eq 1 ] 
    then
	echo Ejecucion con errores
	read -rsp $'Press any key to continue...\n' -n 1 key
	exit 1
fi

echo
echo
read -rsp $'Press any key to continue...\n' -n 1 key
# ===


exit

