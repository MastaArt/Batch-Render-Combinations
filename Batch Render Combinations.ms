/ *      
 [ I N F O ]    
 N A M E   =   B a t c h   R e n d e r   C o m b i n a t i o n s  
 V E R S I O N   =   1 . 0 . 5  
 A U T H O R   =   M a s t a M a n  
 D E V   =   h t t p s : / / 3 d g r o u n d . n e t  
 H E L P   =    
 [ 1 . 0 . 0 ]  
 *   I n i t i a l   r e l e a s e   =  
  
 [ 1 . 1 . 0 ]  
 *   C h a n g e d :   F i n d   m o r e   m a t e r i a l s   c o m b i n a t i o n   b y   t r i m   r i g h t   n u m b e r s   i n   n a m e s   a n d   s e a r c h   b y   m a s k   e x :   P l a s t i c _ * =  
 *   A d d e d :   A n i m a t e   m o d e l   f o r   t h r e e   v i e w s :   F r o n t ,   S i d e ,   B a c k =  
 *   A d d e d :   R e n d e r   b a s e   m o d e l   w i t h   s h a d o w s   i n   s t u d i o =  
  
 [ 1 . 0 . 1 ]  
 +   A d d e d :   C h e c k b o x e s   w i t h   a n g l e s =  
  
 [ 1 . 0 . 2 ]  
 -   B u g F i x :   C a n ' t   o p e n   r e n d e r   f o l d e r =  
  
 [ 1 . 0 . 3 ]  
 *   C h a n g e d :   S u p p o r t   d i f f e r e n t   f i l e   t y p e s   ( m a x ,   f b x ,   o b j ) =  
  
 [ 1 . 0 . 4 ]  
 -   B u g F i x :   M o d e l   r o t a t i o n =  
  
 [ 1 . 0 . 5 ]  
 +   A d d e d :   S u p p o r t   V R a y =  
 +   A d d e d :   S u p p o r t   C o r o n a   8 =  
  
 [ S C R I P T ]  
 * /  
  
 t r y ( c l o s e R o l l o u t F l o a t e r   f B a t c h R e n d e r C o m b i n a t i o n s )   c a t c h ( )  
 g l o b a l   f B a t c h R e n d e r C o m b i n a t i o n s   =   n e w R o l l o u t F l o a t e r   " B a t c h   R e n d e r   C o m b i n a t i o n s "   2 8 0   6 3 0  
  
 - -   F i l e P r o p e r t i e s   b a s e d   s e t t i n g s   s y s t e m  
 s t r u c t   ' $ '   (  
         f n   a d d   n   v   =   (  
                 r e t u r n   ( f i l e P r o p e r t i e s . a d d P r o p e r t y   # c u s t o m   n   v )  
         ) ,  
         f n   g e t   n   =   (  
                 i   =   f i l e P r o p e r t i e s . f i n d P r o p e r t y   # c u s t o m   n  
                 i f ( i   ! =   0 )   d o   (  
                         v   =   f i l e P r o p e r t i e s . g e t P r o p e r t y V a l u e   # c u s t o m   i  
                         i f ( v [ 1 ]   = =   " # " )   d o   r e t u r n   e x e c u t e ( v )  
                         r e t u r n   v  
                 )  
                 r e t u r n   u n d e f i n e d  
         ) ,  
         f n   d e l   n   =   (  
                 f i l e P r o p e r t i e s . d e l e t e P r o p e r t y   # c u s t o m   n  
         ) ,  
         f n   l i s t   t :   # f u l l   =   (  
                 p   =   f i l e P r o p e r t i e s . g e t N u m P r o p e r t i e s   # c u s t o m  
                 r e s   =   # ( )  
                 f o r   i   i n   1   t o   ( f i l e P r o p e r t i e s . g e t N u m P r o p e r t i e s   # c u s t o m )   d o   (  
                         n   =   f i l e P r o p e r t i e s . g e t P r o p e r t y N a m e   # c u s t o m   i  
                         v   =   f i l e P r o p e r t i e s . g e t P r o p e r t y V a l u e   # c u s t o m   i  
                          
                         c a s e   t   o f   (  
                                 # n a m e s :   a p p e n d   r e s   n  
                                 # v a l u e s :   a p p e n d   r e s   v  
                                 d e f a u l t :   a p p e n d   r e s   # ( n ,   v )  
                         )  
                 )  
                  
                 r e t u r n   r e s  
         )  
 )  
  
 r o l l o u t   _ r S t e p A B B 0     " M a i n "  
 (  
         f n   p i c k M a t e r i a l F i l t e r   o b j   =   c l a s s O f   o b j   = =   S p h e r e   a n d   o b j . m a t e r i a l   ! =   u n d e f i n e d    
  
 	 g r o u p   " V i e w s "   (  
 	 	 c h e c k b o x   c b x V i e w 0   " 0   d e g "   c h e c k e d :   t r u e  
 	 	 c h e c k b o x   c b x V i e w 3 5   " 3 5   d e g "   c h e c k e d :   t r u e  
 	 	 c h e c k b o x   c b x V i e w 9 0   " 9 0   d e g "   c h e c k e d :   t r u e  
 	 	 c h e c k b o x   c b x V i e w 1 8 0   " 1 8 0   d e g "   c h e c k e d :   t r u e  
 	 )  
 	  
         g r o u p   " L i s t   O f   C o m b i n a t i o n s "   (  
                 l i s t b o x   l b x C o m b i n a t i o n s L i s t   " "   h e i g h t :   6  
                 b u t t o n   b t n A d d C o m b i n a t i o n   " A d d "   w i d t h :   1 0 0   a c r o s s :   2   t o o l t i p :   " C r e a t e   c o m b i n a t i o n s   i n   a   s t u d i o   s c e n e . \ n S e t t i n g s   a r e   s a v e d   d i r e c t l y   i n t o   t h e   s c e n e ! "  
                 b u t t o n   b t n R e m o v e C o m b i n a t i o n   " R e m o v e "   w i d t h :   1 0 0  
         )  
  
         g r o u p   " C r e a t e   C o m b i n a t i o n s "   (  
                 e d i t t e x t   e d t M o d e l P a r t N a m e   " M o d e l   P a r t   N a m e :   "  
                 l i s t b o x   l b x M o d e l P a r t M a t e r i a l s   " M o d e l   P a r t   M a t e r i a l s :   "   h e i g h t :   6  
                 p i c k b u t t o n   b t n A d d M a t e r i a l   " P i c k   M a t e r i a l "   w i d t h :   1 0 0   a c r o s s :   2   f i l t e r :   p i c k M a t e r i a l F i l t e r   m e s s a g e :   " P l e a s e   p i c k   S p h e r e   w i t h   m a t e r i a l   i n   t h e   s c e n e ! "   t o o l t i p :   " P i c k   S p h e r e   w i t h   m a t e r i a l   i n   t h e   s t u d i o   s c e n e . "  
                 b u t t o n   b t n R e m o v e M a t e r i a l   " R e m o v e   M a t e r i a l "   w i d t h :   1 0 0  
         )  
  
 	 g r o u p   " M e r g e   M o d e l s   F r o m "   (  
                 e d i t t e x t   e d t M e r g e M o d e l P a t h   " "   r e a d o n l y :   t r u e   a c r o s s :   2   a l i g n :   # l e f t   f i e l d w i d t h :   1 9 5  
                 b u t t o n   b t n M e r g e M o d e l P a t h   " . . . "   w i d t h :   3 5     a l i g n :   # r i g h t   o f f s e t :   [ 0 ,   - 3 ]  
         )  
  
         g r o u p   " S a v e   O u t p u t   R e n d e r s "   (  
                 e d i t t e x t   e d t B a t c h R e n d e r P a t h   " "   r e a d o n l y :   t r u e   a c r o s s :   2   a l i g n :   # l e f t   f i e l d w i d t h :   1 9 5  
                 b u t t o n   b t n S e t B a t c h R e n d e r P a t h   " . . . "   w i d t h :   3 5     a l i g n :   # r i g h t   o f f s e t :   [ 0 ,   - 3 ]  
         )  
          
         b u t t o n   b t n S t a r t R e n d e r   " S t a r t   B a t c h   R e n d e r "   h e i g h t :   3 5   w i d t h :   2 4 0   o f f s e t :   [ 0 ,   1 0 ]  
          
         f n   g e t S a v e D i r   t y p e :   " j p g "   =   (  
                 t y p e   =   ( t o U p p e r   t y p e )   + "   ( * . "   +   t y p e   +   " ) | * . "   +   t y p e  
                 f   =   g e t S a v e F i l e N a m e   f i l e n a m e :   " D O   N O T   C H A N G E   N A M E "   c a p t i o n : " S a v e   F i l e "   t y p e s :   t y p e  
                 i f ( f   = =   u n d e f i n e d )   d o   r e t u r n   f  
                  
                 p   =   g e t F i l e N a m e P a t h   f  
 	 	  
                 r e t u r n   p  
         )  
          
 	 f n   u p d a t e R e n d e r S e t t i n g s   =   (  
 	 	 r e n d e r S c e n e D i a l o g . c o m m i t ( )  
 	 	 r e n d e r S c e n e D i a l o g . u p d a t e ( ) 	 	  
 	 )  
 	  
         f n   f i l t e r C o m b i n a t i o n s   c   =   (  
                 i f ( c   = =   u n d e f i n e d )   d o   r e t u r n   # ( )  
                 r e t u r n   f o r   i   i n   c   w h e r e   c [ 1 ]   ! =   u n d e f i n e d   c o l l e c t   i  
         )  
          
         f n   g e t C o m b i n a t i o n s   =   ( 	 	  
                 c   =   ( ' $ ' ) . g e t   " C O M B I N A I T O N S "  
                 r e t u r n   f i l t e r C o m b i n a t i o n s   c  
         )  
          
         f n   a d d C o m b i n a t i o n   c   =   (  
                 ( ' $ ' ) . a d d   " C O M B I N A I T O N S "   ( c   a s   s t r i n g )  
         )  
          
         f n   r e m o v e F r o m A r r a y   c   i   =   (  
                 i f ( i   = =   1   a n d   c . c o u n t   = =   1 )   d o   r e t u r n   # ( )  
                 r e t u r n   f o r   k   i n   1   t o   c . c o u n t   w h e r e   k   ! =   i   c o l l e c t   c [ k ]  
         )  
          
         f n   u i C r e a t e C o m b i n a t i o n s   n   =   (  
                 i f ( n   = =   f a l s e )   d o   (  
                         e d t M o d e l P a r t N a m e . t e x t   =   " "  
                         l b x M o d e l P a r t M a t e r i a l s . i t e m s   =   # ( )  
                 )  
                  
                 e d t M o d e l P a r t N a m e . e n a b l e d   =   n  
                 l b x M o d e l P a r t M a t e r i a l s . e n a b l e d   =   n  
                 b t n A d d M a t e r i a l . e n a b l e d   =   n  
                 b t n R e m o v e M a t e r i a l . e n a b l e d   =   n  
         )  
          
         f n   d i s p l a y C o m b i n a t i o n P r o p s   c   i d   =   (  
                 u i C r e a t e C o m b i n a t i o n s   f a l s e  
                  
                 i f ( i d   = =   0 )   d o   r e t u r n   f a l s e  
                 i f ( c . c o u n t   = =   0 )   d o   r e t u r n   f a l s e  
                  
                 n   =   c [ i d ] [ 1 ]  
                 m   =   c [ i d ] [ 2 ]  
                  
                 e d t M o d e l P a r t N a m e . t e x t   =   n  
                 l b x M o d e l P a r t M a t e r i a l s . i t e m s   =   m  
                 u i C r e a t e C o m b i n a t i o n s   t r u e  
         )  
          
         f n   u p d a t e C o m b i n a i t o n s L i s t   =   (  
                 u i C r e a t e C o m b i n a t i o n s   f a l s e  
                  
                 c   =   g e t C o m b i n a t i o n s ( )  
                  
                 i f ( c . c o u n t   >   0 )   d o   (  
                         n a m e s   =   # ( )    
                         f o r   i   i n   c   d o   (  
                                 n   =   i [ 1 ]  
                                 i f ( i [ 2 ] . c o u n t   = =   0 )   d o   n   + =   "       [ E m p t y   M a t e r i a l s ] "  
  
                                 a p p e n d   n a m e s   n  
                           )  
                                    
                         l b x C o m b i n a t i o n s L i s t . i t e m s   =   n a m e s  
                         l b x C o m b i n a t i o n s L i s t . s e l e c t i o n   =   c . c o u n t  
                         d i s p l a y C o m b i n a t i o n P r o p s   c   ( c . c o u n t )  
                         r e t u r n   f a l s e  
                 )  
                  
                 l b x C o m b i n a t i o n s L i s t . i t e m s   =   # ( )  
         )  
          
         f n   a d d N e w C o m b i n a t i o n   =   (  
                 s   =   ' $ ' ( )  
                  
                 c   =   g e t C o m b i n a t i o n s ( )  
                  
                 a p p e n d   c   # ( " N e w   C o m b i n a t i o n " ,   # ( ) )  
                 c   =   f i l t e r C o m b i n a t i o n s   c  
                          
                 a d d C o m b i n a t i o n   c  
                          
                 u p d a t e C o m b i n a i t o n s L i s t ( )  
         )  
          
         f n   r e m o v e C o m b i n a t i o n   =   (  
                 i d   =   l b x C o m b i n a t i o n s L i s t . s e l e c t i o n  
                          
                 i f ( i d   = =   0 )   d o   r e t u r n   m e s s a g e B o x   " P l e a s e   s e l e c t   c o m b i n a t i o n   f r o m   l i s t ! "   t i t l e :   " W a r n i n g ! "  
                  
                 q   =   q u e r y B o x   ( " D o   y o u   r e a l l y   w a n t   t o   d e l e t e   c o m b i n a t i o n   \ " "   +   l b x C o m b i n a t i o n s L i s t . s e l e c t e d   +   " \ " " )   t i t l e :   " C o n f i r m ? "  
                 i f ( n o t   q )   d o   r e t u r n   f a l s e  
                  
                 c   =   g e t C o m b i n a t i o n s ( ) 	  
                  
                 c   =   r e m o v e F r o m A r r a y   c   i d  
                 c   =   f i l t e r C o m b i n a t i o n s   c  
          
                 a d d C o m b i n a t i o n   c  
                  
                 u p d a t e C o m b i n a i t o n s L i s t ( )  
         )  
          
         f n   l o a d A d d i t i o n a l S e t t i n g s   =   (  
                 s   =   ' $ ' ( )  
                  
                 p 1   =   s . g e t   " M E R G E _ M O D E L S _ P A T H "  
                 i f ( p 1   ! =   u n d e f i n e d   a n d   d o e s F i l e E x i s t   p 1 )   d o   e d t M e r g e M o d e l P a t h . t e x t   =   p 1  
                  
                 p 2   =   s . g e t   " O U T _ R E N D E R _ P A T H "  
                 i f ( p 2   ! =   u n d e f i n e d   a n d   d o e s F i l e E x i s t   p 2 )   d o   e d t B a t c h R e n d e r P a t h . t e x t   =   p 2  
         )  
          
         o n   _ r S t e p A B B 0   o p e n   d o   (  
                 u i C r e a t e C o m b i n a t i o n s   f a l s e  
                  
                 u p d a t e C o m b i n a i t o n s L i s t ( )  
                 l o a d A d d i t i o n a l S e t t i n g s ( )  
         )  
          
         o n   b t n A d d C o m b i n a t i o n   p r e s s e d   d o   (  
                 a d d N e w C o m b i n a t i o n ( )  
                 s e t F o c u s   e d t M o d e l P a r t N a m e  
         )  
          
         o n   b t n R e m o v e C o m b i n a t i o n   p r e s s e d   d o   (  
                 r e m o v e C o m b i n a t i o n ( )  
         )  
          
         o n   l b x C o m b i n a t i o n s L i s t   s e l e c t e d   v   d o   (  
                 i d   =   l b x C o m b i n a t i o n s L i s t . s e l e c t i o n  
                 c   =   g e t C o m b i n a t i o n s ( )  
                 u i C r e a t e C o m b i n a t i o n s   f a l s e  
                  
                 i f ( c [ i d ]   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
                  
                 d i s p l a y C o m b i n a t i o n P r o p s   c   i d  
                  
                 u i C r e a t e C o m b i n a t i o n s   t r u e  
         )  
          
         o n   e d t M o d e l P a r t N a m e   e n t e r e d     v   d o   (  
                 i d   =   l b x C o m b i n a t i o n s L i s t . s e l e c t i o n  
                 c   =   g e t C o m b i n a t i o n s ( )  
                  
                 i f ( c [ i d ]   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
                  
                 i f ( v . c o u n t   <   3 )   d o   (  
                         e d t M o d e l P a r t N a m e . t e x t   =   c [ i d ] [ 1 ]  
                         r e t u r n   m e s s a g e B o x   " P l e a s e   e n t e r   v a l i d   m o d e l   n a m e   ( m i n .   3   c h a r s ) "   t i t l e :   " E r r o r ! "  
                 )  
                                  
                 c [ i d ] [ 1 ]   =   v  
                  
                 a d d C o m b i n a t i o n   c  
                  
                 u p d a t e C o m b i n a i t o n s L i s t ( )  
                 l b x C o m b i n a t i o n s L i s t . s e l e c t i o n   =   i d  
                 d i s p l a y C o m b i n a t i o n P r o p s   c   i d  
         )  
          
         o n   b t n A d d M a t e r i a l   p i c k e d   o b j   d o   (  
                 i f ( o b j   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
                  
                 n   =   o b j . n a m e  
                  
                 i d   =   l b x C o m b i n a t i o n s L i s t . s e l e c t i o n  
                 c   =   g e t C o m b i n a t i o n s ( )  
                  
                 i f ( c [ i d ]   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
                  
                 a p p e n d I f U n i q u e   c [ i d ] [ 2 ]   n  
                  
                 a d d C o m b i n a t i o n   c  
                  
                 u p d a t e C o m b i n a i t o n s L i s t ( )  
                 l b x C o m b i n a t i o n s L i s t . s e l e c t i o n   =   i d  
                 d i s p l a y C o m b i n a t i o n P r o p s   c   i d  
         )  
          
         o n   b t n R e m o v e M a t e r i a l   p r e s s e d   d o   (  
                 i d   =   l b x C o m b i n a t i o n s L i s t . s e l e c t i o n  
                 c   =   g e t C o m b i n a t i o n s ( )  
                  
                 s i d   =   l b x M o d e l P a r t M a t e r i a l s . s e l e c t i o n  
                  
                 i f ( s i d   = =   0 )   d o   r e t u r n   m e s s a g e B o x   " P l e a s e   s e l e c t   m a t e r i a l   f r o m   l i s t ! "   t i t l e :   " W a r n i n g ! "  
                 i f ( c [ i d ]   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
                  
                 m   =   c [ i d ] [ 2 ]  
                 c [ i d ] [ 2 ]   =   r e m o v e F r o m A r r a y   m   s i d  
                  
                 a d d C o m b i n a t i o n   c  
                  
                 u p d a t e C o m b i n a i t o n s L i s t ( )  
                 l b x C o m b i n a t i o n s L i s t . s e l e c t i o n   =   i d  
                 d i s p l a y C o m b i n a t i o n P r o p s   c   i d  
         )  
          
         o n   b t n M e r g e M o d e l P a t h   p r e s s e d   d o   (  
                 p   =   g e t S a v e D i r   t y p e :   " m a x "  
                 i f ( p   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
                  
                 ( ' $ ' ) . a d d   " M E R G E _ M O D E L S _ P A T H "   p  
                  
                 l o a d A d d i t i o n a l S e t t i n g s ( )  
         )  
          
         o n   b t n S e t B a t c h R e n d e r P a t h   p r e s s e d   d o   (  
                 p   =   g e t S a v e D i r   t y p e :   " p n g "  
                 i f ( p   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
                  
                 ( ' $ ' ) . a d d   " O U T _ R E N D E R _ P A T H "   p  
                  
                 l o a d A d d i t i o n a l S e t t i n g s ( )  
         )  
          
         f n   i s S u p p o r t e d R e n d e r   =   (  
                 r   =   r e n d e r e r s . c u r r e n t  
 	 	  
 	 	 i f   m a t c h p a t t e r n   ( r   a s   s t r i n g )   p a t t e r n : " * C o r o n a * "   d o   r e t u r n   # ( r ,   " c o r o n a " ,   " C o r o n a " )  
 	 	 i f   m a t c h p a t t e r n   ( r   a s   s t r i n g )   p a t t e r n : " * V _ R a y * "   d o   r e t u r n   # ( r ,   " v r a y " ,   " V R a y " )  
 	 	          
                 r e t u r n   u n d e f i n e d  
         )  
          
         f n   g e t M o d e l s P a r t s   n   =   (  
                 r e t u r n   f o r   i   i n   ( o b j e c t s   a s   a r r a y )   w h e r e   ( m a t c h P a t t e r n   ( i . n a m e )   p a t t e r n :   ( n   +   " * " ) )   c o l l e c t   i  
         )  
 	  
 	 f n   g e t M o d e l M a t e r i a l s   n   =   (  
 	 	 n   =   t r i m R i g h t   n   " 0 1 2 3 4 5 6 7 8 9 "  
                 r e t u r n   f o r   i   i n   ( o b j e c t s   a s   a r r a y )   w h e r e   c l a s s O f   i   = =   S p h e r e   a n d   ( m a t c h P a t t e r n   ( i . n a m e )   p a t t e r n :   ( n   +   " * " ) )   c o l l e c t   i  
         )  
  
         f n   f o r c e U n g r o u p   o   =   (  
                 o   =   o   a s   a r r a y  
                 i f ( o . c o u n t   = =   0 )   d o   r e t u r n   f a l s e  
  
                 f o r   i   i n   o   w h e r e   i s G r o u p H e a d   i   a n d   i s V a l i d N o d e   i   d o   e x p l o d e G r o u p   i  
         )  
          
         f n   f o r c e D e l e t e O b j e c t s   o   =   (  
                 o   =   o   a s   a r r a y  
                 i f ( o . c o u n t   = =   0 )   d o   r e t u r n   f a l s e  
  
                 o o   =   f o r   i   i n   o   w h e r e   i s V a l i d N o d e   i   a n d   n o t   i s D e l e t e d   i   c o l l e c t   i  
                 d e l e t e   o o  
         )  
 	  
 	 f n   a s s i g n A l l M a t e r i a l s F i r s t   c o m b i n a t i o n s   =   ( 	 	  
 	 	 i f ( c o m b i n a t i o n s . c o u n t   = =   0 )   d o   r e t u r n   f a l s e  
 	 	  
 	 	 f o r   i   i n   c o m b i n a t i o n s   d o   (  
 	 	 	 m o d e l P a r t N a m e   =   i [ 1 ]  
 	 	 	 m o d e l P a r t M a t e r i a l s   =   i [ 2 ]  
 	 	 	  
 	 	 	 m o d e l P a r t s   =   g e t M o d e l s P a r t s   m o d e l P a r t N a m e  
 	 	 	  
 	 	 	 s e l e c t   m o d e l P a r t s  
                         f o r c e U n g r o u p   s e l e c t i o n  
                         s e l e c t   m o d e l P a r t s  
 	 	 	  
 	 	 	 i f ( m o d e l P a r t s . c o u n t   = =   0 )   d o   r e t u r n   f a l s e  
 	 	 	 	  
 	 	 	 m   =   g e t M o d e l M a t e r i a l s   m o d e l P a r t M a t e r i a l s [ 1 ]  
 	 	 	 i f ( m   = =   u n d e f i n e d   o r   m . c o u n t   = =   0 )   d o   c o n t i n u e  
 	 	 	  
 	 	 	 f o r   i i i   i n   m o d e l P a r t s   d o   i i i . m a t e r i a l   =   m [ 1 ] . m a t e r i a l 	 	 	  
 	 	 )  
 	 )  
 	  
 	 f n   s e t u p R e n d e r   f i l e N a m e   i s S e l e c t e d M o d e :   t r u e   =   ( 	 	  
 	 	 c r   =   i s S u p p o r t e d R e n d e r ( )  
 	 	  
 	 	 d e l e t e F i l e   f i l e N a m e  
 	 	  
 	 	 i f ( r e n d e r S c e n e D i a l o g . i s O p e n ( ) )   d o   r e n d e r S c e n e D i a l o g . c l o s e ( )   	 	  
 	 	  
 	 	 r e n d S a v e F i l e   =   t r u e  
 	 	 r e n d O u t p u t F i l e n a m e   =   f i l e N a m e  
 	 	 r e n d T i m e T y p e   =   1  
 	 	  
 	 	 c a s e   c r [ 2 ]   o f   (  
 	 	 	 " c o r o n a " :   (  
 	 	 	 	 c r [ 1 ] . r e n d e r S e l e c t e d _ m o d e   =   i f ( i s S e l e c t e d M o d e )   t h e n   1   e l s e   0  
 	 	 	 	 c r [ 1 ] . v f b _ c l e a r B e t w e e n R e n d e r s   =   t r u e  
 	 	 	 )  
 	 	 	 " v r a y " :   (  
 	 	 	 	 c r [ 1 ] . s y s t e m _ p r e v i o u s R e n d e r   =   5  
 	 	 	 	 c r [ 1 ] . i m a g e S a m p l e r _ r e n d e r M a s k _ t y p e   =   2  
 	 	 	 	 t r y   ( v f b c o n t r o l   # t e s t r e s o l u t i o n   f a l s e )   c a t c h ( )  
 	 	 	 )  
 	 	 )  
 	 	 	  
 	 	 r e M g r   =   m a x O p s . g e t C u r R e n d e r E l e m e n t M g r ( )  
 	 	 r e M g r . S e t E l e m e n t s A c t i v e   f a l s e  
 	 	  
 	 	 u p d a t e R e n d e r S e t t i n g s ( )  
 	 )  
          
         f n   b a t c h R e n d e r   c o m b i n a t i o n s   p t h   m o d e l N a m e   f r a m e   =   (                
 	 	 i f ( c o m b i n a t i o n s . c o u n t   = =   0 )   d o   (  
 	 	 	 p r i n t   ( " N o t   f o u n d   c o m b i n a t i o n s   f o r   "   +   m o d e l N a m e   +   " \ " ! " )  
 	 	 	 r e t u r n   f a l s e  
 	 	 )  
 	 	  
 	 	 a s s i g n A l l M a t e r i a l s F i r s t   c o m b i n a t i o n s  
 	 	  
 	 	 t m p   =   p t h   +   m o d e l N a m e   +   " _ "   +   f r a m e [ 1 ]   +   " _ b a s e . p n g "  
 	 	  
 	 	 s e t u p R e n d e r   t m p   i s S e l e c t e d M o d e :   f a l s e  
 	 	  
 	 	 p r i n t   ( " R e n d e r   t h e   b a s e   "   +   t m p )  
 	 	 m a x   q u i c k   r e n d e r  
 	 	          
                 f o r   i   i n   c o m b i n a t i o n s   d o   (  
                         m o d e l P a r t N a m e   =   i [ 1 ]  
                         m o d e l P a r t M a t e r i a l s   =   i [ 2 ]  
 	 	 	  
                         m o d e l P a r t s   =   g e t M o d e l s P a r t s   m o d e l P a r t N a m e  
 	 	 	  
                         i f ( m o d e l P a r t s . c o u n t   = =   0 )   d o   (  
                                 p r i n t   ( " M i s s i n g   m o d e l s   p a r t s   f o r   \ " "   +   m o d e l P a r t N a m e   +   " \ "   i n   \ " "   +   m o d e l N a m e   +   " \ " ! " )  
                                 c o n t i n u e  
                         )  
 	 	 	  
                         s e l e c t   m o d e l P a r t s  
                         f o r c e U n g r o u p   s e l e c t i o n  
                         s e l e c t   m o d e l P a r t s  
 	 	 	  
                         f o r   i i   i n   m o d e l P a r t M a t e r i a l s   d o   (  
                                 m a t s   =   g e t M o d e l M a t e r i a l s   i i  
                                  
                                 i f ( m a t s   = =   u n d e f i n e d   o r   m a t s . c o u n t   = =   0 )   d o   (  
                                         p r i n t   ( " M i s s i n g   m a t e r i a l   \ " "   +   i i   +   " \ "   f o r   m o d e l   p a r t   \ " "   +   m o d e l P a r t N a m e   +   " \ " ! " )  
                                         c o n t i n u e  
 	 	 	 	 )  
 	 	 	 	  
 	 	 	 	 f o r   m   i n   m a t s   d o   (  
 	 	 	 	 	 m a t N a m e   =   m . n a m e  
 	 	 	 	 	 f o r   i i i   i n   m o d e l P a r t s   d o   i i i . m a t e r i a l   =   m . m a t e r i a l  
 	 	 	 	 	  
 	 	 	 	 	 t m p   =   p t h   +   m o d e l N a m e   +   " _ "   +   f r a m e [ 1 ]   +   " _ "   +   m o d e l P a r t N a m e   +   " _ "   +   m a t N a m e   +   " . p n g "  
 	 	 	 	 	  
 	 	 	 	 	 s e t u p R e n d e r   t m p   i s S e l e c t e d M o d e :   t r u e  
 	 	 	 	 	  
 	 	 	 	 	 p r i n t   ( " R e n d e r   t h e   "   +   t m p )  
 	 	 	 	 	  
 	 	 	 	 	 m a x   q u i c k   r e n d e r  
 	 	 	 	 )  
                         )  
                 )  
         )  
 	  
 	 f n   g e t C e n t e r O f M o d e l   o b j s   =   (  
 	 	 f o r   i   i n   o b j s   w h e r e   i s G r o u p H e a d   i   d o   r e t u r n   i . p o s  
 	 	 r e t u r n   o b j s . c e n t e r  
 	 )  
 	  
 	 f n   a d d F i l e T o S c e n e   f   =   (  
 	 	 e x t   =   g e t F i l e N a m e T y p e   f  
 	 	  
 	 	 c a s e   e x t   o f   (  
 	 	 	 " . m a x " :   m e r g e M a x F i l e   f   # s e l e c t   # n o R e d r a w   # a u t o R e n a m e D u p s   # r e n a m e M t l D u p s   q u i e t :   t r u e  
 	 	 	 d e f a u l t :   i m p o r t F i l e   f   # n o P r o m p t  
 	 	 ) 	 	  
 	 )  
          
         o n   b t n S t a r t R e n d e r   p r e s s e d   d o   (  
                 c r   =   i s S u p p o r t e d R e n d e r ( )  
                 i f ( c r   = =   u n d e f i n e d )   d o   r e t u r n   m e s s a g e B o x   " P l e a s e   a s s i g n   C o r o n a   o r   V R a y   R e n d e r e r ! "   t i t l e :   " E r r o r ! "  
 	 	  
 	 	 f r a m e s   =   # ( )  
 	 	  
 	 	 i f ( c b x V i e w 0 . c h e c k e d )   d o   a p p e n d   f r a m e s   # ( " 0 d e g " ,   0 )  
 	 	 i f ( c b x V i e w 3 5 . c h e c k e d )   d o   a p p e n d   f r a m e s   # ( " 3 5 d e g " ,   - 3 5 )  
 	 	 i f ( c b x V i e w 9 0 . c h e c k e d )   d o   a p p e n d   f r a m e s   # ( " 9 0 d e g " ,   - 9 0 )  
 	 	 i f ( c b x V i e w 1 8 0 . c h e c k e d )   d o   a p p e n d   f r a m e s   # ( " 1 8 0 d e g " ,   - 1 8 0 )  
  
                 o r i g M a x F i l e   =   m a x F i l e P a t h   +   m a x F i l e N a m e  
  
                 i f ( o r i g M a x F i l e   = =   " " )   d o   r e t u r n   m e s s a g e B o x   " P l e a s e   s a v e   t h e   s c e n e ! "   t i t l e :   " E r r o r ! "  
  
                 c h e c k F o r S a v e ( )  
  
                 s   =   ( ' $ ' )  
                 p 1   =   s . g e t   " M E R G E _ M O D E L S _ P A T H "  
                 p 2   =   s . g e t   " O U T _ R E N D E R _ P A T H "  
                  
                 i f ( p 1   = =   u n d e f i n e d   o r   n o t   d o e s F i l e E x i s t   p 1 )   d o   r e t u r n   m e s s a g e B o x   " P l e a s e   c h o o s e   M e r g e   M o d e l s   P a t h ! "   t i t l e :   " E r r o r ! "  
                 i f ( p 2   = =   u n d e f i n e d   o r   n o t   d o e s F i l e E x i s t   p 2 )   d o   r e t u r n   m e s s a g e B o x   " P l e a s e   c h o o s e   S a v e   O u t p u t   R e n d e r   P a t h "   t i t l e :   " E r r o r ! "  
  
                 c o m b i n a t i o n s   =   g e t C o m b i n a t i o n s ( )  
  
                 i f ( c o m b i n a t i o n s . c o u n t   = =   0 )   d o   r e t u r n   m e s s a g e B o x   " P l e a s e   a d d   M o d e l   C o m b i n a t o n s   f i r s t ! "   t i t l e :   " E r r o r ! "  
                 f o r   i   i n   c o m b i n a t i o n s   w h e r e   i [ 1 ]   = =   " N e w   C o m b i n a t i o n "   d o   r e t u r n   m e s s a g e B o x   ( " P l e a s e   c h a n g e   n a m e   f o r   c o m b i n a t i o n   \ " N e w   C o m b i n a t i o n \ " \ n \ n   O r   r e m o v e   t h i s   c o m b i n a t i o n ! " )   t i t l e :   " E r r o r ! "  
                 f o r   i   i n   c o m b i n a t i o n s   w h e r e   i [ 2 ] . c o u n t   = =   0   d o   r e t u r n   m e s s a g e B o x   ( " P l e a s e   a d d   M o d e l   P a r t   M a t e r i a l s   f o r   c o m b i n a t i o n   \ " "   +   i [ 1 ]   +   " \ " ! \ n \ n O r   r e m o v e   t h i s   c o m b i n a t i o n ! " )   t i t l e :   " E r r o r ! "  
 	 	  
 	 	  
 	 	 i f ( f r a m e s . c o u n t   = =   0 )   d o   r e t u r n   m e s s a g e B o x   " P l e a s e   c h o o s e   a t   l e a s t   o n e   v i e w   a n g l e ! "   t i t l e :   " E r r o r ! "    
 	 	  
 	 	 t y p e s   =   # ( " f b x " ,   " m a x " ,   " o b j " )  
 	 	 f i l e s   =   # ( )  
 	 	 f o r   t y p e   i n   t y p e s   d o   (  
 	 	 	 j o i n   f i l e s   ( g e t F i l e s ( p 1   +   " * . "   +   t y p e ) )  
 	 	 )  
                  
                 p r o g r e s s S t a r t   " I n   p r o c e s s . . . "  
                 e s c a p e E n a b l e   =   t r u e  
                 c l e a r L i s t e n e r ( )  
 	 	  
                 f o r   i   i n   1   t o   f i l e s . c o u n t   d o   (  
                         f   =   f i l e s [ i ]  
  
                         a d d F i l e T o S c e n e   f  
  
                         c u r r e n t M o d e l   =   # ( )  
                         c u r r e n t M o d e l   =   s e l e c t i o n   a s   a r r a y  
 	 	 	  
 	 	 	 c e n t e r M o d e l   =   g e t C e n t e r O f M o d e l   s e l e c t i o n  
 	 	 	  
                         m o d e l N a m e   =   g e t F i l e n a m e F i l e   f    
 	 	 	  
 	 	 	 p o i n t H e l p e r   =   p o i n t   n a m e :   " M o d e l C e n t e r "   p o s :   c e n t e r M o d e l  
 	 	 	 	  
 	 	 	 f o r   s s   i n   c u r r e n t M o d e l   d o   s s . p a r e n t   =   p o i n t H e l p e r  
 	 	 	  
                         f o r   f r a m e   i n   f r a m e s   d o   (  
 	 	 	 	 p o i n t H e l p e r . r o t a t i o n . z   =   0  
 	 	 	 	 r o t a t e   p o i n t H e l p e r   ( e u l e r A n g l e s   0   0   f r a m e [ 2 ] )  
 	 	 	 	 b a t c h R e n d e r   c o m b i n a t i o n s   p 2   m o d e l N a m e   f r a m e  
 	 	 	 )  
 	 	 	  
                         f o r c e D e l e t e O b j e c t s   c u r r e n t M o d e l  
 	 	 	 d e l e t e   p o i n t H e l p e r  
 	 	 	  
                         p r o g r e s s U p d a t e   ( 1 0 0   *   i   /   f i l e s . c o u n t )  
                 )  
                 p r o g r e s s E n d ( )  
                  
 	 	 q   =   q u e r y B o x   " A l l   c o m b i n a t i o n s   a r e   r e n d e r e d . \ n \ n D o   y o u   w a n t   t o   o p e n   t h e   f o l d e r   w i t h   r e n d e r s ? "   t i t l e :   " C o n f i r m ! " 	 	 	  
 	 	 i f ( q )   d o   r e t u r n     s h e l l L a u n c h   p 2   " "  
         )  
 )  
  
 r o l l o u t   _ r A b o u t A B B   " A b o u t "    
 (  
         l a b e l   l b l N a m e   " "    
         l a b e l   l b l V e r   " "    
          
         l a b e l   l b l A u t h o r   " "   h e i g h t :   3 0  
         h y p e r l i n k   l b l C o p y   " "     a l i g n :   # c e n t e r  
          
         f n   g e t S c r i p t I n f o   s   r e l e a s e I n f o :   " "   =     (  
                 i f ( r e l e a s e I n f o   ! =   " " )   d o  
                 (  
                         r   =   g e t I N I S e t t i n g   s   r e l e a s e I n f o  
                         r e t u r n   r  
                 )  
  
                 v   =   g e t I N I S e t t i n g   s   " I N F O "   " V E R S I O N "  
                 a   =   g e t I N I S e t t i n g   s   " I N F O "   " A U T H O R "  
                 n   =   g e t I N I S e t t i n g   s   " I N F O "   " N A M E "  
                 o   =   g e t I N I S e t t i n g   s   " A B O U T "  
                 c   =   g e t I N I S e t t i n g   s   " I N F O "   " D E V "  
                 h   =   g e t I N I S e t t i n g   s   " I N F O "   " H E L P "  
                  
                 r   =   f o r   i   i n   ( g e t I N I S e t t i n g   s )   w h e r e   ( i   ! =   " A B O U T "   a n d   i   ! =   " S C R I P T "   a n d   i   ! =   " C O P Y " )   c o l l e c t   i  
                  
                 r e t u r n   # ( n ,   a ,   v ,   o ,   r ,   c ,   h )  
         )  
  
         o n   _ r A b o u t A B B   o p e n   d o  
         (  
                 i   =   g e t S c r i p t I n f o   ( g e t T h i s S c r i p t F i l e n a m e ( ) )  
                          
                 l b l N a m e . c a p t i o n   =   i [ 1 ]  
                 l b l A u t h o r . c a p t i o n   =   i [ 2 ]  
                 l b l V e r . c a p t i o n   =   i [ 3 ]  
                 l b l C o p y . a d d r e s s     =   l b l C o p y . c a p t i o n   =   i [ 6 ]  
         )  
 )  
  
 a d d R o l l o u t   _ r S t e p A B B 0   f B a t c h R e n d e r C o m b i n a t i o n s   r o l l e d U p : f a l s e  
 a d d R o l l o u t   _ r A b o u t A B B   f B a t c h R e n d e r C o m b i n a t i o n s   r o l l e d U p : t r u e   