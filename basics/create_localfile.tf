resource "local_file" "test"{  //BLOCK NAME  "RESOURCE TYPE" "RESOURCE NAME (CAN BE ANYTHING)"
    // LOCAL=Provider File=Resource Type
    filename="/root/text.txt"   //ARGUMENTS
    content = "Hello World!"
}
//EACH RESOURCE TYPE HAS DIFFERENT ARGUMENTS SPECIFIC TO IT.