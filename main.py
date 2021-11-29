

#Opens the file and returns the file pointer
def open_file():
    while True:
        try:
            file_name = input("Please enter the file name: ")
            file_ptr = open(file_name, "r")
            return file_name
        except:
            print("Unable to open file, please enter valid file path.")

#reserved_keys keeps track of important words and characters in python
def build_reserved_keys():
    reserved_keys = []
    #Declare reserved keys
    reserved_words = ['if','else']
    reserved_loops = ['while','for']
    reserved_arithmetic_operators = ['+','-','*','/','%','^']
    reserved_assignment_operators = ['=','+=','-=','*=','^=','%=']
    reserved_conditional_statements = ['<','<=','>','>=','==','!=','and','or','not']
    reserved_comments = ['#']

    #Add reserved keys to list
    reserved_keys.append(reserved_words)
    reserved_keys.append(reserved_loops)
    reserved_keys.append(reserved_arithmetic_operators)
    reserved_keys.append(reserved_assignment_operators)
    reserved_keys.append(reserved_conditional_statements)
    reserved_keys.append(reserved_comments)

    return reserved_keys

#Identify each 'word' in file
def identify_keys(file_ptr, reserved_keys):

    for line in file_ptr:
        new_line = line.split()  #Splits into a list, each element is a 'word'
        for element in new_line:
            #Element is a reserved word (if/else)
            if element in reserved_keys[0]:
                continue
            #Element is a reserved loop
            elif element in reserved_keys[1]:
                continue
            #Element is a reserved arithmetic operator
            elif element in reserved_keys[2]:
                continue
            #Element is a reserved assignment operator
            elif element in reserved_keys[3]:
                continue
            #Element is a reserved conditional statement
            elif element in reserved_keys[4]:
                continue
            #Element is a comment
            elif element in reserved_keys[5]:
                continue
            #Element is either a variable/value, or will result in a syntax error
            else:
                continue


def main():
    while True:
        file_ptr = open_file()
        reserved_keys = build_reserved_keys()
        file_ptr.close()
        user_result = input("Would you like to run another file (Y/N? ")
        if(user_result.upper()=="N"):
            break

main()