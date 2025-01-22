# Power Check in Assembly (x86)

This repo contains a simple implementation to check if a given number is a power of 2 using Assembly for the x86 architecture. It's a classwork for my **Computer Architecture** class in college. The goal is to practice low-level programming, understand bitwise operations, and work directly with assembly language on the x86 architecture.

## How It Works

The program uses the following bitwise equation to check if a quocient \( q \) is a power of 2:

```text
q & (q - 1) = 0
```
So, if the result of `q & (q - 1)` is zero, `q` is a power of 2.

## Running the Code
To assemble and run the code, make sure that you already have `gcc` installed, and then:

1. Link the object file to create the executable:
```bash
gcc -m32 -o power-check bitwise.s
```

2. Run the program:
```bash
./power-check
```
