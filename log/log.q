// General logging package




\d .log

/ @const .log.ansi colour mapping
ansi:(`red`green`yellow`blue`magenta`cyan`reset`default)!("\033[91m";"\033[92m";"\033[93m";"\033[94m";"\033[95m";"\033[96m";"\033[0m";"\033[0m");

/ @const .log.sev log message warning
sev:(`info`debug`warn`error)!("[INFO ]";"[DEBUG]";"[WARN ]";"[ERROR]");

out:{[sev;colour;msg]
    msg:.log.ansi[colour],(sv[" ### ";] (-6_ ssr[string .z.P;"D";" "];.log.sev[sev];msg)),.log.ansi[`reset];
    -1 msg;
    };

/ @function .log.main function that is projected as part of the log based on criticality
/ @param sev
/ @param msg
main:{[sev;colour;msg]
    .log.out[sev;colour;] msg;   
    };

info:.log.main[`info;`default];
debug:.log.main[`debug;`green];
warn:.log.main[`warn;`yellow];
error:.log.main[`error;`red];

\d .


