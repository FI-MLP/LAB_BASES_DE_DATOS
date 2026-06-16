#!/bin/bash
# ============================================================
# Script para crear la estructura de carpetas
# Prácticas y Previos del 06 al 14 con grupos G1, G2, G3
# Ejecutar desde la raíz del repositorio: bash crear_estructura.sh
# ============================================================

echo "🚀 Creando estructura de carpetas..."

# ---------- PRÁCTICAS 06 a 14 ----------
for num in 06 07 08 09 10 11 12 13 14; do
    for grupo in G1 G2 G3; do
        mkdir -p "docs/practicas/P${num}/${grupo}"
        touch "docs/practicas/P${num}/${grupo}/.gitkeep"
        echo "  ✅ docs/practicas/P${num}/${grupo}/"
    done
done

# ---------- PREVIOS 06 a 14 ----------
for num in 06 07 08 09 10 11 12 13 14; do
    for grupo in G1 G2 G3; do
        mkdir -p "docs/previos/PrevioP${num}/${grupo}"
        touch "docs/previos/PrevioP${num}/${grupo}/.gitkeep"
        echo "  ✅ docs/previos/PrevioP${num}/${grupo}/"
    done
done

echo ""
echo "🎉 ¡Listo! Ahora agrega los cambios a Git:"
echo ""
echo "  git add ."
echo "  git commit -m 'feat: agregar estructura de carpetas P06-P14'"
echo "  git push origin main"