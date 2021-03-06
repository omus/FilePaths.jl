function URIParser.URI(p::AbstractPath)
    if isempty(root(p))
        throw(ArgumentError("$p is not an absolute path"))
    end

    b = IOBuffer()
    print(b, "file://")

    if !isempty(drive(p))
        print(b, "/")
        print(b, drive(p))
    end

    for i=2:length(p.parts)
        print(b, "/")
        print(b, URIParser.escape(p.parts[i]))
    end

    return URIParser.URI(String(take!(b)))
end
