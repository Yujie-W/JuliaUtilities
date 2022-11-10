###############################################################################
#
# Save figures as GIF
#
###############################################################################
"""
    save_gif!(figs::Array, fps::Int, gif::String)
    save_gif!(imgs::Array{Array,1}, fps::Int, fn::String)

Save an array of figures as GIF, given
- `figs` An array of figures
- `fps` Frame per second
- `fn` File name of the GIF to save
- `imgs` An array of array (loaded figures)
"""
function save_gif!(figs::Array{Figure,1}, fps::Int, fn::String)
    # load images to memory
    images = Array[];
    for fig in figs
        fig.savefig("temp_gif.png");
        img = load("temp_gif.png");
        push!(images, img);
    end
    rm("temp_gif.png");

    save_gif!(images, fps, fn);

    return nothing
end




function save_gif!(imgs::Array{Array,1}, fps::Int, fn::String)
    gif = cat(imgs...; dims=3);
    save(fn, gif; fps=fps);

    return nothing
end
