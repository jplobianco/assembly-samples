#assembly-samples

**Repositório com exemplos simples de código Assembly x86 usando o nasm para aprendizado**


Para testar os exemplos (Formato ELF):
```bash
git clone git@github.com:jplobianco/assembly-samples.git
cd assembly-samples/copy_file
nasm -f elf copy_file.s
ld -m elf_i386 -o copy_file *.o
./copy_file
```