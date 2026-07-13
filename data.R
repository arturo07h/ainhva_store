# Función para leer imágenes de una carpeta y crear catálogo
crear_productos <- function(categoria, path, nombres, descripciones, precios) {
  
  imagenes <- list.files(
    path = path,
    pattern = "\\.(png|jpg|jpeg|webp)$",
    full.names = TRUE
  )
  
  n <- length(imagenes)
  
  data.frame(
    id = paste0(categoria, "-", seq_len(n)),
    categoria = categoria,
    nombre = nombres[seq_len(n)],
    descripcion = descripciones[seq_len(n)],
    precio = precios[seq_len(n)],
    img = imagenes,
    whatsapp_text = paste0(
      "Hola, me interesa el ",
      nombres[seq_len(n)],
      ". ¿Me puedes dar más información?"
    ),
    stringsAsFactors = FALSE
  )
}

# -------------------------
# ARCO
# -------------------------

productos_arco <- crear_productos(
  categoria = "arco",
  path = "img/arco",
  nombres = c(
    "Espejo Arco Classic",
    "Espejo Arco Natural",
    "Espejo Arco Full Body",
    "Espejo Arco Minimal"
  ),
  descripciones = c(
    "Espejo de cuerpo completo con diseño de arco y marco cálido.",
    "Diseño elegante para recámaras, salas y vestidores.",
    "Espejo vertical ideal para ampliar visualmente tus espacios.",
    "Estilo minimalista con acabado natural y líneas suaves."
  ),
  precios = c(
    "$2,500 - $3,500 MXN",
    "$2,800 - $3,800 MXN",
    "$3,000 - $4,200 MXN",
    "$2,700 - $3,700 MXN"
  )
)

# -------------------------
# IRREGULARES
# -------------------------

productos_irregulares <- crear_productos(
  categoria = "irregulares",
  path = "img/irregulares",
  nombres = c(
    "Espejo Onda Serena",
    "Espejo Bruma Orgánica"
  ),
  descripciones = c(
    "Diseño irregular con líneas suaves que aporta movimiento y personalidad al espacio.",
    "Espejo decorativo de silueta libre, ideal para crear un punto focal elegante y natural."
  ),
  precios = c(
    "$1,900 - $2,700 MXN",
    "$2,100 - $2,900 MXN"
  )
)

# -------------------------
# REDONDOS
# -------------------------

productos_redondos <- crear_productos(
  categoria = "redondos",
  path = "img/redondos",
  nombres = c(
    "Espejo Círculo Aura",
    "Espejo Sol de Casa"
  ),
  descripciones = c(
    "Espejo redondo de estilo cálido y limpio, perfecto para recibidores, salas o tocadores.",
    "Diseño circular minimalista que ilumina visualmente el espacio y aporta equilibrio."
  ),
  precios = c(
    "$1,600 - $2,300 MXN",
    "$1,800 - $2,600 MXN"
  )
)

# -------------------------
# UNIR TODO Y EXPORTAR
# -------------------------

productos <- rbind(
  productos_arco,
  productos_irregulares,
  productos_redondos
)

write.csv(
  productos,
  "productos.csv",
  row.names = FALSE,
  fileEncoding = "UTF-8"
)