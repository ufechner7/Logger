# Julia service to log incoming serial data to a file
# create a new file daily

using LibSerialPort

const port = "/dev/ttyACM0"
const baud = 9600

function kill()
    try
        return readlines(`fuser -k /dev/ttyACM0`)
    catch e
        return nothing
    end
end

# fuser -k /dev/ttyACM0

sp = LibSerialPort.open(port, 9600)
set_flow_control(sp)
line=Base.readline(sp)
println(line)
close(sp)
