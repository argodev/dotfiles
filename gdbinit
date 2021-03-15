set disassembly-flavor intel
source /home/ru7/workspace/externals/pwndbg/gdbinit.py
#source /home/ru7/workspace/externals/splitmind/gdbinit.py
#macro define offsetof(t, f) &((t *) 0)->f                                        

#python                                                                           
#import splitmind                                                                 
#(splitmind.Mind()                                                                
  #.tell_splitter(show_titles=True)                                               
  #.tell_splitter(set_title="Main")                                               
  #.right(display="backtrace", size="25%")                                        
  #.above(of="main", display="disasm", size="60%", banner="top")                  
  #.show("code", on="disasm", banner="none")                                      
  #.right(cmd='tty; tail -f /dev/null', size="65%", clearing=False)               
  #.tell_splitter(set_title='Input / Output')                                     
  #.above(display="stack", size="75%")                                            
  #.above(display="legend", size="25")                                            
  #.show("regs", on="legend")                                                     
  #.below(of="backtrace", cmd="python3", size="30%")                              
#).build(nobanner=True)                                                           
#end  

# let's turn off the auto-follow of child
#set follow-fork-mode parent
# pwndbg defaults to child
