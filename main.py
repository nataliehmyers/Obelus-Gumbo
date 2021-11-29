

#Opens the file and returns the file pointer
def open_file():
    while True:
        try:
            file_name = input("Please enter the file name.")
            file_ptr = open(file_name, "r")
            return file_name
        except:
            print("Unable to open file, please enter valid file path.")

#reserved_keys keeps track of important words and characters in python
def build_reserved_keys():
    reserved_keys = []
    reserved_words = ["if","else"]
    reserved_loops = ["while","for"]
    reserved_arithmetic_operators = ['+','-','*','/','%','^']
    reserved_assignment_operators = ['=','+=','-=','*=','^=','%=']
    reserved_conditional_statements = ['<','<=','>','>=','==','!=','and','or','not']
    reserved_comments = ['#']

    reserved_keys.append(reserved_words)
    reserved_keys.append(reserved_loops)
    reserved_keys.append(reserved_arithmetic_operators)
    reserved_keys.append(reserved_assignment_operators)
    reserved_keys.append(reserved_conditional_statements)
    reserved_keys.append(reserved_comments)

    return reserved_keys


def main():
    file_ptr = open_file()
    reserved_keys = build_reserved_keys()
    file_ptr.close()

main()