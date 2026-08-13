###############################################################################
##
## IdClassNr
##
SCN.IdClassNr := rec();

###############################################################################
##
## Helper
##
SCN.IdClassNr.Helper := rec();

###############################################################################
##
## CCOCount( G, o )
##
SCN.IdClassNr.Helper.CCOCount := function( G, o )
    return Number( ConjugacyClasses( G ), C ->
        Order( Representative( C ) ) = o
    );
end;

###############################################################################
##
## CCOSCount( G, o, s )
##
SCN.IdClassNr.Helper.CCOSCount := function( G, o, s )
    return Number( ConjugacyClasses( G ), C ->
        Order( Representative( C ) ) = o and Size( C ) = s
    );
end;

###############################################################################
##
## CCOSPCount( G, o, s, p )
##
SCN.IdClassNr.Helper.CCOSPCount := function( G, o, s, p )
    return Number( ConjugacyClasses( G ), function( C )
        local g;
        if Size( C ) <> s then
            return false;
        fi;
        g := Representative( C );
        return Order( g ) = o and g ^ p in C;
    end );
end;

###############################################################################
##
## CCOSPTCount( G, o, s, p, t )
##
SCN.IdClassNr.Helper.CCOSPTCount := function( G, o, s, p, t )
    return Number( ConjugacyClasses( G ), function( C )
        local g, h;
        if Size( C ) <> s then
            return false;
        fi;
        g := Representative( C );
        if Order( g ) <> o then
            return false;
        fi;
        h := g ^ p;
        return Size( First( ConjugacyClasses( G ), D -> h in D ) ) = t;
    end );
end;

###############################################################################
##
## NormsSize( G, s )
##
SCN.IdClassNr.Helper.NormsSize := function( G, s )
    return Filtered( NormalSubgroups( G ), H -> Size( H ) = s );
end;

###############################################################################
##
## DerAbInv( G, n )
##
SCN.IdClassNr.Helper.DerAbInv := function( G, n )
    local H, i;
    H := G;
    for i in [ 2 .. n ] do
        H := DerivedSubgroup( H );
    od;
    return AbelianInvariants( H );
end;

###############################################################################
##
## Select
##
SCN.IdClassNr.Select := NewDictionary( [ 0, 0 ], true );

AddDictionary( SCN.IdClassNr.Select, [ 4, 4 ], function( G )
    if IsCyclic( G ) then
        return 1;
    else
        return 2;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 5, 8 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 2 );
    if val = 2 then
        return 2;
    else
        return 3;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 6, 12 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 4 ] then
        return 2;
    else
        return 3;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 6, 18 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val = [ 9 ] then
        return 4;
    else
        return 5;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 7, 16 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
    if val = 2 then
        return 2;
    elif val = 1 then
        return 3;
    else
        return 4;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 8, 8 ], function( G )
    if IsCyclic( G ) then
        return 1;
    elif not IsElementaryAbelian( G ) then
        return 2;
    else
        return 3;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 8, 20 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 4 ] then
        return 4;
    else
        return 5;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 8, 48 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 4, 4 ] then
        return 8;
    elif val1 = [ 3 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 12 );
        if val2 = 0 then
            return 9;
        else
            return 10;
        fi;
    else
        return 11;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 9, 9 ], function( G )
    if IsCyclic( G ) then
        return 1;
    else
        return 2;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 9, 24 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 6 );
    if val = 0 then
        return 4;
    elif val = 2 then
        return 5;
    else
        return 6;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 9, 72 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 2 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
        if val2 = [ 9 ] then
            return 11;
        else
            return 14;
        fi;
    elif val1 = [ 8 ] then
        return 12;
    else
        return 13;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 9, 192 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 12 );
    if val = 2 then
        return 18;
    else
        return 19;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 10, 16 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 2 );
    if val1 = [ 2, 4 ] then
        if val2 = 2 then
            return 2;
        elif val2 = 0 then
            return 3;
        else
            return 4;
        fi;
    else
        if val2 = 4 then
            return 5;
        elif val2 = 0 then
            return 6;
        else
            return 7;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 10, 28 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 4 ] then
        return 8;
    else
        return 9;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 10, 40 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 8 ] then
        return 11;
    else
        return 12;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 10, 48 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 4 ] then
        return 14;
    else
        return 15;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 10, 54 ], function( G )
    local val1, val2;
    val1 := Size( DerivedSubgroup( G ) );
    if val1 = 9 then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
        if val2 = [ 3, 3 ] then
            return 16;
        else
            return 17;
        fi;
    else
        return 18;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 10, 96 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 3 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 3 );
        if val2 = [ 4, 4 ] then
            return 19;
        else
            return 23;
        fi;
    elif val1 = [ 2, 2, 2, 2 ] then
        return 20;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 12 );
        if val2 = 0 then
            return 21;
        else
            return 22;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 10, 100 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 25 ] then
        return 24;
    else
        val2 := SCN.IdClassNr.Helper.CCOSPCount( G, 5, 4, 2 );
        if val2 = 6 then
            return 25;
        else
            return 26;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 11, 27 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 3, 3 );
    if val = 8 then
        return 2;
    else
        return 3;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 11, 32 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 2, 4 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
        if val2 = 1 then
            return 4;
        elif val2 = 2 then
            return 5;
        else
            return 6;
        fi;
    elif val1 = [ 2, 2 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 8 );
        if val2 = 2 then
            return 7;
        elif val2 = 1 then
            return 8;
        else
            return 9;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
        if val2 = 3 then
            return 10;
        else
            return 11;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 11, 192 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 3 );
    if val = [ 2, 2, 2, 2 ] then
        return 21;
    else
        return 22;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 11, 720 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 15 );
    if val = 2 then
        return 29;
    else
        return 30;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 11, 1344 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 42 );
    if val = 0 then
        return 31;
    else
        return 32;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 12, 12 ], function( G )
    if IsCyclic( G ) then
        return 1;
    else
        return 2;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 12, 24 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 8 ] then
        return 3;
    elif val1 = [ 2, 4 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 1 );
        if val2 = 1 then
            return 4;
        else
            return 5;
        fi;
    else
        return 6;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 12, 36 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 4 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
        if val2 = [ 9 ] then
            return 8;
        else
            return 11;
        fi;
    elif val1 = [ 9 ] then
        return 9;
    elif val1 = [ 2, 2 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
        if val2 = [ 9 ] then
            return 10;
        else
            return 13;
        fi;
    else
        return 12;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 12, 48 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
    val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 12 );
    if val1 = 1 then
        if val2 = 1 then
            return 15;
        else
            return 16;
        fi;
    else
        if val2 = 1 then
            return 17;
        else
            return 18;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 12, 72 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 8 ] then
        return 20;
    elif val = [ 2, 3 ] then
        return 21;
    else
        return 22;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 12, 96 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val = [ 4, 4 ] then
        return 24;
    else
        return 25;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 12, 144 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 2, 4 ] then
        return 28;
    else
        return 29;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 12, 240 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 20 );
    if val = 0 then
        return 33;
    else
        return 34;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 12, 384 ], function( G )
    local val1, val2;
    val1 := Size( DerivedSubgroup( G ) );
    if val1 = 64 then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 24 );
        if val2 = 1 then
            return 37;
        else
            return 38;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 12 );
        if val2 = 0 then
            return 39;
        else
            return 40;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 13, 40 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 10 );
    if val = 0 then
        return 2;
    elif val = 2 then
        return 3;
    else
        return 4;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 13, 64 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 2, 2, 2 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
        if val2 = 4 then
            return 6;
        else
            return 7;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 4, 8 );
        if val2 = 4 then
            return 8;
        elif val2 = 5 then
            return 9;
        elif val2 = 0 then
            return 10;
        else
            return 11;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 13, 96 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 12 );
    if val = 1 then
        return 13;
    elif val = 0 then
        return 14;
    else
        return 15;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 13, 162 ], function( G )
    local val1, val2, val3;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 3, 3, 3 ] then
        return 22;
    elif val1 = [ 3, 9 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 3, 18 );
        if val2 = 0 then
            return 23;
        else
            return 24;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 3, 18 );
        if val2 = 1 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 3, 6 );
            if val3 = 3 then
                return 25;
            else
                return 26;
            fi;
        elif val2 = 3 then
            return 27;
        else
            return 28;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 13, 192 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 12 );
    if val1 = 0 then
        return 29;
    elif val1 = 1 then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 24 );
        if val2 = 0 then
            return 30;
        else
            return 32;
        fi;
    else
        return 31;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 13, 216 ], function( G )
    local val;
    val := Size( DerivedSubgroup( G ) );
    if val = 27 then
        return 34;
    else
        return 35;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 13, 1944 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 3, 216 );
    if val = 0 then
        return 52;
    else
        return 53;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 32 ], function( G )
    local val1, val2, val3, val4, val5;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 4 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
        if val2 = [ 2, 4 ] then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 4, 4 );
            if val3 = 2 then
                return 2;
            elif val3 = 4 then
                val4 := SCN.IdClassNr.Helper.CCOSPCount( G, 4, 4, 3 );
                if val4 = 2 then
                    return 3;
                else
                    val5 := SCN.IdClassNr.Helper.CCOSPCount( G, 8, 2, 3 );
                    if val5 = 4 then
                        return 5;
                    else
                        return 6;
                    fi;
                fi;
            elif val3 = 1 then
                return 4;
            else
                return 7;
            fi;
        else
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
            if val3 = 4 then
                return 17;
            elif val3 = 2 then
                val4 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 1 );
                if val4 = 3 then
                    return 18;
                else
                    return 20;
                fi;
            else
                return 19;
            fi;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
        if val2 = 1 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 2 );
            if val3 = 6 then
                return 8;
            elif val3 = 2 then
                return 11;
            else
                return 14;
            fi;
        elif val2 = 2 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 2 );
            if val3 = 2 then
                return 9;
            else
                return 12;
            fi;
        elif val2 = 0 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 2 );
            if val3 = 2 then
                return 10;
            else
                val4 := SCN.IdClassNr.Helper.CCOSPCount( G, 4, 2, 3 );
                if val4 = 2 then
                    return 13;
                else
                    return 16;
                fi;
            fi;
        else
            return 15;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 44 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 4 ] then
        return 21;
    else
        return 22;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 48 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 1 );
    if val = 3 then
        return 23;
    else
        return 24;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 50 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val = [ 25 ] then
        return 25;
    else
        return 26;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 80 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 4, 10 );
    if val = 0 then
        return 28;
    elif val = 5 then
        return 29;
    elif val = 1 then
        return 30;
    else
        return 31;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 84 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 3, 4 ] then
        return 32;
    else
        return 33;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 96 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 12 );
    if val = 0 then
        return 34;
    elif val = 2 then
        return 35;
    else
        return 36;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 104 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 8 ] then
        return 37;
    else
        return 38;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 128 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 4, 16 );
    if val = 2 then
        return 41;
    elif val = 3 then
        return 42;
    elif val = 5 then
        return 43;
    else
        return 44;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 192 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 3 );
    if val = [ 2, 2, 2, 2 ] then
        return 46;
    else
        return 47;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 200 ], function( G )
    local val;
    val := Size( DerivedSubgroup( G ) );
    if val = 25 then
        return 48;
    else
        return 49;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 240 ], function( G )
    local val1, val2;
    val1 := DerivedLength( G );
    if val1 = 1 then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
        if val2 = [ 4 ] then
            return 50;
        else
            return 51;
        fi;
    else
        return 52;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 288 ], function( G )
    local val;
    val := Size( DerivedSubgroup( G ) );
    if val = 48 then
        return 53;
    else
        return 54;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 294 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 49 ] then
        return 55;
    else
        val2 := SCN.IdClassNr.Helper.CCOSPCount( G, 7, 6, 2 );
        if val2 = 8 then
            return 56;
        else
            return 57;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 300 ], function( G )
    local val;
    val := Size( DerivedSubgroup( G ) );
    if val = 25 then
        return 58;
    else
        return 59;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 320 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 40 );
    if val = 0 then
        return 60;
    else
        return 61;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 384 ], function( G )
    local val1, val2, val3;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 4, 4 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 6 );
        if val2 = 2 then
            return 62;
        else
            val3 := SCN.IdClassNr.Helper.CCOSPCount( G, 4, 6, 3 );
            if val3 = 0 then
                return 63;
            else
                return 64;
            fi;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 12 );
        if val2 = 2 then
            return 65;
        else
            val3 := SCN.IdClassNr.Helper.CCOSPTCount( G, 4, 24, 2, 1 );
            if val3 = 2 then
                return 66;
            else
                return 67;
            fi;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 500 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 5, 2 );
    if val = 0 then
        return 72;
    else
        return 73;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 1280 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 40 );
    if val1 = 2 then
        return 76;
    else
        val2 := SCN.IdClassNr.Helper.CCOSPCount( G, 4, 40, 3 );
        if val2 = 2 then
            return 77;
        else
            return 78;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 1920 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 1 );
    if val = 1 then
        return 80;
    else
        return 81;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 14, 40320 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 8, 5040 );
    if val = 0 then
        return 90;
    elif val = 1 then
        return 91;
    else
        return 92;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 15, 24 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 2 );
    if val = 0 then
        return 2;
    else
        return 3;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 15, 48 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 2, 2 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 12 );
        if val2 = 1 then
            return 6;
        elif val2 = 2 then
            return 7;
        else
            return 11;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 6 );
        if val2 = 1 then
            return 8;
        elif val2 = 0 then
            return 9;
        elif val2 = 3 then
            return 10;
        else
            return 12;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 15, 54 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 3 );
    if val = 1 then
        return 13;
    elif val = 4 then
        return 14;
    else
        return 15;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 15, 63 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 3 );
    if val = 8 then
        return 17;
    else
        return 18;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 15, 72 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 6 );
    if val = 7 then
        return 19;
    elif val = 5 then
        return 20;
    elif val = 3 then
        return 21;
    else
        return 22;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 15, 144 ], function( G )
    local val1, val2, val3;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 9 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 36 );
        if val2 = 0 then
            return 28;
        else
            return 29;
        fi;
    elif val1 = [ 4 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 12 );
        if val2 = 2 then
            return 30;
        elif val2 = 0 then
            return 31;
        else
            return 34;
        fi;
    else
        val2 := DerivedLength( G );
        if val2 = 4 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 36 );
            if val3 = 0 then
                return 32;
            else
                return 33;
            fi;
        else
            return 35;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 15, 180 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 3 );
    if val = 2 then
        return 37;
    else
        return 38;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 15, 192 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 3 );
    val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 24 );
    if val1 = [ 4, 4 ] then
        if val2 = 0 then
            return 39;
        else
            return 40;
        fi;
    else
        if val2 = 0 then
            return 41;
        else
            return 42;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 15, 216 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 2 );
    if val = 1 then
        return 43;
    else
        return 44;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 15, 360 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 2 );
    if val = 1 then
        return 47;
    else
        return 48;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 15, 648 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 3 );
    if val = 1 then
        return 51;
    else
        return 52;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 15, 768 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 8 );
    if val = 2 then
        return 53;
    elif val = 4 then
        return 54;
    else
        return 55;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 15, 1944 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 3 );
    if val = 7 then
        return 58;
    else
        return 59;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 16 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 4 );
    if val = 2 then
        return 1;
    elif val = 12 then
        return 2;
    elif val = 4 then
        return 3;
    elif val = 8 then
        return 4;
    else
        return 5;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 40 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 8 ] then
        return 6;
    elif val1 = [ 2, 4 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 1 );
        if val2 = 1 then
            return 7;
        else
            return 8;
        fi;
    else
        return 9;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 48 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 2 );
    if val = 7 then
        return 10;
    else
        return 11;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 52 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 2 );
    if val = 3 then
        return 12;
    else
        return 13;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 64 ], function( G )
    local val1, val2, val3, val4;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 8 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
        val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 8 );
        if val2 = [ 2, 4 ] then
            if val3 = 1 then
                return 15;
            elif val3 = 2 then
                return 16;
            else
                val4 := SCN.IdClassNr.Helper.CCOSPTCount( G, 4, 8, 2, 1 );
                if val4 = 2 then
                    return 17;
                else
                    return 18;
                fi;
            fi;
        else
            if val3 = 3 then
                return 35;
            else
                return 36;
            fi;
        fi;
    elif val1 = [ 2, 4 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 4, 8 );
        if val2 = 0 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
            if val3 = 2 then
                return 19;
            elif val3 = 1 then
                return 27;
            else
                return 37;
            fi;
        elif val2 = 1 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
            if val3 = 4 then
                return 20;
            elif val3 = 2 then
                return 21;
            elif val3 = 1 then
                return 26;
            else
                return 32;
            fi;
        elif val2 = 3 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
            if val3 = 1 then
                return 23;
            else
                val4 := SCN.IdClassNr.Helper.CCOSPCount( G, 8, 4, 3 );
                if val4 = 0 then
                    return 29;
                else
                    return 33;
                fi;
            fi;
        elif val2 = 2 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 1 );
            if val3 = 3 then
                val4 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
                if val4 = 1 then
                    return 24;
                else
                    return 30;
                fi;
            else
                return 28;
            fi;
        else
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
            if val3 = 1 then
                return 25;
            else
                val4 := SCN.IdClassNr.Helper.CCOSPCount( G, 8, 4, 3 );
                if val4 = 0 then
                    return 31;
                else
                    return 34;
                fi;
            fi;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
        if val2 = 3 then
            return 22;
        else
            return 38;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 96 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 4 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 1 );
        if val2 = 3 then
            return 39;
        else
            return 45;
        fi;
    elif val1 = [ 2, 3 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
        if val2 = [ 4, 4 ] then
            return 40;
        else
            return 44;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 12 );
        if val2 = 0 then
            return 41;
        elif val2 = 2 then
            return 42;
        else
            return 43;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 136 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 2 );
    if val = 1 then
        return 49;
    else
        return 50;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 156 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 2 );
    if val = 1 then
        return 52;
    else
        return 53;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 192 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
    if val = 0 then
        return 55;
    else
        return 56;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 216 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 6 );
    if val = 3 then
        return 58;
    elif val = 6 then
        return 59;
    else
        return 60;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 384 ], function( G )
    local val1, val2, val3;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 2, 2 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 3 );
        if val2 = [ 2, 2, 2, 2 ] then
            return 65;
        else
            return 71;
        fi;
    elif val1 = [ 3 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 12 );
        if val2 = 4 then
            return 66;
        elif val2 = 2 then
            return 67;
        else
            val3 := SCN.IdClassNr.Helper.CCOSPTCount( G, 4, 24, 2, 1 );
            if val3 = 0 then
                return 68;
            else
                return 69;
            fi;
        fi;
    else
        return 70;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 400 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 2, 4 ] then
        return 72;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 1 );
        if val2 = 1 then
            return 73;
        else
            return 74;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 448 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 4, 4, 4 ] then
        return 76;
    else
        val2 := Length( SCN.IdClassNr.Helper.NormsSize( G, 8 ) );
        if val2 = 9 then
            return 77;
        else
            return 78;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 576 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 2 );
    if val = 7 then
        return 79;
    else
        return 80;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 600 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 25 );
    if val = 0 then
        return 82;
    elif val = 2 then
        return 83;
    else
        return 84;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 640 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 40 );
    if val = 0 then
        return 86;
    else
        return 87;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 672 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 2 );
    if val = 3 then
        return 88;
    elif val = 1 then
        return 89;
    else
        return 90;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 864 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val = [ 2, 2, 2, 2 ] then
        return 91;
    else
        return 92;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 1200 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 1 );
    if val = 1 then
        return 93;
    else
        return 94;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 1344 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 3 );
    if val1 = [ 4, 4, 4 ] then
        return 96;
    else
        val2 := Length( SCN.IdClassNr.Helper.NormsSize( G, 8 ) );
        if val2 = 3 then
            return 97;
        else
            return 98;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 1440 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 4 ] then
        return 99;
    else
        return 100;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 1536 ], function( G )
    local val1, val2, val3;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 24 );
    if val1 = [ 4, 4 ] then
        if val2 = 2 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 4, 96 );
            if val3 = 4 then
                return 102;
            else
                return 104;
            fi;
        else
            return 103;
        fi;
    else
        if val2 = 2 then
            return 105;
        else
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 48 );
            if val3 = 0 then
                return 106;
            else
                return 107;
            fi;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 1920 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 4, 60 );
    if val = 0 then
        return 109;
    elif val = 2 then
        return 110;
    else
        return 111;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 2160 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 45 );
    if val = 3 then
        return 113;
    else
        return 114;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 2400 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val = [ 2, 2, 2, 2 ] then
        return 115;
    else
        return 116;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 2688 ], function( G )
    local val1, val2;
    val1 := DerivedLength( G );
    if val1 = 1 then
        val2 := Exponent( DerivedSubgroup( G ) );
        if val2 = 84 then
            return 117;
        else
            return 119;
        fi;
    else
        return 118;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 16, 30720 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 16 );
    if val = 1 then
        return 129;
    else
        return 130;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 17, 32 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 2 );
    if val = 9 then
        return 2;
    else
        return 3;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 17, 56 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 14 );
    if val = 2 then
        return 4;
    elif val = 1 then
        return 5;
    else
        return 6;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 17, 80 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
    val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 20 );
    if val1 = 1 then
        if val2 = 1 then
            return 8;
        else
            return 9;
        fi;
    else
        if val2 = 1 then
            return 10;
        else
            return 11;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 17, 81 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 3 );
    if val = 12 then
        return 12;
    elif val = 6 then
        return 13;
    elif val = 10 then
        return 14;
    else
        return 15;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 17, 128 ], function( G )
    local val1, val2, val3, val4;
    val1 := DerivedLength( G );
    if val1 = 3 then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
        val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 8 );
        if val2 = [ 2, 4 ] then
            if val3 = 3 then
                return 16;
            elif val3 = 2 then
                val4 := SCN.IdClassNr.Helper.CCOSCount( G, 4, 16 );
                if val4 = 0 then
                    return 17;
                else
                    return 18;
                fi;
            else
                return 19;
            fi;
        else
            if val3 = 1 then
                return 25;
            elif val3 = 4 then
                return 26;
            elif val3 = 2 then
                return 27;
            else
                val4 := Number(
                    SCN.IdClassNr.Helper.NormsSize( G, 16 ),
                    IsElementaryAbelian
                );
                if val4 = 2 then
                    return 28;
                else
                    return 29;
                fi;
            fi;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 4, 16 );
        if val2 = 4 then
            return 20;
        elif val2 = 5 then
            return 21;
        elif val2 = 0 then
            return 22;
        elif val2 = 1 then
            return 23;
        else
            return 24;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 17, 168 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 2 );
    if val = 1 then
        return 32;
    else
        return 33;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 17, 192 ], function( G )
    local val1, val2, val3;
    val1 := DerivedLength( G );
    if val1 = 4 then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
        val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 24 );
        if val2 = 0 then
            if val3 = 0 then
                return 34;
            else
                return 40;
            fi;
        else
            if val3 = 0 then
                return 35;
            else
                return 36;
            fi;
        fi;
    elif val1 = 2 then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
        if val2 = [ 4, 4 ] then
            return 37;
        else
            return 38;
        fi;
    else
        return 39;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 17, 294 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSPCount( G, 7, 6, 2 );
    if val = 1 then
        return 44;
    else
        return 45;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 17, 324 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 3 );
    if val = 3 then
        return 47;
    elif val = 4 then
        return 48;
    else
        return 49;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 17, 384 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 2, 2 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 24 );
        if val2 = 1 then
            if ForAny( ConjugacyClasses( G ), C -> 
                Order( Representative( C ) ) = 2 and
                Size( C ) = 24 and
                Exponent( Centralizer( G, Representative( C ) ) ) = 2
            ) then
                return 54;
            else
                return 50;
            fi;
        elif val2 = 0 then
            return 51;
        else
            return 53;
        fi;
    else
        return 52;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 17, 648 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 2 );
    if val = 3 then
        return 61;
    else
        return 62;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 17, 1152 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 2 );
    if val = 3 then
        return 70;
    else
        return 71;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 17, 1176 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 7, 24 );
    if val = 0 then
        return 72;
    elif val = 2 then
        return 73;
    else
        return 74;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 17, 3584 ], function( G )
    local val1, val2, val3, normal, A, B;
    val1 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 56 );
    normal := SCN.IdClassNr.Helper.NormsSize( G, 64 );
    val2 := Length( normal );
    if val1 = 0 then
        if val2 = 2 then
            A := First( normal, IsAbelian );
            B := First( normal, H -> not IsAbelian( H ) );
            if ForAny( Elements( A ), a -> ForAny(
                Elements( B ), b ->
                    a ^ 2 <> One( G ) and a ^ 2 <> b ^ 2 and
                    Comm( a, b ) = a ^ 2
            ) ) then
                return 81;
            else
                return 83;
            fi;
        else
            if ForAll( normal, IsAbelian ) then
                return 89;
            else
                return 87;
            fi;
        fi;
    else
        if val2 = 2 then
            val3 := Number( normal, IsElementaryAbelian );
            if val3 = 0 then
                return 82;
            elif val3 = 1 then
                if ForAll( normal, IsAbelian ) then
                    return 84;
                else
                    return 85;
                fi;
            else
                return 86;
            fi;
        else
            if ForAll( normal, IsAbelian ) then
                return 90;
            else
                return 88;
            fi;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 17, 3888 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOCount( G, 2 );
    if val = 2 then
        return 91;
    else
        return 92;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 17, 32256 ], function( G )
    local val;
    val := Size( FrattiniSubgroup( G ) );
    if val = 64 then
        return 98;
    else
        return 99;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 18 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 2, 9 ] then
        return 1;
    else
        return 2;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 36 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 3, 4 ] then
        return 3;
    else
        return 4;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 48 ], function( G )
    local val1, val2, val3, val4;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 2, 4 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 4, 6 );
        if val2 = 1 then
            return 5;
        elif val2 = 0 then
            return 6;
        elif val2 = 4 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 2 );
            if val3 = 0 then
                val4 := SCN.IdClassNr.Helper.CCOSPCount( G, 4, 2, 3 );
                if val4 = 0 then
                    return 7;
                else
                    return 8;
                fi;
            else
                return 10;
            fi;
        else
            return 9;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 2 );
        if val2 = 0 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 6 );
            if val3 = 0 then
                return 11;
            else
                return 12;
            fi;
        elif val2 = 1 then
            return 13;
        else
            return 14;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 54 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val = [ 9 ] then
        return 15;
    else
        return 16;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 60 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 2, 2 ] then
        return 17;
    else
        return 18;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 72 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 2, 4 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 3 );
        if val2 = 2 then
            return 20;
        else
            return 21;
        fi;
    else
        return 22;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 96 ], function( G )
    local val1, val2, val3;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 2, 2 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 8 );
        val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 24 );
        if val2 = 1 then
            if val3 = 1 then
                return 23;
            else
                return 24;
            fi;
        else
            if val3 = 1 then
                return 25;
            else
                return 26;
            fi;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
        if val2 = 2 then
            return 27;
        elif val2 = 1 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 12 );
            if val3 = 2 then
                return 28;
            else
                return 29;
            fi;
        else
            return 30;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 108 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val = [ 3, 9 ] then
        return 31;
    elif val = [ 3, 3 ] then
        return 32;
    else
        return 33;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 120 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 2, 4 ] then
        return 35;
    else
        return 36;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 144 ], function( G )
    local val1, val2, val3;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 9 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
        if val2 = [ 4 ] then
            return 37;
        else
            return 38;
        fi;
    elif val1 = [ 3, 3 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
        if val2 = [ 16 ] then
            return 39;
        elif val2 = [ 4 ] then
            return 42;
        elif val2 = [ 2, 8 ] then
            return 47;
        else
            return 49;
        fi;
    elif val1 = [ 2 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
        if val2 = [ 2, 4 ] then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 6 );
            if val3 = 2 then
                return 40;
            else
                return 41;
            fi;
        else
            return 48;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 4, 18 );
        if val2 = 0 then
            return 43;
        elif val2 = 5 then
            return 44;
        elif val2 = 1 then
            return 45;
        else
            return 46;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 192 ], function( G )
    local val1, val2, val3, val4;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    val2 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 3 ] then
        if val2 = [ 4, 4 ] then
            return 51;
        else
            return 58;
        fi;
    else
        val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
        if val3 = 0 and val2 = [ 4, 4 ] then
            val4 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 12 );
            if val4 = 2 then
                return 52;
            else
                return 57;
            fi;
        elif val2 = [ 2, 2, 2, 2 ] then
            if val3 = 2 then
                return 53;
            else
                return 54;
            fi;
        else
            val4 := SCN.IdClassNr.Helper.CCOSPTCount( G, 4, 12, 2, 1 );
            if val4 = 0 then
                return 55;
            else
                return 56;
            fi;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 216 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 2, 4 ] then
        return 60;
    elif val = [ 2, 2 ] then
        return 61;
    else
        return 62;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 228 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 3, 4 ] then
        return 63;
    else
        return 64;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 240 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 1 );
    if val = 1 then
        return 65;
    else
        return 66;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 288 ], function( G )
    local val1, val2, val3, val4;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 2 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
        val3 := SCN.IdClassNr.Helper.DerAbInv( G, 3 );
        if val2 = [ 9 ] then
            if val3 = [ 4, 4 ] then
                return 67;
            else
                return 74;
            fi;
        else
            if val3 = [ 2, 2, 2, 2 ] then
                return 81;
            else
                return 82;
            fi;
        fi;
    elif val1 = [ 2, 4 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 4, 36 );
        if val2 = 4 then
            val3 := SCN.IdClassNr.Helper.CCOSPCount( G, 8, 18, 3 );
            if val3 = 4 then
                return 68;
            else
                return 69;
            fi;
        elif val2 = 0 then
            return 70;
        else
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 12 );
            if val3 = 2 then
                return 75;
            else
                val4 := SCN.IdClassNr.Helper.CCOSPCount( G, 4, 36, 3 );
                if val4 = 2 then
                    return 76;
                else
                    return 77;
                fi;
            fi;
        fi;
    elif val1 = [ 2, 3 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
        if val2 = [ 3, 4, 4 ] then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 36 );
            if val3 = 1 then
                return 71;
            else
                return 72;
            fi;
        else
            return 73;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
        if val2 = [ 2, 2 ] then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 2 );
            if val3 = 0 then
                val4 := SCN.IdClassNr.Helper.CCOSPCount( G, 4, 18, 3 );
                if val4 = 1 then
                    return 78;
                else
                    return 79;
                fi;
            else
                return 80;
            fi;
        else
            return 83;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 360 ], function( G )
    local val;
    val := DerivedLength( G );
    if val = 2 then
        return 86;
    else
        return 87;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 384 ], function( G )
    local val1, val2, val3;
    val1 := DerivedLength( G );
    if val1 = 4 then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 48 );
        if val2 = 0 then
            return 88;
        else
            return 89;
        fi;
    elif val1 = 2 then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 48 );
        if val2 = 0 then
            val3 := SCN.IdClassNr.Helper.CCOSPCount( G, 8, 6, 3 );
            if val3 = 8 then
                return 90;
            else
                return 91;
            fi;
        else
            return 92;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 4, 12 );
        if val2 = 6 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 1 );
            if val3 = 1 then
                return 93;
            else
                return 95;
            fi;
        elif val2 = 10 then
            return 94;
        elif val2 = 5 then
            return 96;
        elif val2 = 9 then
            return 97;
        else
            val3 := Number(
                SCN.IdClassNr.Helper.NormsSize( G, 16 ),
                IsElementaryAbelian
            );
            if val3 = 0 then
                return 98;
            else
                return 99;
            fi;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 432 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 2, 2 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 12 );
        if val2 = 1 then
            return 101;
        else
            return 102;
        fi;
    elif val1 = [ 2, 2, 2 ] then
        return 103;
    else
        return 104;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 480 ], function( G )
    local val1, val2;
    val1 := DerivedLength( G );
    if val1 = 1 then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 20 );
        if val2 = 0 then
            return 106;
        elif val2 = 1 then
            return 107;
        else
            return 109;
        fi;
    else
        return 108;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 648 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 9, 9 ] then
        return 112;
    else
        val2 := Length( SCN.IdClassNr.Helper.NormsSize( G, 9 ) );
        if val2 = 10 then
            return 113;
        else
            return 114;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 672 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 4 ] then
        return 115;
    else
        return 116;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 900 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val = [ 9 ] then
        return 122;
    else
        return 123;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 972 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.CCOSCount( G, 3, 12 );
    if val1 = 6 then
        return 124;
    else
        val2 := SCN.IdClassNr.Helper.CCOSPCount( G, 9, 12, 2 );
        if val2 = 3 then
            return 125;
        else
            return 126;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 1008 ], function( G )
    local val;
    val := DerivedLength( G );
    if val = 1 then
        return 127;
    else
        return 128;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 1296 ], function( G )
    local val1, val2, val3;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 2, 2 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 3 );
        if val2 = [ 9, 9 ] then
            return 130;
        else
            val3 := Length( SCN.IdClassNr.Helper.NormsSize( G, 9 ) );
            if val3 = 4 then
                return 133;
            else
                return 134;
            fi;
        fi;
    elif val1 = [ 2 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 3, 24 );
        if val2 = 1 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 3, 144 );
            if val3 = 0 then
                return 131;
            else
                return 136;
            fi;
        else
            return 137;
        fi;
    elif val1 = [ 2, 4 ] then
        return 132;
    else
        return 135;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 1920 ], function( G )
    local val1, val2;
    val1 := DerivedLength( G );
    if val1 = 1 then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 15 );
        if val2 = 2 then
            return 138;
        elif val2 = 1 then
            return 139;
        else
            return 141;
        fi;
    else
        return 140;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 2058 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 7, 3 );
    if val = 2 then
        return 143;
    else
        return 144;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 2160 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 45 );
    if val = 3 then
        return 145;
    else
        return 146;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 2592 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 2, 2, 2 ] then
        return 149;
    else
        return 150;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 4704 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 2, 2 ] then
        return 153;
    else
        return 154;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 18, 7056 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val = [ 3, 3 ] then
        return 159;
    else
        return 160;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 64 ], function( G )
    local val1, val2, val3, val4, val5, val6, normal;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 2, 4 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 8 );
        if val2 = 1 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 2 );
            if val3 = 2 then
                return 2;
            else
                return 4;
            fi;
        elif val2 = 0 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 2 );
            if val3 = 2 then
                return 3;
            else
                val4 := SCN.IdClassNr.Helper.CCOSPCount( G, 4, 2, 3 );
                if val4 = 0 then
                    return 5;
                else
                    normal := SCN.IdClassNr.Helper.NormsSize( G, 16 );
                    if ForAny(
                        normal,
                        H -> Size( FrattiniSubgroup( H ) ) = 2
                    ) then
                        return 8;
                    else
                        return 7;
                    fi;
                fi;
            fi;
        else
            return 6;
        fi;
    elif val1 = [ 2, 2 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 16 );
        if val2 = 2 then
            return 9;
        elif val2 = 1 then
            return 10;
        else
            return 39;
        fi;
    elif val1 = [ 2, 2, 2 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
        if val2 = 4 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 8 );
            if val3 = 1 then
                return 11;
            else
                return 14;
            fi;
        elif val2 = 0 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 2 );
            val4 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 8 );
            if val3 = 2 then
                val5 := SCN.IdClassNr.Helper.CCOSPCount( G, 4, 4, 3 );
                if val4 = 1 then
                    if val5 = 5 then
                        return 12;
                    else
                        val6 := SCN.IdClassNr.Helper.CCOSPCount( G, 8, 4, 3 );
                        if val6 = 0 then
                            return 29;
                        else
                            return 30;
                        fi;
                    fi;
                else
                    if val5 = 5 then
                        return 15;
                    else
                        val6 := SCN.IdClassNr.Helper.CCOSPCount( G, 8, 4, 3 );
                        if val6 = 4 then
                            return 32;
                        else
                            return 33;
                        fi;
                    fi;
                fi;
            else
                if val4 = 2 then
                    return 18;
                elif val4 = 0 then
                    val5 := SCN.IdClassNr.Helper.CCOSPCount( G, 8, 4, 3 );
                    if val5 = 0 then
                        normal := SCN.IdClassNr.Helper.NormsSize( G, 16 );
                        val6 := Number(
                            normal,
                            H -> Size( FrattiniSubgroup( H ) ) = 2
                        );
                        if val6 = 3 then
                            return 20;
                        else
                            return 26;
                        fi;
                    elif val5 = 4 then
                        return 24;
                    else
                        return 28;
                    fi;
                else
                    return 22;
                fi;
            fi;
        elif val2 = 3 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 8 );
            if val3 = 1 then
                return 13;
            else
                return 16;
            fi;
        elif val2 = 2 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 8 );
            if val3 = 2 then
                return 17;
            elif val3 = 0 then
                val4 := SCN.IdClassNr.Helper.CCOSPCount( G, 8, 4, 3 );
                if val4 = 4 then
                    normal := SCN.IdClassNr.Helper.NormsSize( G, 16 );
                    val5 := Number(
                        normal,
                        H -> Size( FrattiniSubgroup( H ) ) = 2
                    );
                    if val5 = 3 then
                        return 19;
                    else
                        return 25;
                    fi;
                elif val4 = 0 then
                    return 23;
                else
                    return 27;
                fi;
            else
                return 21;
            fi;
        else
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 8 );
            if val3 = 1 then
                return 31;
            else
                return 34;
            fi;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
        if val2 = 6 then
            normal := SCN.IdClassNr.Helper.NormsSize( G, 16 );
            val3 := Number( normal, IsElementaryAbelian );
            if val3 = 1 then
                return 35;
            else
                return 40;
            fi;
        elif val2 = 4 then
            return 36;
        elif val2 = 2 then
            return 37;
        else
            return 38;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 96 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 2 );
    if val = 0 then
        return 42;
    else
        return 43;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 147 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 49 ] then
        return 44;
    else
        val2 := SCN.IdClassNr.Helper.CCOSPCount( G, 7, 3, 2 );
        if val2 = 16 then
            return 45;
        else
            return 46;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 160 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    val2 := SCN.IdClassNr.Helper.CCOSCount( G, 4, 20 );
    if val1 = [ 2, 2, 5 ] then
        if val2 = 4 then
            return 47;
        elif val2 = 1 then
            return 48;
        elif val2 = 5 then
            return 53;
        else
            return 54;
        fi;
    else
        if val2 = 2 then
            return 49;
        elif val2 = 1 then
            return 50;
        elif val2 = 3 then
            return 51;
        else
            return 52;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 168 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 14 );
    if val = 0 then
        return 55;
    elif val = 2 then
        return 56;
    else
        return 57;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 192 ], function( G )
    local val1, val2, val3;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 2, 2 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
        val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 24 );
        if val2 = 1 then
            if val3 = 0 then
                return 58;
            else
                return 59;
            fi;
        else
            if val3 = 0 then
                return 60;
            else
                return 61;
            fi;
        fi;
    else
        return 62;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 216 ], function( G )
    local val1, val2, val3;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 2, 2 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 18 );
        if val2 = 0 then
            return 63;
        else
            val3 := SCN.IdClassNr.Helper.CCOSPTCount( G, 6, 18, 2, 2 );
            if val3 = 0 then
                return 64;
            else
                return 65;
            fi;
        fi;
    elif val1 = [ 2, 3 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
        if val2 = [ 9 ] then
            return 66;
        else
            return 68;
        fi;
    else
        return 67;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 243 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 3, 27 );
    if val = 4 then
        return 69;
    elif val = 0 then
        return 70;
    else
        return 71;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 256 ], function( G )
    local val1, val2, val3;
    val1 := DerivedLength( G );
    if val1 = 3 then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 16 );
        if val2 = 2 then
            return 73;
        elif val2 = 1 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 4, 32 );
            if val3 = 2 then
                return 74;
            else
                return 75;
            fi;
        else
            return 76;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 4, 32 );
        if val2 = 2 then
            return 77;
        elif val2 = 3 then
            return 78;
        elif val2 = 5 then
            return 79;
        else
            return 80;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 336 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 7 );
    if val = 0 then
        return 81;
    else
        return 82;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 378 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 7, 9 ] then
        val2 := SCN.IdClassNr.Helper.CCOSPCount( G, 63, 6, 4 );
        if val2 = 6 then
            return 85;
        else
            return 86;
        fi;
    else
        return 87;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 384 ], function( G )
    local val1, val2;
    val1 := DerivedLength( G );
    if val1 = 4 then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 48 );
        if val2 = 0 then
            return 88;
        else
            return 89;
        fi;
    else
        return 90;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 480 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 20 );
    if val = 2 then
        return 93;
    elif val = 1 then
        return 94;
    else
        return 95;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 588 ], function( G )
    local val1, val2;
    val1 := DerivedLength( G );
    if val1 = 3 then
        return 98;
    else
        val2 := SCN.IdClassNr.Helper.CCOSPCount( G, 7, 12, 2 );
        if val2 = 3 then
            return 99;
        else
            return 100;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 768 ], function( G )
    local val1, val2, val3, F, S, s, f, g, h, H;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 3 );
    val2 := SCN.IdClassNr.Helper.CCOSCount( G, 4, 48 );
    if val1 = [ 2, 2, 2 ] then
        if val2 = 1 then
            return 103;
        elif val2 = 2 then
            return 104;
        else
            F := FittingSubgroup( G );
            S := SylowSubgroup( G, 3 );
            s := First( GeneratorsOfGroup( S ), x -> not IsOne( x ) );
            for f in Elements( F ) do
                g := f ^ s;
                h := g ^ s;
                if Size( Subgroup( F, [ f, g, h ] ) ) = Size( F ) then
                    H := Subgroup( F, [
                        Comm( f, g ),
                        Comm( f, h ),
                        Comm( g, h )
                    ] );
                    if f ^ 2 in H then
                        return 105;
                    fi;
                fi;
            od;
            return 106;
        fi;
    elif val1 = [ 4, 4 ] then
        if val2 = 4 then
            return 107;
        elif val2 = 1 then
            return 108;
        elif val2 = 5 then
            return 109;
        else
            return 110;
        fi;
    else
        if val2 = 4 then
            return 111;
        elif val2 = 2 then
            val3 := SCN.IdClassNr.Helper.CCOSPTCount( G, 4, 24, 2, 1 );
            if val3 = 2 then
                return 112;
            else
                return 113;
            fi;
        elif val2 = 5 then
            return 114;
        else
            val3 := SCN.IdClassNr.Helper.CCOSPTCount( G, 4, 24, 2, 1 );
            if val3 = 2 then
                return 115;
            else
                return 116;
            fi;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 784 ], function( G )
    local val;
    val := DerivedLength( G );
    if val = 2 then
        return 117;
    else
        return 118;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 960 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 3 );
    if val = [ 4, 4 ] then
        return 120;
    else
        return 121;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 1152 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 72 );
    if val = 0 then
        return 125;
    else
        return 126;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 1600 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 25 ] then
        return 130;
    else
        val2 := SCN.IdClassNr.Helper.CCOSPCount( G, 5, 64, 2 );
        if val2 = 5 then
            return 131;
        else
            return 132;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 1944 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 3 );
    if val = [ 3, 3 ] then
        return 133;
    else
        return 134;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 2500 ], function( G )
    local val, C, c;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 5, 20 );
    if val = 5 then
        return 136;
    elif val = 6 then
        return 137;
    else
        C := First( ConjugacyClasses( G ), D ->
            Order( Representative( D ) ) = 25 and Size( D ) = 20
        );
        c := Representative( C );
        if ForAny( AsList( C ), d -> d ^ -1 * c in C ) then
            return 138;
        else
            return 139;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 2560 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 80 );
    if val = 0 then
        return 140;
    else
        return 141;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 2688 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSPTCount( G, 4, 84, 2, 1 );
    if val = 2 then
        return 142;
    else
        return 143;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 3840 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 1 );
    val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 80 );
    if val1 = 0 then
        if val2 = 1 then
            return 146;
        else
            return 147;
        fi;
    else
        if val2 = 1 then
            return 148;
        else
            return 149;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 9408 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 3 );
    if val = [ 2, 2, 2, 2 ] then
        return 154;
    else
        return 155;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 10752 ], function( G )
    local val1, val2, val3, normal;
    if not IsPerfectGroup( G ) then
        val1 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 56 );
        normal := SCN.IdClassNr.Helper.NormsSize( G, 64 );
        val2 := Length( normal );
        if val1 = 0 then
            if val2 = 2 then
                return 156;
            else
                return 161;
            fi;
        else
            if val2 = 2 then
                val3 := Number( normal, IsElementaryAbelian );
                if val3 = 1 then
                    if ForAll( normal, IsAbelian ) then
                        return 157;
                    else
                        return 158;
                    fi;
                else
                    return 159;
                fi;
            else
                if ForAll( normal, IsAbelian ) then
                    return 162;
                else
                    return 160;
                fi;
            fi;
        fi;
    else
        return 163;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 19, 96768 ], function( G )
    local val;
    val := Size( FrattiniSubgroup( G ) );
    if val = 1 then
        return 167;
    else
        return 168;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 20 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 4, 5 ] then
        return 1;
    else
        return 2;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 32 ], function( G )
    local val1, val2, val3;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 4, 4 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 1 );
        if val2 = 7 then
            return 3;
        else
            return 4;
        fi;
    elif val1 = [ 2, 8 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 2 );
        if val2 = 2 then
            return 5;
        elif val2 = 0 then
            return 6;
        else
            return 7;
        fi;
    elif val1 = [ 2, 2, 4 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 4, 2 );
        if val2 = 8 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 1 );
            if val3 = 7 then
                return 8;
            else
                return 11;
            fi;
        elif val2 = 12 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 1 );
            if val3 = 7 then
                return 9;
            else
                return 12;
            fi;
        elif val2 = 10 then
            return 10;
        elif val2 = 2 then
            return 13;
        else
            return 14;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 2 );
        if val2 = 0 then
            return 15;
        elif val2 = 6 then
            return 16;
        else
            return 17;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 56 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 8 ] then
        return 19;
    elif val1 = [ 2, 4 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 1 );
        if val2 = 1 then
            return 20;
        else
            return 21;
        fi;
    else
        return 22;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 68 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 4 ] then
        return 24;
    else
        return 25;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 80 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 16 ] then
        return 27;
    elif val1 = [ 4, 4 ] then
        return 28;
    elif val1 = [ 2, 8 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 1 );
        if val2 = 3 then
            return 29;
        else
            return 35;
        fi;
    elif val1 = [ 2, 2, 2 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 10 );
        if val2 = 2 then
            return 30;
        elif val2 = 1 then
            return 31;
        elif val2 = 0 then
            return 32;
        else
            return 33;
        fi;
    else
        return 34;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 84 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 2, 2, 3 ] then
        return 36;
    else
        return 37;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 96 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 8 ] then
        return 38;
    elif val1 = [ 2, 4 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 1 );
        if val2 = 1 then
            return 39;
        else
            return 40;
        fi;
    elif val1 = [ 2, 2, 3 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 2 );
        if val2 = 2 then
            return 41;
        else
            return 42;
        fi;
    else
        return 43;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 108 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 3, 4 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
        if val2 = [ 3, 3 ] then
            return 44;
        else
            return 45;
        fi;
    elif val1 = [ 4 ] then
        return 46;
    elif val1 = [ 3, 3 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 3, 12 );
        if val2 = 2 then
            return 47;
        elif val2 = 0 then
            return 48;
        else
            return 49;
        fi;
    elif val1 = [ 2, 2, 3 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
        if val2 = [ 3, 3 ] then
            return 50;
        else
            return 51;
        fi;
    else
        return 52;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 128 ], function( G )
    local val1, val2, val3, val4, val5;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 2, 8 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
        if val2 = [ 2, 4 ] then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 16 );
            val4 := SCN.IdClassNr.Helper.CCOSCount( G, 4, 8 );
            if val3 = 1 then
                if val4 = 4 then
                    return 53;
                else
                    return 55;
                fi;
            else
                if val4 = 4 then
                    return 54;
                else
                    return 56;
                fi;
            fi;
        else
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 8 );
            val4 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 16 );
            if val3 = 2 then
                if val4 = 1 then
                    return 69;
                else
                    return 70;
                fi;
            else
                if val4 = 1 then
                    return 75;
                else
                    return 76;
                fi;
            fi;
        fi;
    elif val1 = [ 4, 4 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
        if val2 = [ 2, 4 ] then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 16 );
            if val3 = 1 then
                return 57;
            else
                return 58;
            fi;
        else
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 8 );
            val4 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 16 );
            if val3 = 3 then
                if val4 = 1 then
                    return 59;
                else
                    return 63;
                fi;
            elif val3 = 2 then
                if val4 = 1 then
                    return 60;
                else
                    val5 := SCN.IdClassNr.Helper.CCOSPCount( G, 8, 8, 3 );
                    if val5 = 4 then
                        return 65;
                    else
                        return 66;
                    fi;
                fi;
            elif val3 = 1 then
                if val4 = 1 then
                    return 61;
                else
                    val5 := SCN.IdClassNr.Helper.CCOSPCount( G, 8, 8, 3 );
                    if val5 = 6 then
                        return 64;
                    else
                        return 68;
                    fi;
                fi;
            else
                if val4 = 1 then
                    return 62;
                else
                    return 67;
                fi;
            fi;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
        if val2 = 4 then
            return 71;
        elif val2 = 2 then
            return 72;
        elif val2 = 0 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 8 );
            if val3 = 3 then
                return 73;
            else
                return 74;
            fi;
        else
            return 77;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 192 ], function( G )
    local val1, val2, val3;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 3 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
        val3 := SCN.IdClassNr.Helper.DerAbInv( G, 3 );
        if val2 = [ 4 ] then
            if val3 = [ 4, 4 ] then
                return 81;
            else
                return 92;
            fi;
        else
            if val3 = [ 4, 4 ] then
                return 85;
            else
                return 93;
            fi;
        fi;
    elif val1 = [ 2, 2, 2, 2 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
        if val2 = [ 3, 4 ] then
            return 82;
        else
            return 89;
        fi;
    elif val1 = [ 4, 4 ] then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
        if val2 = [ 3, 4 ] then
            val3 := SCN.IdClassNr.Helper.CCOSPTCount( G, 4, 12, 2, 1 );
            if val3 = 0 then
                return 83;
            else
                return 84;
            fi;
        else
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 12 );
            if val3 = 0 then
                return 90;
            else
                return 91;
            fi;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 24 );
        if val2 = 0 then
            return 86;
        elif val2 = 1 then
            return 87;
        else
            return 88;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 200 ], function( G )
    local val1, val2, val3, val4;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    val2 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 8 ] then
        if val2 = [ 25 ] then
            return 94;
        else
            val3 := SCN.IdClassNr.Helper.CCOSPCount( G, 5, 4, 2 );
            if val3 = 6 then
                return 96;
            else
                return 97;
            fi;
        fi;
    else
        if val2 = [ 25 ] then
            return 95;
        else
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 1 );
            if val3 = 0 then
                return 98;
            else
                val4 := SCN.IdClassNr.Helper.CCOSPCount( G, 5, 4, 2 );
                if val4 = 6 then
                    return 99;
                else
                    return 100;
                fi;
            fi;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 240 ], function( G )
    local val1, val2;
    val1 := DerivedLength( G );
    if val1 = 1 then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
        if val2 = [ 4 ] then
            return 102;
        else
            return 103;
        fi;
    elif val1 = 3 then
        return 104;
    else
        return 105;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 260 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSPCount( G, 65, 4, 8 );
    if val = 0 then
        return 107;
    else
        return 108;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 272 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 2, 8 ] then
        return 109;
    else
        return 110;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 300 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 3, 4 ] then
        return 113;
    else
        return 114;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 320 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 4 ] then
        return 115;
    else
        return 116;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 384 ], function( G )
    local val1, val2, val3;
    val1 := DerivedLength( G );
    if val1 = 4 then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 4 );
        val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 12 );
        if val2 = 2 then
            if val3 = 1 then
                return 117;
            else
                return 121;
            fi;
        else
            if val3 = 3 then
                return 118;
            else
                return 119;
            fi;
        fi;
    else
        return 120;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 432 ], function( G )
    local val;
    val := DerivedLength( G );
    if val = 4 then
        return 123;
    else
        return 124;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 576 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 72 );
    if val = 0 then
        return 127;
    else
        return 128;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 680 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSPCount( G, 85, 8, 2 );
    if val = 0 then
        return 132;
    else
        return 133;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 768 ], function( G )
    local val1, val2, val3;
    val1 := DerivedLength( G );
    if val1 = 3 then
        val2 := SCN.IdClassNr.Helper.DerAbInv( G, 3 );
        if val2 = [ 2, 2, 2, 2 ] then
            return 136;
        else
            return 137;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 4, 48 );
        if val2 = 1 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 24 );
            if val3 = 2 then
                return 138;
            else
                return 139;
            fi;
        elif val2 = 3 then
            return 140;
        elif val2 = 2 then
            val3 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 24 );
            if val3 = 2 then
                return 141;
            else
                return 142;
            fi;
        else
            return 143;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 780 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSPCount( G, 65, 12, 2 );
    if val = 4 then
        return 145;
    else
        return 146;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 896 ], function( G )
    local val1, val2, val3, C, c;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val1 = [ 2, 2, 2 ] then
        return 149;
    elif val1 = [ 2, 2, 2, 2, 2, 2 ] then
        return 150;
    elif val1 = [ 4, 4, 4 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 56 );
        if val2 = 0 then
            C := First( ConjugacyClasses( G ), D ->
                Order( Representative( D ) ) = 4 and Size( D ) = 14
            );
            c := Representative( C );
            val3 := Number( AsList( C ), d -> d ^ -1 * c in C );
            if val3 = 4 then
                return 151;
            else
                return 152;
            fi;
        else
            return 153;
        fi;
    else
        return 154;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 972 ], function( G )
    local val1, val2, classes, g, h, k;
    val1 := SCN.IdClassNr.Helper.CCOSCount( G, 3, 36 );
    if val1 = 3 then
        return 156;
    else
        val2 := SCN.IdClassNr.Helper.CCOSPCount( G, 9, 36, 2 );
        if val2 = 3 then
            return 157;
        else
            g := Representative( First( ConjugacyClasses( G ), C ->
                Order( Representative( C ) ) = 4
            ) );
            h := Representative( First( ConjugacyClasses( G ), C ->
                Order( Representative( C ) ) = 9
            ) );
            k := Comm( h, g );
            if h ^ 3 = Comm( Comm( k, h ), h ) * k ^ 3 then
                return 158;
            else
                return 159;
            fi;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 1152 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 2 ] then
        return 161;
    elif val = [ 2, 2 ] then
        return 162;
    else
        return 163;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 1176 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val = [ 8 ] then
        return 165;
    elif val = [ 2, 2, 3 ] then
        return 166;
    else
        return 167;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 1280 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 80 );
    if val = 1 then
        return 169;
    else
        return 170;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 1440 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 72 );
    if val = 0 then
        return 171;
    else
        return 172;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 1568 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 1 );
    if val1 = [ 2, 4 ] then
        val2 := SCN.IdClassNr.Helper.CCOSPCount( G, 4, 196, 3 );
        if val2 = 2 then
            return 173;
        else
            return 174;
        fi;
    else
        return 175;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 1728 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 3 );
    if val = [ 2, 2, 2, 2 ] then
        return 176;
    else
        return 177;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 2688 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 3 );
    if val1 = [ 2, 2, 2, 2, 2, 2 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 8 );
        if val2 = 0 then
            return 181;
        else
            return 182;
        fi;
    else
        return 183;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 3072 ], function( G )
    local val1, val2;
    val1 := SCN.IdClassNr.Helper.DerAbInv( G, 3 );
    if val1 = [ 2, 2, 2, 2 ] then
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 4, 192 );
        if val2 = 5 then
            return 184;
        else
            return 185;
        fi;
    else
        val2 := SCN.IdClassNr.Helper.CCOSCount( G, 2, 24 );
        if val2 = 2 then
            return 186;
        else
            return 187;
        fi;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 3584 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 28 );
    if val = 2 then
        return 189;
    else
        return 190;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 3840 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 80 );
    if val = 1 then
        return 191;
    else
        return 192;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 4704 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.DerAbInv( G, 2 );
    if val = [ 2, 2, 2, 2 ] then
        return 195;
    else
        return 196;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 61440 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 16 );
    if val = 1 then
        return 208;
    else
        return 209;
    fi;
end );

AddDictionary( SCN.IdClassNr.Select, [ 20, 120960 ], function( G )
    local val;
    val := SCN.IdClassNr.Helper.CCOSCount( G, 2, 360 );
    if val = 1 then
        return 211;
    else
        return 212;
    fi;
end );
