function [Kredithoehe, NeueKreditvergabe, Kreditrueckzahlung, SollZinsen, MaximaleKreditvergabeNeu] = ...
    Kreditberechnung(Kredithoehe, Kreditbedarf, MaximaleKreditvergabe, Zinssatz, Zinsspread, Kreditrueckzahlungsdauer)  
    % Funktion der Kreditberechnung

    % Sollzinsen berechnen
    SollZinsen = Kredithoehe * (Zinssatz + Zinsspread);
    Kredithoehe = Kredithoehe + SollZinsen;   
    
    % Kreditrückzahlung  berechnen
    Kreditrueckzahlung = Kredithoehe / Kreditrueckzahlungsdauer;
    Kredithoehe = Kredithoehe - Kreditrueckzahlung;   
    
    % Kreditbedarf berechnen
    NeueKreditvergabe = max(min(MaximaleKreditvergabe, Kreditbedarf), 0);
    Kredithoehe = Kredithoehe + NeueKreditvergabe;
    
    % die maximale Kreditvergabe reduziert sich um den neuen Kredit
    MaximaleKreditvergabeNeu = MaximaleKreditvergabe - NeueKreditvergabe;
