Vim�UnDo� �yڞI��l��$n�f��6��Ptd��plZ�Q                                     `q<�    _�                     :        ����                                                                                                                            A   "                                                                                                                                                                                                                            `o>@    �               a   #include<bits/stdc++.h>   using namespace std;       template <int MOD> struct Mint{   !  static constexpr int mod = MOD;     int value;         Mint() : value(0) {}   P  Mint(int64_t v_) : value((int64_t)(v_ % mod)) { if (value < 0) value += mod; }          static int inv(int a, int m) {       a%=m; assert(a);   9    return a == 1?1:(int)(m-(int)(inv(m, a))*(int)(m)/a);     }          Mint inverse() const {   *    Mint res; res.value = inv(value, mod);       return res;     }       "  Mint power(Mint a, int b) const{   L    Mint res = 1; while(b>0){ if(b&1) res *= a; a=(a*a); b>>=1;} return res;     }       D  friend std::istream &operator>>(std::istream &input, Mint &other){   (    input >> other.value; return input;      }       H  friend std::ostream &operator<<(std::ostream &out, const Mint &other){   #    out << other.value; return out;     }       1  Mint operator- () const { return Mint(-value);}   1  Mint operator+ () const { return Mint(*this); }       H  Mint& operator ++ (){ value++;if (value==mod) value=0; return *this; }   J  Mint& operator -- (){ if(value==0) value = mod; value--; return *this; }   g  Mint& operator += (const Mint& o) { value = value+o.value; if(value>=mod) value-=mod; return *this; }   d  Mint& operator -= (const Mint& o) { value = value-o.value; if(value<0) value+=mod; return *this; }   u  Mint& operator *= (const Mint& o) { value = (int64_t)((int64_t)(value) * (int64_t)(o.value) % mod); return *this; }   D  Mint& operator /= (const Mint& o) { return *this *= o.inverse(); }       K  friend Mint operator ++ (Mint& a, int32_t) { Mint r = a; ++a; return r; }   K  friend Mint operator -- (Mint& a, int32_t) { Mint r = a; --a; return r; }   P  friend Mint operator + (const Mint& a, const Mint& b) { return Mint(a) += b; }   P  friend Mint operator - (const Mint& a, const Mint& b) { return Mint(a) -= b; }   P  friend Mint operator * (const Mint& a, const Mint& b) { return Mint(a) *= b; }   P  friend Mint operator / (const Mint& a, const Mint& b) { return Mint(a) /= b; }       W  friend bool operator == (const Mint& a, const Mint& b) { return a.value == b.value; }   W  friend bool operator != (const Mint& a, const Mint& b) { return a.value != b.value; }   U  friend bool operator < (const Mint& a, const Mint& b) { return a.value < b.value; }   U  friend bool operator > (const Mint& a, const Mint& b) { return a.value > b.value; }   W  friend bool operator <= (const Mint& a, const Mint& b) { return a.value <= b.value; }   W  friend bool operator >= (const Mint& a, const Mint& b) { return a.value >= b.value; }   };       using mint = Mint<998255353>;       mint dp[10005][1<<2][20005];       void solve(){     int n, k; cin>>n>>k;   E  dp[0][0][0] = 0; dp[0][1][0] = 0; dp[0][2][0] = 0; dp[0][3][0] = 0;   F  dp[0][0][1] = 1; dp[0][1][1] = 0; dp[0][2][1] = 0; dp[0][3][1] = 1;    F  dp[0][0][2] = 0; dp[0][1][2] = 1; dp[0][2][2] = 1; dp[0][3][2] = 0;      for(int j=1; j<2*n; j++){       for(int i=1; i<n; i++){   +      for(int mask=0; mask<(1<<2); mask++){   0        for(int smask=0; smask<(1<<2); smask++){   B          if(mask&smask) dp[i][mask|smask][j] += dp[i-1][mask][j];             else{   ?            if((mask==2 && smask==1) || (mask==1 && smask==2)){   :              dp[i][mask|smask][j]  += dp[i-1][mask][j-1];               }else{   :              dp[i][mask|smask][j]  += dp[i-1][mask][j-2];               }             }    	        }         }       }     }     mint cnt = 0;     for(int i=0; i<n; i++){   )    for(int mask=0; mask<(1<<2); mask++){         cnt += dp[i][mask][k];       }     }     cout<<cnt<<"\n";   }       int32_t main() {   #  ios_base::sync_with_stdio(false);     cin.tie(0);     int t = 1;     while(t--) solve();   }5�5�_�         
                  ����                                                                                                                            A   "                                                                                                                                                                                                                            `oJI    �         ^    5��                          -                      5�_�                            ����                                                                                                                            B   "                                                                                                                                                                                                                            `oJI    �         _       �         _    5��                          -                      5�_�                           ����                                                                                                                            B   "                                                                                                                                                                                                                            `oJJ    �         _    5��                         .                      �                         -                     �                         -                     5�_�                           ����                                                                                                                            B   "                                                                                                                                                                                                                            `oJJ    �         _    5��                         1                      5�_�                            ����                                                                                                                            C   "                                                                                                                                                                                                                            `oJK     �         `    5�5�_�                            ����                                                                                                                            C   "                                                                                                                                                                                                                 V        `oJO    �                int{   }5��                          -                      5�_�                           ����                                                                                                                            A   "                                                                                                                                                                                                      	           v        `pP�    �                  5��                          [                     5�_�                           ����                                                                                                                            @   "                                                                                                                                                                                                      ;           V        `q     �             8   template <int MOD> struct Mint{   !  static constexpr int mod = MOD;     int value;         Mint() : value(0) {}   P  Mint(int64_t v_) : value((int64_t)(v_ % mod)) { if (value < 0) value += mod; }          static int inv(int a, int m) {       a%=m; assert(a);   9    return a == 1?1:(int)(m-(int)(inv(m, a))*(int)(m)/a);     }     Mint inverse() const {   *    Mint res; res.value = inv(value, mod);       return res;     }       "  Mint power(Mint a, int b) const{   L    Mint res = 1; while(b>0){ if(b&1) res *= a; a=(a*a); b>>=1;} return res;     }       D  friend std::istream &operator>>(std::istream &input, Mint &other){   (    input >> other.value; return input;      }       H  friend std::ostream &operator<<(std::ostream &out, const Mint &other){   #    out << other.value; return out;     }       1  Mint operator- () const { return Mint(-value);}   1  Mint operator+ () const { return Mint(*this); }       H  Mint& operator ++ (){ value++;if (value==mod) value=0; return *this; }   J  Mint& operator -- (){ if(value==0) value = mod; value--; return *this; }   g  Mint& operator += (const Mint& o) { value = value+o.value; if(value>=mod) value-=mod; return *this; }   d  Mint& operator -= (const Mint& o) { value = value-o.value; if(value<0) value+=mod; return *this; }   u  Mint& operator *= (const Mint& o) { value = (int64_t)((int64_t)(value) * (int64_t)(o.value) % mod); return *this; }   D  Mint& operator /= (const Mint& o) { return *this *= o.inverse(); }       K  friend Mint operator ++ (Mint& a, int32_t) { Mint r = a; ++a; return r; }   K  friend Mint operator -- (Mint& a, int32_t) { Mint r = a; --a; return r; }   P  friend Mint operator + (const Mint& a, const Mint& b) { return Mint(a) += b; }   P  friend Mint operator - (const Mint& a, const Mint& b) { return Mint(a) -= b; }   P  friend Mint operator * (const Mint& a, const Mint& b) { return Mint(a) *= b; }   P  friend Mint operator / (const Mint& a, const Mint& b) { return Mint(a) /= b; }       W  friend bool operator == (const Mint& a, const Mint& b) { return a.value == b.value; }   W  friend bool operator != (const Mint& a, const Mint& b) { return a.value != b.value; }   U  friend bool operator < (const Mint& a, const Mint& b) { return a.value < b.value; }   U  friend bool operator > (const Mint& a, const Mint& b) { return a.value > b.value; }   W  friend bool operator <= (const Mint& a, const Mint& b) { return a.value <= b.value; }   W  friend bool operator >= (const Mint& a, const Mint& b) { return a.value >= b.value; }   };       using mint = Mint<998244353>;       mint dp[1005][1<<2][2005];5��           8               .       �	              5�_�                            ����                                                                                                                               "                                                                                                                                                                                                                 V        `q     �                 5��                          .                      5�_�                            ����                                                                                                                               "                                                                                                                                                                                                                 V        `q
    �                  int n, k; cin>>n>>k;   $  dp[0][0][1] = 1; dp[0][3][1] = 1;    $  dp[0][1][2] = 1; dp[0][2][2] = 1;      map<pair<int, int>, int> m;   �  m[make_pair(0, 1)] = 1; m[make_pair(0, 2)] = 1; m[make_pair(0, 3)] = 1; m[make_pair(3, 0)] = 1; m[make_pair(3, 2)] = 1; m[make_pair(3, 1)] = 1;   1  m[make_pair(1, 2)] = 2; m[make_pair(2, 1)] = 2;     for(int i=1; i<n; i++){       for(int j=1; j<=k; j++){   +      for(int mask=0; mask<(1<<2); mask++){   0        for(int smask=0; smask<(1<<2); smask++){   .          if(m.count(make_pair(smask, mask))){   S            if(m[make_pair(smask, mask)]==1) dp[i][mask][j] += dp[i-1][smask][j-1];   D            else dp[i][mask][j] += (j-2>=0? dp[i-1][smask][j-2]: 0);             }   3          else dp[i][mask][j] += dp[i-1][smask][j];   	        }         }       }     }     mint cnt = 0;   '  for(int mask=0; mask<(1<<2); mask++){       cnt += dp[n-1][mask][k];     }     cout<<cnt<<"\n";5��                          <       g              5�_�                           ����                                                                                                                            @   "                                                                                                                                                                                                                            `q;�    �                 �             5��                          <                      �                          <                      �                        >                     �                        >                     �                        >                     �                        >                     �                     	   >              	       �       	                 E                     �       	                 E                     �                        L                      �                         O                      5�_�                            ����                                                                                                                            B   "                                                                                                                                                                                                                            `q<�     �                  v.5��                          M                      5�_�                             ����                                                                                                                            A   "                                                                                                                                                                                                                            `q<�    �                 �             5��                          M                      �                         O                      5�_�                           ����                                                                                                                            @   "                                                                                                                                                                                                                 V        `q     �               void solve(){5��                         .                     5�_�                            ����                                                                                                                            @   "                                                                                                                                                                                                                            `q    �               void solve(){5��                         .                     �                        /                     �                        0                     �                        1                     5�_�                            ����                                                                                                                            A   "                                                                                                                                                                                                                            `q2!    �                 �                 vector<int> v;5��                          <                      �                          <                      �                        >                     �                        >                     �                        >                     �                        >                     �                     	   >              	       �       	                 E                     �       	                 E                     5�_�                            ����                                                                                                                            A   "                                                                                                                                                                                                                            `q2+     �                 vector<int> v5��                         K                      5�_�                           ����                                                                                                                            A   "                                                                                                                                                                                                                            `pP�    �         ]       5��                          [                     �                          [                     5�_�                     N        ����                                                                                                                            A   "                                                                                                                                                                                                                            `pSe     �   N   O   ^              �   N   P   _                      5��    N                      �              	       �    N                     �                     �    N                    �                    �    N                     �                     �    N                    �              	       �    P                      �                     �    O                    �              	       �    P                      �                     5�_�                           ����                                                                                                                            B   "                                                                                                                                                                                                      	           v        `pP�     �         ^       5��                          w                     �                         w                    �                          w                     5�_�                            ����                                                                                                                            @   "                                                                                                                                                                                                                 V        `pP�     �         ^      ?template <int MOD> struct Mint{ static constexpr int mod = MOD;5��                       M                     5�_�          	      
   3       ����                                                                                                                            A   "                                                                                                                                                                                                                            `oIr    �   2   4   ^      V  friend bool operator = (const Mint& a, const Mint& b) { return a.value != b.value; }5��    2                     �                     5�_�             
   	   2       ����                                                                                                                            A   "                                                                                                                                                                                                                            `oIe    �   1   3   ^      V  friend bool operator = (const Mint& a, const Mint& b) { return a.value == b.value; }5��    1                     �                     5�_�             	      $       ����                                                                                                                            A   "                                                                                                                                                                                                                            `oI\    �   #   %   ^      G  Mint& operator + (){ value++;if (value==mod) value=0; return *this; }5��    #                     �                     5�_�                   !       ����                                                                                                                            A   "                                                                                                                                                                                                                            `oIV    �       "   ^      0  int operator- () const { return Mint(-value);}5��                                               5�_�                  @       ����                                                                                                                            A   "                                                                                                                                                                                                                            `o>y   
 �   ?   A   ^      #  dp[0][0][1] = 1; dp[0[3][1] = 1; 5��    ?                     �	                     5�_�                     A       ����                                                                                                                            A   "                                                                                                                                                                                                                            `o>~   	 �   @   B   ^      #  dp[0][1][2] = 1; dp[0[2][2] = 1; 5��    @                     
                     5�_�                   @       ����                                                                                                                            A   "                                                                                                                                                                                                                            `o>p    �   ?   A   ^      #  dp[0][0][1] = 1; dp[0[3][1] = 1; 5��    ?                     �	                     5�_�                   @       ����                                                                                                                            A   "                                                                                                                                                                                                                            `o>i    �   ?   A   ^      #  dp[0][0][1] = 1; dp[0[3][1] = 1; 5��    ?                     �	                     5�_�                    3       ����                                                                                                                            A   "                                                                                                                                                                                                                            `o>T    �   2   4   ^      V  friend bool operator = (const Mint& a, const Mint& b) { return a.value != b.value; }5��    2                     �                     5��