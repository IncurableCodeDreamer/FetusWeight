# Fetus Weight

> The application allows to determine the approximate weight of the fetus based on ultrasound images between 16 and 40 weeks of pregnancy.

## Table of Contents
- [Installation](#installation)
- [Features](#features)
- [Contributing](#contributing)
- [Team](#team)
- [Support](#support)

## Installation
- All the `code` required to get started from gitHub
- Ultrasound images (samples are provided)

### Clone
- Clone this repo to your local machine using `https://github.com/IncurableCodeDreamer/FetusWeight`
```shell
$ git clone https://github.com/IncurableCodeDreamer/FetusWeight
```

### Setup
> Matlab licence is needed
- Start the command line.
- Enter the folder containing the .m file:
```shell
$ cd C:\M1\M2\M3.
```
- Run the following: 
```shell
$ C:\E1\E2\E3\matlab.exe -r mfile.
```

## Features
Between 18 and 22 and 28 and between 32 weeks of pregnancy, it is possible to assess the child's development. It is necessary to perform three biometric parameters: head circumference (HC), fetal abdominal circumference (AC) and femur length (FL). The fetal head circumference is performed on the cross-section at the level of the hills. The image of the cerebral hemispheres must be symmetrical and the cerebellum must be invisible. Use an ellipse to outlining the outer surfaces of the head. Belly circumference should be performed in the transverse plane. The umbilical vein should be located at the level of the hepatic sinus. The stomach bubble is visible, and the kidneys are invisible. Use an ellipse to outline the outer abdominal surfaces. We measure the length of the femur in the longest axis, with both calcified stems visible. Cartilage parts should not be included if they are visible.

Using the measurements of biometric parameters, the fetal weight can be determined. The Hadlock formula was used:
BW = 10^(1.304+ (0.05281 * AC) + (0.1938 * FL) - (0.004 * (AC * FL))).

We give HC, AC, FL indicators in centimeters and obtain the weight of the BW fetus in grams.

## Contributing
> To get started:

### Step 1
- **Option 1**
    - 🍴 Fork this repo!

- **Option 2**
    - 👯 Clone this repo to your local machine using `https://github.com/IncurableCodeDreamer/FetusWeight.git`

### Step 2
- **HACK AWAY!** 🔨🔨🔨

### Step 3
- 🔃 Create a new pull request using <a href="https://github.com/IncurableCodeDreamer/FetusWeight/compare/" target="_blank">`https://github.com/IncurableCodeDreamer/FetusWeight/compare/`</a>.

---

## Team
| **Main developer**| **Main developer** |
| :---: |:---:| 
| <a href="https://github.com/IncurableCodeDreamer" target="_blank">`IncurableCodeDreamer`</a> | <a href="https://github.com/novocaina" target="_blank">`Novocaina`</a> |

---

## Support
Reach out to me at one of the following places!
- Facebook at <a href="https://www.facebook.com/klaudia.nowak.710667" target="_blank">`IncurableCodeDreamerFb`</a>
- Linkedin at <a href="https://www.linkedin.com/in/klaudia-nowak" target="_blank">`IncurableCodeDreamerLinkedin`</a>
