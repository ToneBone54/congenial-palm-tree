import func as f

def routine():
    while True:
        choice = str(input("What would you like to do? (new, edit, overwrite, read, delete, exit): "))

        match choice:
            case "new":
                f.file_create()
            case "edit":
                f.file_edit()
            case "overwrite":
                f.file_write()
            case "read":
                f.file_read()
            case "delete":
                f.file_del()
            case "exit":
                return
            case _:
                print("Invalid option")

routine()