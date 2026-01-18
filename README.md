To run this project you can simply download this repository and open it in Xcode by double clicking on the Berlin clock.xcodeproj file in the folder. I used Xcode 26.1.1 to develop it.

I started developing this exercise using **TDD** where I started with the easiest thing I could write a test for first which was if the seconds lamp was illuminated or not for my BerlinClock. I did everything in small incremental steps which can be seen from the commits, I tried to follow the Red -> Green -> Refactor which I also mention in my commit messages.

After finishing the Berlin clock I started with writing tests to start developing the **BerlinClockViewModel**.

## Rules
The Berlin Clock (Mengenlehreclock or Berlin Uhr) is a clock that tells the time using a series of illuminated coloured blocks, as you can see in the picture for this project.

The top lamp blinks to show seconds- it is illuminated on even seconds and off on odd seconds.

The next two rows represent hours. The upper row represents 5 hour blocks and is made up of 4 red lamps. The lower row represents 1 hour blocks and is also made up of 4 red lamps.

The final two rows represent the minutes. The upper row represents 5 minute blocks, and is made up of 11 lamps- every third lamp is red, the rest are yellow. The bottom row represents 1 minute blocks, and is made up of 4 yellow lamps.
