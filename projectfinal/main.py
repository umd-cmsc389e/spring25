# Credit to mattbatwings for this script
from assembler import assemble
from schematic import make_schematic
import sys

def main():
    if (len(sys.argv) == 1):
        print("Please enter name of file.")
        quit()
    program = sys.argv[1]
    
    as_filename = f'programs/{program}.as'
    mc_filename = f'programs/{program}.mc'
    schem_filename = f'programs/{program}program.schem'

    assemble(as_filename, mc_filename)
    make_schematic(mc_filename, schem_filename)

if __name__ == '__main__':
    main()