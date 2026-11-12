# Welli | Análisis Comercial y Optimización de la Red de Aliados

## Descripción del proyecto

Caso de análisis de datos comerciales enfocado en evaluar el desempeño de la red de aliados de Welli, identificar oportunidades de crecimiento, priorizar aliados y proponer un modelo de gestión comercial basado en datos.

El proyecto integra análisis exploratorio, indicadores de negocio, segmentación, modelos de scoring y consultas SQL para convertir los datos en recomendaciones comerciales y operativas.

## Objetivos del análisis

- Evaluar el embudo comercial: solicitudes, aprobaciones y desembolsos.
- Analizar la activación y el comportamiento de las sedes.
- Identificar oportunidades por sector, ciudad, canal de adquisición y tamaño del aliado.
- Definir criterios para identificar y priorizar aliados de alto desempeño.
- Diseñar un modelo de puntuación para nuevos prospectos.
- Proponer un modelo operativo para adquisición, activación, desarrollo y reactivación de aliados.
- Clasificar segmentos y niveles de inactividad mediante SQL.

## Herramientas y tecnologías

- **Python:** Pandas, NumPy y Matplotlib.
- **SQL:** SQLite, CTE, funciones de ventana, agregaciones y funciones de ranking.
- **Entorno de trabajo:** Jupyter Notebook.
- **Visualización y presentación:** Google Slides.

## Principales hallazgos

- Se analizaron **330 sedes y 184 aliados**.
- La tasa de activación de sedes fue del **68,18 %**.
- El **31,82 % de las sedes** no registraba activación.
- El **80 % de los desembolsos** se concentró en aproximadamente el **21,21 % de las sedes**.
- El canal de alianzas estratégicas presentó una conversión superior y menor proporción de desembolsos en mora que el canal Hunter.
- El sector de estética mostró una combinación atractiva de activación, conversión y calidad de cartera.

## Propuesta de estrategia comercial

A partir de los resultados, se plantean las siguientes iniciativas:

- Priorizar aliados mediante un modelo de scoring basado en activación, productividad, conversión, calidad de cartera y tamaño de red.
- Fortalecer el proceso de incorporación y activación de sedes.
- Distribuir responsabilidades comerciales entre Hunters, Customer Success y Farmers.
- Implementar alertas de inactividad, acuerdos de nivel de servicio (SLA) y procesos de reactivación.
- Validar las iniciativas de activación mediante un piloto controlado.
- Medir el crecimiento considerando tanto el volumen de desembolsos como su calidad.

## Estructura del repositorio

```text
welli-commercial-analytics/
│
├── README.md
├── Welli_Commercial_Data_Analysis.ipynb
│
├── sql/
│   ├── 01_segment_ranking.sql
│   └── 02_inactivity_classification.sql
│
└── presentation/
    ├── README.md
    └── Welli_Executive_Presentation.pdf
```

## Notas metodológicas

- El análisis utiliza datos simulados y confidenciales suministrados para el desarrollo del caso. El conjunto de datos original no se incluye en este repositorio.
- Los resultados son descriptivos y no deben interpretarse como relaciones causales ni como predicciones.
- Los modelos de scoring son herramientas de priorización, no modelos predictivos validados.
- Las metas y recomendaciones operativas propuestas requieren validación mediante implementación y experimentación.
- Las consultas SQL utilizan la tabla `sedes`, generada en el notebook mediante una base de datos SQLite en memoria. Para reproducirlas, es necesario ejecutar primero el notebook.

---

**Proyecto:** Caso de Análisis Comercial Welli  
**Cargo:** Data Analyst Comercial
