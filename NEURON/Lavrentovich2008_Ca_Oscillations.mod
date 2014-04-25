TITLE Mod file for component: Component(id=Lavrentovich2008_Ca_Oscillations_0 type=Lavrentovich2008_Ca_Oscillations)

COMMENT

    This NEURON file has been generated by org.neuroml.export (see https://github.com/NeuroML/org.neuroml.export)
         org.neuroml.export  v1.1.2
         org.neuroml.model   v1.0.7
         jLEMS               v0.9.5.2

ENDCOMMENT

NEURON {
    POINT_PROCESS Lavrentovich2008_Ca_Oscillations
    RANGE vin                              : parameter
    RANGE kout                             : parameter
    RANGE vM3                              : parameter
    RANGE k_CaA                            : parameter
    RANGE n                                : parameter
    RANGE k_CaI                            : parameter
    RANGE m                                : parameter
    RANGE kip3                             : parameter
    RANGE vM2                              : parameter
    RANGE k2                               : parameter
    RANGE kf                               : parameter
    RANGE vp                               : parameter
    RANGE kp                               : parameter
    RANGE kdeg                             : parameter
    RANGE compartment                      : parameter
    RANGE ER                               : parameter
    RANGE init_X                           : parameter
    RANGE init_Y                           : parameter
    RANGE init_Z                           : parameter
    RANGE tscale                           : parameter
    RANGE rate__R1                         : derived var
    
    RANGE rate__R2                         : derived var
    
    RANGE rate__R3                         : derived var
    
    RANGE rate__R4                         : derived var
    
    RANGE rate__R5                         : derived var
    
    RANGE rate__R6                         : derived var
    
    RANGE rate__R7                         : derived var
    
}

UNITS {
    
    (nA) = (nanoamp)
    (uA) = (microamp)
    (mA) = (milliamp)
    (mV) = (millivolt)
    (mS) = (millisiemens)
    (uS) = (microsiemens)
    (molar) = (1/liter)
    (mM) = (millimolar)
    (um) = (micrometer)
    
}

PARAMETER {
    
    vin = 0.05 
    kout = 0.5 
    vM3 = 40 
    k_CaA = 0.15 
    n = 2.02 
    k_CaI = 0.15 
    m = 2.2 
    kip3 = 0.1 
    vM2 = 15 
    k2 = 0.1 
    kf = 0.5 
    vp = 0.05 
    kp = 0.3 
    kdeg = 0.08 
    compartment = 1 
    ER = 1 
    init_X = 0.1 
    init_Y = 1.5 
    init_Z = 0.1 
    tscale = 0.001 (megahertz)
}

ASSIGNED {
    
    rate__R1                               : derived var
    
    rate__R2                               : derived var
    
    rate__R3                               : derived var
    
    rate__R4                               : derived var
    
    rate__R5                               : derived var
    
    rate__R6                               : derived var
    
    rate__R7                               : derived var
    rate_Y (/ms)
    rate_X (/ms)
    rate_Z (/ms)
    
}

STATE {
    X 
    Y 
    Z 
    
}

INITIAL {
    rates()
    
    X = init_X
    
    Y = init_Y
    
    Z = init_Z
    
}

BREAKPOINT {
    
    SOLVE states METHOD cnexp
    
    
}

DERIVATIVE states {
    rates()
    Y' = rate_Y 
    X' = rate_X 
    Z' = rate_Z 
    
}

PROCEDURE rates() {
    
    rate__R1 = (  compartment  *  vin  ) ? evaluable
    
    rate__R2 = (  compartment  *  kout  * (  X  /  compartment  ) ) ? evaluable
    
    rate__R3 = (  ER  *4*  vM3  *  k_CaA  ^  n  * (  X  /  compartment  ) ^  n  /(( (  X  /  compartment  ) ^  n  +  k_CaA  ^  n  )*( (  X  /  compartment  ) ^  n  +  k_CaI  ^  n  ))* (  Z  /  compartment  ) ^  m  /( (  Z  /  compartment  ) ^  m  +  kip3  ^  m  )*( ( (  Y  /  ER  ) /  ER  ) - (  X  /  compartment  ) )) ? evaluable
    
    rate__R4 = (  compartment  *  vM2  * (  X  /  compartment  ) ^2/( (  X  /  compartment  ) ^2+  k2  ^2)) ? evaluable
    
    rate__R5 = (  ER  *  kf  *( ( (  Y  /  ER  ) /  ER  ) - (  X  /  compartment  ) )) ? evaluable
    
    rate__R6 = (  compartment  *  vp  * (  X  /  compartment  ) ^2/( (  X  /  compartment  ) ^2+  kp  ^2)) ? evaluable
    
    rate__R7 = (  compartment  *  kdeg  * (  Z  /  compartment  ) ) ? evaluable
    
    rate_Z = tscale  * (  rate__R6   -   rate__R7  ) 
    rate_Y = tscale  * (-1*  rate__R3   +  rate__R4  -   rate__R5  ) 
    rate_X = tscale  * (  rate__R1   -  rate__R2  +  rate__R3  -  rate__R4  +   rate__R5  ) 
    
     
    
}
