import os
import json
import requests
import pandas as pd
import matplotlib.pyplot as plt
from fastapi import FastAPI, HTTPException
from langchain.chat_models import ChatOpenAI
from langchain.schema import SystemMessage, HumanMessage
from io import BytesIO
from dotenv import load_dotenv
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse, JSONResponse

# Cargar variables de entorno
load_dotenv()

# Inicializar FastAPI
app = FastAPI(title="Chatbot Inteligente con GitHub y Gráficos")

# Servir archivos estáticos
app.mount("/static", StaticFiles(directory="static"), name="static")

# Configuración de OpenAI
CHAT_MODEL = "gpt-3.5-turbo"
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")

# URL del repositorio de GitHub (actualizada con la nueva ruta)
GITHUB_REPO = "https://api.github.com/repos/AlexisAlvarenga/Chatbot/ProyectoFinal_MachineLearning/contents"


# Inicializar el modelo de lenguaje de OpenAI
chat_model = ChatOpenAI(temperature=0.7, model=CHAT_MODEL, openai_api_key=OPENAI_API_KEY)

# Página principal
@app.get("/")
def serve_home():
    """Sirve la página principal"""
    return FileResponse("static/index.html")

# Conversación general con el chatbot
@app.post("/chat/")
def chat(query: str):
    """Recibe una pregunta y responde de manera natural"""
    respuestas = {
        "hola": "¡Hola! ¿Cómo puedo ayudarte?",
        "adios": "¡Adiós! Que tengas un buen día.",
    }

    # Si la pregunta está en las respuestas predefinidas
    if query.lower() in respuestas:
        return JSONResponse(content={"response": respuestas[query.lower()]})

    # Respuesta por defecto si no está en las predefinidas
    else:
        messages = [
            SystemMessage(content="Eres un asistente experto en análisis de datos y machine learning."),
            HumanMessage(content=query)
        ]
        response = chat_model(messages)
        return JSONResponse(content={"response": response.content})

# Buscar archivos en el repositorio de GitHub
@app.get("/buscar_archivos/")
def buscar_archivos(path: str = ""):
    """Busca archivos en una carpeta del repositorio de GitHub"""
    url = f"{GITHUB_REPO}/{path}"
    headers = {"Authorization": f"token {os.getenv('GITHUB_TOKEN')}"}
    response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        archivos = [item["name"] for item in response.json()]
        return {"archivos": archivos}
    else:
        raise HTTPException(status_code=404, detail="No se encontraron archivos")

# Obtener contenido de un archivo CSV del repositorio
@app.get("/leer_csv/")
def leer_csv(path: str):
    """Lee un archivo CSV del repositorio de GitHub y devuelve los primeros registros"""
    url = f"{GITHUB_REPO}/{path}"
    headers = {"Authorization": f"token {os.getenv('GITHUB_TOKEN')}"}
    response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        file_content = requests.get(response.json()["download_url"]).content
        df = pd.read_csv(BytesIO(file_content))
        return {"data": df.head().to_dict()}
    else:
        raise HTTPException(status_code=404, detail="Archivo CSV no encontrado")

# Generar y mostrar gráficos a partir de un CSV
@app.get("/grafico/")
def generar_grafico(path: str, x_col: str, y_col: str):
    """Genera un gráfico de línea a partir de un archivo CSV del repositorio de GitHub"""
    url = f"{GITHUB_REPO}/{path}"
    headers = {"Authorization": f"token {os.getenv('GITHUB_TOKEN')}"}
    response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        file_content = requests.get(response.json()["download_url"]).content
        df = pd.read_csv(BytesIO(file_content))
        
        if x_col not in df.columns or y_col not in df.columns:
            raise HTTPException(status_code=400, detail="Columnas especificadas no encontradas en el CSV")
        
        # Crear el gráfico
        plt.figure(figsize=(8, 5))
        plt.plot(df[x_col], df[y_col], marker="o", linestyle="-", color="b")
        plt.xlabel(x_col)
        plt.ylabel(y_col)
        plt.title(f"Gráfico de {y_col} vs {x_col}")
        plt.grid()
        
        # Guardar el gráfico en memoria
        buffer = BytesIO()
        plt.savefig(buffer, format="png")
        buffer.seek(0)
        plt.close()
        
        return {"message": "Gráfico generado correctamente", "grafico": buffer.getvalue()}
    else:
        raise HTTPException(status_code=404, detail="Archivo CSV no encontrado")

# Analizar modelos de regresión en el repositorio
@app.get("/modelos_regresion/")
def analizar_modelos():
    """Busca archivos de modelos de regresión en el repositorio"""
    modelos_path = "MODELO Y PREDICION/MODELO REGRESION LINEAL/CANASTA BASICA URBANA"
    return buscar_archivos(modelos_path)

# Página principal adicional (en caso de ser necesario para la interacción del chatbot)
@app.get("/home")
def home():
    return {"message": "Bienvenido al Chatbot Inteligente"}
