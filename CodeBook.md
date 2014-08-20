## CodeBook


### Explanatory notes

The first column is `Subject`:  integer numbers between 1 and 30 representing one of 30 individuals.

The second column is `Actvity`: This is one of six types of activities, "LAYING", "SITTING", "STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS".

Each subsequent column name consists of 5 abbreviations taken from the list below. 
Each abbreviation is on the left side, grouped by occurrence, and has its description on the right.
```
t:        time domain (prefix 't')
f:        frequency domain (prefix 'f') (FFT of time domain)

Body:     signal due to body forces
Gravity:  signal due to gravity force

Acc:      Acceleration (measured with accelerometer) [a]
AccJerk:  Acceleration Jerk signal                   [da/dt]
Gyro:     Angular Velocity (measured with gyroscope) [w]
GyroJerk: Angular Velocity Jerk                      [dw/dt]

Mag:      Euclidean norm (magnitude)

Mean:     Mean value
Std:      Standard deviation

X:        Measurement along X-direction
Y:        Measurement along Y-direction
Z:        Measurement along Z-direction
```

Concrete example:

`tBodyAccMeanX`, is the mean of time domain signal due to body forces of the acceleration (measured with accelerometer) along the X-direction.

*Footnote: The complete data is normalized and bounded within [-1,1]*
