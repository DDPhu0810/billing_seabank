(window.webpackJsonp=window.webpackJsonp||[]).push([[24],{386:function(n,l,t){const e=["vi","en"];var i=t(0),a=t(25),o=t(17),u=t(27);t.d(l,"a",(function(){return c}));class c{constructor(n,l,t,e){this.translateService=n,this.titleService=l,this.router=t,this.renderer=null,this.renderer=e.createRenderer(document.querySelector("html"),null),this.init()}getAll(){return e}updateTitle(n){n||(n=this.getPageTitle(this.router.routerState.snapshot.root)),this.translateService.get(n).subscribe(n=>{this.titleService.setTitle(n)})}init(){this.translateService.onLangChange.subscribe(n=>{this.renderer.setAttribute(document.querySelector("html"),"lang",this.translateService.currentLang),this.updateTitle()})}getPageTitle(n){let l=n.data&&n.data.pageTitle?n.data.pageTitle:"jhipsterApp";return n.firstChild&&(l=this.getPageTitle(n.firstChild)||l),l}}c.ngInjectableDef=i.kc({factory:function(){return new c(i.lc(a.i),i.lc(o.i),i.lc(u.m),i.lc(i.T))},token:c,providedIn:"root"})},749:function(n,l,t){t.r(l);var e=t(0);class i{}var a=t(49),o=t(260),u=t(202),c=t(265),r=t(178),b=t(206),s=t(266),d=t(215),g=t(264),m=t(263),p=t(737),h=t(208),f=t(18),U=t(32),_=t(29),v=t(20),x=t(16),W=t(3),M=t(544),C=t(160),w=t(744),O=t(207),P=t(27),k=t(735),y=t(162),K=t(146),A=t(226);class J{constructor(n,l,t,e,i){this.elementRef=n,this.renderer=l,this.loginService=t,this.router=e,this.accountService=i,this.links=[]}ngOnInit(){this.accountService.identity().subscribe(n=>{this.currentAccount=n,this.lastName=this.currentAccount.lastName,this.links=[{label:"Extension",icon:"account_balance",child:[{isVisible:!0,label:"Call Histories",route:"/call-histories",icon:"account_balance"},{isVisible:!0,label:"Summary Report",route:"/summary-report",icon:"summary_report"},{isVisible:this.currentAccount.authorities.includes("ROLE_ADMIN"),label:"Cost Reprocess",route:"/rebilling-session",icon:"rebilling-session"},{isVisible:!0,label:"End Users",route:"/users/user-management",icon:"person"},{label:"Departments",route:"/groups-manager",icon:"group",isVisible:this.currentAccount.authorities.includes("ROLE_ADMIN")},{label:"Gateway Operator",route:"/gateway-operator",icon:"account_balance",isVisible:this.currentAccount.authorities.includes("ROLE_ADMIN")}],isVisible:!0,expanded:!1},{label:"Users",icon:"person",child:[{label:"Users LDAP",route:"/config-role",icon:"account_balance",isVisible:this.currentAccount.authorities.includes("ROLE_ADMIN")},{label:"Users local",route:"/users/user-system-management",icon:"account_balance",isVisible:this.currentAccount.authorities.includes("ROLE_ADMIN")}],isVisible:this.currentAccount.authorities.includes("ROLE_ADMIN"),expanded:!1},{label:"Config",icon:"settings",isVisible:this.currentAccount.authorities.includes("ROLE_ADMIN"),expanded:!1,child:[{label:"Price Config",route:"/price-config",icon:"account_balance",isVisible:this.currentAccount.authorities.includes("ROLE_ADMIN")},{label:"Config SYSTEM",route:"/price-manager/config-config",icon:"account_balance",isVisible:this.currentAccount.authorities.includes("ROLE_ADMIN")}]}]})}ngAfterViewInit(){this.elementRef.nativeElement.querySelectorAll(".mat-list-item-content").forEach(n=>{this.renderer.setStyle(n,"padding","0 0 0 0")})}onSelectParentItem(n){n.child.length>0&&(n.expanded=!n.expanded)}logout(){this.loginService.logout(),this.router.navigateByUrl("login")}}var I=[[".branding[_ngcontent-%COMP%]{display:contents;align-items:center;position:fixed;padding:0 16px;width:15rem;line-height:64px;top:0;left:0;z-index:999;color:#fff;transition:all .3s cubic-bezier(0.35, 0, 0.25, 1);overflow:hidden}.branding[_ngcontent-%COMP%]   .app-brand[_ngcontent-%COMP%]{width:100%;overflow:hidden;position:sticky;position:-webkit-sticky;top:0;z-index:1000;background-color:#28304b}.branding[_ngcontent-%COMP%]   .app-brand[_ngcontent-%COMP%]   .app-logo[_ngcontent-%COMP%]{width:64px;height:64px;float:left;display:flex;align-items:center;justify-content:center}.branding[_ngcontent-%COMP%]   .app-brand[_ngcontent-%COMP%]   .app-logo[_ngcontent-%COMP%]   img[_ngcontent-%COMP%]{width:30px;height:30px}.branding[_ngcontent-%COMP%]   .app-brand[_ngcontent-%COMP%]   .app-logo-text[_ngcontent-%COMP%]{text-align:center;font-weight:400;font-size:20px}.app-user[_ngcontent-%COMP%]{text-align:center;width:100%;padding:1rem 0;color:#fff}.app-user[_ngcontent-%COMP%]   img[_ngcontent-%COMP%]{width:100%;height:100%;border-radius:50%}.app-user[_ngcontent-%COMP%]   .app-user-photo[_ngcontent-%COMP%]{width:72px;margin:0 auto 8px;height:72px;box-sizing:border-box;padding:4px;border-radius:50%}.app-user[_ngcontent-%COMP%]   .app-user-name[_ngcontent-%COMP%]{display:block;font-size:.875rem;font-weight:300}.app-user[_ngcontent-%COMP%]   .app-user-controls[_ngcontent-%COMP%]{display:block}.app-user[_ngcontent-%COMP%]   .app-user-controls[_ngcontent-%COMP%]   .mat-icon-button[_ngcontent-%COMP%]{height:20px;width:20px;line-height:20px}.app-user[_ngcontent-%COMP%]   .app-user-controls[_ngcontent-%COMP%]   .mat-icon-button[_ngcontent-%COMP%]   .mat-icon[_ngcontent-%COMP%]{font-size:16px;line-height:20px !important;height:20px;width:20px}.active-list-item[_ngcontent-%COMP%]{color:#fff !important}.active-list-item[_ngcontent-%COMP%]   .mat-icon-parent[_ngcontent-%COMP%]{border-color:#fff !important}.active-list-item-child[_ngcontent-%COMP%]{color:#fff !important;background-color:#181e33 !important}.mat-nav-list[_ngcontent-%COMP%]{padding-top:0px}.mat-nav-list[_ngcontent-%COMP%]   .nav-item[_ngcontent-%COMP%] > a[_ngcontent-%COMP%]{height:48px;color:#a9a9a9}.mat-nav-list[_ngcontent-%COMP%]   .nav-item[_ngcontent-%COMP%] > a[_ngcontent-%COMP%]   .nav-caption-child[_ngcontent-%COMP%]{margin:0 0 0 32px}.mat-nav-list[_ngcontent-%COMP%]   a[_ngcontent-%COMP%]:hover{background:#181e33 !important}.mat-nav-list[_ngcontent-%COMP%]   .nav-item[_ngcontent-%COMP%] > a[_ngcontent-%COMP%]   .mat-icon-parent[_ngcontent-%COMP%]{text-align:center;margin-right:3px;height:48px;width:48px;font-size:18px;line-height:48px;padding:0 0 0 0;border-left:3px solid;border-color:transparent}.mat-nav-list[_ngcontent-%COMP%]   .nav-item[_ngcontent-%COMP%]   .mat-list-item[_ngcontent-%COMP%]   .mat-list-item-content[_ngcontent-%COMP%]{padding:0 16px 0 3px}.menu-button-icon[_ngcontent-%COMP%]{transition:300ms ease-in-out;transform:rotate(0deg);font-size:1rem;line-height:1;height:16px;width:16px;margin:0 16px 0 auto}.rotated[_ngcontent-%COMP%]{transform:rotate(90deg)}"]],S=e.Ib({encapsulation:0,styles:I,data:{}});function j(n){return e.gc(0,[(n()(),e.Kb(0,0,null,null,5,"mat-icon",[["class","menu-button-icon mat-icon notranslate"],["role","img"]],[[2,"mat-icon-inline",null],[2,"mat-icon-no-color",null]],null,null,M.b,M.a)),e.bc(512,null,W.G,W.H,[e.C,e.D,e.q,e.S]),e.Jb(2,278528,null,0,W.m,[W.G],{klass:[0,"klass"],ngClass:[1,"ngClass"]},null),e.Zb(3,{rotated:0}),e.Jb(4,9158656,null,0,C.b,[e.q,C.d,[8,null],[2,C.a],[2,e.r]],null,null),(n()(),e.ec(-1,0,[" navigate_next "]))],(function(n,l){var t=n(l,3,0,l.parent.parent.context.$implicit.expanded);n(l,2,0,"menu-button-icon",t),n(l,4,0)}),(function(n,l){n(l,0,0,e.Wb(l,4).inline,"primary"!==e.Wb(l,4).color&&"accent"!==e.Wb(l,4).color&&"warn"!==e.Wb(l,4).color)}))}function q(n){return e.gc(0,[(n()(),e.Kb(0,0,null,null,16,"a",[["class","mat-list-item"],["mat-list-item",""]],[[2,"mat-list-item-avatar",null],[2,"mat-list-item-with-avatar",null],[1,"target",0],[8,"href",4]],[[null,"click"]],(function(n,l,t){var i=!0,a=n.component;"click"===l&&(i=!1!==e.Wb(n,5).onClick(t.button,t.ctrlKey,t.metaKey,t.shiftKey)&&i);"click"===l&&(i=!1!==a.onSelectParentItem(n.parent.context.$implicit)&&i);return i}),w.c,w.a)),e.Jb(1,1228800,null,3,O.b,[e.q,e.j,[2,O.e],[2,O.a]],null,null),e.cc(603979776,1,{_lines:1}),e.cc(603979776,2,{_avatar:0}),e.cc(603979776,3,{_icon:0}),e.Jb(5,671744,null,0,P.p,[P.m,P.a,W.l],{routerLink:[0,"routerLink"]},null),(n()(),e.ec(-1,2,[" "])),(n()(),e.Kb(7,0,null,2,2,"mat-icon",[["class","mat-icon-parent mat-icon notranslate"],["role","img"]],[[2,"mat-icon-inline",null],[2,"mat-icon-no-color",null]],null,null,M.b,M.a)),e.Jb(8,9158656,null,0,C.b,[e.q,C.d,[8,null],[2,C.a],[2,e.r]],null,null),(n()(),e.ec(9,0,["",""])),(n()(),e.ec(-1,2,[" "])),(n()(),e.Kb(11,0,null,2,1,"span",[["class","nav-caption"]],null,null,null,null,null)),(n()(),e.ec(12,null,["",""])),(n()(),e.ec(-1,2,[" "])),(n()(),e.Ab(16777216,null,2,1,null,j)),e.Jb(15,16384,null,0,W.o,[e.hb,e.bb],{ngIf:[0,"ngIf"]},null),(n()(),e.ec(-1,2,[" "]))],(function(n,l){n(l,5,0,l.parent.context.$implicit.route),n(l,8,0),n(l,15,0,l.parent.context.$implicit.child.length>0)}),(function(n,l){n(l,0,0,e.Wb(l,1)._avatar||e.Wb(l,1)._icon,e.Wb(l,1)._avatar||e.Wb(l,1)._icon,e.Wb(l,5).target,e.Wb(l,5).href),n(l,7,0,e.Wb(l,8).inline,"primary"!==e.Wb(l,8).color&&"accent"!==e.Wb(l,8).color&&"warn"!==e.Wb(l,8).color),n(l,9,0,l.parent.context.$implicit.icon),n(l,12,0,l.parent.context.$implicit.label)}))}function T(n){return e.gc(0,[(n()(),e.Kb(0,0,null,null,12,"a",[["class","mat-list-item"],["mat-list-item",""]],[[2,"mat-list-item-avatar",null],[2,"mat-list-item-with-avatar",null],[1,"target",0],[8,"href",4]],[[null,"click"]],(function(n,l,t){var i=!0;"click"===l&&(i=!1!==e.Wb(n,5).onClick(t.button,t.ctrlKey,t.metaKey,t.shiftKey)&&i);return i}),w.c,w.a)),e.Jb(1,1228800,null,3,O.b,[e.q,e.j,[2,O.e],[2,O.a]],null,null),e.cc(603979776,4,{_lines:1}),e.cc(603979776,5,{_avatar:0}),e.cc(603979776,6,{_icon:0}),e.Jb(5,671744,[[8,4]],0,P.p,[P.m,P.a,W.l],{routerLink:[0,"routerLink"]},null),e.Jb(6,1720320,null,2,P.o,[P.m,e.q,e.S,[2,P.n],[2,P.p]],{routerLinkActive:[0,"routerLinkActive"]},null),e.cc(603979776,7,{links:1}),e.cc(603979776,8,{linksWithHrefs:1}),(n()(),e.ec(-1,2,[" "])),(n()(),e.Kb(10,0,null,2,1,"span",[["class","nav-caption-child"]],null,null,null,null,null)),(n()(),e.ec(11,null,["",""])),(n()(),e.ec(-1,2,[" "]))],(function(n,l){n(l,5,0,l.parent.context.$implicit.route);n(l,6,0,"active-list-item-child")}),(function(n,l){n(l,0,0,e.Wb(l,1)._avatar||e.Wb(l,1)._icon,e.Wb(l,1)._avatar||e.Wb(l,1)._icon,e.Wb(l,5).target,e.Wb(l,5).href),n(l,11,0,l.parent.context.$implicit.label)}))}function L(n){return e.gc(0,[(n()(),e.Kb(0,0,null,null,4,"div",[["class","nav-item"]],null,null,null,null,null)),(n()(),e.ec(-1,null,[" "])),(n()(),e.Ab(16777216,null,null,1,null,T)),e.Jb(3,16384,null,0,W.o,[e.hb,e.bb],{ngIf:[0,"ngIf"]},null),(n()(),e.ec(-1,null,[" "]))],(function(n,l){n(l,3,0,l.context.$implicit.isVisible)}),null)}function z(n){return e.gc(0,[(n()(),e.Kb(0,0,null,null,4,"div",[],null,null,null,null,null)),(n()(),e.ec(-1,null,[" "])),(n()(),e.Ab(16777216,null,null,1,null,L)),e.Jb(3,278528,null,0,W.n,[e.hb,e.bb,e.C],{ngForOf:[0,"ngForOf"]},null),(n()(),e.ec(-1,null,[" "]))],(function(n,l){n(l,3,0,l.parent.context.$implicit.child)}),null)}function R(n){return e.gc(0,[(n()(),e.Kb(0,0,null,null,7,"div",[["class","nav-item"]],null,null,null,null,null)),(n()(),e.ec(-1,null,[" "])),(n()(),e.Ab(16777216,null,null,1,null,q)),e.Jb(3,16384,null,0,W.o,[e.hb,e.bb],{ngIf:[0,"ngIf"]},null),(n()(),e.ec(-1,null,[" "])),(n()(),e.Ab(16777216,null,null,1,null,z)),e.Jb(6,16384,null,0,W.o,[e.hb,e.bb],{ngIf:[0,"ngIf"]},null),(n()(),e.ec(-1,null,[" "]))],(function(n,l){n(l,3,0,l.context.$implicit.isVisible),n(l,6,0,l.context.$implicit.child.length>0&&l.context.$implicit.expanded)}),null)}function V(n){return e.gc(0,[(n()(),e.Kb(0,0,null,null,7,"div",[["class","branding"]],null,null,null,null,null)),(n()(),e.ec(-1,null,[" "])),(n()(),e.Kb(2,0,null,null,4,"div",[["class","app-brand"]],null,null,null,null,null)),(n()(),e.ec(-1,null,[" "])),(n()(),e.Kb(4,0,null,null,1,"div",[["class","app-logo-text"]],null,null,null,null,null)),(n()(),e.ec(-1,null,["Billing Server"])),(n()(),e.ec(-1,null,[" "])),(n()(),e.ec(-1,null,[" "])),(n()(),e.ec(-1,null,[" "])),(n()(),e.Kb(9,0,null,null,9,"div",[["class","app-user"]],null,null,null,null,null)),(n()(),e.ec(-1,null,[" "])),(n()(),e.Kb(11,0,null,null,3,"div",[["class","app-user-photo"]],null,null,null,null,null)),(n()(),e.ec(-1,null,[" "])),(n()(),e.Kb(13,0,null,null,0,"img",[["alt",""],["class","mat-elevation-z1"],["src","content/2357ccb0b8a6f67e099a4953d90fd3b5.png"]],null,null,null,null,null)),(n()(),e.ec(-1,null,[" "])),(n()(),e.ec(-1,null,[" "])),(n()(),e.Kb(16,0,null,null,1,"div",[["class","app-user-name mb-2"]],null,null,null,null,null)),(n()(),e.ec(17,null,[" "," "])),(n()(),e.ec(-1,null,[" "])),(n()(),e.ec(-1,null,[" "])),(n()(),e.Kb(20,0,null,null,1,"mat-divider",[["class","mat-divider"],["role","separator"]],[[1,"aria-orientation",0],[2,"mat-divider-vertical",null],[2,"mat-divider-horizontal",null],[2,"mat-divider-inset",null]],null,null,k.b,k.a)),e.Jb(21,49152,null,0,y.a,[],null,null),(n()(),e.ec(-1,null,[" "])),(n()(),e.Kb(23,0,null,null,5,"mat-nav-list",[["class","mat-nav-list mat-list-base"],["role","navigation"]],null,null,null,w.d,w.b)),e.Jb(24,704512,null,0,O.e,[],null,null),(n()(),e.ec(-1,0,[" "])),(n()(),e.Ab(16777216,null,0,1,null,R)),e.Jb(27,278528,null,0,W.n,[e.hb,e.bb,e.C],{ngForOf:[0,"ngForOf"]},null),(n()(),e.ec(-1,0,[" "])),(n()(),e.ec(-1,null,[" "]))],(function(n,l){n(l,27,0,l.component.links)}),(function(n,l){n(l,17,0,l.component.lastName),n(l,20,0,e.Wb(l,21).vertical?"vertical":"horizontal",e.Wb(l,21).vertical,!e.Wb(l,21).vertical,e.Wb(l,21).inset)}))}e.Gb("jhi-sidebar",J,(function(n){return e.gc(0,[(n()(),e.Kb(0,0,null,null,1,"jhi-sidebar",[],null,null,null,V,S)),e.Jb(1,4308992,null,0,J,[e.q,e.S,K.a,P.m,A.a],null,null)],(function(n,l){n(l,1,0)}),null)}),{},{},[]);var D=t(738),E=t(210),N=t(89),$=t(55),G=t(736),H=t(128),B=t(25),F=t(13);class Y{constructor(n,l){this.loginService=n,this.router=l,this.loginType=localStorage.getItem("loginType")}logout(){this.loginService.logout(),this.router.navigateByUrl("login")}changePassword(){this.router.navigate(["account/password"])}}var X=[[".img-button[_ngcontent-%COMP%]   img[_ngcontent-%COMP%]{width:32px;height:32px;border-radius:50%}.topbar-button-right[_ngcontent-%COMP%]{margin:0 .5rem !important}.user-menu[_ngcontent-%COMP%]{width:170px !important}"]],Z=e.Ib({encapsulation:0,styles:X,data:{}});function Q(n){return e.gc(0,[(n()(),e.Kb(0,0,null,null,10,"button",[["class","user-menu mat-menu-item"],["mat-menu-item",""]],[[1,"role",0],[2,"mat-menu-item-highlighted",null],[2,"mat-menu-item-submenu-trigger",null],[1,"tabindex",0],[1,"aria-disabled",0],[1,"disabled",0]],[[null,"click"],[null,"mouseenter"]],(function(n,l,t){var i=!0,a=n.component;"click"===l&&(i=!1!==e.Wb(n,1)._checkDisabled(t)&&i);"mouseenter"===l&&(i=!1!==e.Wb(n,1)._handleMouseEnter()&&i);"click"===l&&(i=!1!==a.changePassword()&&i);return i}),G.c,G.a)),e.Jb(1,180224,[[1,4],[2,4]],0,H.e,[e.q,W.d,v.h,[2,H.b]],null,null),(n()(),e.ec(-1,0,[" "])),(n()(),e.Kb(3,0,null,0,2,"mat-icon",[["class","mat-icon notranslate"],["role","img"],["style","margin-right: 16px; vertical-align: middle;"]],[[2,"mat-icon-inline",null],[2,"mat-icon-no-color",null]],null,null,M.b,M.a)),e.Jb(4,9158656,null,0,C.b,[e.q,C.d,[8,null],[2,C.a],[2,e.r]],null,null),(n()(),e.ec(-1,0,["apps"])),(n()(),e.ec(-1,0,[" "])),(n()(),e.Kb(7,0,null,0,2,"span",[],null,null,null,null,null)),(n()(),e.ec(8,null,["",""])),e.Yb(131072,B.h,[B.i,e.j]),(n()(),e.ec(-1,0,[" "]))],(function(n,l){n(l,4,0)}),(function(n,l){n(l,0,0,e.Wb(l,1).role,e.Wb(l,1)._highlighted,e.Wb(l,1)._triggersSubmenu,e.Wb(l,1)._getTabIndex(),e.Wb(l,1).disabled.toString(),e.Wb(l,1).disabled||null),n(l,3,0,e.Wb(l,4).inline,"primary"!==e.Wb(l,4).color&&"accent"!==e.Wb(l,4).color&&"warn"!==e.Wb(l,4).color),n(l,8,0,e.fc(l,8,0,e.Wb(l,9).transform("global.menu.account.changepassword")))}))}function nn(n){return e.gc(0,[(n()(),e.Kb(0,16777216,null,null,5,"button",[["aria-haspopup","true"],["class","topbar-button-right img-button mat-menu-trigger"],["mat-icon-button",""]],[[1,"disabled",0],[2,"_mat-animation-noopable",null],[1,"aria-expanded",0]],[[null,"mousedown"],[null,"keydown"],[null,"click"]],(function(n,l,t){var i=!0;"mousedown"===l&&(i=!1!==e.Wb(n,2)._handleMousedown(t)&&i);"keydown"===l&&(i=!1!==e.Wb(n,2)._handleKeydown(t)&&i);"click"===l&&(i=!1!==e.Wb(n,2)._handleClick(t)&&i);return i}),N.b,N.a)),e.Jb(1,180224,null,0,$.b,[e.q,v.h,[2,_.a]],null,null),e.Jb(2,1196032,null,0,H.g,[F.b,e.q,e.hb,H.c,[2,H.d],[8,null],[2,f.b],v.h],{menu:[0,"menu"]},null),(n()(),e.ec(-1,0,[" "])),(n()(),e.Kb(4,0,null,0,0,"img",[["alt",""],["class","mat-elevation-z1"],["src","content/2357ccb0b8a6f67e099a4953d90fd3b5.png"]],null,null,null,null,null)),(n()(),e.ec(-1,0,[" "])),(n()(),e.ec(-1,null,[" "])),(n()(),e.Kb(7,0,null,null,22,"mat-menu",[["yPosition","below"]],null,null,null,G.d,G.b)),e.bc(6144,null,H.d,null,[H.h]),e.bc(6144,null,H.b,null,[H.d]),e.Jb(10,1294336,[["userMenu",4]],3,H.h,[e.q,e.K,H.a],{yPosition:[0,"yPosition"]},null),e.cc(603979776,1,{_allItems:1}),e.cc(603979776,2,{items:1}),e.cc(603979776,3,{lazyContent:0}),(n()(),e.ec(-1,0,[" "])),(n()(),e.Ab(16777216,null,0,1,null,Q)),e.Jb(16,16384,null,0,W.o,[e.hb,e.bb],{ngIf:[0,"ngIf"]},null),(n()(),e.ec(-1,0,[" "])),(n()(),e.Kb(18,0,null,0,10,"button",[["class","user-menu mat-menu-item"],["mat-menu-item",""]],[[1,"role",0],[2,"mat-menu-item-highlighted",null],[2,"mat-menu-item-submenu-trigger",null],[1,"tabindex",0],[1,"aria-disabled",0],[1,"disabled",0]],[[null,"click"],[null,"mouseenter"]],(function(n,l,t){var i=!0,a=n.component;"click"===l&&(i=!1!==e.Wb(n,19)._checkDisabled(t)&&i);"mouseenter"===l&&(i=!1!==e.Wb(n,19)._handleMouseEnter()&&i);"click"===l&&(i=!1!==a.logout()&&i);return i}),G.c,G.a)),e.Jb(19,180224,[[1,4],[2,4]],0,H.e,[e.q,W.d,v.h,[2,H.b]],null,null),(n()(),e.ec(-1,0,[" "])),(n()(),e.Kb(21,0,null,0,2,"mat-icon",[["class","mat-icon notranslate"],["role","img"],["style","margin-right: 16px; vertical-align: middle;"]],[[2,"mat-icon-inline",null],[2,"mat-icon-no-color",null]],null,null,M.b,M.a)),e.Jb(22,9158656,null,0,C.b,[e.q,C.d,[8,null],[2,C.a],[2,e.r]],null,null),(n()(),e.ec(-1,0,["exit_to_app"])),(n()(),e.ec(-1,0,[" "])),(n()(),e.Kb(25,0,null,0,2,"span",[],null,null,null,null,null)),(n()(),e.ec(26,null,["",""])),e.Yb(131072,B.h,[B.i,e.j]),(n()(),e.ec(-1,0,[" "])),(n()(),e.ec(-1,0,[" "])),(n()(),e.ec(-1,null,[" "]))],(function(n,l){var t=l.component;n(l,2,0,e.Wb(l,10));n(l,10,0,"below"),n(l,16,0,"0"===t.loginType),n(l,22,0)}),(function(n,l){n(l,0,0,e.Wb(l,1).disabled||null,"NoopAnimations"===e.Wb(l,1)._animationMode,e.Wb(l,2).menuOpen||null),n(l,18,0,e.Wb(l,19).role,e.Wb(l,19)._highlighted,e.Wb(l,19)._triggersSubmenu,e.Wb(l,19)._getTabIndex(),e.Wb(l,19).disabled.toString(),e.Wb(l,19).disabled||null),n(l,21,0,e.Wb(l,22).inline,"primary"!==e.Wb(l,22).color&&"accent"!==e.Wb(l,22).color&&"warn"!==e.Wb(l,22).color),n(l,26,0,e.fc(l,26,0,e.Wb(l,27).transform("global.menu.account.logout")))}))}e.Gb("jhi-header",Y,(function(n){return e.gc(0,[(n()(),e.Kb(0,0,null,null,1,"jhi-header",[],null,null,null,nn,Z)),e.Jb(1,49152,null,0,Y,[K.a,P.m],null,null)],null,null)}),{},{},[]);var ln=t(386);class tn{constructor(n,l){this.router=n,this.jhiLanguageHelper=l,this.screenWidth=window.innerWidth,window.onresize=()=>{this.screenWidth=window.innerWidth}}getPageTitle(n){let l=n.data&&n.data.pageTitle?n.data.pageTitle:"jhipsterbaseApp";return n.firstChild&&(l=this.getPageTitle(n.firstChild)||l),l}ngOnInit(){this.router.events.subscribe(n=>{n instanceof P.d&&this.jhiLanguageHelper.updateTitle(this.getPageTitle(this.router.routerState.snapshot.root)),n instanceof P.e&&404===n.error.status&&this.router.navigate(["/404"])})}}var en=[[".mat-toolbar[_ngcontent-%COMP%]{background:#fff !important;color:rgba(0,0,0,.87) !important;position:relative;box-shadow:0 3px 1px -2px rgba(0,0,0,.2),0 2px 2px 0 rgba(0,0,0,.14),0 1px 5px 0 rgba(0,0,0,.12);z-index:1001}mat-sidenav[_ngcontent-%COMP%]{width:240px;background-color:#28304b}.app-toolbar[_ngcontent-%COMP%]{position:sticky;position:-webkit-sticky;top:0;z-index:1000}"]],an=e.Ib({encapsulation:0,styles:en,data:{}});function on(n){return e.gc(0,[(n()(),e.Kb(0,0,null,null,39,"mat-sidenav-container",[["class","mat-drawer-container mat-sidenav-container"],["fullscreen",""]],[[2,"mat-drawer-container-explicit-backdrop",null]],null,null,p.d,p.b)),e.Jb(1,1490944,null,2,h.f,[[2,f.b],e.q,e.K,e.j,U.e,h.a,[2,_.a]],null,null),e.cc(603979776,1,{_drawers:1}),e.cc(603979776,2,{_content:0}),(n()(),e.ec(-1,2,[" "])),(n()(),e.Kb(5,0,null,0,5,"mat-sidenav",[["class","mat-drawer mat-sidenav"],["position","start"],["tabIndex","-1"]],[[1,"align",0],[2,"mat-drawer-end",null],[2,"mat-drawer-over",null],[2,"mat-drawer-push",null],[2,"mat-drawer-side",null],[2,"mat-drawer-opened",null],[2,"mat-sidenav-fixed",null],[4,"top","px"],[4,"bottom","px"],[40,"@transform",0]],[["component","@transform.start"],["component","@transform.done"]],(function(n,l,t){var i=!0;"component:@transform.start"===l&&(i=!1!==e.Wb(n,6)._animationStartListener(t)&&i);"component:@transform.done"===l&&(i=!1!==e.Wb(n,6)._animationDoneListener(t)&&i);return i}),p.f,p.a)),e.Jb(6,3325952,[[1,4],["sidenav",4]],0,h.e,[e.q,v.i,v.h,x.a,e.K,[2,W.d]],{position:[0,"position"],mode:[1,"mode"],opened:[2,"opened"]},null),(n()(),e.ec(-1,0,[" "])),(n()(),e.Kb(8,0,null,0,1,"jhi-sidebar",[],null,null,null,V,S)),e.Jb(9,4308992,null,0,J,[e.q,e.S,K.a,P.m,A.a],null,null),(n()(),e.ec(-1,0,[" "])),(n()(),e.ec(-1,2,[" "])),(n()(),e.Kb(12,0,null,1,26,"mat-sidenav-content",[["class","mat-drawer-content mat-sidenav-content"]],[[4,"margin-left","px"],[4,"margin-right","px"]],null,null,p.e,p.c)),e.Jb(13,1294336,[[2,4]],0,h.g,[e.j,h.f,e.q,U.b,e.K],null,null),(n()(),e.ec(-1,0,[" "])),(n()(),e.Kb(15,0,null,0,16,"mat-toolbar",[["class","app-toolbar mat-toolbar"],["color","primary"]],[[2,"mat-toolbar-multiple-rows",null],[2,"mat-toolbar-single-row",null]],null,null,D.b,D.a)),e.Jb(16,4243456,null,1,E.a,[e.q,x.a,W.d],{color:[0,"color"]},null),e.cc(603979776,3,{_toolbarRows:1}),(n()(),e.ec(-1,0,[" "])),(n()(),e.Kb(19,0,null,0,6,"button",[["mat-icon-button",""]],[[1,"disabled",0],[2,"_mat-animation-noopable",null]],[[null,"click"]],(function(n,l,t){var i=!0;"click"===l&&(i=!1!==e.Wb(n,6).toggle()&&i);return i}),N.b,N.a)),e.Jb(20,180224,null,0,$.b,[e.q,v.h,[2,_.a]],null,null),(n()(),e.ec(-1,0,[" "])),(n()(),e.Kb(22,0,null,0,2,"mat-icon",[["class","mat-icon notranslate"],["role","img"]],[[2,"mat-icon-inline",null],[2,"mat-icon-no-color",null]],null,null,M.b,M.a)),e.Jb(23,9158656,null,0,C.b,[e.q,C.d,[8,null],[2,C.a],[2,e.r]],null,null),(n()(),e.ec(-1,0,["menu"])),(n()(),e.ec(-1,0,[" "])),(n()(),e.ec(-1,0,[" "])),(n()(),e.Kb(27,0,null,0,0,"span",[["fxflex",""],["style","flex: 1 1 0%; box-sizing: border-box;"]],null,null,null,null,null)),(n()(),e.ec(-1,0,[" "])),(n()(),e.Kb(29,0,null,0,1,"jhi-header",[],null,null,null,nn,Z)),e.Jb(30,49152,null,0,Y,[K.a,P.m],null,null),(n()(),e.ec(-1,0,[" "])),(n()(),e.ec(-1,0,[" "])),(n()(),e.Kb(33,0,null,0,4,"div",[["class","main-content"]],null,null,null,null,null)),(n()(),e.ec(-1,null,[" "])),(n()(),e.Kb(35,16777216,null,null,1,"router-outlet",[],null,null,null,null,null)),e.Jb(36,212992,null,0,P.r,[P.b,e.hb,e.m,[8,null],e.j],null,null),(n()(),e.ec(-1,null,[" "])),(n()(),e.ec(-1,0,[" "])),(n()(),e.ec(-1,2,[" "])),(n()(),e.ec(-1,null,[" "]))],(function(n,l){var t=l.component;n(l,1,0);n(l,6,0,"start",t.screenWidth>=960?"side":"over",t.screenWidth>=960),n(l,9,0),n(l,13,0);n(l,16,0,"primary"),n(l,23,0),n(l,36,0)}),(function(n,l){n(l,0,0,e.Wb(l,1)._backdropOverride);n(l,5,0,null,"end"===e.Wb(l,6).position,"over"===e.Wb(l,6).mode,"push"===e.Wb(l,6).mode,"side"===e.Wb(l,6).mode,e.Wb(l,6).opened,e.Wb(l,6).fixedInViewport,e.Wb(l,6).fixedInViewport?e.Wb(l,6).fixedTopGap:null,e.Wb(l,6).fixedInViewport?e.Wb(l,6).fixedBottomGap:null,e.Wb(l,6)._animationState),n(l,12,0,e.Wb(l,13)._container._contentMargins.left,e.Wb(l,13)._container._contentMargins.right),n(l,15,0,e.Wb(l,16)._toolbarRows.length>0,0===e.Wb(l,16)._toolbarRows.length),n(l,19,0,e.Wb(l,20).disabled||null,"NoopAnimations"===e.Wb(l,20)._animationMode),n(l,22,0,e.Wb(l,23).inline,"primary"!==e.Wb(l,23).color&&"accent"!==e.Wb(l,23).color&&"warn"!==e.Wb(l,23).color)}))}var un=e.Gb("jhi-layout",tn,(function(n){return e.gc(0,[(n()(),e.Kb(0,0,null,null,1,"jhi-layout",[],null,null,null,on,an)),e.Jb(1,114688,null,0,tn,[P.m,ln.a],null,null)],(function(n,l){n(l,1,0)}),null)}),{},{},[]),cn=t(15),rn=t(4),bn=t(163),sn=t(59),dn=t(5),gn=t(45),mn=t(36),pn=t(129),hn=t(76),fn=t(17),Un=t(143),_n=t(144),vn=t(145),xn=t(62),Wn=t(11),Mn=t(53),Cn=t(212),wn=t(23),On=t(216),Pn=t(98),kn=t(217),yn=t(204),Kn=t(164),An=t(179),Jn=t(130),In=t(218),Sn=t(70),jn=t(219),qn=t(117),Tn=t(161),Ln=t(220),zn=t(221),Rn=t(222),Vn=t(223),Dn=t(165),En=t(81),Nn=t(77),$n=t(46),Gn=t(211),Hn=t(209),Bn=t(224),Fn=t(213),Yn=t(44),Xn=t(2),Zn=t(30),Qn=t(203),nl=t(214);const ll=()=>t.e(23).then(t.bind(null,764)).then(n=>n.ViewsRoutingModuleNgFactory);class tl{}var el=t(9);t.d(l,"JhipsterLayoutModuleNgFactory",(function(){return il}));var il=e.Hb(i,[],(function(n){return e.Tb([e.Ub(512,e.m,e.tb,[[8,[a.a,a.b,a.j,a.k,a.g,a.h,a.i,o.u,u.b,u.a,c.a,r.a,b.b,b.a,s.a,d.a,d.b,g.a,m.a,un]],[3,e.m],e.I]),e.Ub(4608,cn.A,cn.A,[]),e.Ub(4608,W.q,W.p,[e.E,[2,W.J]]),e.Ub(4608,rn.u,rn.u,[e.m,e.A,rn.ob,rn.v]),e.Ub(4608,cn.f,cn.f,[]),e.Ub(4608,F.b,F.b,[F.h,F.d,e.m,F.g,F.e,e.A,e.K,W.d,f.b,[2,W.k]]),e.Ub(5120,F.i,F.j,[F.b]),e.Ub(5120,bn.a,bn.b,[F.b]),e.Ub(4608,sn.c,sn.c,[]),e.Ub(4608,dn.d,dn.d,[]),e.Ub(5120,gn.b,gn.c,[F.b]),e.Ub(135680,gn.d,gn.d,[F.b,e.A,[2,W.k],[2,gn.a],gn.b,[3,gn.d],F.d]),e.Ub(4608,mn.i,mn.i,[]),e.Ub(5120,mn.a,mn.b,[F.b]),e.Ub(5120,H.c,H.j,[F.b]),e.Ub(4608,dn.c,dn.z,[[2,dn.h],x.a]),e.Ub(5120,pn.a,pn.b,[F.b]),e.Ub(5120,hn.a,hn.b,[F.b]),e.Ub(4608,fn.f,dn.e,[[2,dn.i],[2,dn.n]]),e.Ub(5120,Un.b,Un.a,[[3,Un.b]]),e.Ub(5120,_n.b,_n.a,[[3,_n.b]]),e.Ub(5120,vn.b,vn.a,[[3,vn.b]]),e.Ub(135680,v.h,v.h,[e.K,x.a]),e.Ub(4608,xn.f,xn.f,[e.bb]),e.Ub(5120,fn.j,fn.u,[W.d,e.c]),e.Ub(1073742336,cn.z,cn.z,[]),e.Ub(1073742336,cn.k,cn.k,[]),e.Ub(1073742336,W.c,W.c,[]),e.Ub(1073742336,rn.c,rn.c,[]),e.Ub(1073742336,rn.g,rn.g,[]),e.Ub(1073742336,rn.h,rn.h,[]),e.Ub(1073742336,rn.l,rn.l,[]),e.Ub(1073742336,rn.m,rn.m,[]),e.Ub(1073742336,rn.r,rn.r,[]),e.Ub(1073742336,rn.s,rn.s,[]),e.Ub(1073742336,rn.w,rn.w,[]),e.Ub(1073742336,rn.D,rn.D,[]),e.Ub(1073742336,rn.J,rn.J,[]),e.Ub(1073742336,rn.M,rn.M,[]),e.Ub(1073742336,rn.P,rn.P,[]),e.Ub(1073742336,rn.S,rn.S,[]),e.Ub(1073742336,rn.X,rn.X,[]),e.Ub(1073742336,rn.ab,rn.ab,[]),e.Ub(1073742336,rn.bb,rn.bb,[]),e.Ub(1073742336,rn.cb,rn.cb,[]),e.Ub(1073742336,rn.x,rn.x,[]),e.Ub(1073742336,Wn.p,Wn.p,[]),e.Ub(1073742336,Mn.j,Mn.j,[]),e.Ub(1073742336,cn.u,cn.u,[]),e.Ub(1073742336,B.f,B.f,[]),e.Ub(1073742336,Cn.a,Cn.a,[]),e.Ub(1073742336,f.a,f.a,[]),e.Ub(1073742336,dn.n,dn.n,[[2,dn.f],[2,fn.g]]),e.Ub(1073742336,x.b,x.b,[]),e.Ub(1073742336,dn.y,dn.y,[]),e.Ub(1073742336,dn.w,dn.w,[]),e.Ub(1073742336,dn.t,dn.t,[]),e.Ub(1073742336,wn.h,wn.h,[]),e.Ub(1073742336,U.c,U.c,[]),e.Ub(1073742336,F.f,F.f,[]),e.Ub(1073742336,bn.c,bn.c,[]),e.Ub(1073742336,sn.d,sn.d,[]),e.Ub(1073742336,v.a,v.a,[]),e.Ub(1073742336,On.a,On.a,[]),e.Ub(1073742336,Pn.c,Pn.c,[]),e.Ub(1073742336,$.c,$.c,[]),e.Ub(1073742336,kn.a,kn.a,[]),e.Ub(1073742336,yn.e,yn.e,[]),e.Ub(1073742336,Kn.b,Kn.b,[]),e.Ub(1073742336,Kn.a,Kn.a,[]),e.Ub(1073742336,An.b,An.b,[]),e.Ub(1073742336,gn.g,gn.g,[]),e.Ub(1073742336,mn.j,mn.j,[]),e.Ub(1073742336,y.b,y.b,[]),e.Ub(1073742336,Jn.c,Jn.c,[]),e.Ub(1073742336,In.a,In.a,[]),e.Ub(1073742336,Sn.d,Sn.d,[]),e.Ub(1073742336,dn.p,dn.p,[]),e.Ub(1073742336,jn.a,jn.a,[]),e.Ub(1073742336,C.c,C.c,[]),e.Ub(1073742336,qn.c,qn.c,[]),e.Ub(1073742336,Tn.c,Tn.c,[]),e.Ub(1073742336,O.c,O.c,[]),e.Ub(1073742336,H.i,H.i,[]),e.Ub(1073742336,H.f,H.f,[]),e.Ub(1073742336,dn.A,dn.A,[]),e.Ub(1073742336,dn.q,dn.q,[]),e.Ub(1073742336,pn.c,pn.c,[]),e.Ub(1073742336,hn.c,hn.c,[]),e.Ub(1073742336,Un.c,Un.c,[]),e.Ub(1073742336,Ln.a,Ln.a,[]),e.Ub(1073742336,zn.a,zn.a,[]),e.Ub(1073742336,Rn.a,Rn.a,[]),e.Ub(1073742336,h.h,h.h,[]),e.Ub(1073742336,Vn.a,Vn.a,[]),e.Ub(1073742336,Dn.b,Dn.b,[]),e.Ub(1073742336,Dn.a,Dn.a,[]),e.Ub(1073742336,En.d,En.d,[]),e.Ub(1073742336,_n.c,_n.c,[]),e.Ub(1073742336,Nn.e,Nn.e,[]),e.Ub(1073742336,vn.c,vn.c,[]),e.Ub(1073742336,$n.q,$n.q,[]),e.Ub(1073742336,Gn.b,Gn.b,[]),e.Ub(1073742336,Hn.j,Hn.j,[]),e.Ub(1073742336,E.b,E.b,[]),e.Ub(1073742336,xn.d,xn.d,[]),e.Ub(1073742336,Bn.a,Bn.a,[]),e.Ub(1073742336,Fn.a,Fn.a,[]),e.Ub(1073742336,Yn.Hb,Yn.Hb,[]),e.Ub(1073742336,Yn.Be,Yn.Be,[]),e.Ub(1073742336,Yn.dh,Yn.dh,[]),e.Ub(1073742336,Yn.jg,Yn.jg,[]),e.Ub(1073742336,Yn.Tb,Yn.Tb,[]),e.Ub(1073742336,Yn.fc,Yn.fc,[]),e.Ub(1073742336,Yn.xc,Yn.xc,[]),e.Ub(1073742336,Yn.Jf,Yn.Jf,[]),e.Ub(1073742336,Yn.Rf,Yn.Rf,[]),e.Ub(1073742336,Xn.d,Xn.d,[W.d,e.K,[2,Zn.l]]),e.Ub(1073742336,Xn.g,Xn.g,[]),e.Ub(1073742336,fn.b,fn.b,[]),e.Ub(1073742336,Qn.b,Qn.b,[]),e.Ub(1073742336,nl.a,nl.a,[]),e.Ub(1073742336,P.q,P.q,[[2,P.v],[2,P.m]]),e.Ub(1073742336,tl,tl,[]),e.Ub(1073742336,i,i,[]),e.Ub(256,An.a,{separatorKeyCodes:[el.f]},[]),e.Ub(256,dn.g,dn.k,[]),e.Ub(1024,P.k,(function(){return[[{path:"",component:tn,children:[{path:"",loadChildren:ll}]}]]}),[])])}))}}]);