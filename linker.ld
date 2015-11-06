ENTRY(_start)

SECTIONS
{
    /* start at 1MiB addr*/
    . = 1M;
    /* load the multiboot header first then the .text*/
    .text BLOCK(4K): ALIGN(4K)
    {
        *(.multiboot)
        *(.text)
    }
    /* Read only data.*/
    .rodata BLOCK(4K): ALIGN(4K)
    {
        *(.rodata)
    }

    /* Read-write data*/
    .data BLOCK(4K): ALIGN(4K)
    {
        *(.data)
    }

    /* Read-write data (unitialized) and stack*/
    .bss BLOCK(4K): ALIGN(4K)
    {
        *(COMMON)
        *(.bss)
        *(.bootstrap_stack)
    }
}