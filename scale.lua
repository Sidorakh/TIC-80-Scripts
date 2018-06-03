function draw_quad(p,tex,w,h,tra,is_map)
	tra=tra or -1
	is_map=is_map or false
	local u1=(tex%16)*8
	local v1=(tex//16)*8
	local u2=(tex%16)*8+(w*8)
	local v2=(tex//16)*8+(h*8)
	textri( p.x1,p.y1,p.x2,p.y2,p.x3,p.y3,
            u1,  v1,  u2,  v1,  u2,  v2,
            use_map, tra)
    textri( p.x1,p.y1,p.x3,p.y3,p.x4,p.y4,
            u1,  v1,  u2,  v2,  u1,  v2,
            use_map, tra)
end

function quad(_x1,_y1,_x2,_y2,_x3,_y3,_x4,_y4)
	local p={   x1=_x1,y1=_y1,
                x2=_x2,y2=_y2,
                x3=_x3,y3=_y3,
                x4=_x4,y4=_y4}
	return p
end

function tr_skew(t,_xsk,_ysk)
	t.xsk=_xsk
	t.ysk=_ysk
end

function tr_ang(t,a,_deg)
    if (_deg==nil)then
        t.ang=a
    else t.ang=math.rad(a) end
end

function tr_sc(t,_xsc,_ysc)
	t.xsc=_xsc
	t.ysc=_ysc
end

function tr_pers(t,_xpers,_ypers)
	t.xpers=_xpers
	t.ypers=_ypers
end

function tr_pos(t,_x,_y)
	t.x=_x
	t.y=_y
end

function spr_tbl(sp,x,y,w,h,tcol,tbl)
 
	local ang=tbl.ang or 0
	local xpers=tbl.xpers or 1
	local ypers=tbl.ypers or 1
	local xsc=tbl.xsc or 1
	local ysc=tbl.ysc or 1
	local xskew=tbl.xsk or 0
	local yskew=tbl.ysk or 0
	local _x=tbl.x or 0
	local _y=tbl.y or 0
	x=x+_x
	y=y+_y
	
	x=math.floor(x)
	y=math.floor(y)
	
	local sw=w*xsc
	local sh=h*xsc
	
	local s = math.sin(ang)
	local c = math.cos(ang)
	
	local _x1=math.floor(-(w*(sw//2)*8)/2)
	local _y1=math.floor(-(h*(sh//2)*8)/2)
	local _x2=math.floor((w*(sw//2)*8)/2)
	local _y2=math.floor((h*(sh//2)*8)/2)
	
	local x1=(_x1*c-_y1*s)+x-xskew
	local y1=(_x1*s+_y1*c)+y-yskew
	local x2=(_x2*c-_y1*s)+x-xskew
	local y2=(_x2*s+_y1*c)+y+yskew
	local x3=(_x2*c-_y2*s)+x+xskew
	local y3=(_x2*s+_y2*c)+y+yskew
	local x4=(_x1*c-_y2*s)+x+xskew
	local y4=(_x1*s+_y2*c)+y-yskew
	
	local p=quad(x1,y1,x2,y2,x3,y3,x4,y4)
	
	draw_quad(p,sp,w,h,tc)
end