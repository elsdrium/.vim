Vim�UnDo� ���4��fbdc�o�p9ȃ!wF]w����  
n                                   Th �    _�                      $        ����                                                                                                                                                                                                                                                                                                                                                             Th �    �  
  
          (        The data must obey some rules : �  	�  	�          (        The data must obey some rules : �  	�  	�                  �  	�  	�                  �  	V  	X          T                K = K,iter = iter, t0 = t0, clean = clean, rho = rho,verbose=False, �  	H  	J          >        model: struct (optional) learned model to be used for �  	F  	H          !        U: double m x p matrix   �  	>  	@          ?        batch: (optional, false by default, use batch learning �  	<  	>          @        clean: (optional, true by default. prunes automatically �  	:  	<          3        t0: (optional) tuning parameter (see paper �  	6  	8          1          decay weights with updates of the form �  	5  	7          ?          3) if modeParam=2, the optimization uses exponential �  	3  	5          7          2) if modeParam=1, the optimization uses the �  	1  	3          7          1) if modeParam=0, the optimization uses the �  	.  	0          @        batchsize: (optional, size of the minibatch, by default �  	*  	,          <        iter: (number of iterations).  If a negative number �  	$  	&                  return_lasso: �  	  	                  �  	  	          <        "Online Dictionary Learning for Sparse Coding"      �  	  	                  �  	  	                  �  	  	          :        non-negative sparse coding technique presented in �  	  	          T                K = K,iter = iter, t0 = t0, clean = clean, rho = rho,verbose=False, �  �  �          >        model: struct (optional) learned model to be used for �  �  �          !        U: double m x p matrix   �  �  �          ?        batch: (optional, false by default, use batch learning �  �  �          @        clean: (optional, true by default. prunes automatically �  �  �          3        t0: (optional) tuning parameter (see paper �  �  �          4        rho: (optional) tuning parameter (see paper �  �  �          2          decay weights with updates of the form  �  �  �          ?          3) if modeParam=2, the optimization uses exponential �  �  �          7          2) if modeParam=1, the optimization uses the �  �  �          7          1) if modeParam=0, the optimization uses the �  �  �          @        batchsize: (optional, size of the minibatch, by default �  �  �          <        iter: (number of iterations).  If a negative number �  �  �                  return_lasso: �  �  �                  �  �  �          <        "Online Dictionary Learning for Sparse Coding"      �  �  �                  �  �  �                  �  �  �          A        non-negative matrix factorization technique presented in �  �  �          O            - single precision setting (even though the output alpha is double �  �  �          2        clean: (optional, true by default. prunes �  �  �          1          decay weights with updates of the form �  �  �          ?          3) if modeParam=2, the optimization uses exponential �  �  �          7          2) if modeParam=1, the optimization uses the �  �  �          7          1) if modeParam=0, the optimization uses the �  �  �          M        iter_updateD: (optional, number of BCD iterations for the dictionary �  �  �          @        batchsize: (optional, size of the minibatch, by default �  �  �          <          dictionary, false by default, not compatible with �  �  �          <        posD: (optional, adds positivity constraints on the �  �  �          2        mode: (optional, see above, by default 2) �  |  ~          ?        iter: (number of iterations).  If a negative number is �  x  z          @          When D is not provided, the dictionary is initialized �  m  o          %                                     �  k  m          I              C={  D in Real^{m x p}  s.t.  forall j,  ||d_j||_2^2 + ... �  h  j          I              C={  D in Real^{m x p}  s.t.  forall j,  ||d_j||_2^2 + ... �  c  e          9                                                         �  b  d          O                                                         lambda1||alpha_i||_1  �  a  c          G        min_{D in C} (1/n) sum_{i=1}^n (1/2)||x_i-Dalpha_i||_2^2 + ... �  [  ]                     �  V  X          =        Contrary to the approaches above, the algorithm here �  U  W                  �  R  T          <        "Online Dictionary Learning for Sparse Coding"      �  Q  S                  �  L  N                  �  J  L          <        trainDL_Memory is an efficient but memory consuming �  8  :          '            - single precision setting �               2        clean: (optional, true by default. prunes �              1          decay weights with updates of the form �              ?          3) if modeParam=2, the optimization uses exponential �              7          2) if modeParam=1, the optimization uses the �              7          1) if modeParam=0, the optimization uses the �              @        batchsize: (optional, size of the minibatch, by default �  	            <          dictionary, false by default, not compatible with �    
          <        posD: (optional, adds positivity constraints on the �               K          'graph' 'graph-ridge' 'graph-l2' 'tree-l0' 'tree-l2' 'tree-linf' �  �  �          ?        iter: (number of iterations).  If a negative number is �  �  �          @          When D is not provided, the dictionary is initialized �  �  �                  return_model: �  �  �          %                                     �  �  �          S              C={  D in Real^{m x p}  s.t.  forall j,  (1-gamma1)||d_j||_2^2 + ... �  �  �          I              C={  D in Real^{m x p}  s.t.  forall j,  ||d_j||_2^2 + ... �  �  �          I              C={  D in Real^{m x p}  s.t.  forall j,  ||d_j||_2^2 + ... �  �  �                      �  �  �                  �  �  �                  �  �  �          <        "Online Dictionary Learning for Sparse Coding"      �  �  �                  �  �  �                  �  �  �          '            - single precision setting �  �  �          2        clean: (optional, true by default. prunes �  �  �          1          decay weights with updates of the form �  �  �          ?          3) if modeParam=2, the optimization uses exponential �  �  �          7          2) if modeParam=1, the optimization uses the �  �  �          7          1) if modeParam=0, the optimization uses the �  �  �          @        batchsize: (optional, size of the minibatch, by default �  �  �          <          dictionary, false by default, not compatible with �  �  �          <        posD: (optional, adds positivity constraints on the �    �          >          coefficients, false by default, not compatible with �  }            2        mode: (optional, see above, by default 2) �  y  {          ?        iter: (number of iterations).  If a negative number is �  t  v          @          When D is not provided, the dictionary is initialized �  l  n                  return_model: �  e  g          %                                     �  c  e          S              C={  D in Real^{m x p}  s.t.  forall j,  (1-gamma1)||d_j||_2^2 + ... �  `  b          I              C={  D in Real^{m x p}  s.t.  forall j,  ||d_j||_2^2 + ... �  ]  _          I              C={  D in Real^{m x p}  s.t.  forall j,  ||d_j||_2^2 + ... �  X  Z                  �  W  Y                  �  V  X          V        min_{D in C} (1/n) sum_{i=1}^n 0.5||x_i-Dalpha_i||_2^2 +lambda1||alpha_i||_0  �  P  R          K        min_{D in C} (1/n) sum_{i=1}^n (1/2)||x_i-Dalpha_i||_2^2  s.t. ... �  M  O          G        min_{D in C} (1/n) sum_{i=1}^n (1/2)||x_i-Dalpha_i||_2^2 + ... �  D  F                  �  C  E                  �  A  C          I        reasonable size and you have enough memory on your computer, you �  ?  A                  �  <  >          <        "Online Dictionary Learning for Sparse Coding"      �  ;  =                  �  6  8                  �  �            9        if not ('eta_g' in tree and 'groups' in tree and �  �  �                  return_val_loss: �  �  �          
          �  �  �          
          �  �  �          P          the (i,j) entry is non-zero if and only if the variable i is included �  �  �          
          �  �  �          O          the (i,j) entry is non-zero if and only if i is different than j and �  �  �          J          graph.groups           sparse (double or boolean) N x N matrix  �  �  �          A          The next field sets inclusion relations between groups �  �  �          
          �  �  �          1          graph.eta_g            double N vector �  �  �          
          �  �  �                  �  �  �          /                                               �  �  �                      �  �  �                      �  ~  �                      �  z  |                  �  v  x                      �  u  w          /            on the value of regul, it computes �  -  /                  return_val_loss: �  ,  .          
          �  *  ,          
          �  )  +          2          tree['N_own_variables']  int32 N vector �  '  )          
          �  $  &          E          The next field define the smallest index of each group gi, �  #  %          
          �     "          O          the (i,j) entry is non-zero if and only if i is different than j and �    !          L          tree['groups']           sparse (double or boolean) N x N matrix  �              A          The next field sets inclusion relations between groups �              
          �              3          tree['eta_g']            double N vector �              
          �              
          �                        For instance, �              
          �  
            B          T={ g1={1,2,3,4},g2={2,3},g3={4} }, then, root(g1)={1}, �              E          * Every group is a set of  contiguous indices for instance �              M          in gj, then j <= i. g1 should be the group at the root of the tree �               
          �  �                     tree: named list �  �  �                  �  �  �          /                                               �  �  �                      �  �  �                    for all i, v^i = �  �  �                    for all i, v^i = �  �  �                  �  �  �                      �  �  �          /            on the value of regul, it computes �  �  �                  return_val_loss: �  �  �                      �  �  �          "            argmin 0.5||U-V||_F^2 �  �  �                  if regul='none',  V= �  �  �                  if regul='rank',  V= �  �  �          #        if regul='trace-norm',  V= �  �  �          *        if regul='l1linf+row-column',  V= �  �  �          "        if regul='l1linf+l1',  V= �  �  �                   if regul='l1l2+l1',  V= �  �  �                  if regul='l1linf',  V= �  ~  �                  if regul='l1l2',  V= �  |  ~                     �  z  |          9            argmin 0.5||u-v||_2^2 + lambda1 ||mat(v)||_* �  y  {          "        if regul='trace-norm-vec' �  t  v          *        if regul='sparse-group-lasso-l2'  �  p  r          <            argmin 0.5||u-v||_2^2 + lambda1 sum_g ||v_g||_2 �  o  q          #        if regul='group-lasso-l2'  �  Z  \          G        Given an input matrix U=[u^1,\ldots,u^n], it computes a matrix �  X  Z                      �  W  Y          /            on the value of regul, it computes �              
          �                      a: �  �  �                  return_optim_info: �  �  �          1        X: double dense or sparse m x p matrix   �  �  �                      �  �  �                        �  �  �                      �  �  �                      �  �  �          
          �  �  �                  a: �  �  �                  return_optim_info: �  |  ~          1        X: double dense or sparse m x p matrix   �  v  x                      �  s  u                        �  q  s                      �               
          �                      a: �              L        2: Barzilai-Borwein step sizes (similar to SparSA by Wright et al.) �  �  �                  return_optim_info: �  �  �          1        X: double dense or sparse m x p matrix   �  �  �                      �  �  �                            �  �  �                            �  �  �          O              - loss='cur' useful to perform sparse CUR matrix decompositions, �  �  �                          �  �  �                          �  �  �                            �  �  �                          �  �  �                          �  �  �                            �  �  �          P                the entries of Y are real-valued,  W is a matrix of size p x n. �  �  �                            �  �  �                      �  �  �          L         - single precision setting (even though the output alpha is double �  �  �          +          N is the total number of signals �  �  �          M            min_{A_i} 0.5||X_i-D A_i||_2^2 + lambda1/sqrt(n_i)||A_i||_{1,2}  �  �  �          '            for all matrices X_i of X, �  �  �                  �  }                    �  z  |          E        Simultaneous signal decomposition formulation based on block �  y  {          "        l1L2BCD is a solver for a �  l  n          L         - single precision setting (even though the output alpha is double �  T  V          +          N is the total number of signals �  N  P                      �  L  N                      �  I  K          #        for all matrices X_i of X, �  H  J                  �  E  G                  �  ?  A          <        for solving a large number of small or medium-sized �  0  2          E            - single precision setting (even though the output alpha �              A            min_{alpha} 0.5||x-Dalpha||_2^2 + lambda1||alpha||_1 �              I            For this constraint setting, the method solves a sequence of �    	          M        correlation between the dictionary elements and when one can benefit �              C        This method is particularly well adapted when there is low �              L        It is optimized for solving a large number of small or medium-sized �               5        cd addresses l1-decomposition problem with a �  �  �             �  �  �          E         - Passing a double vector of length n to eps and or lambda1 �  �  �          L         - single precision setting (even though the output alpha is double �  �  �          5          path (optional): double dense p x L matrix �  �  �          H        L: (optional, maximum number of elements in each decomposition, �  �  �                  return_reg_path: �  �  �          H            min_{alpha} ||alpha||_0  s.t  ||diag(beta)*(x-Dalpha)||_2^2 �  �  �          L        for all columns x of X, and columns beta of B, it computes a column �  �  �                  �  |  ~          E         - Passing a double vector of length n to eps and or lambda1 �  x  z          L         - single precision setting (even though the output alpha is double �  b  d          H        L: (optional, maximum number of elements in each decomposition, �  ^  `                  return_reg_path: �  U  W          A            min_{alpha} 0.5||x-Dalpha||_2^2 + lambda1||alpha||_0 �  P  R          -        it addresses for all columns x of X, �  O  Q                  �  H  J          <        for solving a large number of small or medium-sized �  5  7          O            - single precision setting (even though the output alpha is double �  "  $          9        L: (optional, maximum number of elements of each �              F                                            lambda1||diag(w)alpha||_1 �              0            min_{alpha} 0.5||x-Dalpha||_2^2  +  �              1            min_{alpha} ||x-Dalpha||_2^2   s.t.  �              <        for solving a large number of small or medium-sized �  �  �          O            - single precision setting (even though the output alpha is double �  �  �          9        L: (optional, maximum number of elements of each �  �  �          F            min_{alpha} ||alpha||_1 s.t. ||diag(beta)(x-Dalpha)||_2^2 �  �  �              �  �  �          O            - single precision setting (even though the output alpha is double �  y  {          F        cholesky: (optional, default false),  choose between Cholesky �  j  l                  return_reg_path: �  ]  _                  �  Z  \                      �  N  P                  �  M  O          7        homotopy-LARS algorithm for solving the Lasso. �  <  >          '            - single precision setting �     "          G           it solves the previous problems with positivity constraints �               0                                                �              I              min_v 0.5||u-v||_2^2 + lamuda1||v||_1 +lamuda2 FL(v) + ... �              L              min_v ||u-v||_2^2  s.t  ||v||_1 + 0.5lamuda1||v||_2^2 <= thrs �  
            2        sparseProject solves various optimization �   �   �                  Y: double m x n matrix �   �   �          !        X: double m x n matrix   �   �   �                  B: double n x n matrix �   �   �          !        A: double n x n matrix   �   �   �          @        Conjugate gradient algorithm, sometimes faster than the �   �   �                  Y: double m x m matrix �   �   �          %        offset: scalar, 0,1,2 or 3   �   �   �          !        X: double m x n matrix   �   �   �                  Z: double m x p matrix �   �   �          !        Y: double n x p matrix   �      �                  Z: double m x p matrix �   |   ~          !        Y: double p x n matrix   �   l   n                  Z: double m x p matrix �   i   k          !        Y: double n x p matrix   �   F   H          !        XAt: double m x p matrix �   C   E          (        A: double sparse p x n matrix   �   >   @          F      lot more columns than rows. In some cases, it is up to 20 times �   =   ?          C        Compute efficiently XAt = X*A', when A is sparse and has a �   ,   .          !        AAt: double m x m matrix �   )   +          (        A: double sparse m x n matrix   �   #   %          9        Compute efficiently AAt = A*A', when A is sparse 5��