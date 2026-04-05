#! @Chapter library

#! @Section groupsbyprops

#! @BeginGroup
#! @Returns all finite groups with certain properties as specified by
#! <A>arg</A>.
#! @Arguments arg...
DeclareGlobalFunction( "AllSmallClassNrGroups" );
#! @Label with AsPermGroup
#! @Arguments arg...: AsPermGroup
DeclareGlobalName( "AllSmallClassNrGroups" );
#! @EndGroup
#! @InsertChunk example_allsmallclassnrgroups

#! @BeginGroup
#! @Returns one finite group with certain properties as specified by
#! <A>arg</A>.
#! @Arguments arg...
DeclareGlobalFunction( "OneSmallClassNrGroup" );
#! @Label with AsPermGroup
#! @Arguments arg...: AsPermGroup
DeclareGlobalName( "OneSmallClassNrGroup" );
#! @EndGroup
#! @InsertChunk example_onesmallclassnrgroup

#! @Returns the number of finite groups with certain properties as specified by
#! <A>arg</A>.
#! @Arguments arg...
DeclareGlobalFunction( "NrSmallClassNrGroups" );
#! @InsertChunk example_nrsmallclassnrgroups

#! @Returns an iterator that iterates over the finite groups with properties as
#! specified by <A>arg</A>.
#! @Arguments arg...
DeclareGlobalFunction( "IteratorSmallClassNrGroups" );
#! @InsertChunk example_iteratorsmallclassnrgroups
