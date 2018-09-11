ffmpeg -loop 1 -i 3rd_species_over_fux_1a_1.png -i 3rd_species_over_fux_1a_1.wav -c:v libx264 -tune stillimage -c:a aac -shortest out.mp4
