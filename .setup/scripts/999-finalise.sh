#!/bin/bash

# Error handling
set -e

# Output final messages and instructions
echo
echo -e "${GREEN}Setup complete. You will need to restart the Crostini container for all changes to take effect.${NC}"
echo -e "${GREEN}To restart the container, open the Crosh terminal (Ctrl + Alt + T) and use the following command:${NC}"
echo -e "${YELLOW}vmc stop termina${NC}"
echo