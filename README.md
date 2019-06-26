# assembly-samples

**Repositório com exemplos simples de código Assembly Intel x86 usando o nasm para aprendizado**


Para testar os exemplos (Formato ELF):
```bash
git clone git@github.com:jplobianco/assembly-samples.git
cd assembly-samples/copy_file
nasm -f elf *.s
ld -m elf_i386 *.o
./a.out
```
