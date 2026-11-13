# Portafolio universitario de Ingeniería Industrial y Ciencia de Datos

**Alonso Romero · Ingeniería Civil Industrial con mención en Analítica de Datos**

Esta carpeta reúne una selección de proyectos realizados durante mi formación universitaria. Los trabajos abordan análisis de clientes, operación de servicios, producción de litio y exploración de datos, junto con ejercicios de fundamentos de machine learning e inferencia bayesiana.

El propósito es mostrar las técnicas utilizadas, el razonamiento aplicado y los entregables desarrollados. Se conservan las versiones académicas y sus limitaciones conocidas. Los resultados guardados en informes y notebooks corresponden a las ejecuciones de esas entregas; preparar este portafolio no implicó volver a entrenar los modelos ni validar los simuladores.

## Herramientas

![Python](https://img.shields.io/badge/Python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![Google Colab](https://img.shields.io/badge/Google%20Colab-F9A825?style=for-the-badge&logo=googlecolab&logoColor=white)
![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge)
![Amazon Athena](https://img.shields.io/badge/Amazon%20Athena-232F3E?style=for-the-badge)
![KNIME](https://img.shields.io/badge/KNIME-FDD800?style=for-the-badge&logo=knime&logoColor=black)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge)
![FlexSim](https://img.shields.io/badge/FlexSim-005A9C?style=for-the-badge)
![Excel](https://img.shields.io/badge/Excel-217346?style=for-the-badge)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=for-the-badge&logo=numpy&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![scikit-learn](https://img.shields.io/badge/scikit--learn-F7931E?style=for-the-badge&logo=scikit-learn&logoColor=white)
![Matplotlib](https://img.shields.io/badge/Matplotlib-FFFFFF?style=for-the-badge)


## Proyectos incluidos

Los cuatro proyectos principales conectan herramientas de datos con preguntas empresariales u operativas. Los tres ejercicios complementarios muestran fundamentos e implementación de métodos.

| Tipo | Proyecto | Técnicas y herramientas | Estado del material |
| --- | --- | --- | --- |
| Principal | [Fuga de clientes](04-fuga-clientes/) | Python, preparación de datos, clasificación, SMOTE y validación cruzada | Notebooks, informes y base preprocesada local; evaluación con limitaciones |
| Principal | [Simulación del litio](05-simulacion-litio/) | FlexSim, eventos discretos y análisis de resultados en Excel | Modelo y materiales de entradas/resultados; ejecución y correspondencia pendientes de verificar |
| Principal | [Centro de llamadas con Athena](06-athena-centro-llamadas/) | SQL, AWS Athena, boto3 y visualización en Python | Consultas, informe y notebook sin claves incrustadas |
| Principal | [Delitos en Los Ángeles](01-business-analytics-delitos-la/) | KNIME, ETL, Power BI e indicadores descriptivos | Workflow, dashboard, informe y datos locales; errores de métricas documentados |
| Complementario | [Segmentación de clientes](02-segmentacion-clientes/) | K-Means manual, PCA y clustering jerárquico | Notebook y dataset local; implementación con defectos conocidos |
| Complementario | [Regresión de superficies](03-regresion-superficies/) | Regresión polinómica y descenso de gradiente | Notebook con salidas históricas; dataset original ausente |
| Complementario | [Inferencia bayesiana](07-inferencia-bayesiana/) | R, Beta-Binomial y simulación Monte Carlo | Desarrollo parcial de comparación de proporciones |

Para una primera revisión recomiendo comenzar por el [informe de clasificación de clientes](04-fuga-clientes/informes/clasificacion-original.docx), el [modelo del litio](05-simulacion-litio/modelo/Litio-original.fsm), el [informe del centro de llamadas](06-athena-centro-llamadas/informes/informe-original.docx) y el [informe de BI de delitos](01-business-analytics-delitos-la/4.%20informes/informe-original.pdf).

## Estructura

```text
Proyectos U/
├── README.md
├── .gitignore
├── 01-business-analytics-delitos-la/
│   ├── 1. Data/
│   ├── 2. ETL/
│   ├── 3. Dashboard/
│   └── 4. informes/
├── 02-segmentacion-clientes/
│   ├── 1. data/
│   └── 2. Notebook/
├── 03-regresion-superficies/notebooks/
├── 04-fuga-clientes/
│   ├── data/
│   ├── informes/
│   └── notebooks/
├── 05-simulacion-litio/
│   ├── data/
│   ├── modelo/
│   └── resultados/
├── 06-athena-centro-llamadas/
│   ├── informes/
│   └── notebooks/
└── 07-inferencia-bayesiana/
    ├── codigo/
    ├── fuentes/
    └── informes/
```

La numeración conserva la organización de los archivos y no representa una clasificación de calidad. Se retiraron enunciados, libros de terceros, certificados, duplicados, archivos temporales y trabajos descartados. Los datos locales que siguen siendo útiles se conservan con las exclusiones de Git descritas más abajo.

## Fuga de clientes

**Pregunta:** ¿cómo identificar clientes con mayor propensión a abandonar una entidad financiera y comparar modelos para apoyar decisiones de retención?

El proyecto incluye análisis exploratorio, tratamiento de datos faltantes e inconsistencias, construcción de variables temporales y selección de atributos. Compara regresión logística, árbol de decisión, KNN, Random Forest, red neuronal y SVM. Utiliza SMOTE para tratar el desbalance y búsqueda de hiperparámetros con validación cruzada de diez particiones en varios modelos. El informe incorpora una matriz de pagos como ejercicio de evaluación económica.

**Archivos utilizados:**

- [Notebook de preprocesamiento](04-fuga-clientes/notebooks/preprocesamiento-original.ipynb) y [su informe](04-fuga-clientes/informes/preprocesamiento-original.docx).
- [Notebook de clasificación](04-fuga-clientes/notebooks/clasificacion-original.ipynb) y [su informe](04-fuga-clientes/informes/clasificacion-original.docx).
- [Base preprocesada local](04-fuga-clientes/data/base-fuga-preprocesada-original.xlsx), con 5.605 filas y 11 columnas; excluida de Git.

El notebook conserva para Random Forest un AUC de 0,922 y accuracy aproximado de 0,90. **Son resultados históricos que requieren revalidación:** la selección de atributos y parte del preprocesamiento se hicieron antes de separar entrenamiento y prueba, y el escalamiento de varios modelos se ajustó sobre toda la base. La clase mayoritaria representa aproximadamente el 87,2%, por lo que accuracy debe interpretarse junto con métricas por clase.

También deben revisarse el significado de `FUGA_NF`, la orientación de las matrices de confusión y su correspondencia con los pagos. El informe confunde en una interpretación el odds ratio con multiplicación de probabilidades. Los beneficios económicos son cálculos del ejercicio, sin evidencia de ganancias obtenidas por una empresa. SMOTE sí aparece dentro del pipeline de validación de varios clasificadores; ese aspecto del diseño se conserva.

Para repetir clasificación se necesita la base preprocesada y adaptar las rutas de Google Drive. La preparación completa no puede repetirse con estos archivos: falta `Base_Fuga_2025.xlsx`, la entrada original de esa etapa.

## Simulación del proceso del litio

**Pregunta:** ¿cómo representar mediante simulación de eventos discretos un proceso de producción de litio desde extracción de salmuera hasta productos y subproductos?

Es un estudio académico del proceso en Chile. Se conserva un modelo con cabecera FlexSim 23.0 y materiales de caracterización de pozos, composición de salmuera y análisis de salidas. La vinculación con una empresa específica y el alcance exacto de las etapas modeladas no están acreditados documentalmente en esta selección.

**Archivos utilizados:**

- [Modelo FlexSim](05-simulacion-litio/modelo/Litio-original.fsm).
- [Análisis de resultados](05-simulacion-litio/resultados/analisis-litio-original.xlsx), con secciones de producción de litio técnico y de batería, comparaciones y estadísticas de recursos.
- [Libro de test de bondad](05-simulacion-litio/resultados/test-bondad-original.xlsx).
- Fuentes locales de [características de pozos](05-simulacion-litio/data/pozos-produccion-original.xlsx) y [calidad de salmuera](05-simulacion-litio/data/calidad-pozos-original.xlsx), excluidas de Git.

El modelo se abre con una instalación compatible de FlexSim; otra versión puede requerir conversión. No se volvió a ejecutar ni se comprobó que cada salida de Excel corresponda a esa versión del `.fsm`. Tampoco se verificaron integralmente unidades, balance de masa, distribuciones de entrada o diseño de réplicas. Los libros se conservan como materiales del estudio, sin presentarlos como validación de una planta industrial.

Las siguientes mejoras de documentación serían capturas, un diagrama de etapas y la explicación de entidades, recursos y supuestos. Los archivos de Arena encontrados durante la revisión formaban otro conjunto de simulación y no se incluyeron en esta selección.

## Centro de llamadas con Amazon Athena

**Pregunta:** ¿qué patrones de atención, desconexión y calidad de audio pueden identificarse en los registros de un centro de llamadas?

El trabajo combina consultas SQL en Amazon Athena con procesamiento y gráficos en Python. Utiliza joins, agregaciones y consultas con CTE y funciones de ventana para analizar conversaciones, sesiones, flujos y segmentos. Los indicadores exploran tiempos, tipos de desconexión y calidad de las llamadas.

**Archivos utilizados:**

- [Notebook sin credenciales incrustadas](06-athena-centro-llamadas/notebooks/athena-sin-credenciales.ipynb).
- [Informe del proyecto](06-athena-centro-llamadas/informes/informe-original.docx).
- [Documento de consultas originales](06-athena-centro-llamadas/informes/consultas-originales.docx).

La preparación del portafolio retiró las claves del notebook. El cliente utiliza ahora la cadena de credenciales de boto3: perfil AWS local o variables de entorno estándar. Se retiraron las salidas de error y se conservaron gráficos y otras salidas históricas. **No se ejecutaron consultas nuevas en AWS.** La lógica analítica no se corrigió.

Para repetirlo se necesita acceso autorizado a Athena, a la base `telephonic_campaigns` y al destino S3 configurado en el código. Esas fuentes no se distribuyen aquí. Las consultas utilizan los recursos de la cuenta configurada; leer los informes no requiere acceso a AWS.

El código no implementa paginación con `NextToken`. Una consulta de tiempo por segmento combina una medida de sesión con tablas de detalle cuya multiplicidad debe revisarse. Además, falta `Datos.csv`, utilizado para uno de los gráficos. El notebook muestra el procedimiento y resultados históricos, pero necesita recuperar el entorno docente para repetir el análisis completo.

## Delitos en Los Ángeles

**Pregunta:** ¿cómo transformar registros de delitos y construir indicadores de su distribución temporal, geográfica y por características del incidente?

El proyecto integra un ETL en KNIME y un dashboard de Power BI con cuatro páginas. Incluye tratamiento de formatos y faltantes, integración de fuentes, creación de variables e interpretación de indicadores. El CSV local de delitos contiene 1.005.104 registros, con fechas entre enero de 2020 y marzo de 2025.

**Archivos utilizados:**

- [Workflow KNIME](01-business-analytics-delitos-la/2.%20ETL/etl-original.knwf).
- [Dashboard Power BI](01-business-analytics-delitos-la/3.%20Dashboard/dashboard-original.pbix).
- [Informe PDF](01-business-analytics-delitos-la/4.%20informes/informe-original.pdf).
- Datos locales de [delitos](01-business-analytics-delitos-la/1.%20Data/Crime_Data_from_2020_to_Present.csv), [arrestos](01-business-analytics-delitos-la/1.%20Data/Arrest_Data_from_2020_to_Present.csv) y [salida del ETL](01-business-analytics-delitos-la/2.%20ETL/Final_Crime_Data_from_2020_to_Present_arreglado.xlsx), excluidos de Git.

Hay errores que afectan algunos resultados: dos visualizaciones suman `DR_NO` en lugar de contar incidentes, se usa edad de personas arrestadas para completar edades de víctimas y se promedia un código categórico. Algunas afirmaciones del informe no se reconcilian con los datos, incluida la cifra de incidentes en Central. Es análisis descriptivo de delitos reportados: los conteos no equivalen automáticamente a tasas de riesgo poblacional o efectos causales.

Para abrirlo se necesitan KNIME y Power BI Desktop. Para repetir el ETL y refrescar el dashboard deben reconfigurarse las rutas y comprobarse las métricas. Las conclusiones afectadas se conservan como parte de la entrega original, sin presentarlas como resultados validados.

## Segmentación de clientes

**Objetivo:** implementar y explorar métodos de agrupamiento sobre 200 clientes.

El [notebook de clustering](02-segmentacion-clientes/2.%20Notebook/clustering-original.ipynb) contiene K-Means manual, PCA y agrupamiento jerárquico de enlace simple. La copia local de [Mall Customers](02-segmentacion-clientes/1.%20data/Mall_Customers-1.csv) permite revisar edad, ingreso y puntaje de gasto; está excluida de Git hasta documentar su procedencia.

Es un ejercicio de fundamentos. La variante inicial de K-Means con K=4 no actualiza las etiquetas del bucle; no se manejan clusters vacíos y la parada del codo compara contra las etiquetas iniciales. El jerárquico recibe los datos originales aunque se preparó una versión escalada. Estos puntos deben corregirse para confiar en la agrupación y selección de K.

El notebook utiliza Colab y rutas de Drive. También debe adaptarse el nombre del CSV: busca `Mall_Customers.csv`, mientras la copia conservada se llama `Mall_Customers-1.csv`.

## Regresión de superficies

**Objetivo:** comparar superficies lineales, cuadráticas y con términos cúbicos mediante descenso de gradiente.

Se conserva el [notebook original](03-regresion-superficies/notebooks/regresion-original.ipynb), con separación de entrenamiento y prueba, curvas de pérdida y comparación de predicciones. Demuestra una implementación manual del ajuste de parámetros.

Falta el Excel `Datos_T1DL202420_Grupo3.xlsx`, por lo que el ajuste completo no puede repetirse. La función devuelve predicciones anteriores a la última actualización de pesos, la pérdida está rotulada como MSE aunque calcula MSE/2 y se comparan modelos con niveles de convergencia distintos. MSE/2 es un objetivo válido para el gradiente; la limitación está en la rotulación y evaluación. Se conserva como ejercicio histórico, sin afirmar un ganador validado.

## Inferencia bayesiana

**Objetivo:** comparar proporciones de mujeres estudiantes y docentes con Beta-Binomial y Monte Carlo.

**Archivos utilizados:**

- [Código R](07-inferencia-bayesiana/codigo/comparacion-proporciones.R), transcrito del documento académico para facilitar su lectura y ejecución.
- [Desarrollo original en Word](07-inferencia-bayesiana/informes/desarrollo-original.docx), con código, interpretación y tablas.
- [Referencias para las priors](07-inferencia-bayesiana/fuentes/referencias-priori.xlsx).

El ejercicio aborda actualización conjugada, diferencias de proporciones, probabilidades de hipótesis, odds y factor de Bayes. Corresponde a una parte de una tarea más amplia, sin evidencia de resolución de todos sus problemas.

El código conserva su lógica original: una frecuencia simulada de cero se interpreta como probabilidad cero y genera divisiones por cero; el segundo gráfico reutiliza las primeras diferencias; no se fija semilla y las priors necesitan una justificación más sólida. La transcripción a `.R` no corrige esos puntos. No se volvió a ejecutar en R.

## Entornos y reproducibilidad

No existe un entorno único ni versiones de dependencias congeladas para toda la carpeta. Cada trabajo conserva las herramientas de su entrega.

| Proyecto | Entorno necesario | Condición para repetirlo |
| --- | --- | --- |
| Fuga | Python/Colab; pandas, NumPy, SciPy, scikit-learn, imbalanced-learn, statsmodels, Matplotlib, Seaborn, openpyxl, pydot, six y joblib; Graphviz para algunas figuras | Adaptar rutas y revisar versiones; falta la entrada cruda del preprocesamiento |
| Litio | FlexSim compatible y lector de Excel | Verificar entradas y relación entre modelo y resultados |
| Athena | Python/Colab; boto3, pandas, Matplotlib, Seaborn y Plotly | Configurar credenciales propias, permisos, tablas y destino de resultados; falta un CSV |
| Delitos | KNIME, Power BI Desktop y datos locales | Adaptar rutas y revisar transformaciones y métricas |
| Clustering | Python/Colab; NumPy, pandas, scikit-learn, SciPy, Matplotlib y Seaborn | Adaptar lectura del CSV y corregir implementación para validar resultados |
| Superficies | Python/Colab; NumPy, pandas, scikit-learn, Matplotlib y openpyxl | Recuperar el Excel original y adaptar su ruta |
| Bayes | R con ggplot2 | Ejecutar como ejercicio original; requiere revisión metodológica y numérica |

Los notebooks pueden inspeccionarse en GitHub o Jupyter. Los DOCX y formatos de aplicaciones pueden requerir descarga. Las celdas que montan Drive dependen de Colab. La adaptación local, la fijación de dependencias y las correcciones son mejoras posteriores, sin realizar en esta selección.

## Datos locales y publicación en GitHub

La carpeta conserva datos útiles para trabajar, pero `.gitignore` evita incorporarlos por defecto: los dos CSV y el Excel de delitos, Mall Customers, la base de fuga y los dos libros de fuentes del litio. También excluye credenciales, configuraciones personales, licencias de software y cachés.

**Un clon de GitHub no contendrá esos datos.** Los enlaces a archivos excluidos sirven para navegar la copia local; en GitHub no resolverán mientras esos archivos no se distribuyan por otra vía. El CSV de delitos y el Excel del ETL superan individualmente los 100 MiB admitidos por Git convencional en GitHub. [Referencia sobre archivos grandes](https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-large-files-on-github).

El informe de delitos menciona Kaggle, pero no conserva URL y versión suficientes de las fuentes. También falta documentar completamente la procedencia de Mall Customers y las condiciones de distribución de los datos docentes y de pozos. No se inventaron enlaces de descarga ni se asignó una licencia general a esos materiales. El libro de referencias bayesianas se conserva como apoyo bibliográfico del ejercicio.

## Autoría y alcance

Hay entregas grupales y partes basadas en plantillas docentes. La presencia de un archivo no implica autoría individual de todo su contenido. Los informes de Business Analytics identifican a **Lucas DeAndrade, Alonso Romero y Jorge Yapur**. El desarrollo bayesiano identifica a **Stephan Atzler, Yessica Mercado y Alonso Romero**.

La entrega de delitos atribuye a Alonso Romero los indicadores de armas utilizadas, tipos de delitos y evolución de armas. El documento de Athena le atribuye una consulta de conversaciones salientes con MOS mayor que 4. El resto de la contribución individual no está desagregado de forma verificable; se presentan los entregables como trabajo grupal. Las autorías de los demás ejercicios se conservan donde figuran en sus documentos y notebooks.

Para preparar esta carpeta se seleccionaron materiales, retiraron duplicados y credenciales, transcribió el código bayesiano a R y documentaron limitaciones. No se reentrenaron modelos ni se actualizaron resultados académicos. Las mejoras futuras deberán distinguirse de las entregas originales.
