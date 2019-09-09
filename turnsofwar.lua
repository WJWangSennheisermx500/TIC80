-- title:  Turns of War
-- author: msx80 & Stavros & Fubuki
-- desc:   A turn based fantasy strategy game
-- script: lua
-- input:  mouse
-- saveid: turnsofwar


-- Hi there :) Thanks for playing my
-- game!
-- Sorry for the obfuscated sources
-- but i don't like being copied..
-- if you have any question on the
-- workings feel free to contact me!
-- Reach me on the TIC80 discord!
-- Don't forget to "like" the game
-- on https://tic.computer/play
-- msx80 @ twitter

-- Gfx by Stavros: 
-- eliacoan @ twitter
-- "Go with the flow"

-- Sfx and Music by Fubuki

iS=true 
iT=0
iU=0
iW=0
iX={}
iY=nil
iZ=nil
ja=nil
jb={}
jc={}
jd=nil
je=nil
jf=false
jg=false
jh=false
ji={b={4,1,15,14},c={4,1,12,12},d={6,12,0,1},e={5,11,15,14}}

function jj(lb,lc)
  return{min=lb,max=lc}
end

function jk(ld,le)
  for lf=1,#ld do
    if ld[lf]==le then
      return true
    end
  end
  return false
end


function jl(lg,lh,li,lj)
  return math.abs(lg-li)<=1 and math.abs(lh-lj)<=1 and(lg~=li or lh~=lj)
end


function jm(lk,ll,lm,ln)
  local lo=lk-lm
  local lp=ll-ln
  return math.sqrt(lo*lo+lp*lp)
end


function jn(lq)
  if type(lq)=="number" then
    return math.random(0,lq)
  else return math.random(lq.min,lq.max)
  end
end

function jo(lr,ls,lt)
  return ls*lt+lr*(1-lt)
end

function jp(...)
  local lu = table.pack(...)
  return function(...)
    for lw=1,#lu do
      if not lu[lw](...) then
        return false
      end
    end
    return true
  end
end


function jq(lx,ly,lz)
  return ly>=lx.r and lz>=lx.s and ly<(lx.r+lx.ac) and lz<(lx.s+lx.ad)
end


function jr(lA,lB)
  return lA+lB*20
end



function js(lC)
  return lC%20,lC//20
end

function jt(lD,lE,lF)
  if type(lD)=="string" then
    print(lD,lE,lF,15,false,1,true)
  else
    for lG=1,#lD,2 do
      local lH=lD[lG+1]
      local lI=lD[lG]
      local lJ
      if lI<0 then
        spr(lH,lE,lF-1,0-lI)
        lJ=8
      else lJ=print(lH,lE,lF,lI,false,1,true)
      end
      lE=lE+lJ
    end
  end
end


function ju(lK)
  return lK
end



function jw(lL)
  local lM=1.70158;
  return lL*lL*((lM+1)*lL-lM)
end


function jx(lN)
  return lN*lN
end



function jy(lO)
  lO=lO*2
  if(lO)<1 then
    return 0.5*lO*lO;
  else
    return -0.5*((lO-1)*(lO-3)-1);
  end
end



function jz(lP)
  if lP==0 then
    return 0
  end
  if lP==1 then
    return 1
  end
  return math.pow(2,-10*lP)*math.sin((lP-0.1)*5*math.pi)+1;
end





function jA(lQ)
  lQ:j(lQ.p,lQ.o)
  lQ.n=lQ.n+1
  local lR=lQ.n/lQ.k
  lQ.p=lQ.l(lR)
  lQ.o=lQ.k*lQ.p
  if jB(lQ) then
    if lQ.m then lQ:m()
    end
    return false
  end
  return true
end



function jB(lS)
  return lS.n>=lS.k
end



function jC(lT,lU,lW,lX)
  return{j=lT,k=lU,l=lW,m=lX,n=0,o=0,p=0}
end


function jD(lY,lZ,ma)
  return jC(
    -- function(mb,mc,md)
    function()
    if not jB(lY)then
      jA(lY)
    end
    if not jB(lZ)then
      jA(lZ)
    end
  end, math.max(lY.k,lZ.k),ju,ma)
end


function jE(me,mf,mg)
  -- return jC(function(mh,mi,mj)
  return jC(function()
    if not jB(me)then
      jA(me)
    end
    if jB(me)and not jB(mf)then
      jA(mf)
    end
  end,me.k+mf.k,ju,mg)
end


function jF()
  local mk=pmem(0)
  if mk==0 then
    mk=1
  end
  return mk
end


function jG(ml)
  if pmem(0)<ml then
    pmem(0,ml)
  end
end


function jH(mm)
  for mn,mo in pairs(mm.y) do
    if mo>0 then
      mm.y[mn]=mo-1
    end
  end
  mm.x={}
  if mm.q.x then
    for mp,mq in pairs(mm.q.x)do
      mm.x[mp]=mq
    end
  end
  mm:D()
end


function jI(mr)
  for ms,mt in pairs(mr) do
    return true
  end
  return false
end


function jJ(mu,mw,mx,my)
  local mz=mu 
  if not mz.cB then 
    mz.cB=0 
  end 
  local mA={
            q=mz,
            r=mw,
            s=mx,
            t=my,
            u={},
            w={},
            x={},
            y={},
            z=mz.z,
            A=function(mB,mC)
              mB.u[mC]=mC.aY;
              if iY==mB then 
                jX()
              end 
            end, 
            B=function(mD,mE)
              mD.z=mD.z-mE 
              if mD.z<0 then 
                mD.z=0 
              elseif mD.z>mD.q.z then 
                mD.z=mD.q.z 
              end 
            end,
            C=function(mF)
              local mG={}
              for mH,mI in pairs(mF.u) do 
                if mH.bi then 
                  table.insert(mG,mH)
                end 
              end 
              for mJ=1,#mG do 
                mF.u[mG[mJ]]=nil 
              end 
            end,
            D=function(mK)
              for mL,mM in pairs(mK.u) do 
                if mM==1 then 
                  mK.u[mL]=nil 
                else 
                  if mM>0 then 
                    mK.u[mL]=mM-1 
                  end 
                end 
              end 
             end,
            E=function(mN,mO)
              return mN.u[mO]~=nil 
            end,
            F=function(mP)
              if mP:E(kS.aT) then 
                return false 
              else 
                return jI(ro:Z(mP))
              end 
            end,
            G=function(mQ)
              local mR=0 
              if mQ:E(kS.bm) then 
                mR=1 
              end 
              return mQ.q.G+mRend
              end
            }
              
              jH(mA)
              return mA 
            end 
            
            
            
            function jK(mS)
              local mT=kZ[mS]
              local mU,mW=kg(mT.dR,mT.dS)
              iZ=nil 
              ja=nil 
              kd(nil)
              local mY=mT.ec 
              for nb=1,#mY,3 do 
                table.insert(mU,jJ(mY[nb],mY[nb+1],mY[nb+2],0))end 
                local mY=mT.ed 
                for nc=1,#mY,3 do 
                  table.insert(mU,jJ(mY[nc],mY[nc+1],mY[nc+2],1))end 
                  local mZ={}
                  if mT.L then 
                    for nd,ne in pairs(mT.L)do 
                      mZ[nd]=ne 
                    end 
                  end 
                  local na={
                            H=mT.H,
                            I=0,
                            J=mS,
                            K=mU,
                            L=mZ,
                            M=function(nf)
                              for ng=1,#nf.K do 
                                local nh=nf.K[ng]
                                if nh.t==0 then
                                  return false 
                                end
                              end 
                              return true 
                            end,
                            N=function(ni,nj,nk)
                              for nl=1,#ni.K do 
                                local nm=ni.K[nl]
                                if nm.r==nj and nm.s==nk then
                                  return nm end 
                                end 
                                return nil;
                              end,
                              O=function(nn,no,np)
                                return mW[jr(no,np)]
                              end,
                              P=function(nq)
                                for nr=#nq.K,1,-1 do 
                                  local ns=nq.K[nr]
                                  if ns.z and ns.z<=0 then 
                                    table.remove(nq.K,nr)end
                                  end 
                                end,
                                Q=function(nt)
                                  table.sort(nt.K,function(nu,nw)return nu.s<nw.s end)
                                end,
                                R=function(nx,ny,nz,nA,nB)
                                  local nC=jJ(ny,nz,nA,nB)
                                  table.insert(nx.K,nC)
                                  return nC 
                                end,

                                S=function(nD,nE,nF,nG,nH)
                                  local nI=nD:N(nF,nG)
                                  if not nI then 
                                    return nD:R(nE,nF,nG,nH)
                                  end 
                                  for nJ=math.max(nF-1,0),math.min(nF+1,10) do
                                    for nK=math.max(nG-1,0),math.min(nG+1,7) do
                                      local nL=nD:N(nJ,nK)
                                      if not nL then 
                                        return nD:R(nE,nJ,nK,nH)
                                      end 
                                    end 
                                  end 
                                  return nil 
                                end,

                                T=function(nM,nN,nO,nP)
                                  for nQ,nR in ipairs(nM.K)do 
                                    if nN==nR then
                                      local nS=jJ(nO,nN.r,nN.s,nP);
                                      nM.K[nQ]=nS 
                                      return 
                                    end 
                                  end 
                                end,

                                U=function(nT,nU)
                                  local nW={}
                                    for nX=1,#nT.K do
                                      local nY=nT.K[nX]
                                        if nY.t==nU and nY:F() then 
                                          table.insert(nW,nY)
                                        end 
                                    end
                                    return nW 
                                end,
                                    
                                W=function(nZ,oa)
                                  local ob=0 
                                  for oc=1,#nZ.K do 
                                    local od=nZ.K[oc]
                                    if od.q==oa then 
                                      ob=ob+1 
                                    end 
                                  end
                                  return ob 
                                end,
                                X=function(oe,of,og,oh)
                                  for oi=1,#oe.K do 
                                    local oj=oe.K[oi]
                                    if of~=oj and oj.t==of.t then 
                                      if jR(of,nil,oj.r,oj.s) then 
                                        oj:A(oh)
                                      end 
                                    end 
                                  end 
                                end,
                                Y=function(ok)
                                  for ol=1,#ok.K do 
                                    ok.K[ol]:C()
                                  end 
                                  for om=1,#ok.K do 
                                    local on=ok.K[om]
                                    for oo=1,#on.q.cx do 
                                      local op=on.q.cx[oo]
                                      if op.bN then 
                                        ok:X(on,on.G,op.bN)
                                      end 
                                    end 
                                  end 
                                end,
                                Z=function(oq,os)
                                  local ot={}
                                  for ou=#os.q.cx,1,-1 do 
                                    local ow=os.q.cx[ou]
                                    if (not os.y[ow]) or (os.y[ow]==0) then 
                                      for ox=0,10 do 
                                        for oy=0,7 do 
                                          local oz=oq:N(ox,oy)
                                          if ow.bu(os,oz,ox,oy)then 
                                            if not ot[jr(ox,oy)]then 
                                              ot[jr(ox,oy)]={}
                                            end 
                                            table.insert(ot[jr(ox,oy)],ow)
                                          end 
                                        end
                                      end 
                                    end 
                                  end 
                                  return ot 
                                end
                              }
                  na:Q()
                  na:Y()
                  kU(mT.dT,nil,ji.b)
                  music((mS+1)%2)
                  return na 
end 






function jL(oA,oB,oC,oD)
  return jl(oA.r,oA.s,oC,oD)
end 
  


function jM(oE,oF,oG,oH)
    local oI=ro:O(oG,oH)
    return oI==0 or oI==2 or oI==128 
end 

function jN(oJ,oK,oL,oM)
  return oK==nil 
end 


function jO(oN,oO,oP,oQ)
  return oO and oO.q==kY.cG 
end 

function jP(oR,oS,oT,oU)
  return oS and oS.q==kY.cM 
end 

function jQ(oW,oX,oY,oZ)
  return oX and oX.z and oX.z<oX.q.z 
end 


function jR(pa,pb,pc,pd)
  return jm(pa.r,pa.s,pc,pd)<=pa:G()
end
 
function jS(pe,pf,pg,ph)
  return pf and (pf.t>=0) and (pf.t~=pe.t) 
end


function jT(pi,pj,pk,pl)
  return pj and pj~=pi and pj.t==pi.t 
end 

function jU(pm,pn,po,pp)
  return not pn:E(kS.aT)
end 


function jW(pq,pr,ps,pt)
  return false 
end 


function jX()
  if iY and not iY:E(kS.aT) then 
    iZ=ro:Z(iY) else iZ=nil 
  end 
  if iY and iY.q.G then 
    jY(iY.r,iY.s,iY:G()) 
  else 
    ja=nil 
  end 
end 

function jY(pu,pw,px)
  ja={}
  local py={}
  for pz=0,11 do 
    py[pz]={}
    for pA=0,8 do 
      local pB=jm(pu,pw,pz,pA)<=px 
      py[pz][pA]=pB
    end 
  end 
  for pC=0,10 do 
    for pD=0,7 do 
      if py[pC][pD]~=py[pC+1][pD] then
        for pE=0,15,2 do 
          table.insert(ja,{pC*16+16,pD*16+pE})
        end 
      end 
      if py[pC][pD]~=py[pC][pD+1] then 
        for pF=0,15,2 do 
          table.insert(ja,{pC*16+pF,pD*16+16})
        end 
      end 
    end 
  end 
end 



function jZ(pG)
  local pH=pG.ax or 0 
  local pI=pG.ay or 0 
  if pG==iY and not je and iZ and not jd and pG.t==0 then 
    pI=-math.abs(math.sin(iW/10))*3 
    pH=0 
  end 
  local pJ={} 
  for pN,pO in pairs(pG.u) do 
    table.insert(pJ,pN)
  end 
  local pK=(7*#pJ)//2 
  for pP=1,#pJ do 
    spr(pJ[pP].aX,pG.r*16+pH-pK+pP*7,pG.s*16+pI-8,pJ[pP].bg or 14)
  end 
  local pL=0 
  if pG.t==1 then
    pL=1 
  end 
  spr(pG.q.aX,pG.r*16+pH,pG.s*16+pI,pG.q.bg or 14,1,pL,0,2,2)
  local pM=pG.q.aU 
  if pG.z then 
    pM=pM.." "..pG.z.."/"..pG.q.z 
  end 
  ka(pG.r*16,pG.s*16,16,16,pM)
end 


function ka(pQ,pR,pS,pT,pU)
  table.insert(jb,{r=pQ,s=pR,ac=pS,ad=pT,ae=pU})
end 

function kb(pW,pX,pY,pZ,qa)              --似乎跟按钮有关
  local qb=4+print(pY,0,-10,15,false,1,true)
  local qc=8+2 rect(pW,pX,qb,qc,6)
  line(pW,pX,pW+qb-2,pX,12)
  line(pW,pX,pW,pX+qc-2,12)
  line(pW+1,pX+qc-1,pW+qb-1,pX+qc-1,4)
  line(pW+qb-1,pX+1,pW+qb-1,pX+qc-1,4)
  print(pY,pW+2,pX+2,15,false,1,true)
  ka(pW,pX,qb,qc,pZ)
  table.insert(jc,{r=pW,s=pX,ac=qb,ad=qc,ae=pY,af=qa})
end 

function kc(qd,qe,qf)
  print(qd.q.aU,qe,qf,15,false,1,false)
  spr(qd.q.aX,qe,qf+8,qd.q.bg or 14,1,0,0,2,2)
  if qd.z then 
    print(qd.z.."/"..qd.q.z,qe+17,qf+8,6,false,1,true)
    ka(qe+17,qf+8,15,6,"Health points left and total")
  end 
  if qd.q.cy then 
    print(qd.q.cy.min.."-"..qd.q.cy.max,qe+17,qf+14,3,false,1,true)
    ka(qe+17,qf+14,15,6,"Attack range, min and max")
  end 
  if qd.q.G then 
    print(qd:G(),qe+17,qf+20,5,false,1,true)
    ka(qe+17,qf+20,15,6,"Distance of ranged attack or magic")
  end 
  qf=qf+25 
  for qg=1,#qd.q.cx do 
    local qh=qd.q.cx[qg]
    local qi=qh.aZ 
    local qj={-1,qh.bw,15," "..qh.aU}
    if qd.x then 
      local ql=qd.x[qh]
      if ql then 
        table.insert(qj,14)table.insert(qj," +"..ql)
        qi=qi.." - "..ql.." free (doesn't spend unit)"
      end 
    end 
    local qk=qh.y 
    if qk then 
      local qm=qd.y[qh] or 0 
      if qm==0 then 
        table.insert(qj,14)
        table.insert(qj," "..qm.."/"..qk)
        qi=qi.." - Cooldown: Ready"
      else 
        table.insert(qj,6)
        table.insert(qj," "..qm.."/"..qk)
        qi=qi.." - Cooldown: "..qm.." turns left"
      end 
    end 
    jt(qj,qe,qf+1)
    ka(qe,qf+1,60,8,qi)
    qf=qf+9 
  end 
  qf=qf+8
  for qn,qo in pairs(qd.u) do 
    qf=qf+7 
    spr(qn.aX,qe-1,qf-2,qn.bg or 14)
    local qp=qo>0 and qo or"A"
    jt({15,qn.aU,14," ["..qp.."]"},qe+7,qf,15)
    ka(qe+7,qf,60,8,qn.aZ..(qo>0 and""or" (area effect)"))
  end 
  qf=90 
  if qd.t==0 then 
    kb(qe,qf,"Pass","Don't use this unit this turn.",function()qd:A(kS.aT)sfx(2,50,20)kP()end)
  end 
end 

function kd(qq)
  iY=qq 
  iW=0 
  jX();
end 

function ke(qr,qs,qt)
  if qr<0 or qs<0 or qr>21 or qs>15 then 
    return qt 
  else 
    return mget(qr,qs)
  end 
end 
  
  
function kf(qu,qw,qx)
    local qy=0 
    if ke(qu-1,qw-1,qx)~=qx then 
      qy=qy+1 
    end 
    if ke(qu,qw-1,qx)~=qx then
      qy=qy+2 
    end 
    if ke(qu+1,qw-1,qx)~=qx then 
      qy=qy+4 
    end 
    if ke(qu+1,qw,qx)~=qx then 
      qy=qy+8 
    end 
    if ke(qu+1,qw+1,qx)~=qx then 
      qy=qy+16 
    end 
    if ke(qu,qw+1,qx)~=qx then 
      qy=qy+32 
    end 
    if ke(qu-1,qw+1,qx)~=qx then 
      qy=qy+64 
    end 
    if ke(qu-1,qw,qx)~=qx then 
      qy=qy+128 
    end 
    return qy 
end
  
  
function kg(qz,qA)
    local qB={}
    local qC={}
    for qF=0,10 do
      for qG=0,7 do 
        local qH=mget(qF+qz,qG+qA)
        if qH>=32 and qH<128 then
          for qI,qJ in pairs(kY) do 
            if qJ.aX==qH then 
              table.insert(qB,jJ(qJ,qF,qG,-1))
            end 
          end
          qH=0 
        end 
        if qH<128 then 
          mset(qF*2,qG*2,qH)
          mset(qF*2+1,qG*2,qH)
          mset(qF*2,qG*2+1,qH)
          mset(qF*2+1,qG*2+1,qH)
        else 
          mset(qF*2,qG*2,qH)
          mset(qF*2+1,qG*2,qH+1)
          mset(qF*2,qG*2+1,qH+16)
          mset(qF*2+1,qG*2+1,qH+17)
        end 
        qC[jr(qF,qG)]=qH 
      end 
    end 

    local qD={}

    for qK=0,21 do 
      for qL=0,15 do 
        local qM=mget(qK,qL)
        if qM>=1 and qM<3 then
          local qN=kf(qK,qL,qM)
          if qN>0 then 
            table.insert(qD,{r=qK,s=qL,q=qN})
          end
        end
      end
    end

    local qE={[1]=11,[3]=1,[4]=10,[6]=1,[7]=1,[12]=4,[16]=8,[24]=4,[28]=4,[31]=2,[48]=6,[64]=9,[96]=6,[112]=6,[124]=7,[129]=3,[192]=3,[193]=3,[199]=0,[241]=5,}

    for qO=1,#qD do 
      local qP=qD[qO]
      if qE[qP.q]then 
        local qQ=mget(qP.r,qP.s)
        local qR=32 
        if qQ==1 then 
          qR=240 
        elseif qQ==2 then 
          qR=224 
        end 
        mset(qP.r,qP.s,qE[qP.q]+qR)
      end 
    end 
    for qS=0,21 do 
      for qT=0,15 do 
        local qU=mget(qS,qT)
        if qU<16 and math.random(100)>95 then 
          mset(qS,qT,qU+16)
        end 
      end
    end 
    return qB,qC 
end 


function TIC()
  qW,qX,qY,qZ,ra=mouse()
  rb=qY and not re 
  rc=qZ and not rf 
  rd=ra and not rg 
  re=qY 
  rf=qZ 
  rg=ra 
  if iT==0 then 
    kj()
  else
    kk()
  end 
end 


function kh(rh,ri,rj,rk)
  local rl=print(rh,0,-10,rk)
  print(rh,ri-(rl//2),rj,rk)
end 


function ki(rm,rn)
  kh("CHOOSE LEVEL:",rm+90,rn,15)
  kh(kZ[la].dT[1],rm+90,rn+10,12)
  kb(rm,    rn+10,"<<","",function() la=la-1 if la<1 then la=#kZ end end)
  kb(rm+170,rn+10,">>","",function()la=la+1 if la>#kZ then la=1 end end)
  if la>jF()then 
    kb(rm+75,rn+20,"LOCKED","",function()end)
  else 
    kb(rm+75,rn+20,"START!","",function()sfx(01,50,50)ro=jK(la)iT=1 end)
  end 
end


function kj()
  cls(0)
  print("Turns of War",20+1,10,4,false,3)
  print("Turns of War",20,10+1,4,false,3)
  print("Turns of War",20-1,10,4,false,3)
  print("Turns of War",20,10-1,4,false,3)
  print("Turns of War",20,10,11,false,3)
  print("A turn based strategy game",40,30)
  print("Code and design by: ",40,37)
  print("Graphics by:",40,37+7)
  print("Music and sfx:",40,37+7+7)
  print("msx80",150,37,12)
  print("Stavros",150,37+7,12)
  print("Fubuki",150,37+7+7,12)
  print("Ver 1.1",200,130,3)
  spr(258,0,26,6,2,0,0,2,2)
  spr(324,240-32,26,14,2,1,0,2,2)
  ki(30,80)
  if rb then 
    for rp=1,#jc do 
      local rq=jc[rp]
      if jq(rq,qW,qX)then 
        rq.af()
        return 
      end 
    end 
  end 
  jc={}
end 





function kk()
  jb={}
  local rr=qW//16 
  local rs=qX//16 
  if not je then 
    if jd then 
      if rb then 
        local rt=jd.onClose
        jd=nil 
        if rt then 
          rt()
        end 
      end 
    else 
      local ru=nil 
      if iZ then 
        ru=iZ[jr(rr,rs)]
      end
      if rb and ((not iS)or not ru) then 
        if qW<=176 then 
          kd(ro:N(rr,rs))
        else 
            for rw=1,#jc do 
              local rx=jc[rw]
              if jq(rx,qW,qX)then 
                rx.af()
                return 
              end 
            end 
        end
      elseif((rd and not iS) or (rb and iS)) and iY and iZ and iY.t==ro.I then 
          if ru then 
            ru[1]:by(iY,rr,rs)
          end 
      end 
    end
  end 
  cls(4)
  map(0,0,22,16)
  if rr<11 and rs<8 then 
      rectb(rr*16,rs*16,16,16,14)
  end 
  for ry=1,#ro.K do 
      local rz=ro.K[ry]jZ(rz)
  end 
  if iY then 
      jc={}kc(iY,180,1)
  end 
  kb(190,118,"Restart","Restart current level.", function() ro=jK(ro.J)return end)
  if not je then
    if iZ then 
      for rA=0,10 do 
        for rB=0,7 do
          local rC=iZ[jr(rA,rB)]
          if rC then 
              spr(rC[1].bw,rA*16+4,rB*16+4,1,1,0,0,1,1)
          end 
        end 
      end 
    end 
  end

  if je then 
    if jB(je)then 
        je=nil 
    else 
        jA(je)
    end 
  end
  iU=iU+1
  iW=iW+1 
  if ja then 
    for rD=1,#ja do 
        pix(ja[rD][1],ja[rD][2],5)
    end
  end 
  for rE=1,#jb do 
    if jq(jb[rE],qW,qX)then 
        print(jb[rE].ae,0,16*8+2,15,false,1,true)
    end 
  end 
  if jd then kl()
  end 
  line(176,0,176,128-1,3)
  line(0,128,176,128,3)
  spr(494,240-16,136-16,0,1,0,0,2,2)
end
  
  
function kl()
    local rF=0 
    for rH=1,#jd do 
      local rI=print(jd[rH],0,-20,1)//2 
      if rI>rF then 
        rF=rI 
      end 
    end 
    local rG=(#jd*7)//2 
    rect(88-rF-5,60-rG,rF*2+10,(rG*2)+10,jd.cols[1])
    rectb(88-rF-4,61-rG,rF*2+8,(rG*2)+8,jd.cols[2])
    for rJ=1,#jd do 
      print(jd[rJ],88-rF,60-rG+5+(rJ-1)*7,(rJ==1) and jd.cols[3]or jd.cols[4])
    end 
end 
  
  
function km(rK,rL,rM,rN)
  return jC(function(rO,rP,rQ) print(rK,rL-1,rM-rP*10,0,false,1,true)
                               print(rK,rL+1,rM-rP*10,0,false,1,true)
                               print(rK,rL,rM-rP*10+1,0,false,1,true)
                               print(rK,rL,rM-rP*10-1,0,false,1,true)
                               print(rK,rL,rM-rP*10,rN,false,1,true) end,
                               50,
                               ju)
end 

function kn(rR,rS)
  local rT=jC(function(rU,rW,rX)rU.v=rU.v+0.15 rU.s=rU.s+rU.v circ(rR+rU.n/4,rS+rU.s,2,6)
                                                              circ(rR-rU.n/4,rS+rU.s,2,6)
                                                              circ(rR+rU.n/5,rS+rU.s*1.2+1,2,6)
                                                              circ(rR-rU.n/5,rS+rU.s*1.2+1,2,6)
                                                              circ(rR+rU.n/6,rS+rU.s*1.4,2,6)
                                                              circ(rR-rU.n/6,rS+rU.s*1.4,2,6)
                                                            end,
                                                            30,
                                                            jw)
  rT.v=-2 
  rT.s=0 
  return rT 
end 


function ko(rY,rZ,sa,sb,sc)
  return jC(function(sd,se,sf) rZ(rY,se,sf) end ,
                                              sa,
                                              sb,
            function() rY.ax=0;rY.ay=0;iW=0;if sc then sc()end end)
end

function kp(sg,sh,si,sj)
  local sk=sh-sg.r 
  local sl=si-sg.s 
  return ko(sg,function(sm,sn,so)sm.ax=sn*16*sk sm.ay=sn*16*sl end,40,jy,sj)
end 


function kq(sp,sq,sr,ss)
  local st=sq.r-sp.r 
  local su=sq.s-sp.s 
  sfx(0,40,20)return 
  jE(jC(function(sw,sx,sy)spr(256,16*(sp.r+sx*st)+4,16*(sp.s+sx*su)+4,0)end,30,ju), jD(ku(sq),jD(kn(sq.r*16+8,sq.s*16+8),km("-"..sr,sq.r*16+8-5,sq.s*16,6))),ss)
end


function kr(sz,sA,sB)
  return jD(ku(sz),jD(kn(sz.r*16+8,sz.s*16+8),km(sA,sz.r*16+8-5,sz.s*16,sB)))
end 

function ks(sC,sD,sE,sF,sG)
  local sH=sD-sC.r 
  local sI=sE-sC.s 
  local sJ=nil 
  for sK=1,#sF do 
    local sL=sF[sK]
    local sM 
    if sD==sL.r and sE==sL.s then
      sM=4 
    else 
      sM=2 
    end 
    local sN=kr(sL,"-"..sM,6)
    if sJ==nil then 
      sJ=sN 
    else 
      sJ=jD(sJ,sN)
    end 
  end 
  return jE(jC(function(sO,sP,sQ) spr(304,16*(sC.r+sP*sH)+4,16*(sC.s+sP*sI)+4,0)end,30,ju),sJ,sG)
end 


function kt(sR,sS,sT,sU,sW)
  local sX=sS.r-sR.r 
  local sY=sS.s-sR.s 
  return jE(jC(function(sZ,ta,tb)spr(257,16*(sR.r+ta*sX)+4,16*(sR.s+ta*sY)+4,0)end,30,ju,function()if sU then sfx(4,60,40)else sfx(11,50,40)end end),kr(sS,sT,11),sW)
end 



function ku(tc)
  return ko(tc,function(td,te,tf)td.ax=jn(2)-1 td.ay=jn(2)-1 end,30,ju)
end

function kw(tg,th,ti,tj)
  local  tk=th.r-tg.r 
  local  tl=th.s-tg.s 
  return jE(ko(tg,function(tm,tn,to) tm.ax=tn*14*tk;tm.ay=tn*14*tl end, 30, jw, function() sfx(0,20,30) end),jD(ko(tg,function(tp,tq,tr) tp.ax=(14-tq*14)*tk tp.ay=(14-tq*14)*tlend end, 30 , ju),jD( ku(th), jD( kn(th.r*16+8,th.s*16+8), km("-"..ti,th.r*16+8-5,th.s*16,6)))),tj)
end 
  
  
function kx(ts,tt,tu,tw)
  local tx=tt-ts.r 
  local ty=tu-ts.s 
  return ko(ts,function(tz,tA,tB)tz.ax=tA*16*tx tz.ay=tA*16*ty end,90,jz,tw)
end 

function ky(tC,tD)
  if tD.y then 
    tC.y[tD]=tD.y 
  end
  if tC.x then 
    local tE=tC.x[tD]
    if tE and tE>0 then 
      tC.x[tD]=tE-1 return 
    end 
  end
  tC:A(kS.aT)
end 


function kz(tF,tG,tH)
  return math.abs(tF.r-tG)+math.abs(tF.s-tH)
end 

function kA(tI)
  local tJ={}
  for tK,tL in pairs(tI)do
    for tM=1,#tL do
      local tN=tL[tM]
      if not tJ[tN]then
        tJ[tN]={}
      end
      table.insert(tJ[tN],tK)
    end
  end
  return tJ
end


-- function kB()
-- end 




function kC(tO,tP,tQ)
  local tR=10000 
  local tS=nil 
  for tT=1,#ro.K do 
    local tU=ro.K[tT]
    if tU.t~=tQ and tU.t>=0 then 
      local tW=kz(tU,tO,tP)
      if tW<tR then 
        tR=tW tS=tT 
      end 
    end 
  end 
  return tR 
end 



function kD(tX,tY)
  local tZ=ro:N(tX,tY)
  if tZ and tZ.t<0 then 
    return false 
  end 
  return jM(nil,nil,tX,tY)
end 



function kE(ua,ub,uc)
  iX={}
  local ud={}
  iX[jr(ua,ub)]=0 
  for ue=0,100 do 
    for uf,ug in pairs(iX)do 
      if ug==ue then 
        local uh,ui=js(uf)
        local uj=ro:N(uh,ui)
        if uj and uj.t~=uc and uj.t>=0 then 
          return ue 
        end 
        for uk=uh-1,uh+1 do
          for ul=ui-1,ui+1 do 
            if uk>=0 and ul>=0 and uk<11 and ul<8 and not(uk==uh and ul==ui) then 
              if kD(uk,ul) then
                local um=iX[jr(uk,ul)]
                if not um then
                  ud[jr(uk,ul)]=ue+1 
                end 
              end 
            end 
          end 
        end
      end 
    end 
    for un,uo in pairs(ud)do 
      iX[un]=uo 
    end 
  end 
  return 1000 
end 


function kF(up,uq)
  local ur={}
  for us=1,#uq do
    local ut,uu=js(uq[us])
    table.insert(ur,ro:N(ut,uu))
  end 
  for uw=1,#ur do
    local ux=ur[uw]
    if ux.z<=up.q.cy.min then 
      return ux.r,ux.s 
    end 
  end 
  table.sort(ur,function(uy,uz)return uy.q.cB>uz.q.cB end)
  return ur[1].r,ur[1].s 
end 





function kG(uA)
  local uB=uA.w[kT.bz]
  local uC,uD=kF(uA,uB)kT.bz:by(uA,uC,uD)
end 




function kH(uE)
  local uF=uE.w[kT.bC]
  local uG,uH=kF(uE,uF)
  kT.bC:by(uE,uG,uH)
end



function kI(uI)
  local uJ=uI.w[kT.bs]
  local uK=10000 
  local uL=nil 
  for uO=1,#uJ do 
    local uP,uQ=js(uJ[uO])
    local uR=kE(uP,uQ,uI.t)
    if(uR<uK)or(uR==uK and jn(10)>5) then 
      uK=uR 
      uL=uO 
    end
  end 
  local uM,uN=js(uJ[uL])kT.bs:by(uI,uM,uN)
end 



function kJ(uS)
  for uT,uU in pairs(uS.w) do 
    if uT~=kT.bz and uT~=kT.bs and uT~=kT.bC then 
      for uW=1,#uU do 
        local uX,uY=js(uU[uW])
        if uT.bU(uS,uX,uY) then 
           uT:by(uS,uX,uY) 
           return true 
        end 
      end 
    end 
  end 
  return false
end 




function kK()
  local uZ=ro:U(ro.I)
    for wa=1,#uZ do 
      local wb=uZ[wa]wb.w=kA(ro:Z(wb))
    end 
    for wc=1,#uZ do 
      local wd=uZ[wc]
      if kJ(wd)then 
        return
      end 
    end 
    for we=1,#uZ do 
      local wf=uZ[we]
      if wf.w[kT.bz] then 
        kG(wf)
        return 
      end
      if wf.w[kT.bC] then 
        kH(wf)
        return 
      end
    end 
    for wg=1,#uZ do 
      local wh=uZ[wg]
      if wh.w[kT.bs] then 
        kI(wh)
        return 
      end 
    end
end 




function kL(wi)
  for wj=1,#ro.K do
    local wk=ro.K[wj]
    if wk.t==wi then 
      jH(wk)
    end 
  end 
end 



function kM()
  for wl,wm in pairs(ro.L)do 
    if wl<0 then 
      local wn=-wl 
      for wo=0,8 do 
        local wp=ro:N(wn,wo)
        if wp and wp.t==0 then 
          local wq=ro.L[wl]ro.L[wl]=nil wq()
          return 
        end
      end 
    else 
      local wr,ws=js(wl)
      local wt=ro:N(wr,ws)
      if wt and wt.t==0 then 
        local wu=ro.L[wl]
        ro.L[wl]=nil 
        wu()
        return
      end 
    end 
  end 
end 




function kN()
  music(2,-1,-1,false)
  jG(ro.J+1)
  kU({"LEVEL COMPLETED!"},
      function() ro=jK(ro.J+1)end,
      ji.c)
end 




function kO()
  music()
  kU({ "YOU'VE BEEN DEFEATED!","","Too bad, the forces of evil","overwhelmed you.","","Click to try again!"},
        function() ro=jK(ro.J) end,
        ji.d)
end 




function kP()
  ro:P()
  ro:Q()
  ro:Y()
  if ro.H() then 
    kN() 
    return 
  end 
  if ro:M() then 
    kO()
    return 
  end 
  kM()
  if#ro:U(ro.I)==0 then 
    ro.I=(ro.I+1)%2 
    kL(ro.I)
    if ro.I==0 then 
      if kZ[ro.J].hN then 
        kZ[ro.J].hN()
      end 
    end 
  end 
  if ro.I==0 then 
    if iY and iY.t==ro.I and iY:F() then 
      jX()
    else 
      for ww=1,#ro.K do 
        local wx=ro.K[ww]
        if wx.t==ro.I and wx:F() then 
          kd(wx)
          break 
        end 
      end 
    end 
  else 
    if #ro:U(ro.I)==0 then 
      kP()
    else kK()
    end
  end 
end 




function kQ(wy,wz)
  ky(wz,wy)
  kP()
end 




function kR(wA,wB,wC)
  wA.r=wB 
  wA.s=wC 
end 



kS={
    aT={aU="Spent",   aX=272,     aY=1,  aZ="Unit already moved this turn"},
    bb={aU="Hexen",   aX=273,     aY=4,  aZ="Does 1 less damage"},
    be={aU="Morale",  aX=320,bg=6,aY=-1, aZ="Receive 1 less damage on any attack",bi=true},
    bj={aU="Ensnared",aX=288,     aY=3,  aZ="Unit will not be able to move"},
    bm={aU="Focused", aX=289,     aY=4,  aZ="Range of attacks increased by 1"},
    bp={aU="Furious", aX=321,     aY=4,  aZ="Attack dmg increased by 1"}
}





kT={
  
  
  bs={aU="Move",
        bu=jp(jN,function(wD,wE,wF)return not wD:E(kS.bj)end,jL,jM),
        bw=448,
        aZ="Move unit to nearby cell",
        by=function(wG,wH,wI,wJ) 
             sfx(10,15+jn(25),20) 
             je=kp(wH,wI,wJ,function()kR(wH,wI,wJ)kQ(wG,wH)end)
            end},
        
  bz={aU="Attack",
        bu=jp(jS,jL),
        bw=449,
        aZ="Attack a nearby unit",
        by=function(wK,wL,wM,wN) 
              local wO=ro:N(wM,wN) 
              local wP=jn(wL.q.cy) 
              if wL:E(kS.bb) then 
                wP=wP-1 
              end 
              if wO:E(kS.be) then 
                wP=wP-1 
              end 
              if wL:E(kS.bp) then 
                wP=wP+1 
              end 
              if wP<0 then 
                wP=0 
              end 
              je=kw(wL,wO,wP,function() wO:B(wP) kQ(wK,wL)end)
            end},
            
  bC={aU="Ranged",
        bu=jp(jR,jS),
        bw=449,
        aZ="Attack an enemy at distance",
        by= function(wQ,wR,wS,wT)
             local wU=ro:N(wS,wT)
             local wW=jn(wR.q.cy)
             if wR:E(kS.bb) then 
               wW=wW-1 
             end 
             if wU:E(kS.be) then 
               wW=wW-1 
             end 
             if wR:E(kS.bp) then 
               wW=wW+1 
             end 
             if wW<0 then 
               wW=0 
             end 
             je=kq(wR,wU,wW,function() wU:B(wW)kQ(wQ,wR)end)
            end
      
      },



  bF={aU="Teleport",
    bu=jp(jN,jR,jM),
    bw=464,
    aZ="Teleport to any free cell in range",
    y=2,
    by=function(wX,wY,wZ,xa)
      je=kx(wY,wZ,xa, function() kR(wY,wZ,xa)kQ(wX,wY)end)end},


  bI={aU="Hex",
    bu=jp(jR,jS),
    bw=465,
    aZ="Cast HEX: enemy does -1 damage on attacks",
    by= function (xb,xc,xd,xe) local xf=ro:N(xd,xe); je=kt(xc,xf,"HEX",false,function() xf:A(kS.bb);kQ(xb,xc) end) end
   },


  be={aU="Morale",
    bu=jW,
    bw=465,
    aZ="All friends in range gets MORALE effect",
    by=function(xg,xh,xi,xj)end,
    bN=kS.be},


  bO={aU="Bomb",
    bu=jp(jR,jS),
    bw=465,
    aZ="Throw a bomb, 4 dmg at center, 2 adjacents",
    y=6,
    by=function(xk,xl,xm,xn)
          local xo={}
          for xp=xm-1,xm+1 do 
            for xq=xn-1,xn+1 do 
              local xr=ro:N(xp,xq)
              if xr and xr.t>=0 then 
                table.insert(xo,xr)
              end 
            end 
          end 
          je=ks(xl,xm,xn,xo,function() for xs=1,#xo do local xt=xo[xs] local xu if xm==xt.r and xn==xt.s then xu=4 else xu=2 end xt:B(xu)end kQ(xk,xl)end)
    end},



  bj={aU="Ensnare",
      bu=jp(jR,jS),
      bw=465,
      y=2,
      aZ="Cast ENSNARE: enemy cannot move",
      by=function(xw,xx,xy,xz) local xA=ro:N(xy,xz) je=kt(xx,xA,"ENSNARE",false,function()xA:A(kS.bj)kQ(xw,xx)end)end,
      bU=function(xB,xC,xD) local xE=ro:N(xC,xD) return not xE:E(kS.bj)end
    },


  bW={aU="WakeEnt",
    bu=jp(jO,jR),
    bw=464,
    aZ="Tranform a tree into an ENT",
    y=8,
    by=function(xF,xG,xH,xI) local xJ=ro:N(xH,xI) je=kt(xG,xJ,"WAKE",true,function() ro:T(xJ,kY.df,xG.t) kQ(xF,xG) end ) end
   },


  ca={aU="Recall",
      bu=jp(jP,jR),
      bw=464,
      aZ="Tranform a tomb into a Skeleton",
      by=function(xK,xL,xM,xN)
             local xO=ro:N(xM,xN)je=kt(xL,xO,"RAISE",true,function()ro:T(xO,kY.dx,xL
.t)kQ(xK,xL)end)end,bU=function
(xP,xQ,xR)return true end},


  ce={
       aU="Heal",
       bu=jp(jT,jR,jQ),
       bw=464,
       aZ="Heal 3 hp to target friend",
       by=function(xS,xT,xU,xW)
            local xX=ro:N(xU,xW)
            je=kt(xT,xX,"+3",true,function()xX:B(-3)kQ(xS,xT)end)
          end
      },


  ci={aU="Haste",bu=jp(jT,jR
,jU),bw=464,aZ="Give 2 free move actions to unspent friend"
,y=2,by=function(xY,xZ,ya,yb)local
yc=ro:N(ya,yb)je=kt(xZ,yc,"HASTE"
,true,function()local yd=yc.x[kT
.bs]or 0 yc.x[kT.bs]=yd+2 kQ(xY,xZ
)end)end},


  cm={aU="Focus",bu=jp(
jT,jR,function(ye,yf,yg,yh)return
jk(yf.q.cx,kT.bC)end),bw=464,aZ
="Unit with ranged attack gets +1 range"
,y=2,by=function(yi,yj,yk,yl)local
ym=ro:N(yk,yl)je=kt(yj,ym,"FOCUS"
,true,function()ym:A(kS.bm)kQ(yi
,yj)end)end},


  cq={aU="Fury",bu=jp
(jT,jR,function(yn,yo,yp,yq)return
yo.q.cy~=null end),bw=464,aZ="Unit gets +1 attack"
,by=function(yr,ys,yt,yu)local yw
=ro:N(yt,yu)je=kt(ys,yw,"FURY",
true,function()yw:A(kS.bp)kQ(yr
,ys)end)end},



}







function kU(yx,yy,yz)
  if yz==ji.e then 
    sfx(1,45,30)
  end
  yx.onClose=yy 
  yx.cols=yz 
  local yA=0 
  for yG=1,#yx do 
    local yH=print(yx[yG],0,-20,14)//2 
    if yH>yA then 
      yA=yH 
    end 
  end 
  local yB=(#yx*7)//2 
  local yC=yA*2+10 
  local yD=(yB*2)+10 
  local yE=88-yA-5 
  local yF=60-yB 
  je=jC(function(yI,yJ,yK) rect(jo(88,yE,yJ),yF*yJ,yC*yJ,yD*yJ,yz[1]) rectb(jo(88,yE,yJ)+1,yF*yJ+1,yC*yJ-2,yD*yJ-2,yz[2]) end, 30, jx, function()jd=yx end)
end



function kW()
  for yL=1,#ro.K do 
    local yM=ro.K[yL]
    if yM.t==0 then 
      if ro:O(yM.r,yM.s)==128 then 
        return true 
      end 
    end 
  end 
  return false 
end

function kX()
  for yN=1,#ro.K do 
    local yO=ro.K[yN]
    if yO.t==1 then 
      return false 
    end
  end 
  return true 
end 


kY={cu={aU="Soldier",    aX=258,bg=6,z=7, cx={kT.bs,kT.bz},cy=jj(2,4),          x={[kT.bs]=1}},
    cz={aU="Paladin",    aX=356,bg=6,z=9, cx={kT.bs,kT.bz,kT.ce},cy=jj(3,4),G=4,x={[kT.bs]=1,[kT.ce]=1},cB=2},
    cC={aU="Elf",        aX=292,z=5,      cx={kT.bs,kT.bC},      cy=jj(1,2),G=4,                        cB=1},
    cE={aU="Farmer",     aX=298,z=3,      cx={kT.bs},                                                   cB=-1},
    cG={aU="Tree",       aX=32,           cx={}},
    cI={aU="Castle",     aX=44,           cx={}},
    cK={aU="Well",       aX=36,           cx={}},
    cM={aU="Tomb",       aX=108,cx={}},
    cO={aU="Gloomy Tree",aX=104,bg=6,cx={}},
    cQ={aU="Boulder",    aX=42,           cx={}},
    cS={aU="House",      aX=38,           cx={}},
    cU={aU="Ruins",      aX=102,          cx={}},
    cX={aU="Mage",       aX=260,z=4,      cx={kT.bs,kT.bz,kT.ce},cy=jj(1,2),G=2,x={[kT.ce]=1},cB=10},
    cZ={aU="Brute",      aX=290,z=7,      cx={kT.bs,kT.bz},cy=jj(3,5)},
    db={aU="Cyclop",     aX=358,z=15,     cx={kT.bs,kT.bz},cy=jj(3,5)},
    dd={aU="Druid",      aX=266,z=5,      cx={kT.bs,kT.bW},G=3,},
    df={aU="Ent",        aX=296,z=8,      cx={kT.bs,kT.bz},cy=jj(1,2)},
    dh={aU="King",       aX=268,z=8,bg=11,cx={kT.bs,kT.be},G=2.5,cB=2},
    dj={aU="Dwarf",      aX=302,z=8,      cx={kT.bs,kT.bz},cy=jj(2,5)},
    dl={aU="Bomber",     aX=300,z=8,      cx={kT.bs,kT.bz,kT.bO},cy=jj(2,3),G=5,cB=2},
    dn={aU="Captain",    aX=270,z=5,                       cy=jj(1,2),cx={kT.bs,kT.bC,kT.cm},G=4,cB=3},
    dq={aU="Monk",       aX=264,z=5,      cx={kT.bs,kT.bI},G=6,cB=1},
    ds={aU="Witch",      aX=262,z=4,      cx={kT.bs,kT.bC,kT.cq},G=5,x={[kT.cq]=1},cy=jj(1,2)},
    du={aU="Shaolin",    aX=294,bg=6,z=5, cx={kT.bs,kT.bz},cy=jj(2,3),x={[kT.bz]=1},cB=1},
    dx={aU="Skeleton",   aX=322,z=4,      cx={kT.bs,kT.bz},cy=jj(1,2)},
    dz={aU="Goblin",     aX=326,z=6,      cx={kT.bs,kT.bz},cy=jj(2,3)},
    dB={aU="Spider",     aX=330,z=6,      cx={kT.bs,kT.bC,kT.bj},cy=jj(1,3),G=3.5,cB=1},
    dD={aU="Snake",      aX=328,z=3,cx={kT.bs,kT.bz},cy=jj(2,3),},
    dF={aU="Slugdo",     aX=354,z=8,cx={kT.bs,kT.bz,kT.ci},cy=jj(1,2),G=3},
    dH={aU="Kobold",     aX=324,z=6,cx={kT.bs,kT.bC},cy=jj(1,2),G=4,cB=1},
    dJ={aU="Lichking",   aX=334,z=12,bg=2,cx={kT.bs,kT.bz,kT.ca},cy=jj(2,3),G=7,cB=3},
    dL={aU="Rat",        aX=332,z=3,cx={kT.bs,kT.bz},cy=jj(1,2),x={[kT.bs]=1}},
    dN={aU="Archdemon",  aX=364,z=30,cx={kT.bs,kT.bz},cy=jj(3,6),x={[kT.bs]=1,[kT.bz]=1}},
    dP={aU="Portal",     aX=386,z=50,cx={},}
}
  
  kZ={
    
     {dR=12,
      dS=17,
      dT={"#1 TUTORIAL: MOVING","","Help the Farmer reach the","other side of the map","","The yellow circles show","where you can move.","","Left click to select a unit,","Right click to choose action"},
      ec={kY.cE,1,3},
      ed={},
      L= {[-5]=function()local yP=ro:R(kY.dL,0,3,1) yP.u[kS.aT]=2 kU({"Uh uh, better hurry up!"},nil,ji.e) end},
      H=kW},

      {dR=0,
       dS=17,
       dT={"#2 TUTORIAL: ATTACK","","Phew that was close!","","The Farmer encountered a","kind Dwarf. He accepted to","protect him during the travel.","","Get rid of all the enemies.","","The red targets show","where you can attack."},
       ec={kY.cE,1,2,kY.dj,1,3,},
       ed={kY.dL,10,5,kY.dL,10,4,},
       H=kX},


      {dR=24,
       dS=17,
       dT={"#3 TUTORIAL: FREE ACTIONS","","Some units have free actions.","Free actions don't spend the","unit!","They're shown on the info box.","Here, the soldier has an","extra, free Move action!","","Note: any other action will","spend the unit, so use them","first!",},
       ec={kY.cu,1,2,kY.cu,1,3,},
       ed={kY.dD,10,3,kY.dL,10,4,},
       H=kX},

                   
      {dR=36,
       dS=17,
       dT={"#4 TUTORIAL: RANGED ATTACKS","","Some units have ranged","attack! Their range can be","seen in the info box or","drawn on the map.","","Help the elves defend from","the Skeletons!"},
       ec={kY.cC,3,5,kY.cC,2,3,},
       ed={kY.dx,10,3,kY.dx,10,4,kY.dx,9,5,kY.dx,8,6,},
       H=kX},

      {dR=48,
       dS=17,
       dT={"#5 TUTORIAL: MAGIC","","Some units can cast spells!","They can give effects or","alter the match in many","ways.","","Use your Mage ability to","withstand the assault","at the village!","","Positive spells usually","have green circle target."},
       ec={kY.cX,5,4,kY.cu,5,5,kY.cu,4,4,kY.cu,6,4,kY.cu,5,3,},
       ed={kY.dx,1,0,kY.dx,1,1,kY.dx,3,0,kY.dL,0,1,kY.dL,10,7,kY.dL,9,7,kY.dx,10,0,kY.dL,10,1,kY.dL,2,7,kY.dL,1,6,kY.dL,3,7,},
       H=kX},


      {dR=60,
       dS=17,
       dT={"#6 TUTORIAL: COOLDOWN","","Some abilities require","some rest before being","used again. You can","check it on the info","box.","","A Druid alone doesn't","look like much, but...",},
       ec={kY.dd,1,4,},
       ed={kY.dx,10,2,kY.dx,10,3,kY.dx,9,4,kY.dL,10,4,},
       H=kX},



      {dR=72,
       dS=17,
       dT={"#7 SKELETON'S ATTACK!","","It's a pleasant morning","when, unexpectedly, some","Skeletons attack the","village! We have some","archers but they're not","many.","","Try to keep skeletons busy","while the elves shoot them!",},
       ec={kY.dd,1,3,kY.cu,0,4,kY.cC,1,5,kY.cC,1,2,},
       ed={kY.dx,10,6,kY.dx,10,5,kY.dx,10,4,kY.dx,10,3,kY.dx,10,2,kY.dx,9,6,kY.dx,8,4,kY.dx,8,5,kY.dx,8,3,kY.dx,9,2,},
       L={[-2]=function()kU({"\"Why are they attacking?","","We never had much skeleton","problems around here. I","wonder why they're showing","up now..\""},nil,ji.e)end},
       H=kX},


      {dR=84,
       dS=17,
       dT={"#8 EVEN MORE SKELETONS!","","They have some kobolds too!","Keep the mage out of their","range!"},
       ec={kY.cX,0,3,kY.cu,1,3,kY.cu,1,4,kY.cC,1,6,kY.cC,1,2,kY.cC,2,7,},
       ed={kY.dx,10,4,kY.dH,10,3,kY.dx,9,4,kY.dx,10,5,kY.dx,10,2,kY.dx,9,2,kY.dx,10,6,kY.dx,9,3,kY.dH,9,5,},
       H=kX},


     {dR=96,
      dS=17,
      dT={"#9 THE RUN","","The skeleton attacks are","intensifying. We need to","investigate and find cause!","","The road out of the village","is dangerous. Luckly,","one of the Slug people","accepted to aid us","with the run!"},
      ec={kY.cC,1,0,kY.dn,0,0,kY.cX,1,3,kY.cu,8,7,kY.dF,0,1,kY.cu,7,7,},
      ed={kY.dB,10,3,kY.dH,7,0,kY.dH,8,0,kY.dD,6,3,kY.dD,7,3,kY.dD,6,4,kY.dD,5,1,kY.dx,1,7,kY.dL,2,7,kY.dx,0,7,kY.dx,1,6,kY.dD,0,6,kY.dL,1,5,kY.dL,0,5,},
      H=kW},


     {dR=108,
      dS=17,
      dT={"#10 THE LICHKING","","Here's the source of all","those skeletons! A Lichking","has arrived to the village!","","Be quick to take it down as","he can summon more skeletons!"},
      ec={kY.cC,1,3,kY.dn,0,4,kY.cu,1,4,kY.dF,0,3,kY.cu,0,5,},
      ed={kY.dJ,9,4,kY.dx,9,3,kY.dx,9,5,},
      H=kX},



    {dR=120,
     dS=17,
     dT={"#11 BRUTE ENCOUNTER","","On the way back to the","village, the fellowship has","to cross a mountain pass.","","Brutes inhabit the area,","Be careful as they're pretty","tough!","","A solitary monk living there","can provide some help!"},
     ec={kY.cC,1,3,kY.dn,0,4,kY.dq,1,1,kY.cu,1,4,kY.cu,0,5,},
     ed={kY.cZ,8,4,kY.cZ,9,3,kY.cZ,10,5,kY.cZ,10,4,},
     H=kX},



   {dR=132,
    dS=17,
    dT={"#12 UH OH!","","A couple of Kobolds ambushed","your team! And some other","thugs are joining the party!","","This is a tough one, plan","carefully and exploit the","wizard!"},
    ec={kY.cX,1,3,kY.dF,0,4,kY.dq,0,3,kY.cu,1,4,kY.cu,0,5,},
    ed={kY.dH,8,4,kY.dH,8,3,kY.dz,10,5,kY.dz,10,4,kY.cZ,10,1,kY.cZ,7,7,},
    H=kX},


   {dR=144,
    dS=17,
    dT={"#13 DWARF RESQUE","","A dwarf has been attacked","by a bunch of Kobolds!","","Perhaps if we resque him","he may help us later.","","Try to save him in the first","turns as he's indispensable","to defeat all those enemies!"},
    ec={kY.cX,1,2,kY.dF,2,2,kY.cu,1,3,kY.cu,0,4,kY.dj,7,4,},
    ed={kY.dH,8,4,kY.dH,7,3,kY.dH,7,5,kY.dH,10,5,kY.dz,10,4,},
    H=kX},


     {dR=156,
      dS=17,
      dT={"#14 DWARFS VS BRUTES","","Take advantage of the","bottleneck to show them","brutes who's the boss","of the mountains!","","Also, BOMBS!"},
      ec={kY.cC,2,2,kY.dn,1,2,kY.dj,2,3,kY.dl,1,4,},
      ed={kY.dH,6,4,kY.cZ,8,4,kY.cZ,8,3,kY.cZ,8,5,kY.cZ,6,5,kY.cZ,10,3,kY.dz,10,4,},
      H=kX},


     {dR=168,
      dS=17,
      dT={"#15 UNDER ATTACK","","The tables have turned:","now WE are under attack","from ranged enemies!","","No subtleties here, just","rush onto them!"},
      ec={kY.dj,1,2,kY.dj,1,3,kY.dF,2,2,kY.dj,1,4,},
      ed={kY.dH,9,4,kY.dH,8,4,kY.dH,9,3,},
      H=kX},


     {dR=180,
      dS=17,
      dT={"#16 BACK AT THE VILLAGE","","Oh no! The village has been","Overrun by the forces of evil!",},
      ec={kY.cu,2,2,kY.cu,2,3,kY.dF,3,2,kY.cC,0,3,kY.dn,0,4,kY.dj,2,4,kY.dl,1,4,kY.cX,1,3,kY.dd,1,2,},
      ed={kY.dx,9,5,kY.dx,8,5,kY.dH,9,3,kY.dH,10,2,kY.dJ,10,3,kY.dJ,10,4,kY.dz,10,5,kY.dH,10,6,},
      H=kX},


     {dR=192,
      dS=17,
      dT={"#17 SEARCHING FOR HELP","","The village destroyed, you","have to rally some forces..","You try and head for a","nearby monastry, where a","different kind of monks","dwells. The fighting kind!","","Beat them to earn their","respect and loyalty!"},
      ec={kY.cu,2,2,kY.dj,2,4,kY.dq,1,4,kY.cX,1,3,},ed={kY.du,7,4,kY.du,8,3,kY.du,9,5,kY.du,8,5,},
      H=kX},


     {
      dR=204,
      dS=17,
      dT={"#18 SURROUNDED BY BRUTES","","Wow, those kids were fast","as lighting! Good that we","won their respect!","","Looks like some brutes are","trying to surround us.","Teach em a lesson."},
      ec={kY.cu,4,2,kY.du,5,4,kY.du,6,4,kY.cX,5,3,kY.dq,5,5},
      ed={kY.cZ,4,0,kY.cZ,9,3,kY.cZ,8,4,kY.cZ,9,5,kY.cZ,8,6,kY.cZ,0,5,kY.cZ,0,6,},
      H=kX},


    {
     dR=216,
     dS=17,
     dT={"#19 CYCLOPS","","Uh oh, looks who's there..","Those guys are pretty","big and strong.","","Luckly the Shaolin are","fast enought to sting and","back off."},
     ec={kY.cu,4,2,kY.du,5,4,kY.du,6,4,kY.cX,5,3,},
     ed={kY.db,9,3,kY.db,8,4,kY.dD,8,6,kY.dD,0,5,kY.dD,0,6,},
     H=kX},

    {dR=228,
     dS=17,
     dT={"#20 CALL IN THE PALADIN","","We arrived at the remote","retire of a powerfull paladin.","","If we can get past all those","monsters, and if we can find","him maybe we can hire him!"},
     ec={kY.cu,1,3,kY.du,1,4,kY.dF,0,4,kY.dl,0,3,kY.cC,0,2,kY.cX,0,5,kY.dq,1,6,},
     ed={kY.db,9,3,kY.db,8,4,kY.dD,9,6,kY.db,10,6,kY.dL,7,1,kY.dL,8,1,kY.dL,8,2,kY.dL,9,5,kY.dL,10,3,kY.dB,8,3,kY.dH,9,4,},
     H=kW},



    {dR=0,
    dS=26,
    dT={"#21 TO THE KING","","With the paladin on our side","we'll be able to get the King","attention and involvement!","","It looks like the castle is","sieged too!"},
    ec={kY.cu,1,3,kY.cz,1,4,kY.cu,1,5,kY.dj,0,4,kY.cC,1,6,},
    ed={kY.dz,9,3,kY.dz,8,4,kY.dH,8,2,kY.dH,10,3,kY.dL,7,1,kY.dL,8,1,kY.dD,5,7,kY.dD,4,7,},
    H=kX},



    {dR=12,dS=26,dT={"#22 COUNTERATTACK!","","The king agreed to meet us","and decided it's time to","fight the monsters back","and free the reign once","again!","","We must find where they","come from!"},
     ec={kY.dh,1,3,kY.cz,1,4,kY.cu,1,5,kY.cu,0,5,kY.cu,0,6,kY.dq,0,3,},ed={kY.db,9,3,kY.cZ,8,4,kY.db,8,2,kY.cZ,10,3,kY.cZ,9,4,},
     L={[-2]=function()kU({"","\"Wow, having the king","on the battlefield","gives a huge morale","boost to our troops!","","We are unstoppable!\"",""},nil,ji.e)end},
     H=kX},



    {dR=24,
     dS=26,
     dT={"#23 THE WITCH","",},
     ec={kY.dh,1,3,kY.cz,1,2,kY.cu,0,2,kY.dq,0,3,},
     ed={kY.dH,6,1,kY.dH,7,1,kY.dH,2,7,kY.dH,3,7,kY.dH,5,7,kY.cZ,8,4,kY.cZ,9,5,kY.dL,8,3,kY.dL,9,3,kY.dD,6,3,kY.dD,6,4,},
     H=kW},



    {dR=36,
     dS=26,
     dT={"#24 WITCHY WITCH","","The witch joins the battle.","Sure she'll be useful, but","you're not sure you like her.","","She need to reach a magical","well where she can perform a","divination and locate the","monsters source.","","We're kind of surrounded here,","Power up those elves and","resist the assault!"},
     ec={kY.dh,0,0,kY.cC,1,0,kY.cu,1,2,kY.cC,0,2,kY.dn,1,1,kY.ds,0,1,},
     ed={kY.cZ,8,4,kY.cZ,9,5,kY.cZ,10,5,kY.cZ,6,2,kY.dL,8,3,kY.dL,7,7,kY.db,9,3,kY.dz,7,3,kY.dz,5,6,kY.dD,7,4,},
     H=kX},



    {dR=48,
     dS=26,
     dT={"#25 THE MAGICAL WELL","","We reached the well, move","the witch nearby to perform","the ritual!","","Looks like the forces of","Evil got wind of our plans","becouse monsters are","literally pouring in!"},
     ec={kY.dh,0,0,kY.cC,0,3,kY.cu,1,2,kY.cC,0,2,kY.dn,1,1,kY.ds,0,1,},
     ed={kY.cZ,8,7},
     hN=function() local yS=ro:S(kY.dx,10,5,1)if yS then yS.u[kS.aT]=1 end local yS=ro:S(kY.dx,4,7,1) if yS then yS.u[kS.aT]=1 end local yS=ro:S(kY.dx,5,0,1)if yS then yS.u[kS.aT]=1 end end,
     L={[jr(7,4)]=function()local yT=ro:N(7,4)if yT.q==kY.ds then kU({"ABRA CADABRA!","The witch performs a dark","divination ritual!","She observe a portal","not too far away,","from where the monsters","are coming...","","We must close it!","","The energy blast from","the ritual kills all","enemies!"},kN,ji.e) else kU({"ARGH!!","\"Only a witch can withstand","the power of the magic well!","the unit dies in a huge","explosion taking everybody","with him!"},kO,ji.e)end end},
     H=function()return false;end},



    {dR=60,
     dS=26,
     dT={"#26 THE PORTAL","","This is it, the final battle!","","The portal is here, and it has","just spit out the strongest","of all enemies, the Archdemon!","","We must kill all monsters and","destroy the portal! While it is","open, more skeletons will","enter!","","Good luck, for our freedom!"},
     ec={kY.dh,0,0,kY.cC,0,3,kY.cu,1,2,kY.cC,0,2,kY.dn,1,1,kY.ds,0,1,kY.cz,0,4,kY.dl,0,5,kY.dF,2,0,kY.dj,1,0,kY.cX,1,4,kY.dd,1,3,},
     ed={kY.dN,10,7,kY.dJ,10,6,kY.db,9,7,kY.dH,8,6,kY.dH,9,5,kY.cZ,6,4,kY.cZ,5,5,kY.dz,9,3,kY.dP,9,6},
     hN=function()
           if ro:W(kY.dP)>0 then 
             if ro:W(kY.dx)<10 then 
              local yX=ro:S(kY.dx,10,5,1)
                 if yX then 
                  yX.u[kS.aT]=1 
                 end 
                 local yX=ro:S(kY.dx,4,7,1)
                 if yX then 
                  yX.u[kS.aT]=1 
                 end
                 local yX=ro:S(kY.dx,5,0,1)
                 if yX then
                  yX.u[kS.aT]=1 
                 end 
            end 
          end 
        end,
    H=kX},


    {dR=72,
     dS=26,
     dT={"#27 VICTORY!","","The portal has been closed!","We WON the war against the","evil forces!","","Once the dust settled, the","celebrations concluded, ","peace finally return to the","lands."},
     ec={kY.dh,0,0,kY.cE,5,6,kY.cE,6,4,kY.cE,7,2,kY.cu,0,2,kY.cu,1,2,},
     ed={},
     hN=function()
          if not ro.msgdone then 
            ro.msgdone=true 
            kU({"The Game is Over","This is a game over screen.","You defeated the evil portal","","You can move around the","farmers but they're just","there to signify peace. There","are no more monsters to kill.","","If you liked this game, please","leave a thumbs up on the tic80","website. Thanks :)"},function() kU({"A game by MSX","Reach me on TIC80 discord or","at msx80 @ twitter","","Graphics by: "," Stavros (eliacoan @ twitter)","","Music and sfx by:"," Fubuki"},nil,ji.e)end,ji.e)
          end 
        end,
      H=function()return false end}
}

la=jF()music(3)

-- <TILES>
-- 000:bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
-- 001:dddddddddd88dd8888dd88dddddddddddddddddddd88dd8888dd88dddddddddd
-- 002:7eeeeee7ee77eeeeeeeeeeeeeeeeeeeeeee77eeeeeeeee77eeeeeeeeeeeeeeee
-- 003:1444444441444444441444444441444444441441444444144444414444441444
-- 004:333333333aaa3aaa33333333a3aaa3aa33333333aaa3aaa333333333aa3aaa3a
-- 005:fffffffffddfffffdffdfffffffffffffffffffffffffddfffffdffdffffffff
-- 006:7777777777377777737377777777777777777777777773777777373777777777
-- 016:bbbbbbbbbbbbbbbb5b5bbbbbb5bbbbbbbbbbbbbbbbbbbbbbbbbb5b5bbbbbb5bb
-- 017:dddddddddd88dd8d88dd88dddddddddddddddddddd88dd8dd8dd88dddddddddd
-- 018:7eeeeee7eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee7eeeeeeeeeeeeeeeee
-- 019:1444444441444444441444444441444444441441444444144444414444441444
-- 020:333333333aaa3aaa33333333a3aaa3aa33333333aaa3aaa333333333aa3aaa3a
-- 021:fffffffffddfffffdffdfffffffffffffffffffffffffddfffffdffdffffffff
-- 022:7777777777377777737377777777777777777777777773777777373777777777
-- 032:eeee0000eee0055bee0055bbee0555bbe0055bbbe0555bbbe0555bbbe05555bb
-- 033:0000eeeebbb00eeebbbb00eebbbbb0eebbbbb00ebbbbbb0ebbbbbb0ebbbb550e
-- 034:eeeee000eeeee05beeee005beeee055beee005bbeee055bbeee055bbeee055bb
-- 035:000eeeeebb0eeeeebb00eeeebbb0eeeebbb00eeebbbb0eeebbbb0eeebbbb0eee
-- 036:eeeeeeeeeeeeeeeeeeeeeeeeeeee0000eee00333ee003aaaee03a888ee033888
-- 037:eeeeeeeeeeeeeeeeeeeeeeee0000eeee33300eeeaaa300ee888a30ee888330ee
-- 038:eeeeeeeeeeeeeeeeeeee0000eee00141ee001414e00144410014444401444444
-- 039:eeeeeeeeeeeeeeee0000eeee41400eee141400ee4141400e1414140041414140
-- 040:bbbbbbbbbbbbbbbbbbbbb000bbbbb040b0000045b0bb0040b055b040b0005544
-- 041:bbbbbbbbbbbbbbbb000bbbbbbb0bbbbb550bbbbb000bbbbb0bbbbbbb0b000bbb
-- 042:eeeeeeeeeeeeeee0eeeeee00eeeee007eeee0037eeee0337eeee0337eee00377
-- 043:eeeeeeee0000eeee77700eee77770eee77770eee777700ee777770ee777770ee
-- 044:eeeeee00eeeeee06000000040777003303370077077700770777777700777777
-- 045:0000eeee6660eeee400000007700777077007730770077707777733077777700
-- 048:e0055555ee005555eee00055eeeee044eeee0044ee000444ee044444ee000000
-- 049:bbb5500e555500ee55000eee440eeeee4400eeee444000ee444440ee000000ee
-- 050:eee055bbee0055bbee05555bee000555eeee0004eeeeee04eeeeee04eeeeee00
-- 051:bbbb0eeebbbb00eebb5550ee555000ee4000eeee40eeeeee40eeeeee00eeeeee
-- 052:ee03a333ee03aa3aee033a3aee03a333ee03aaaaee003aaaeee00333eeee0000
-- 053:333a30eeaaaa30eeaaa330ee333a30eea3aa30eea3a300ee33300eee0000eeee
-- 054:00444444e0411114e0411114e0411114e0411114e0411114e0000000eeeeeeee
-- 055:444444004111140e4188140e4111140e4444440e4444440e0000000eeeeeeeee
-- 056:bbb00004bbbbbb04bbbbbb04bbbbbb04bbbbbb04bbbbbb04bbbbbb04bbbbbb00
-- 057:00040bbb04440bbb44000bbb400bbbbb40bbbbbb40bbbbbb40bbbbbb00bbbbbb
-- 058:eee03377ee003377ee033377e0033337e0333333e0033333ee000033eeeee000
-- 059:777770ee777770ee777770ee7777700e7777330e3333330e3333000e00000eee
-- 060:e0033777ee077777ee077337ee077774ee077744ee037744ee077744ee000000
-- 061:7337700e777770ee777330ee477770ee447770ee447770ee447330ee000000ee
-- 064:eeee0000eee00fffee00ffffee0fffffe00fffffe0ffffffe0ffffffe0ffffff
-- 065:0000eeeefff00eeeffff00eefffff0eeffffa00effaaaa0effaafa0effaa330e
-- 066:eeeee000eeeee0ffeeee00ffeeee0fffeee00fffeee0ffffeee0ffffeee0ffff
-- 067:000eeeeeff0eeeeeff00eeeefff0eeeefff00eeeffff0eeeffff0eeeffff0eee
-- 068:eeeeeeeeeeeeeeeeeeeeeeeeeeee0000eee00333ee003aaaee03aff8ee033f8f
-- 069:eeeeeeeeeeeeeeeeeeeeeeee0000eeee33300eeeaaa300eeff8a30eef8f330ee
-- 070:eeeeeeeeeeeeeeeeeeee0000eee00fffee00f4ffe00f444f00f444440f444444
-- 071:eeeeeeeeeeeeeeee0000eeeefff00eeeffff00eefffff00ef4ffff004141fff0
-- 072:eeeeeeeeeeeeeeeeeeeee000eeeee0f0eeeee0f0eeeee0f0eeeee0f0eeeee0ff
-- 073:eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0eeeeeee0e000eee
-- 074:eeeeeeeeeeeeeee0eeeeee00eeeee00feeee00ffeeee0fffeeee03ffeee00377
-- 075:eeeeeeee0000eeeefff00eeeffff0eeeffff0eeef7ff00ee777ff0ee777770ee
-- 080:e00ff3ffee003333eee00033eeeee077eeee0077ee000777ee077777ee000000
-- 081:faa3300e333300ee33000eee770eeeee7700eeee777000ee777770ee000000ee
-- 082:eee0fffaee00ffaaee0fff3aee000333eeee0007eeeeee07eeeeee07eeeeee00
-- 083:affa0eeeaaaa00eeaa3330ee333000ee7000eeee70eeeeee70eeeeee00eeeeee
-- 084:ee03a333ee03aa3aee033a3aee03a333ee03aaaaee003aaaeee00333eeee0000
-- 085:333a30eeaaaa30eeaaa330ee333a30eea3aa30eea3a300ee33300eee0000eeee
-- 086:004ffff4e0411114e0411114e0411114e0411114e0411114e0000000eeeeeeee
-- 087:444444004111140e4199140e4111140e4444440e4444440e0000000eeeeeeeee
-- 088:eeeee00feeeeee0feeeeee0feeeeee0feeeeee07eeeeee07eeeeee07eeeeee00
-- 089:000f0eee0fff0eeeff000eee700eeeee70eeeeee70eeeeee70eeeeee00eeeeee
-- 090:eee03377ee00fff7ee0fffffe00f33ffe0333333e0033333ee000033eeeee000
-- 091:777770ee777770ee777770ee7777700e7777330e3333330e3333000e00000eee
-- 096:666600006660099e660099ee660999ee60099eee60999eee60999eee609999ee
-- 097:00006666eee00666eeee0066eeeee066eeeee006eeeeee06eeeeee06eeee9906
-- 098:666660006666609e6666009e6666099e666009ee666099ee666099ee666099ee
-- 099:00066666ee066666ee006666eee06666eee00666eeee0666eeee0666eeee0666
-- 100:666666666666666666666666666600006660033366003aaa6603a77766033777
-- 101:6666666666666666666666660000666633300666aaa30066777a306677733066
-- 102:eeeeeeeeeeeeeeeeeeee0000eee00730ee003470e00344470014444401444444
-- 103:eeeeeeeeeeeeeeeeee00eeeeee000eee0e0400ee0e03400e0003340043433340
-- 104:666666666666666666666000666660406666604966000049600ee04060eee944
-- 105:66666666666666666666666600666666e00666669e0666660006666606000666
-- 106:eeeeeeeeeeeeeee0eeeeee00eeeee009eeee0099eeee0999eeee0199eee00149
-- 107:eeeeeeee0000eeee99900eee99990eee94990eee449400ee449440ee449940ee
-- 108:eeeeeeeeeeeeee00eeeee007eeee0077ee000377ee077777ee077777ee000377
-- 109:eeeeeeee0eeeeeee00eeeeee700eeeee73000eee77770eee77770eee73000eee
-- 112:6009999966009999666000996666604466660044660004446604444466000000
-- 113:eee9900699990066990006664406666644006666444000664444406600000066
-- 114:666099ee660099ee6609999e6600099966660004666666046666660466666600
-- 115:eeee0666eeee0066ee9990669990006640006666406666664066666600666666
-- 116:6603a3336603aa3a66033a3a6603a3336603aaaa66003aaa6660033366660000
-- 117:333a3066aaaa3066aaa33066333a3066a3aa3066a3a300663330066600006666
-- 118:00444744e0411714e0044744ee047444ee017117ee047447e0000000eeeeeeee
-- 119:444443004111140e3133170e3111170e3344470e7334740e0000000eeeeeeeee
-- 120:6009900466000004666666046666660466666604666666046666660466666600
-- 121:0004066604440666440006664006666640666666406666664066666600666666
-- 122:eee01199ee001194ee011144e0011114e0111111e0011111ee000011eeeee000
-- 123:444940ee444440ee444440ee4444400e4444110e1111110e1111000e00000eee
-- 124:eeee0057eeeee057eeeee077eeeee077ee000077ee044444ee004444eee00000
-- 125:700eeeee70eeeeee70eeeeee50eeeeee5000eeee44440eee444440ee000000ee
-- 128:bbbbbbbbb666bbbbb6bbbbbbb6bbbbbbbbbbbbbbbbbbbbb6bbbbbbb6bbbbb666
-- 129:bbbbbbbbbbbb666bbbbbbb6bbbbbbb6bbbbbbbbb6bbbbbbb6bbbbbbb666bbbbb
-- 144:bbbbb666bbbbbbb6bbbbbbb6bbbbbbbbb6bbbbbbb6bbbbbbb666bbbbbbbbbbbb
-- 145:666bbbbb6bbbbbbb6bbbbbbbbbbbbbbbbbbbbb6bbbbbbb6bbbbb666bbbbbbbbb
-- 224:bbbbbbbbbbb7ebbbbbeeeeeebbbeeeeebebb7eeebeeeee77bbeeeeeebbeeeeee
-- 225:bbbbbbbbbe7bbbebeeeebeeeeeeeeeeeeee77eeeeeeeee77eeeeeeeeeeeeeeee
-- 226:bbbbbbbbebbbebbbeebeeebbebbeeebbeee77bbbeeeeeebbeeeeeeebeeeeeeeb
-- 227:beeeeee7be77eeeebbeeeeeebbbeeeeebbbb7eeebbebee77beeeeeeebbeeeeee
-- 228:7eeeeeebee77eebbeeeebebbeeeebbbbeee77ebbeeeeee7beeeeeeebeeeeeebb
-- 229:beeeeee7beb7eeeebbbeeeeebbeeeeeebee77eeebeeeeb77bbebbbeebbbbbbbb
-- 230:7eeeeee7ee77eeeeeeeeeeeeeebbeeeeeeeb7eeeeeebbe77eebbbeeebbbbbbbb
-- 231:7eeeeeebee77eebbeeeeeebbeeeeeeebeee77ebbeeebee7bebbbbebbbbbbbbbb
-- 232:7eeeeee7ee77eeeeeeeeeeeeeeeeeebbeee77eebeeeebe7beeeebbbbeeeeeebb
-- 233:7eeeeee7ee77eeeeeeeeeeeeeeeeeeeeeee77eeebeeebe77bbbbbeeebbeeeeee
-- 234:7eeeeebbee77ebbbeeeebbeeeeeebeeeeee77eeeeeeeee77eeeeeeeeeeeeeeee
-- 235:bbeeeee7bbbbeeeeebebeeeeebeeeeeeeee77eeeeeeeee77eeeeeeeeeeeeeeee
-- 240:bbbbbbbbbb88dbb8b8dd88ddbdddddddbbddddddbb88dd88bbbd88ddbdbddddd
-- 241:bbbbbbbbdbb8bbb888dd8bdddddddddddddddddddd88dd8888dd88dddddddddd
-- 242:bbbbbbbbdbbbddbb88dbb8dbddddbddbddddddbbdd88dbbb88dd8bdbdddddddb
-- 243:bdddddddbd88dd88b8dd88ddbbdbddddbbbbddddbb88dd88b8dd88ddbddddddd
-- 244:dddddddbdd88dd8b88dd88bbddddddbbdddddbbbdd88dd8b88dd88dbdddddddb
-- 245:bdddddddbb88dd88bbbd88ddbdbdddddbdddddddbd88dbb8bbddbbddbbbbbbbb
-- 246:dddddddddd88dd8888dd88ddddddddddddddbbdddd88db8888bbbbbdbbbbbbbb
-- 247:dddddddbdd88dd8b88dd88bbdddddbbbdddddddbddb8dd8b8bbd88bbbbbbbbbb
-- 248:dddddddddd88dd8888dd88dddddddddddddddbbddd88ddbb88dd88bbdddddbbb
-- 249:dddddddddd88dd8888dd88ddddddddddddddddddbd88dd88bbbb88ddbbbddddd
-- 250:ddddddbbdd88ddbb88dd8bbddddddbdddddddddddd88dd8888dd88dddddddddd
-- 251:bbddddddbbb8dd88b8bb88dddddbdddddddddddddd88dd8888dd88dddddddddd
-- </TILES>

-- <SPRITES>
-- 000:0000000000000000000110000016610000166100000110000000000000000000
-- 001:00000000000ee00000e55e000e5bb5e00e5bb5e000e55e00000ee00000000000
-- 002:666666666666600066660077666607cc6660007766007222660202226002e222
-- 003:6666666606666666006666667066666600000000270111102022c11020011110
-- 004:eeeee000eeee0011eee00111eee0111ceee0111ceee00111ee006111ee011161
-- 005:0eee000e00ee060010ee0060c0e00600c0e0660e1000460e1600400e1111c0ee
-- 006:eeeee000e000001100110111011161cc000001cceee011ccee0061ccee0c666c
-- 007:0eeeeeee00e000ee10e0d00ec000dd0ec00ddd0e000dd00ec60080ee66ccc0ee
-- 008:eeeee000eeee00cceeee03cceeee03cceeee033ceee00433ee004443e0044444
-- 009:0eeeeeee00eeeeeec0eeeeeec0eeeeee30eeeeee300eeeee3400eeee44400eee
-- 010:eeeeeeeeeeeee000eeeee0cceeeee0cceeeee0aceeee00aaeee0011aee001111
-- 011:eeee000e00e00400c0e0bbb0c000bbb0ca00cbb0aa011000aa1100eeaa100eee
-- 012:bbbb0000bbbb0e0ebbbb0eeebbbb07ccbbb00f77bb006f97bb096ff9b09966f9
-- 013:000bbbbb0e0bbbbbee0bbbbbc70bb0007f00b0607f6000e0ff699cc0f66999c0
-- 014:e0000000e0666bb0e060bbbbe0000bcceee00bbbee00bc47ee0bbbb7ee00bb4b
-- 015:e000eeee00400eee070400ee7000400e70004700444477700bbbc7007000400e
-- 016:eeeeeeeeeeeeeeeeee0000eee099990eee0090eeee090eeee099990eee0000ee
-- 017:eeeeeeeeeeeeeeeeee0ee0eee0b00b0eee0bb0eeee0bb0eee0b00b0eee0ee0ee
-- 018:60ece7776000e444666002226666020066660706666602066666070666660006
-- 019:7701111040001100200000060206666607066666020666660770666600006666
-- 020:ee011111ee011111ee00c111000111110111111100111111e0001111eee00000
-- 021:611040ee110040ee110040ee110040ee110040ee110040ee100040ee00e000ee
-- 022:ee0c6666ee0c6666ee00c166ee006611e0066666e0666660e0000cc0eeee0000
-- 023:660080ee600080ee10e080ee0ee080ee0ee080ee0ee080eeeee080eeeee000ee
-- 024:e0444444e0404444e0c09999e0004444eee04444eee0c000eee03300eee00000
-- 025:444400ee4404c0ee9000a0ee40e0a0ee40e0a0eec000a0ee3300a0ee000000ee
-- 026:ee011111ee011111ee001c11eee00111eeee0111eeee0111eeee01c1eeee0000
-- 027:1a00eeee1aa0eeee10a0eeee1aa0eeee1a00eeee100eeeee1c0eeeee000eeeee
-- 028:b09c66f7b00666f1bb06f6fab00666fab0f666a6b0666aa6b0007700bbb0000b
-- 029:f6f000e0f660b000f660bbbba6f00bbba6660bbbaa660bbb07700bbb0000bbbb
-- 030:eee044bbeee0bbbbeee0b00beee00b00ee00b00bee060060ee066066ee000000
-- 031:700040ee070400ee00400eeeb000eeee00eeeeee0eeeeeee0eeeeeee0eeeeeee
-- 032:eeeeeeeeeeeeeeeeeeeeeeeeeee00eeeee0ff0eee0f00f0eee0ff0eeeee00eee
-- 033:eeeeeeeeeeeeeeeeeeeeeeeeee0000eee0dddd0ee0d00d0ee0dddd0eee0000ee
-- 034:eeeeee00eeeee00ceeeee04ceeee0044eee00cc4ee00ccccee0cccccee0c0ccc
-- 035:00ee000ec0ee040ec0ee040e400e040e4c00040eccc0040eccccc40ecc00040e
-- 036:eeeee000eeee00bbeeee0bbbeeee00bceeee00bbeee00bc4eee0bbbbeee00bb4
-- 037:0e000eee000400eeb070400ec700040eb700040e7444470e70bbbc0eb700040e
-- 038:666666006666660c6666660c6000000c60cecccc60000ccc666600c966666009
-- 039:00666666c0666666c066666600000006c9ccec0699c000069c0066669c066666
-- 040:eeee0000eeee0b00eeee00bbeeeee00beeeeee0bee00000bee044b40ee00b4b4
-- 041:000000eebbb0b0ee444bb0ee545bb0ee444b0000bbbb0040bbb4b400bbbb4b00
-- 042:eeee0000eeee0cc0eeee0cc0eee00c00ee007c70ee0c777ce00c7770e0c07770
-- 043:0000000e0a0a0a0e0a0a0a0e0a0a0a0e0aaaaa0e0004000ecccc0eee00040eee
-- 044:eeeeeeeeeeee0000eee00404ee004444ee0444ccee004ccce00444cc00954444
-- 045:eeeeeeee0eeeeeee00ee000e4000040e4400400ec403330e4403330e44c3330e
-- 046:eeeeeeeeeeee0000eee00909ee009999ee0999ccee009ccce00999cc00b59999
-- 047:eeeeeeee0eeeeeee00eeeeee900eeeee990eeeeec90eeeee9900eeee99b00eee
-- 048:0000044e0000400e000770000077330007733330077333300073330000033000
-- 050:ee0c0cccee000444eeee0666eeee0770eeee0660eeee0400eeee040eeeee000e
-- 051:cc0e000e440eeeee660eeeee670eeeee660eeeee0400eeee0440eeee0000eeee
-- 052:eeee044beeee0bbbeeee0b00eeee00b0eee00b00eee04004eee04404eee00000
-- 053:b700040eb070400eb00400ee0b000eeeb00eeeee00eeeeee40eeeeee00eeeeee
-- 054:6666660966666004666660996666609966666090666660906666604066666000
-- 055:9400666644900666999906660099066600400666600066666666666666666666
-- 056:e004b0bbe044004be0000044eeeee0b4eeee00bbeeee04b4eeee0444eeee0000
-- 057:44bb04b04b400040b44b0000bbb400ee404b40ee000440ee0e0440ee0e0000ee
-- 058:e0c04440e0009990eee09090eee09090eee090c0eee0c0c0eee0c0c0eee00000
-- 059:ee040eeeee040eeeee040eeeee040eeeee040eeeee040eeeee040eeeee000eee
-- 060:099554540c9555550cc9555500059991e0055555e0333505e0333000e00000e0
-- 061:49cc000e45900eee5900eeee950eeeee5500eeee33300eee33330eee00000eee
-- 062:0bb559590cb555550ccb55550005bbb9e0055555e0333505e0333000e00000e0
-- 063:9bbb0eee95bb00005bc44440b5000aa05500aaa033300aa03333000000000eee
-- 064:66666666666666666606606660e00e0660eeee0660eeee06660ee06666600666
-- 065:eeeeeeeeeeeeeeeeeeeeeeeeee0ee0eee060060ee066660ee066660eee0000ee
-- 066:eeeeeeeeeeeeeee0eeeeee00eeeeee0feeeeee0feeee0000eee00f0fee00ff00
-- 067:eeeeeeee0000eeeefff00eeeffff0eeef6f60eeeffff0eee0ff00eee000f0eee
-- 068:eeee0000eeee0444eeee0044eeee0044eee00444ee044444e0444444e0440444
-- 069:00eeeeee4000eeee6440eeee4440eeeef4f0eeee44400eee4444000e44044a0e
-- 070:eee00000eee0bb00eee00bbbeeee0bb6eeee00bbeee0099bee009999e0090999
-- 071:00eeeeeeb0eeeeeeb0eeeeeeb00eeeeebb00000eb333030e9933330e9933330e
-- 072:eeeeeeeeeeeee000eee00055ee005555ee055555ee00555beee0055beeee0055
-- 073:eeeeeeee0000eeee55500eee55650eee55550eee00f50eee00000eeeb000eeee
-- 074:eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000e00007770033777703007777
-- 075:eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000eeeee770000ee777330ee7777000e
-- 076:eeeeeeeeeeeeeeeeeeeeeee0eeeeeee0eeeeeee0eeeee000eeee00aae0000aaa
-- 077:eeeeeeeeeeeeeeee000000eeaa0aa0eeac0ac0eeacaac0eeaaaaa0eeaa6a600e
-- 078:22222000222220e0222220ee2222200f2222220f222200002220066f2200ff00
-- 079:00002222e0e02222eee00222ffff0222f6f60222ffff02220ff00222000f0222
-- 082:ee0f00ffee0f0f00ee0000ffeee0ffffee00f000ee0f00e0ee0ff0e0ee0000e0
-- 083:0ff000ee0000f0ee0f0000eef00eeeeef0eeeeeef00eeeeeff0eeeee000eeeee
-- 084:e0a00444000033430444333300043333ee003300eee0400eeee0a0eeeee000ee
-- 085:4400a00e430000ee3300eeee3330eeee0330eeee0040eeeee0a0eeeee000eeee
-- 086:e09009990090099904b33339000333aaee00a000ee0a00eeee0b0eeeee000eee
-- 087:9933330e909b330e9030300ea00000ee0a0eeeee0a0eeeee0b0eeeee000eeeee
-- 088:eeeee005eeeeee0000000eee0777000e00055500ee005555eee00555eeee0000
-- 089:55500eee055500ee0055b0eee005b0ee0055b0ee555b00ee55b00eee0000eeee
-- 090:00033776e0300373e0300373e0303377e0303007e0003000ee00030eeeee000e
-- 091:336733003333003063630030337330307770303000003000ee0300eeee000eee
-- 092:00c00aaa0c00aaaa0c0aaaac0c0aaaaa0c0aaaaa0ccaaaaa00ccacca00000000
-- 093:aaaaaa0eaaaa0a00caaffcc0caa000c0aaa0e000aaa00eeeaacc0eee00000eee
-- 094:220f00ff000f0f00060000ff0660ffff0600f000000f0060220ff00022000020
-- 095:0ff000220000f0220f000022f0060222f0660022f0066022ff00002200022222
-- 098:eeeee000eeeee0c0eeeee00ceeeeee0ceeeee00ceee0001ce000441ce044441c
-- 099:000eeeee0c0eeeeec00000eec00550ee0005500ec004050ec004050ecccc000e
-- 100:66666000666000996660ee9966600993666000996600eee9660e0eee600e8eee
-- 101:06666666006666669066666630666666900000009e033330e0eec330e0033330
-- 102:eeeee000eeeee0cceeee00c6ee000ccce00ccccc00ccccc70ccccc770cc00ccc
-- 103:00ee0000c0ee0440c00e0440cc000040cccc0040ccccc0407c0ccc40cc000040
-- 104:eeeeee00eeeeee0ceeeee00cee000ccce00ccccc00cccccc0cccccc70cc00ccc
-- 105:000e0000cc0e04406c0e0440cc000040cccc00407cccc040770ccc40cc000040
-- 106:eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00eeeee00beeee00bbeee00bbb
-- 107:eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00eeeeeeb00eeeeebb0eeeeebb00eeee
-- 108:ee000000e0099996e0990066e0990061e0446c6600466c6606666c6606606c66
-- 109:000000ee6999900e6600990e6100000e66c6440e66c6640066c6666066c60660
-- 110:eeee0000eeee0cc0eeee0cc0eee00c00ee007cc0ee0c7770e00c7770e0c0777c
-- 111:eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0eeeeeee0e00000e
-- 114:e044111ce041441ce041441ce0441441e0044444ee00ccc0ee0cc0ccee000000
-- 115:c0040eeec0040eeecc040eeecc040eeecc040eeecc040eeec0040eee00000eee
-- 116:60dc8ddd6000844466600eee66660e006666090666660e066666070666660006
-- 117:dd03333040003300e00000060e066666090666660e0666660770666600006666
-- 118:0cc00ccc0c00033300000cc3eee0ccc0eee0ccc0eee0cc00eee0cc0eeee0000e
-- 119:cc00e040330ee0403300e0403330e040c3c0e0000cc00eee0ccc0eee00000eee
-- 120:07700ccc00c00333e0000cc3eee0ccc0eee0ccc0eee0cc00eee0cc0eeee0000e
-- 121:cc00e040330ee0403300e0403330e040c3c0e0000cc00eee0ccc0eee00000eee
-- 122:ee00bbbbe00bbffbe0bbb0fbe0bbbbbbe0bbbbbbe00bbbbbee000000eeeeeeee
-- 123:bbb000eeffbbb00e0fbbb50ebbbbb50ebbbb550ebb55500e000000eeeeeeeeee
-- 124:066066cc0600066600004666eee04460e0006440e0600660e0066660ee000000
-- 125:cc660660666000606664000006440eee0446000e0660060e0666600e000000ee
-- 126:e0c0444c0000fff00444f0f40000f0f0eee0f0c0eee0c0c0eee0c0c0eee00000
-- 127:000aaa0ec00a000e444aaa0e000a000eee0aaa0eee00000eeeeeeeeeeeeeeeee
-- 130:eeeeeee2ee2eee2ee2e22ee2eeeee222ee2e2200e2e22000eee20000eee20001
-- 131:eee2e2eeeeee2eee2ee2eee2222eee2e00222e2e000022ee100002ee110002e2
-- 146:e2e20001ee22000022ee2000eeee2200ee22e220e2eeee22eeeee2eeeeeeeeee
-- 147:1100022e100002e2000002ee00002eee000222e22022ee2e22ee2eeeee2ee2ee
-- 192:11000011100ee00100e00e000e0110e00e0110e000e00e00100ee00111000011
-- 193:1100001110066001006006000606606006066060006006001006600111000011
-- 194:000011110ee011110e0011110001111111111111111111111111111111111111
-- 195:1111000011110ee0111100e01111100011111111111111111111111111111111
-- 196:0000111106601111060011110001111111111111111111111111111111111111
-- 197:1111000011110660111100601111100011111111111111111111111111111111
-- 198:0000111108801111080011110001111111111111111111111111111111111111
-- 199:1111000011110880111100801111100011111111111111111111111111111111
-- 200:0000111107701111070011110001111111111111111111111111111111111111
-- 201:1111000011110770111100701111100011111111111111111111111111111111
-- 208:1100001110055001005005000501105005011050005005001005500111000011
-- 209:1100001110022001002002000201102002011020002002001002200111000011
-- 210:11111111111111111111111111111111000111110e0011110ee0111100001111
-- 211:1111111111111111111111111111111111111000111100e011110ee011110000
-- 212:1111111111111111111111111111111100011111060011110660111100001111
-- 213:1111111111111111111111111111111111111000111100601111066011110000
-- 214:1111111111111111111111111111111100011111080011110880111100001111
-- 215:1111111111111111111111111111111111111000111100801111088011110000
-- 216:1111111111111111111111111111111100011111070011110770111100001111
-- 217:1111111111111111111111111111111111111000111100701111077011110000
-- 224:11000111110e0011000ee0110eeee00100eeee011000ee011110000111111111
-- 225:1100011111060011000660110666600100666601100066011110000111111111
-- 227:1111100016666100166110001616100016116100010016100000016100000011
-- 238:4444444444444444444444444444444444444444444444444444444444444444
-- 239:4444449444444444444444944444449444444494444444944444449444444494
-- 240:1100011111080011000880110888800100888801100088011110000111111111
-- 241:1100011111070011000770110777700100777701100077011110000111111111
-- 254:4444444444444444444444444444444444444444444444449499999944444444
-- 255:4444449444444494444449444444494444449444449944949944499444444444
-- </SPRITES>

-- <MAP>
-- 000:fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 001:fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 002:fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 003:fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 004:fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 005:fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 006:fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 007:fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 008:fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 009:fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 010:fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 011:fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 012:fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 013:fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 014:fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 015:fbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfbfb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 017:1010101010000000000202c01010101010101010101010e22020000000000000000202e20000000000000000000000f00000000010100000000000e00000000000020000000000e06200000000a22020202020e00202000010000000000000e0000020a220202020202020e00002000020202020202020e0a2a2a2a2a2a2a200a20000e0a2a2000000000000000002e0a2a2a2a2a2a2a2a2a2a2a2e0a2a2a2a2a2a2a2a2a2a2a2e00000000202020202000000e00002020000000000000000e01010101010101010101010e0020202020000a2a2a2a2a2e00202000000000000026200e01010101010101010101010e0
-- 018:0000001010020000000000c00000101010020010101010e22000000000000000000002e200000000a2000000000000f00000000000000000000000e00002020202020000020200e00000002000a22020202020e00000000010100000000202e0000000a220202020202020e00200000020c600c6c60086e06200a20000000000a20000e0a200000000000000000200e0a2a2a2a2a2a2a2a2a2a2a2e0a2a20000000000a200a2a2e00000000000020200000000e000c600c60000000066c600e01000000000000010001010e0000202020000000000a2a2e00200000000000000000000e01010101010000000000010e0
-- 019:0000000002000000000000c00000000000000200101010e20000000000000000000000e200000000a2000000000000f00000000000000000000000e00000000000000000000200e000002020a2a22020202020e00000000000000000000000e0000002a220a2a2a2a2a220e00202000020000000000000e00000000000000000000000e00000000000000000000000e00000000000a2a2a2a2a200e0a200000000a200000000a2e00000000000000000000000e02020202000c60062006600e00000000000006200001010e00000000000000200000000e00000000000000000000000e00000000000000000000010e0
-- 020:0000000000000000000000c00000000000000000000008e20000000000020000000000e200000000a2a20000000000f00200000062000200000002e00000000000000000000000e00000000000202020202020e00000000000000020202020e00000022020a2202020a208e02020200020c600c6c60000e00000000200000000000000e00000000000000000000000e00000000000000000000000e0a200000000a20000000000e00000000000000000000000e00000002020202020202020e02020202020000000000010e00000000002000000000000e00000000000000000000000e00000000000000000000000e0
-- 021:0000000000000000000000c01010000000000000000008e20000000000000000000000e20000000000a20000000000f00000000000000000000002e00000000000000000000000e00000000000002020202020e00000000000000000002020e00202a2202020202020a2a2e00000202020c600c6c60000e00000000000000000000000e00000000000100000000000e00000000000000000000000e0a200000000a20000000000e00000000000000000000000e00000000000200066026600e00000000020202020000010e00000000000000002000000e00000000000002000000000e00000000000001000000008e0
-- 022:0000000000000010000000c01010020000000002000008e20000000200000000000000e20000000000a20000000000f00200000002006200000000e00000000002020000000200e00200000000000020202020e00000000000001000000020e00000a2a2a2a2a2a2202020e00000000020000000000000e00000000200020000000000e00000000000100000000000e0a2a2a20000000000000000e0a2a2000000a200000000a2e00000000000000000000000e00000000000202020202020e01000000000620020000010e00000020002000000020000e00000000020202000000000e00000000010101002000062e0
-- 023:0000000002001010000000c01010101000000010101010e20200000000001000000000e200000000a2a20000000000f00000000000000000000000e00002020202020002000000e00000000002020020202020e00000000000101000000000e000002020202020a2a22020e00000000020c600c6c68600e000000000020000a2a20000e00000000010100202020200e0a2a2a2a2000000000000a2e0a2a2a20000a2000000a2a2e00000a20000000000000000e0c6c6000000c60066006200e01000000000006200001010e000000000a2a2a200000000e00020202020000000000002e01000101010101002020000e0
-- 024:0000000202001000000000c01010101010101010101010e20202000000101010000000e20000000000000000000000f00202000000000000000000e00000000000020000000000e06202000000620000202020e062620000a21010000000a2e00000002020202020202020e00002020020202020202020e0000000000000a2a2a2a200e010a2a20010101000000000e0a2a2a2a2a200000000a2a2e0a2a2a2a2a2a2a2a2a2a2a2e00000a21010100000a2a200e01010100002020000660002e01010101010101010101010e0000000a2a2a2a2a2000000e00000000000000000000202e01010101010101010101010e0
-- 025:fbfbfbfbfbfbfbfbfbfbfbfbe2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e0e2e2e2e2e2e2e2e2e2e2e2e0e2e2e2e2e2e2e2e2e2e2e2e0e2e2e2e2e2e2e2e2e2e2e2e0e2e2e2e2e2e2e2e2e2e2e2e0e2e2e2e2e2e2e2e2e2e2e2e0e2e2e2e2e2e2e2e2e2e2e2e0e2e2e2e2e2e2e2e2e2e2e2e0e2e2e2e2e2e2e2e2e2e2e2e0e2e2e2e2e2e2e2e2e2e2e2e0e2e2e2e2e2e2e2e2e2e2e2e0e2e2e2e2e2e2e2e2e2e2e2e0e2e2e2e2e2e2e2e2e2e2e2e0e2e2e2e2e2e2e2e2e2e2e2e0e2e2e2e2e2e2e2e2e2e2e2e0
-- 026:000000a2a2a2a2a2620200c0000200000000000000a2a2e20002100202020202020202e20000000020202020a2a2a2e20002020200000002020202e20000000000000000000202e20000000002001010101010e2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 027:00000000a2a2000000c202c002c20200000000000000a2e20000101010100000000202e20000002020202020202020e20000000000000002020202e20000000002000000000002e200c2000000000000101010e2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 028:0000000000a20000200262c00002202020000000000000e22020000000101010101010e20000000020202020202020e20000000000000000000002e200000000000000c6000000e20000000000006200000010e2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 029:2020200000a20020200000c00000000020202000000000e20020202000000000000002e20000000000202020202020e20000000000000000020000e20000000000000000c60000e22020202020000000000000e2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 030:0000202020002020000000c00000000000002020200000e21010002020202020200202e2000000002020202020a220e20000000000000008420200e20000000000020000000000e20000000020202020200000e2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 031:000000002020200000a2a2c00000000000000000200000e20010000000000000200802e20000200000202020202020e20000000000000000020000e200000000000000c6000000e20000000000002062202020e2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 032:0200000000000000a2a2a2c00002020000000000202020e20010101010101010206602e200000020202020a2a220a2e20002000000000000000000e2020200000000c600000000e20202000000002000000000e2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 033:0202020000000000a2a2a2c0000000000000000000a2a2e20000000000000010020202e20202000000202020a22020e20202020000000000000202e20202020200000000000000e20202020200002000000202e2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 034:fbfbfbfbfbfbfbfbfbfbfbfbe2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2e2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- </MAP>

-- <WAVES>
-- 001:0123456789abcdeffedcba9876543210
-- 002:ffff0000000000000000000000000000
-- 003:ffffffff000000000000000000000000
-- 004:ffffffffffffffff0000000000000000
-- 009:24779c6656ca477b6968dcc645c3b93e
-- </WAVES>

-- <SFX>
-- 000:0000b0400068000800088008a008c008d008f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000a74000000000
-- 001:040014001470247024c034c034c044c044c054c054c064c064c074c074c084c084c094c094c0a4c0a4c0b4c0b4c0c4c0c4c0d4c0d4c0e4c0e4c0f4c0507000000004
-- 002:0350235043506350835003002300430063008300830093009300a300a300b300b300c300c300d300d300e300e300f300f300f300f300f300f300f300400000000000
-- 003:04c014c014002400240034003400440044005400540064006400740074008400840094009400a400a400b400b400c400c400d400d400e400e400f400502000000004
-- 004:042014001430241024403420345044304460544054706450648074607490847084a0948094b0a490a4c0b4a0b4d0c4b0c4e0d4c0d4f0e4d0e4f0f4d0572000000004
-- 005:70f0c000d000d000d000d000d000d000e000e000e000e000e000e000e000e000e000e000e000e000e000e000e000e000e000e000e000e000e000f000004000000000
-- 006:7000d000e000e000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000304000000000
-- 007:e200c2019301a300b30fb30fb300b300c300c300c300c300c300c300c300c300c300c300c300d300c300d300c300d300c300d300c300c300c300c300405000ff0006
-- 008:a200b300b400c400c400c400c400c400c400c400c400d400d400d400d400d400d400d400d400d400d400d400d400d400d400d400d400d400d400e400402000000000
-- 009:010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100010001000100302000000000
-- 010:00009000d000e000f000f000f000f000f000f000f0007000c000e000f000f000f000f000f000f000f000f000b000e000f000f000f000f000f000f000280000000000
-- 011:3248922822098229024a826a024b820b120b820c220c920d320d920e520ea20f620fb2007201c2029203d203a204e205c206e206d207f207e207f207300000000700
-- 012:7000d000e000f000f000f0007000d000e000f000f0007000d000e000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000f000304000000000
-- </SFX>

-- <PATTERNS>
-- 000:600078000000d00078b00078900078100000600078000000800078000000600078400078600078000000d00076400078600078000000900078000000800078000000400078000000d00076000000000000000000100000000000000000000000600078000000d00078b00078900078100000600078000000800078000000600078400078600078000000600078800078900078000000b00078000000800078600078400078000000600078000000000000000000100000000000000000000000
-- 001:d00078000000b00078100000d0007800000040007a000000f00078d00078b00078100000d00078000000600078800078900078000000b00078000000800078000000400078000000600078000000d00078000000800078000000100000000000d00078000000b00078100000d0007800000040007a00000060007af00078b00078100000d00078000000600078800078900078000000b00078000000800078000000400078000000600078000000000000000000100000000000000000000000
-- 002:600094100000600094100000000000000000000000000000600094100000800094100000900094100000600096000000f00094000000000000000000b00094000000000000000000d00094000000000000000000000000000000100000000000600094100000600094100000000000000000000000000000600094100000800094100000900094100000400096000000600096000000000000000000400096000000000000000000600096000000000000000000000000000000100000000000
-- 003:900094100000900094100000000000000000000000000000900094100000900094100000000000000000000000000000900094000000000000000000b00094000000000000000000d00094000000000000000000000000000000100000000000900094100000900094100000000000000000000000000000900094100000900094100000000000000000000000000000900094000000000000000000800094000000000000000000600094000000000000000000000000000000100000000000
-- 004:d8006c000000d8006cd8006cd8006c000000d8006c000000d8006c000000d8006c000000d8006c000000b8005e000000d8006c000000d8006cd8006cd8006c000000d8006c000000d8006c000000000000000000b8005e000000000000000000d8006c000000d8006cd8006cd8006c000000d8006c000000d8006c000000d8006c000000d8006c000000b8005e000000d8006c000000d8006cd8006cd8006c000000d8006c000000d8006c000000000000000000b8005e000000000000000000
-- 005:600094100000600094100000000000000000000000000000600094100000600094100000000000000000000000000000900094000000b00094900094800094100000400094100000600094000000000000000000000000000000100000000000600094100000600094100000000000000000000000000000600094100000600094100000000000000000000000000000900094000000b00094900094800094100000400096100000600096000000000000000000000000000000100000000000
-- 006:f8008800000048008af80088d80088000000b80088000000d80088100000680088100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000f8008800000048008af80088d80088000000b80088000000d8008810000068008a100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d00076000000400078000000
-- 007:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000600086000000800086000000900086000000400088000000900086000000b00086000000d00086000000800088000000d00086f00086400088b00088400088600088800088f00088800088900088b0008860008a80008a60008a40008af00088
-- 008:800094000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000800094000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000800094000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000800094000000000000000000000000000000000000000000f00094000000000000000000400096000000000000000000
-- 009:b70050000000000000000000000000000000000000000000000000000000000000000000000000000000bb0054000000b70050000000000000000000000000000000000000000000000000000000000000000000000000000000bb0054000000b70050000000000000000000000000000000000000000000000000000000000000000000000000000000bb0054000000b70050000000000000000000000000000000000000000000000000000000000000000000000000000000bb0054000000
-- 010:d00088000000900088000000800088000000900088000000800088000000400088000000f00086000000d00086000000b00088000000600088000000400088000000600088000000400088000000f00086000000d00086000000f00086000000900088000000600088000000d00086000000900088000000800088000000400088000000d00086000000800088000000600088000000400088000000f00086000000d00086000000c00086000000d00086000000f00086000000800086000000
-- 011:d00094100000d00094100000000000000000d00094100000d00094100000d00094100000000000000000d00094100090f00094100000f00094100000000000000000f00094100000f00094100000f00094100000000000000000f00094100000400096100000400096100000000000000000400096100000400096100000400096100000000000000000400096100000600096100000600096100000000000000000600096100000800096100000800096100000000000000000800096100000
-- 012:b0005c000000000000000000b00056000000000000000000000000000000900066900066900066000000900066000000b00058000000000000000000b00054000000000000000000000000000000900066000000900066900066900066000000b0005c000000000000000000b00056000000000000000000000000000000900066900066900066000000900066000000b00058000000000000000000b00054000000000000000000000000000000900066000000900066900066900066000000
-- 013:00000000000000000000000040007a000000000000000000f00078000000000000000000d0007800000000000000000060007a000000000000000000000000000000000000000000b0007800000000000000000000000000000000000000000010000000000000000000000040007a00000000000000000060007a00000000000000000080007a00000000000000000060007a00000000000000000000000000000000000000000090007a00000000000000000080007a000000000000000000
-- 014:000000000000000000000000d00078000000000000000000b00078000000000000000000d00078000000000000000000f0007800000000000000000000000000000000000000000060007800000000000000000000000000000000000000000010000000000000000000000040007a000000000000000000f0007800000000000000000040007a00000000000000000060007a00000000000000000000000000000000000000000080007a000000000000000000c0007a000000000000000000
-- 015:d00078670078b00078670078d0007867007840007a670078f00078670078d00078670078b00078670078f0007867007840007a870078b0007887007840007a87007880007a87007860007a87007840007a870078f0007887007840007a87007860007ad7007840007ad7007860007ad7007890007ad7007880007ad7007860007ad7007840007ad7007860007ad7007880007a40007af00078b0007860007ad00078a0007860007840007ab00078800078400078f00078b00078600078f00076
-- 016:000000000000000000000000d0008a00000000000000000080008a00000000000000000010000000000000000000000000000000000000000000000040008c000000000000000000b0008a00000000000000000080008a00000000000000000010000000000000000000000060008c000000000000000000d0008a00000000000000000010000000000000000000000000000088007a48007af80078b8007868007ad80078a8007868007848007ab80078880078480078f80078b80078680078
-- 017:d00094100000d00094100000000000000000b00094100000d00094100000d00094100000000000000000f00094100000400096100000400096100000000000000000b00094100000400096100000400096100000000000000000500096100000600096100000600096100000000000000000d00094100000600096100000600096100000000000000000600096100000400096000000100000000000f00094000000100000000000d00094000000100000000000b00094000000100000000000
-- 018:d00078670078b00078670078d0007867007840007a670078f00078670078d00078670078b00078670078f0007867007840007a870078b0007887007840007a87007880007a87007860007a87007840007a870078f0007887007840007a87007860007ad7007840007ad7007860007ad7007890007ad7007880007ad7007860007ad7007840007ad7007860007ad70078b0007a000000000000000000000000000000000000000000b8007a000000000000000000bc007a000000000000000000
-- 019:000000000000000000000000d0008a00000000000000000080008a00000000000000000010000000000000000000000000000000000000000000000040008c000000000000000000b0008a00000000000000000080008a00000000000000000010000000000000000000000060008c000000000000000000d0008a000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 020:d00094100000d00094100000000000000000b00094100000d00094100000d00094100000000000000000f00094100000400096100000400096100000000000000000b00094100000400096100000400096100000000000000000500096100000600096100000600096100000000000000000d00094100000600096100000600096100000000000000000600096100000b00094000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000
-- 021:d00078000000000000d00078d00078d0007840007a000000f00078000000b00078000000d00078000000000000d00078d00078d0007880007a00000060007a00000080007a000000d0007a000000000000000000000000000000000000000000d8007a000000000000000000dc007a000000000000000000dd007a000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 022:900098400098d00096900096d00096400098900098400098d00096900096d00096400098b00098600098f00096b00096f00096600098b00098600098f00096b00096f00096600098d00098800098500098800098500098d00096500098d00096800096d00096800096500096d00094000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 023:840056000000000000840056000000100000800054800054800054800054000000000000840056000000000000840066840066840066800054000000800054000000800054000000f0005a000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 024:900078000000000000900078900078900078900078000000900078000000900078000000b00078000000000000b00078b00078b00078b00078000000b00078000000b0007800000056008c87008cd7008c58008c88008cd9008c59008c8a008cda008c5b008c8b008cdc008c5c008c8d008cdd008c100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 025:000000da00780000001000700000006a0078000000100000000000fa0078100000da0078ba0078da00780000006a00788a00789a0078000000ba00780000008a00780000004a0078000000da0076000000000000000000100000000000000000000000da00780000001000000000006a0078000000100000000000fa0078100000da0078ba0078da00780000006a00788a00789a0078000000ba00780000008a00780000009a00780000006a0078000000000000000000100000000000000000
-- 026:d00078000000100070000000600078000000100000000000f00078100000d00078b00078d00078000000600078800078900078000000b00078000000800078000000400078000000d00076000000000000000000100000000000000000000000d00078000000100000000000600078000000100000000000f00078100000d00078b00078d00078000000600078800078900078000000b00078000000800078000000900078000000600078000000000000000000100000000000000000000000
-- 027:600096100000600096100000000000000000000000000000600096100000600096100000d00094000000000000000000600096100000600096100000000000000000000000000000600096100000600096100000d00094000000000000000000600096100000600096100000000000000000000000000000600096100000600096100000d00094000000000000000000600096100000600096100000000000000000000000000000600096100000000000000000900078000000b00078000000
-- 028:d00068000000d00068000000000000000000000000000000d00068000000d00068000000d000c4000000d000c4000000d00068000000d00068000000000000000000000000000000d00068000000d00068000000d000c4000000d000c4000000d00068000000d00068000000000000000000000000000000d00068000000d00068000000d000c4000000d000c4000000d00068000000d00068000000000000000000000000000000d00058000000000000000000000000000000000000000000
-- 029:600096100000600096100000000000000000000000000000600096100000600096100000000000000000000000000000600096100000600096100000000000000000000000000000600096100000600096100000d00094000000400096000000600096100000600096100000000000000000000000000000600096100000600096100000000000000000400096100000e00094000000000000000000400096000000000000000000600096000000000000000000000000000000100000000000
-- 030:40005c000000000000000000f00068000000f800c4000000f00068000000f00068000000f800c4000000f8006400000040006c000000000000000000f00068000000f800c4000000f00068000000f00068000000f800c4000000f8006400000040005c000000000000000000f00068000000f800c4000000f00068000000f00068000000f800c4000000f8006400000040006c000000000000000000f00068000000f800c4000000f00068000000f00068000000f800c4000000f80064000000
-- 031:000000da00780000001000700000006a0078000000100000000000fa0078100000da0078ba0078da00780000006a00788a00789a0078000000ba00780000008a00780000004a0078000000da0076000000000000000000100000000000000000000000da00780000001000000000006a00780000001000000000006a007a1000004a007aea0078da00780000006a0078e00076000000600078000000800078000000b00078000000a00078000000000000000000100000000000000000000000
-- 032:d00078000000100070000000600078000000100000000000f00078100000d00078b00078d00078000000600078800078900078000000b00078000000800078000000400078000000d00076000000000000000000100000000000000000000000d0007800000010000000000060007800000010000000000060007a10000040007ae00078d00078000000600078800078900078000000b00078000000d0007800000040007a00000060007a000000000000000000100000000000000000000000
-- </PATTERNS>

-- <TRACKS>
-- 000:0403410403410804410006410006410c1641000000000000000000000000000000000000000000000000000000000000000040
-- 001:0029820c2c43b83c43bc3c431142534d4553000000000000000000000000000000000000000000000000000000000000000050
-- 002:995716000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010
-- 003:000c57ad6ed7068ed7000000000000000000000000000000000000000000000000000000000000000000000000000000000020
-- </TRACKS>

-- <PALETTE>
-- 000:140c1c44243430346d4e4a4e854c30346524d04648757161597dced27d2c8595a16daa2cd2aa996dc2cadad45edeeed6
-- </PALETTE>

-- <COVER>
-- 000:012100007494648393160f00880077000012ffb0e45445353414055423e2033010000000129f40402000ff00c2000000000f00880078d6aac241c0c1d62cace4a4e458c40343564295d7ecedee6d0d64842dd7c25717162daa99ad4de50343d644424358591a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080ff00108040010a0a1c28303121c386051a3c780132a041041b2a54b82133a6cd8c1b3a7478308088c1942b4a9c398235aa44930b0618209011a247903b5608f883108003060822f4f9d3776ec1a44b867c0922f08255a408929c5ab23aa4569b0f5a34992096e5db9643360df9b3fba18ea46bca154ad4f0c355b32d9e4d7bf63bebca93336ecd78c5dce3410a3f2264db0830b444bb49dabd2cc61ea2e49559eec4eaa51f6e51c30df654ac893331e4c967de2efcc830cd58809743edcc000caaefa8ab579ddc053da16ec0ab6310286afaac5ba4a33b850a0cd5b0f2a86d6b1f8b2a37b0c795a593006e99d2b5e1e4d1761f3e8d556363dcc12727ee500ba0ff69ee7bab97e87d3bbaf2995fbfcdee13ddfb71f3e753071a7e3f74c4f22f021038421202069420220be194639b7d0d27fc9143f1d7c11c4e8944fb58504157709e7bfd942310850d84606084048870e843319439138951a854d48911f54e1f52c500904d8904a8a1a04cfd461082010cf7f3e884268830698225c7822e8de5294d1975d514736e8f0de873d20b08f8f16092291842e6964ed6b096932d28de989df148189d7612e7ea1d8a4a4945e0485ef8146191067970ea8921f8a2db911e3741ed76fdc863649256249e124b0010a0094e3e7925599c056890e4a46e05e2a2413ef5d6e5a7820098624e3e04b08699ed00cf567d9224e9674b9254f9e0ff569eb93b22a629c47bdc9ff9848a2a49ae17da57895af921da9a6e4420d859cac8d7515c0595195b7b51f62dae8c1e19008ea6a2fadb210fb20b8a1f8f82a9e590aca9e4aa5f5f3d2b2b600b419be154b635c74decb0a27813d8bbd694fd28b9992a75a78931c82d5f5fa63b939bb5811bc1d777a5b4ec1146dedab0d2404e848ae5791f791c6e5ad215fa68ccc2e4100207089c7003ca19cb1f5b75f6bc172baf124a19efb5523ae8aacf09a9c3758be215a0b254962c11765bb56a6472a739cc625104083d433b7ffa8a9759a839fc85b9be39e4dea0d927aca33e554b4c8bdbc13ddb521d9a6f94e434d15b9863b049ba0cf198c67f8c1f28d6090d16fcff4fe9340d59d66347986f76873df2dbd8068b8de7c57fdd1272c5097d067ac29fb7471c7bd15b0f92dc05a4e6b2e1c6eba67e4d3b6d6ce9bf19bb39e7dd7f3689fc52e1d41bbc4dfea41afbd3a33d0fa649a3aed37bb39b2c34f360feca01a382b3657d9f7a83c5d175cda2744034e3d91539f2c4a51a4c2d86367fc2ada36600c003033bc6fc33617bcc54d6a31d54fef5f04bed06396e6a4470dd84ee9f04a8f04a9f4eb995c6c03d494a0d6a44c8b16915c24bc260e0a0c29a9da10d857b01bc1e5c05291a3dd8ec4c32ef170726ff13f5f74485045b890b48824a913e675ff9ea0ca4d5acaac0f4435aca0b06f486401c1e558b7879ef07faf3139e3180ff30832c02d90f88c417b04a2c539a855752345cb8fcef0973b3a22750d25010020039250ce2a715986429294800536c2320ac98864584172b8b5c4f5dc2d807c90e4f4a8dbbd843f004e6c73a246c8da14ad34cf817ca02fd2229dbaf115e67974de04400918c4360d4788714ccbe042963c3622519a1264624439e84391accf452b39142372b6c29120ec706c7bc10b63d8c6563c6163db74641f823eb3569c40852c9d4b5479d91555648f8281e4aa8c591f1fa1be0749d36d912f3285c35a08e69604d5e111583d4f5ef298917c36eed699951db52372986bff833d9964420e431a2e4931a535f32cc332633c449b1e9413e9414666d2b026b4e2a90398fff5430af37d9fec77a637f65fce66bea0a4bca56e3559abbc15b3bd933a93e14eb6ed460d4498721d65dd1d38794394041d8edba157fe1961c16612749131e1affa3a0d37867402ad92c02129e7bf3a92daee7a6469e26e3a02599adfc272fcda00511a9255212257ab8bc4eb4d98125f9ec40784c30c5453aab3cfe5e419a171e96ca6696cb5a5c2b12c5d031e8e8a85503df9cc886523aa53dae194bab57da075062f4b983012b2657550ec83ec92b8a0818030402c08eb20610b28500cf5d0b58d3c606dfa48d0358fefa6754a6b5527a00c25064eaf1189200fd54ebfb69fe3b5e33c28634b3a52d69654b3ada3d9905b195d960b41065a15d56f9429c2dffad6f6b8bdcd69fcc4c6c2f5b695a39d5d514a2b5b279674efa1acf46065105adac63799b3a57e6471ab0a5f19a3ff7ebd2be45c66a0860877b10e3270887d10975d0de6169c649e6579abf955f6b79db5e35f274bf359dfd67438bd19004304fbfd5efe204cb5ed54ab3ff4e19dcabe0c6abd40b28d29c12608d7f2989928430810fdddf6006cb4e50c0c43726e3f626451c02ebd600e1078b13d80f1c984cfe648c7b085e6563cb3ed00b9502a0042e1fd256bcd7eae87abfcd28c30c38e3ee11a83f811ec2629e2c4e591f97a3c705c1fb777cbe582f76f02129a2f008acad5d3a6463c21eefe3b4c82c5a26887cc6bd2846c636df912bb1385616dfa295ffa4356ee939f3b08d1d6d99cc9ad33f6cc02a6e4f9a83fb3aae1db953c50ec1349687d95a33c7ffab867f6c7b1d100451f9facd9de3f3f8dcb4bdfa65dfa35673d66b744d52c68a11bd75a37e897c35eff56969b6961dd259461862ea3153b95193fc9f0b8ad0ded951212e1172ad7df9d65734d66e5da3263197341c3b14a3d9861674deda66cea628e3a0d68b2d1d8d11192f3a5bd18576ba05270068c8d25e83862678f83ce8e3574915d9ddc2fa40cd13e6fc92bd54cd27be58e2aadef1150fc906f6f219463e5b29757cd9038d60ca19cb5523fb37bef6e810c5cb20728c335875f6aba25bb9e54c6b44a1dc178273c3c84234278bf743fe09777fbb03ff600f65dc436a46b863dd037e8f7c1182c5400683f9a1f99ce7b2cef559b3491c41bf8c2c57b33fc3dae6cb637c0b5d24e316e9b8c33c25a11798f0797d1a3e6b8ebe97832d10cd2429130a5cf262e268ded4490f8fa31ef36c907b36edc5caba74be367a394e8c774e07f7a0bc65e0b66b3b5b6fe870bdddfe61eef73eed5f9ca9dd9ea7fea06650c292333617b20f2babd6dde00dc881403c1369b3e4a62e669039d522c5e6a64a1849221df34e6b7762335e1b31f2cc31e56c286288c63658f6a4fd842d7357aebc71dc7767f39bdd087aa43ce9efa77696addc184d02dde28f620d66b64dbc54d29af9bba7f7d0f98fbcf28f2d46d3c95cf040fd2af4bfff50daae01c5b3f77d9012a70f5d7166826ec33826dae80319d6fb7f34404c5d73e0e53c4a5dd07066de9f76b11d3e856f78a1f33d31591873265c03f56541ae6fb70c7be7253353d21af2f92953ce2c971437c3b18832895ed78f72187211d31b59d7a12ee3f24dd4ad34a1294f74e287f7df6228e15c44272628292b23374e117037649c5825131e94e38341e77e06238318491a828333213b7631bb5325d486417a37518e5a422b4938b11e95f08f86108ca44182013b7b47c48954354a54508434e33c53a186c4cd4de1a68862f18764126b580a14380003739523316e3951978871b78104023603e42d21e16384131388b683c4b949e7a06278f911c2d8ff3628e78401b78751d78398831223082bd48155250f4415145247eb71f5c88b351e24a3af6168104735468106fb36c2288d46c32e16ac4557db7be6118548bb3e557a81f1f48484d95568301953634998405c73554454bf6138221652cc8dc8ec8ec88721531d32330a4658738b040885e1245b28555225c980a87a59b6861b005025e86e87e8446be3e551841883069344059b7886c16958c86f77bc88237e89f8672796ff27130c8da17a3c62631345fd8de1152f985861a5ae52a63e80488f8202a410197231d82d8df8c24f975612c8be2e813551482a7148758c96ab6ca53214e8119219f09729419fd6546d085f75c6da18982d6c554f7491d09319e0ff99293199e8777ed15a38a11935d61d6af1739502b41a39502c397822e2f39f117082321341590c34e6819b127f8af8859a49157552103778e493590b2ac21c3a65b56d02d182c1d09859af8a59932851e83a380939d80f38887d44255593520228b8bf76f3000b82d82a484583746d3de81c5d38509639548945633db8ab15384a28c4fb8a42109399aa3ba3358da13a8a81d13ba82912739d20989a8004b714990c3808988e74968706ff88e1989073ff25984b2f88e59d210b9a92279389791b74b26688ba9a11999d25fa9091698763518d49a782c99228b9132995d98b98779024989b992684b22d36c9de1c99901da84a9ea84232b8ea3a91da98d276ff5127c89b515d9aa82a9a01a19be9712cc97156c8fc91e41d9f769f5938ce35741655d3ac9928d53cd88891e9b55ef85e6bf99b9cc95880f80e900a777457d51bd9399ec2414809181fb9955b97ee88d3617341ce9ad9fb160aa28b43029fa11e966561ad8440a2f33775c61f941abd5b96eb372a0f324971a7e1c2aa56375154c1a5a92829d45c353a1517d67923645c58120a66951c8a3a93a3c8ef7cd55f657532a631e0040015a15a2e103150135a25abb8d13167b48c5303aa08b4954acd72f9a7975a95a85a55485a86a7356c6987666c5aa4203afd7b2730007ae4a00a66a221a6aaf697a76a95a9c31998f318a4a18a207a391e0aa1902558a1676bff332ad7aa7ae7a70115a421b7a5548d9b5179a331b8ac8a74a94a4a933a9f119657a67a46a821fc87aa8aa9aa4e8b8171672159adaa62159a1315b9c788c92913aa4aa7b940ac45196c5acd78844e8a692cab69caac277b2047c12c324ba4986ba751b9ac9a1f3f5ac71b4a1812aaeba2b50caf09859839af8839a819007b1f32816a7a3e5d572ea5ea25a5ea5a71a93683d9b51fcaf26971e9ab1a134b590fafba251629e94849749a29119749b29fe67ea2e5a7ac3145ab223ea25a60b587c489e96f35e9d219137da9714fabe94791aa21beba7549fa8232a404883902be1b6499490710ea4019ea40b82b70b72b90b3ea189d6af55766a1b2faaba6d347ada91bc8a7319da729efa319e3b93901942bf6162b30b39a96380b8ea74b116a768baa00296a9272a37ad69c4b167f4bb3bbfaffacda2a4ffa6e8b3952b1eaa2b8f2c2b94b7e6281e87c4b91341b51b35916a86b766a3bc1b3ca27b5e8fda1ea6542c277bc4476b96b231b6b93a0aaf42396f6b8019da37b68b57be2a34a53bac9e8469277ab2110bfc30eae6b49b59b69b79b89b99ba9bb9bc9bd9be9ba9bda90ea32a3ab4aba352ab5ab8ab9ab1537abaabdabeab9d1cabfab2bb3bb34b4bb6bb7bb9215322211bb8bbdbb32a0ea582582321abbebb5cbdbb10100b3
-- </COVER>

