import brotli
import os

# Cambia esto por el nombre exacto de tu archivo generado
input_file = "Dungeon Frog.wasm" 
output_file = "Dungeon Frog.br"

def compress_wasm():
    if not os.path.exists(input_file):
        print(f"Error: No encontr el archivo {input_file}")
        return

    print(f"Comprimiendo {input_file} (esto puede tardar unos segundos)...")
    
    with open(input_file, "rb") as f:
        data = f.read()

    # quality=11 es el estndar de oro para la web
    compressed = brotli.compress(data, quality=11, lgwin=22)

    with open(output_file, "wb") as f:
        f.write(compressed)

    original_size = os.path.getsize(input_file) / (1024 * 1024)
    final_size = os.path.getsize(output_file) / (1024 * 1024)

    print(f"Listo!")
    print(f"Tamao original: {original_size:.2f} MB")
    print(f"Tamao comprimido (.br): {final_size:.2f} MB")
    
    if final_size < 10:
        print(" Perfecto para Poki!")
    else:
        print(" Sigue por encima de 10MB, pero Poki igual lo aceptar si es razonable.")

if __name__ == "__main__":
    compress_wasm()