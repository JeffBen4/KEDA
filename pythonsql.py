import mysql.connector
# Conexión a la base de datos
conexion = mysql.connector.connect(
    host="localhost",
    user="root",
    password="@jair31013202",  # Cambia si usas contraseña
    database="SERVER_IA "  # Reemplaza por tu base de datos real
)
cursor = conexion.cursor()
# Registrar usuario
def registrar_usuario(username, email, password):
    # Verifica si ya existe ese email
    cursor.execute("SELECT * FROM usuarios WHERE email = %s", (email,))
    if cursor.fetchone():
        print("Ese correo ya está registrado.")
        return
    # Inserta nuevo usuario (fecha_creacion se asigna automáticamente)
    consulta = "INSERT INTO usuarios (username, email, password) VALUES (%s, %s, %s)"
    valores = (username, email, password)
    cursor.execute(consulta, valores)
    conexion.commit()
    print("Usuario registrado correctamente.")

# Verificar login
def verificar_login(email, password):
    consulta = "SELECT * FROM usuarios WHERE email = %s AND password = %s"
    cursor.execute(consulta, (email, password))
    usuario = cursor.fetchone()
    if usuario:
        print("Login exitoso. ¡Bienvenido,", usuario[1], "!")
    else:
        print("Correo o contraseña incorrectos.")

# Menú
while True:
    print("\n1. Registrar usuario")
    print("2. Iniciar sesión")
    print("3. Salir")
    opcion = input("Seleccione una opción: ")

    if opcion == "1":
        username = input("Nombre de usuario: ")
        email = input("Correo: ")
        password = input("Contraseña: ")
        registrar_usuario(username, email, password)
    elif opcion == "2":
        email = input("Correo: ")
        password = input("Contraseña: ")
        verificar_login(email, password)
    elif opcion == "3":
        print("¡Hasta luego!")
        break
    else:
        print("Opción no válida.")

# Cierra la conexión
cursor.close()
conexion.close()