function spotify-open
    set url $argv[1]

    if test -z "$url"
        echo "Usage: spotify-open <spotify_link_url>"
        return 1
    end

    # Follow redirects and extract the canonical URL from spotify.link
    echo "Following redirects from: $url"
    set canonical_url (curl -s -L "$url" | grep -E 'property="og:url"' | sed -E 's/.*content="([^"]+)".*/\1/')

    if test -z "$canonical_url"
        echo "Could not extract canonical URL from $url"
        return 1
    end

    echo "Found canonical URL: $canonical_url"

    # Extract the resource path from open.spotify.com URLs
    set spotify_uri (echo $canonical_url | sed -E 's|https?://open\.spotify\.com/([^?]+).*|spotify://\1|')

    # Replace forward slashes with colons for Spotify URI format
    set spotify_uri (echo $spotify_uri | sed 's|/|:|g')

    echo "Opening: $spotify_uri"
    xdg-open "$spotify_uri"
end
