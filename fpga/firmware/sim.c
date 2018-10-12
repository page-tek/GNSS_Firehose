// Picorv32 simulator firmware
//
// Copyright 2017 Peter Monta
//



#include "delay.c"
#include "io.c"





int main()
{   
int i;

i = port_read(2);

port_write(3,i);

 }
