-- ===================================================================
-- Limpiezas Torrenueva - Seed de los 5 primeros artículos del blog
-- Ejecutar DESPUÉS de supabase_blog_v2.sql en SQL Editor de Supabase
-- ===================================================================

-- Borrar previos por si se re-ejecuta (sólo los que vamos a insertar)
delete from posts where slug in (
    'cuanto-cuesta-limpieza-comunidades-torrevieja',
    'como-limpiar-garaje-comunitario-guia-2026',
    'limpieza-oficinas-torrevieja-frecuencia-presupuesto',
    'fregadora-industrial-como-elegir',
    'empresa-limpieza-orihuela-costa-que-buscar'
);

insert into posts (title, slug, category, tag, keyword_principal, reading_time, meta_title, meta_description, description, image_url, published, content) values
(
'Cuánto cuesta una empresa de limpieza de comunidades en Torrevieja',
'cuanto-cuesta-limpieza-comunidades-torrevieja',
'comunidades',
'Comunidades',
'precio limpieza comunidades Torrevieja',
8,
'Precio Limpieza de Comunidades en Torrevieja 2026 [Guía + Tarifas]',
'¿Cuánto cuesta la limpieza de comunidades en Torrevieja? Precios reales por vivienda, factores y cómo conseguir el mejor presupuesto. ☎ 604 438 618',
'Conoce los precios reales de la limpieza de comunidades en Torrevieja y la Vega Baja en 2026. Factores que influyen, tarifas medias y cómo ahorrar sin perder calidad.',
'/blog-comunidades.png',
true,
'<p>Si presides una comunidad de vecinos en Torrevieja o en cualquier municipio de la Vega Baja, en algún momento te has hecho la misma pregunta: <strong>¿cuánto debería costar la limpieza de mi comunidad?</strong> En este artículo te explicamos los precios reales del mercado en 2026, los factores que más influyen y cómo conseguir un presupuesto justo y transparente.</p>

<h2>Precio medio de la limpieza de comunidades en Torrevieja</h2>
<p>El precio de la <strong>limpieza de comunidades en Torrevieja</strong> oscila habitualmente entre <strong>4 y 12 euros por vivienda al mes</strong>, dependiendo de varios factores que veremos a continuación. Es un servicio que se paga por adelantado mensualmente y se suele contratar por períodos de 12 meses con revisión anual.</p>
<p>Como orientación práctica:</p>
<ul>
    <li><strong>Comunidad pequeña</strong> (10-20 viviendas, 1 portal, sin garaje): entre <strong>180 € y 350 € al mes</strong>.</li>
    <li><strong>Comunidad mediana</strong> (20-50 viviendas, 1-2 portales, con garaje): entre <strong>350 € y 800 € al mes</strong>.</li>
    <li><strong>Comunidad grande</strong> (+50 viviendas, varios portales, garaje grande, piscina): entre <strong>800 € y 2.000 € al mes</strong>.</li>
</ul>

<h2>Factores que influyen en el precio</h2>
<h3>1. Tamaño y configuración del edificio</h3>
<p>El número de viviendas, plantas y portales es el factor más importante. No cuesta lo mismo limpiar un bloque de 12 viviendas con un portal y sin ascensor que una urbanización con 5 bloques, garaje subterráneo de 3 plantas y zona ajardinada.</p>

<h3>2. Frecuencia de limpieza</h3>
<p>La mayoría de comunidades contratan limpieza <strong>2 o 3 días por semana</strong> en zonas comunes (escaleras, portales, ascensores) más una limpieza más profunda mensual. Subir a 5 días a la semana puede incrementar el presupuesto un 40-60 %.</p>

<h3>3. Servicios incluidos</h3>
<p>El precio base cubre habitualmente:</p>
<ul>
    <li>Barrido y fregado de escaleras y portales</li>
    <li>Limpieza de ascensores</li>
    <li>Vaciado de papeleras</li>
    <li>Limpieza de cristales del portal</li>
</ul>
<p>Servicios adicionales que se contratan aparte:</p>
<ul>
    <li>Limpieza de garaje con fregadora industrial (+150 a 400 € al mes)</li>
    <li>Mantenimiento de piscina y zonas exteriores</li>
    <li>Limpieza de cristales en altura (anual o semestral)</li>
    <li>Tratamientos de suelos (abrillantado, pulido)</li>
</ul>

<h3>4. Ubicación dentro de la Vega Baja</h3>
<p>El desplazamiento influye. En <strong>Torrevieja centro, Orihuela Costa, La Mata y Guardamar</strong> tenemos cobertura inmediata. Para municipios más alejados (Rojales, Pilar de la Horadada, San Miguel) puede haber un ligero suplemento logístico.</p>

<h3>5. Maquinaria necesaria</h3>
<p>Si tu comunidad tiene <strong>garaje grande, parking exterior o muchos m² de zonas comunes</strong>, una empresa que disponga de <strong>fregadora industrial y barredora propias</strong> reducirá tu coste a la larga frente a las que subcontratan o lo hacen a mano.</p>

<h2>Cómo conseguir un presupuesto justo</h2>
<p>Sigue estos pasos para obtener el mejor presupuesto sin sustos posteriores:</p>
<ol>
    <li><strong>Pide al menos 3 presupuestos</strong> a empresas distintas en la zona.</li>
    <li><strong>Exige visita previa</strong>. Cualquier empresa seria debe ver el edificio antes de cotizar.</li>
    <li><strong>Pide presupuesto desglosado</strong> por servicio y frecuencia.</li>
    <li><strong>Verifica seguros</strong> (Responsabilidad Civil obligatoria) y referencias.</li>
    <li><strong>Pacta la duración</strong> del contrato (mínimo 12 meses pero con cláusula de salida).</li>
    <li><strong>Define KPI</strong>: ¿quién supervisa la calidad? ¿cómo se reportan incidencias?</li>
</ol>

<h2>Por qué elegir Limpiezas Torrenueva</h2>
<p>En <strong>Limpiezas Torrenueva</strong> llevamos más de <strong>15 años limpiando comunidades en Torrevieja</strong> y la Vega Baja. Trabajamos con más de 200 comunidades, contamos con maquinaria propia, personal cualificado y un sistema de supervisión que garantiza la calidad mes a mes. Te visitamos sin compromiso y te ofrecemos un presupuesto detallado en menos de 24 horas.</p>

<blockquote>"Desde que contratamos a Limpiezas Torrenueva, nuestra comunidad está impecable. El personal es muy educado y detallista." — María José G., Presidenta Comunidad Residencial Marina</blockquote>

<h2>Preguntas frecuentes sobre la limpieza de comunidades</h2>
<h3>¿Es obligatorio contratar una empresa de limpieza?</h3>
<p>No es obligatorio por ley, pero sí es la opción más rentable y profesional cuando la comunidad supera las 8-10 viviendas.</p>

<h3>¿Se puede cambiar de empresa a mitad de contrato?</h3>
<p>Sí, siempre que respetes las condiciones de cancelación pactadas en el contrato (habitualmente 30-60 días de preaviso).</p>

<h3>¿Quién supervisa la calidad del trabajo?</h3>
<p>En Limpiezas Torrenueva tenemos supervisores propios que visitan cada comunidad mínimo una vez al mes y reportan al presidente o al administrador de fincas.</p>'
),

(
'Cómo limpiar un garaje comunitario: guía profesional 2026',
'como-limpiar-garaje-comunitario-guia-2026',
'garajes',
'Garajes',
'limpieza garaje comunitario',
9,
'Limpiar Garaje Comunitario: Guía Profesional 2026 [Pros]',
'Cómo limpiar un garaje comunitario paso a paso: frecuencia, maquinaria, productos y coste. Guía profesional para presidentes y administradores. ☎ 604 438 618',
'Guía profesional 2026 para la limpieza de garajes comunitarios: frecuencia, maquinaria, productos, manchas de aceite y presupuesto medio en Torrevieja y Vega Baja.',
'/blog-garajes.png',
true,
'<p>El garaje es la <strong>zona común más sucia y a la vez más olvidada</strong> de la mayoría de comunidades. Una limpieza profesional periódica no solo mejora la imagen del edificio, sino que <strong>previene accidentes, alarga la vida del pavimento</strong> y evita malos olores y plagas. Esta es nuestra guía profesional 2026 para limpiar un garaje comunitario en Torrevieja y Vega Baja.</p>

<h2>¿Por qué es tan importante limpiar el garaje?</h2>
<p>Un garaje sucio acumula manchas de aceite, restos de neumático, polvo, hojas y residuos orgánicos. Esto provoca:</p>
<ul>
    <li>Deterioro acelerado del pavimento</li>
    <li>Riesgo de resbalones y caídas (responsabilidad civil para la comunidad)</li>
    <li>Olores desagradables que afectan a los vecinos</li>
    <li>Aparición de plagas e insectos</li>
    <li>Peor imagen de la comunidad de cara a visitantes y compradores</li>
</ul>

<h2>Frecuencia recomendada</h2>
<p>La frecuencia depende del tamaño y uso, pero como orientación general:</p>
<ul>
    <li><strong>Barrido y recogida de basuras</strong>: semanal o quincenal</li>
    <li><strong>Fregado con fregadora industrial</strong>: mensual o trimestral</li>
    <li><strong>Limpieza profunda con hidrolimpiadora</strong>: 1-2 veces al año</li>
    <li><strong>Tratamiento de manchas puntuales</strong>: a demanda</li>
</ul>

<h2>Maquinaria profesional necesaria</h2>
<h3>Fregadora industrial</h3>
<p>Es la herramienta clave. Una <strong>fregadora de hombre a bordo</strong> puede limpiar entre 1.000 y 2.000 m² por hora con resultado uniforme. Para garajes pequeños, una fregadora de empuje manual es suficiente.</p>

<h3>Barredora</h3>
<p>Para zonas exteriores o garajes muy grandes, la barredora industrial recoge polvo, hojas y restos antes de pasar la fregadora.</p>

<h3>Hidrolimpiadora de alta presión</h3>
<p>Indispensable para limpieza profunda anual y para tratar manchas de aceite y grasa difíciles.</p>

<h3>Aspirador industrial</h3>
<p>Para zonas con polvo fino o residuos orgánicos donde no se puede mojar.</p>

<h2>Productos profesionales</h2>
<ul>
    <li><strong>Detergente desengrasante alcalino</strong> para suelos de hormigón</li>
    <li><strong>Desengrasante específico de aceites minerales</strong> para manchas</li>
    <li><strong>Limpiadores con pH neutro</strong> para suelos epoxi o pintados</li>
    <li><strong>Tratamientos antideslizantes</strong> en zonas de riesgo</li>
</ul>
<p>Nunca uses lejía concentrada o productos ácidos en suelos de garaje: pueden dañar el hormigón y la pintura horizontal.</p>

<h2>Cómo eliminar las manchas de aceite</h2>
<ol>
    <li>Aplicar desengrasante específico directamente sobre la mancha</li>
    <li>Dejar actuar 5-15 minutos según severidad</li>
    <li>Cepillar enérgicamente con cepillo de cerdas duras</li>
    <li>Aclarar con hidrolimpiadora</li>
    <li>Repetir si es necesario</li>
</ol>
<p>Para manchas antiguas o muy incrustadas hace falta producto profesional y, en algunos casos, granallado o lijado del hormigón.</p>

<h2>Coste medio en Torrevieja y Vega Baja</h2>
<p>El servicio de limpieza periódica de garajes en Torrevieja oscila entre:</p>
<ul>
    <li><strong>Garaje pequeño</strong> (10-20 plazas): 80-150 € por servicio</li>
    <li><strong>Garaje mediano</strong> (20-50 plazas): 150-300 € por servicio</li>
    <li><strong>Garaje grande</strong> (+50 plazas): 300-700 € por servicio</li>
</ul>
<p>Si se contrata como parte del paquete de limpieza de comunidades, el coste por servicio individual baja un 20-30 %.</p>

<h2>Errores comunes que cometen las comunidades</h2>
<ul>
    <li>Limpiar solo a mano sin maquinaria profesional (resultado pobre y caro)</li>
    <li>Usar productos no aptos para hormigón</li>
    <li>Espaciar demasiado las limpiezas (cuanto más sucio, más cuesta)</li>
    <li>Contratar empresas sin seguro de Responsabilidad Civil</li>
    <li>No revisar el pavimento periódicamente</li>
</ul>

<h2>¿Por qué confiar en Limpiezas Torrenueva?</h2>
<p>En Limpiezas Torrenueva tenemos <strong>flota propia de fregadoras industriales, barredoras e hidrolimpiadoras</strong> para garajes de cualquier tamaño en Torrevieja, Orihuela Costa, Guardamar y toda la Vega Baja. Más de 15 años trabajando con comunidades de vecinos y administradores de fincas nos avalan.</p>

<p><strong>Pide tu presupuesto sin compromiso llamando al 604 438 618</strong> o desde nuestra página de contacto.</p>'
),

(
'Limpieza de oficinas en Torrevieja: frecuencia y presupuesto',
'limpieza-oficinas-torrevieja-frecuencia-presupuesto',
'oficinas',
'Oficinas',
'limpieza oficinas Torrevieja',
7,
'Limpieza de Oficinas Torrevieja: Precio y Frecuencia 2026',
'Limpieza profesional de oficinas en Torrevieja: frecuencia recomendada, precios reales por m² y servicios incluidos. Presupuesto en 24h ☎ 604 438 618',
'Todo sobre la limpieza profesional de oficinas en Torrevieja: frecuencia recomendada, presupuestos reales por m² y servicios incluidos en 2026.',
'/blog-comunidades.png',
true,
'<p>Mantener una <strong>oficina limpia y ordenada</strong> es mucho más que una cuestión estética: mejora la productividad de tu equipo, reduce las bajas por enfermedad y transmite profesionalidad a tus clientes. Esta es nuestra guía 2026 sobre <strong>limpieza profesional de oficinas en Torrevieja</strong>.</p>

<h2>¿Con qué frecuencia hay que limpiar una oficina?</h2>
<p>La frecuencia depende del tamaño de la oficina y del número de personas que trabajan en ella. Como guía:</p>
<ul>
    <li><strong>Oficinas pequeñas</strong> (1-5 personas): 2-3 veces por semana</li>
    <li><strong>Oficinas medianas</strong> (5-20 personas): de lunes a viernes</li>
    <li><strong>Oficinas grandes</strong> (+20 personas): limpieza diaria + repaso medio día</li>
</ul>

<h2>Tareas habituales en una limpieza de oficina profesional</h2>
<ul>
    <li>Aspirado y fregado de suelos</li>
    <li>Limpieza de mesas, sillas y mobiliario</li>
    <li>Limpieza y desinfección de baños</li>
    <li>Limpieza y reposición de cocina/sala de descanso</li>
    <li>Vaciado de papeleras y reciclaje</li>
    <li>Limpieza de cristales interiores</li>
    <li>Desinfección de pomos, interruptores y zonas de contacto</li>
    <li>Tareas mensuales: techos, rejillas de aire acondicionado, mamparas</li>
</ul>

<h2>Precio de la limpieza de oficinas en Torrevieja</h2>
<p>El precio se calcula habitualmente <strong>por m² o por hora</strong>:</p>
<ul>
    <li><strong>Por hora</strong>: 14-22 € + IVA según servicios incluidos</li>
    <li><strong>Por m² mensual</strong>: 1,50-4 € + IVA según frecuencia y dificultad</li>
</ul>
<p>Ejemplos reales en Torrevieja:</p>
<ul>
    <li>Oficina de 80 m², 3 veces por semana: <strong>220-340 € al mes</strong></li>
    <li>Oficina de 200 m², 5 días a la semana: <strong>550-900 € al mes</strong></li>
    <li>Coworking de 500 m², diario: <strong>1.300-2.000 € al mes</strong></li>
</ul>

<h2>Servicios complementarios</h2>
<ul>
    <li><strong>Limpieza de moquetas y alfombras</strong> (trimestral o semestral)</li>
    <li><strong>Limpieza de cristales en altura</strong></li>
    <li><strong>Tratamientos de suelo</strong> (abrillantado, encerado)</li>
    <li><strong>Desinfección sanitaria</strong> con ozono o productos virucidas</li>
    <li><strong>Limpieza de fin de obra</strong></li>
</ul>

<h2>Cómo elegir la empresa adecuada</h2>
<p>Antes de firmar:</p>
<ul>
    <li>Pide visita técnica gratuita</li>
    <li>Asegúrate de que tienen seguro de Responsabilidad Civil</li>
    <li>Comprueba referencias en oficinas similares</li>
    <li>Define horarios (la mayoría limpia fuera del horario laboral)</li>
    <li>Pide protocolo de discreción y confidencialidad</li>
</ul>

<h2>Limpiezas Torrenueva: tu empresa de limpieza de oficinas en Torrevieja</h2>
<p>Limpiamos oficinas, despachos profesionales, coworkings y clínicas en toda la <strong>Vega Baja</strong>. Adaptamos horarios a tus necesidades (madrugada, tarde-noche o fines de semana) y supervisamos cada servicio personalmente.</p>

<p><strong>¿Quieres un presupuesto a medida? Llámanos al 604 438 618</strong> o escríbenos desde nuestra página de contacto.</p>'
),

(
'Fregadora industrial: cómo elegir la mejor para tu negocio',
'fregadora-industrial-como-elegir',
'maquinaria',
'Maquinaria',
'comprar fregadora industrial',
10,
'Fregadora Industrial: Cómo Elegir la Mejor [Guía 2026]',
'Guía 2026 para elegir fregadora industrial: tipos, rendimiento, precios y comparativa. Asesoramiento profesional en Torrevieja ☎ 604 438 618',
'Todo lo que necesitas saber para comprar la fregadora industrial perfecta para tu negocio: tipos, rendimiento, precios y errores a evitar.',
'/blog-maquinaria.png',
true,
'<p>La <strong>fregadora industrial</strong> es la inversión más rentable para cualquier negocio que necesite limpiar superficies medianas o grandes con regularidad. Pero el catálogo es enorme y elegir mal puede salir caro. Esta guía 2026 te ayudará a acertar.</p>

<h2>Tipos de fregadora industrial</h2>
<h3>Fregadora de empuje manual</h3>
<p>El operario empuja la máquina caminando. Ideal para superficies pequeñas o medianas (hasta 600 m²) y zonas con muchos obstáculos. Precio: <strong>1.200-3.500 €</strong>.</p>

<h3>Fregadora de hombre a bordo</h3>
<p>El operario va sentado o de pie sobre la máquina. Mucha más productividad (hasta 5.000 m²/h). Indicada para parkings, grandes superficies y naves. Precio: <strong>6.000-25.000 €</strong>.</p>

<h3>Fregadora robotizada</h3>
<p>Trabaja sola siguiendo un mapa preprogramado. Aporta autonomía total pero requiere inversión inicial alta. Precio: desde <strong>20.000 €</strong>.</p>

<h2>Cable o batería: ¿cuál elegir?</h2>
<ul>
    <li><strong>Con cable</strong>: más económica, menos autonomía limitada por el cable, ideal para zonas pequeñas con enchufe accesible.</li>
    <li><strong>Con batería</strong>: autonomía 2-8h sin cables, más cómoda y segura, pero más cara.</li>
</ul>

<h2>Rendimiento (m² por hora)</h2>
<p>El rendimiento depende del ancho de cepillo y la velocidad:</p>
<ul>
    <li><strong>Cepillo 40 cm, manual</strong>: 800-1.200 m²/h</li>
    <li><strong>Cepillo 50 cm, manual</strong>: 1.500-2.000 m²/h</li>
    <li><strong>Cepillo 70 cm, hombre a bordo</strong>: 3.000-4.500 m²/h</li>
    <li><strong>Cepillo 90 cm, hombre a bordo</strong>: 4.500-6.000 m²/h</li>
</ul>

<h2>¿En qué superficies funciona mejor?</h2>
<p>Cualquier suelo duro: hormigón, gres, porcelánico, terrazo, suelo pintado, epoxi. Para suelos de madera o moquetas existen máquinas específicas distintas.</p>

<h2>Cuánto cuesta usar una fregadora industrial</h2>
<p>El consumo medio es bajísimo: <strong>0,3-1,5 € por cada 1.000 m² limpiados</strong> en agua, detergente y electricidad. Frente al coste de mano de obra manual (12-18 €/h), la fregadora se amortiza rapidísimo.</p>

<h2>Comprar vs alquilar</h2>
<ul>
    <li><strong>Comprar</strong>: rentable si la vas a usar más de 8 horas a la semana.</li>
    <li><strong>Alquilar</strong>: ideal para necesidades puntuales (limpiezas de fin de obra, eventos) o si quieres probar antes de comprar.</li>
</ul>

<h2>Errores comunes al comprar fregadora industrial</h2>
<ul>
    <li>Comprar una máquina pequeña porque es barata cuando tu superficie es grande</li>
    <li>No tener en cuenta el peso (algunas pasan de 200 kg y no caben en ascensor)</li>
    <li>Olvidar el servicio técnico postventa</li>
    <li>No probarla antes de comprarla</li>
    <li>Comprar a vendedores no especialistas que no te asesoran</li>
</ul>

<h2>Mantenimiento básico</h2>
<ul>
    <li>Vaciar y aclarar depósitos después de cada uso</li>
    <li>Revisar cepillos y rasqueta una vez al mes</li>
    <li>Cargar batería completamente entre usos</li>
    <li>Servicio técnico anual</li>
</ul>

<h2>¿Te asesoramos sin compromiso?</h2>
<p>En Limpiezas Torrenueva llevamos más de 15 años usando y vendiendo fregadoras industriales en Torrevieja y la Vega Baja. Te ayudamos a elegir la máquina perfecta para tu actividad, sin que pagues de más y con garantía y servicio técnico propio.</p>

<p><strong>Llámanos al 604 438 618</strong> y nuestros expertos te asesoran sin compromiso.</p>'
),

(
'Empresa de limpieza en Orihuela Costa: qué buscar antes de contratar',
'empresa-limpieza-orihuela-costa-que-buscar',
'zonas',
'Zonas',
'empresa limpieza Orihuela Costa',
7,
'Empresa de Limpieza en Orihuela Costa: Guía 2026 [Pros]',
'¿Buscas empresa de limpieza en Orihuela Costa? Te explicamos qué buscar, precios reales y cómo elegir. Limpiezas Torrenueva ☎ 604 438 618',
'Cómo elegir empresa de limpieza en Orihuela Costa: criterios clave, precios reales y particularidades de las urbanizaciones de la zona.',
'/blog-comunidades.png',
true,
'<p><strong>Orihuela Costa</strong> es una de las zonas con mayor densidad de comunidades de vecinos de toda la Vega Baja. Campoamor, Cabo Roig, La Zenia, Playa Flamenca, Villamartín, Punta Prima... cientos de urbanizaciones que necesitan servicios profesionales de limpieza periódica. Esta guía te ayuda a elegir bien.</p>

<h2>Particularidades de las comunidades en Orihuela Costa</h2>
<p>Las comunidades de Orihuela Costa tienen características muy específicas que cualquier empresa profesional debe conocer:</p>
<ul>
    <li><strong>Tamaño grande</strong>: muchas superan los 100 vecinos y tienen varios bloques.</li>
    <li><strong>Alta rotación turística</strong>: muchos propietarios son extranjeros con alquiler vacacional.</li>
    <li><strong>Idiomas</strong>: inglés, alemán, sueco, francés son habituales en las reuniones.</li>
    <li><strong>Zonas comunes extensas</strong>: piscinas, jardines, garajes subterráneos grandes.</li>
    <li><strong>Picos estacionales</strong>: el verano multiplica el uso de las instalaciones.</li>
</ul>

<h2>Criterios clave para elegir</h2>
<h3>1. Experiencia local</h3>
<p>Busca empresas con presencia real en Orihuela Costa, no solo en Torrevieja. Saber cómo llegar rápido a Cabo Roig o La Zenia un domingo de agosto marca la diferencia.</p>

<h3>2. Maquinaria propia</h3>
<p>Los parkings subterráneos de las urbanizaciones grandes requieren <strong>fregadora industrial</strong>. Confirma que la empresa la tiene en propiedad.</p>

<h3>3. Personal estable</h3>
<p>Las comunidades valoran ver siempre las mismas caras. Pregunta por la rotación de personal y la antigüedad media.</p>

<h3>4. Supervisión real</h3>
<p>Un encargado debe visitar la urbanización mínimo 1 vez al mes y reportar al presidente o administrador.</p>

<h3>5. Seguros y normativa</h3>
<p>Seguro de Responsabilidad Civil obligatorio. Cumplimiento de Prevención de Riesgos Laborales. Trabajadores dados de alta correctamente.</p>

<h3>6. Comunicación multiidioma</h3>
<p>Si tu junta tiene vecinos extranjeros, valora que la empresa pueda atender en inglés básico.</p>

<h2>Precios en Orihuela Costa</h2>
<p>Las urbanizaciones de Orihuela Costa suelen pagar:</p>
<ul>
    <li><strong>Mediana</strong> (40-80 viviendas): 400-900 € al mes</li>
    <li><strong>Grande</strong> (80-200 viviendas): 900-2.500 € al mes</li>
    <li><strong>Resort/complejo</strong> (+200 viviendas): a partir de 2.500 € al mes</li>
</ul>
<p>El garaje, las piscinas y las zonas exteriores se suelen presupuestar aparte.</p>

<h2>Servicios habituales que se contratan</h2>
<ul>
    <li>Limpieza de portales y escaleras (3-5 días/semana)</li>
    <li>Limpieza de ascensores</li>
    <li>Limpieza de garaje (mensual con fregadora)</li>
    <li>Limpieza de cristales en altura (semestral)</li>
    <li>Mantenimiento de zonas exteriores</li>
    <li>Refuerzo en temporada alta de verano</li>
</ul>

<h2>Por qué Limpiezas Torrenueva en Orihuela Costa</h2>
<p>Trabajamos con decenas de comunidades en Campoamor, Cabo Roig, La Zenia, Playa Flamenca, Villamartín y Punta Prima. Tenemos <strong>fregadora industrial propia, equipo de cristales en altura</strong>, encargados con dominio del inglés y supervisión mensual incluida.</p>

<p>Sabemos lo que es trabajar en agosto con la urbanización al 100 % de ocupación y entendemos las particularidades de cada zona.</p>

<p><strong>Pide tu presupuesto sin compromiso al 604 438 618</strong> o desde el formulario de contacto. Te visitamos en menos de 48 horas.</p>'
);
