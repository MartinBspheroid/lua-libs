--[[
    Base class for all nodes

    Defines the basic interface for all nodes in the graph (name, id, inputs, outputs, process, etc)


    

]]

Node = {}
Node.__index = Node

Node.new = function(self, id, name)
    local node = {}
    setmetatable(node, Node)
    node.id = id
    node.name = name
    node.inputs = {}
    node.outputs = {}
    node.process = function(self) end
    return node
end


Node.add_input = function(self, input)
    table.insert(self.inputs, input)
end

Node.add_output = function(self, output)
    table.insert(self.outputs, output)
end

