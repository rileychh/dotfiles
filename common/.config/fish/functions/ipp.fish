function ipp
    begin
        echo "ADDRESSES:"
        ip -c -br a
        echo
        echo "LINKS:"
        ip -c -br l
        echo
        echo "ROUTES:"
        ip -c r
        echo
        echo "NEIGHBOURS:"
        ip -c -br n
    end | less -R
end
