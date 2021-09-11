Received: from mail-lj1-f202.google.com (mail-lj1-f202.google.com [209.85.208.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4827E2FB2
	for <linux-staging@lists.linux.dev>; Sat, 11 Sep 2021 03:09:45 +0000 (UTC)
Received: by mail-lj1-f202.google.com with SMTP id v16-20020a2e7a10000000b001ba9e312de6so1668298ljc.21
        for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 20:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:reply-to:sender:message-id:date:subject:from:to;
        bh=yPzEnuzfInRfVM9Go6+ieXKR4D2qVqPMLEcL7DvNa6w=;
        b=pRdeK652nmB2MbBU3hJ6mI7nOBkoi1mCv7R9wknfQlNkCE5YefF8uKbAE/UhEtkHV5
         OeMg0366Ogll4WjmBmoJGwv6KkBM/2vc1IqyLgY3bQPbArrvjjF8CppfZvgkro7sR0Pl
         sEqcN+347DOg0nbBwFV5GkqsVLmsWyKxfFl1ijl1W3akwEvTwxDgTg1i39Sf/2SO7ftG
         StaPGz1qUEyQTmBfrhQEtbMh5g2vHWhNUe/hGFy6ukXDfsrSddFt+BVyf+PGbQDdqZKo
         GNbZJ0j9Bm7B+QPqkFcr8lpvis3pULPcVgNvdWbL2uL9fa6bnh4KuMdvKvkw8o2ZOQ8N
         TDOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:message-id:date:subject:from:to;
        bh=yPzEnuzfInRfVM9Go6+ieXKR4D2qVqPMLEcL7DvNa6w=;
        b=bvgNuUQckQSyd44EXmGJ3R/q5jbuIXxIQnwYRxVXWe40NTegs2hs8lAtz04gzakfsg
         sN66xSZGP5BdOWTkrBwPXzKyR7V429+Y2pfREYOAgj48EGVlsyhIM3CuZx+IzSVs16sS
         pq08zQLphnMcatbq1YqyR/N8w6tiHF+fzy2OxfvSCquwzgOxucxDCosNGi+oTlutWGZp
         FAkVqznCwe1aeCjBgXIMyFuH8Qot7iM0sxfzDK/0UlEfAfyKJM9UnJyTOtI299pE8sif
         HMer3JRiILThLh9os0g/f40ulA+dTiorQeEVpp3/40wR14j94obDdR1RrXScLuwEIS7I
         VI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:message-id:date
         :subject:from:to;
        bh=yPzEnuzfInRfVM9Go6+ieXKR4D2qVqPMLEcL7DvNa6w=;
        b=l9/sdRrAU7xYjZdC+PgCsTLbGyMMDBYqKAT+fqVDzv6KeISF77XoNN8YWr+D/Vt/nl
         QaV3vefgzttfR52/K9WkIm19O0huhnQSSXkRpe/PTFo+HmD1qaY3z0g+A8LhScTiv4Hj
         dBRQuUJp965cT9QTHJKb9sLe9lgFXX0pTGhaDUNt8bT8OybdNcwzmRWrsYc+pTAUppXc
         UxyYLK45L8UPBTq6Ac73/5FQl5FcdGy+1bQyg3LRtHKp6+qyCyvlEfFOmz5Lxb4M4iLe
         OQgvtxNfubsc07WyyY8W0e2nV2yxfZNY0vffxC9BxrHpufpsO701ZIiVqEZzimSxGTZQ
         KlyA==
X-Gm-Message-State: AOAM5333+YSeIq45uvqgY29RM4nkiGsqnsTTzPzaa0ygZRMszXJgOLyq
	xjgn9rrs4jXRsYWxU1pTWOYqt9UopNchw1K56oOk
X-Google-Smtp-Source: ABdhPJzXsyi8Gf0ewm6XU4GJcdSCNZY8YgS5hobF7iiQBnC0Qrpz6J8Q3VFi/p0VnNS6OOt6ylNnd5pm3HJ/g938cJVg
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a2e:8e62:: with SMTP id t2mr654887ljk.477.1631329783257;
 Fri, 10 Sep 2021 20:09:43 -0700 (PDT)
Reply-To: fmdefrancesco@gmail.com
Sender: Google Calendar <calendar-notification@google.com>
Message-ID: <0000000000003e20a705cbaf90c0@google.com>
Date: Sat, 11 Sep 2021 03:09:43 +0000
Subject: Invitation: [PATCH] staging: rtl8723bs: remove possible deadlock
 when... @ Sat 2021-09-11 05:30 - 06:30 (CEST) (linux-staging@lists.linux.dev)
From: fmdefrancesco@gmail.com
To: linux-staging@lists.linux.dev
Content-Type: multipart/mixed; boundary="0000000000003e209405cbaf90bf"

--0000000000003e209405cbaf90bf
Content-Type: multipart/alternative; boundary="0000000000003e209205cbaf90bd"

--0000000000003e209205cbaf90bd
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

WW91IGhhdmUgYmVlbiBpbnZpdGVkIHRvIHRoZSBmb2xsb3dpbmcgZXZlbnQuDQoNClRpdGxlOiBb
UEFUQ0hdIHN0YWdpbmc6IHJ0bDg3MjNiczogcmVtb3ZlIHBvc3NpYmxlIGRlYWRsb2NrIHdoZW4g
ZGlzY29ubmVjdA0KSGksDQoNCg0KT24gOS8yLzIxIDExOjM1IEFNLCBGYWJpbyBBaXV0byB3cm90
ZToNCiZndDsgd2hlbiB0dXJuaW5nIG9mZiBhIGNvbm5lY3Rpb24sIGxvY2tkZXAgY29tcGxhaW5z
IHdpdGggdGhlDQomZ3Q7IGZvbGxvd2luZyB3YXJuaW5nIChhIG1vZHByb2JlIGhhcyBiZWVuIGRv
bmUgYnV0IHRoZSBzYW1lDQomZ3Q7IGhhcHBlbnMgd2l0aCBhIGRpc2Nvbm5lY3Rpb24gZnJvbSBO
ZXR3b3JrTWFuYWdlciwNCiZndDsgaXQncyBlbm91Z2ggdG8gdHJpZ2dlciBhIGNmZzgwMjExX2Rp
c2Nvbm5lY3QgY2FsbCk6DQomZ3Q7DQomZ3Q7IFsgIDY4Mi44NTU4NjddID09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KJmd0OyBbICA2ODIuODU1
ODc3XSBXQVJOSU5HOiBwb3NzaWJsZSBjaXJjdWxhciBsb2NraW5nIGRlcGVuZGVuY3kgZGV0ZWN0
ZWQNCiZndDsgWyAgNjgyLjg1NTg4N10gNS4xNC4wLXJjNisgIzE2IFRhaW50ZWQ6IEcgICAgICAg
ICBDIE9FDQomZ3Q7IFsgIDY4Mi44NTU4OThdICANCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS4uLg0KV2hlbjogU2F0IDIwMjEtMDktMTEgMDU6
MzAg4oCTIDA2OjMwIENlbnRyYWwgRXVyb3BlYW4gVGltZSAtIFJvbWUNCg0KSm9pbmluZyBpbmZv
OiBKb2luIHdpdGggR29vZ2xlIE1lZXQNCmh0dHBzOi8vbWVldC5nb29nbGUuY29tL2Riei16Z3F4
LWF2ZD9ocz0yMjQNCg0KQ2FsZW5kYXI6IGxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2DQpX
aG86DQogICAgIChHdWVzdCBsaXN0IGhhcyBiZWVuIGhpZGRlbiBhdCBvcmdhbml6ZXIncyByZXF1
ZXN0KQ0KDQpFdmVudCBkZXRhaWxzOiAgDQpodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20vY2Fs
ZW5kYXIvZXZlbnQ/YWN0aW9uPVZJRVcmZWlkPU1HTmlaSEJuTXpac1kycHBNamhpZEdsb2JHMDVh
RzA1Wm1RZ2JHbHVkWGd0YzNSaFoybHVaMEJzYVhOMGN5NXNhVzUxZUM1a1pYWSZ0b2s9TWpNalpt
MWtaV1p5WVc1alpYTmpiMEJuYldGcGJDNWpiMjB5WVRWbU5EWmxZelpsTXprME56QXpOekEwTUdR
MVlUZGpZemd3WWpsbU5UTmxaVEkyWlRreSZjdHo9RXVyb3BlJTJGUm9tZSZobD1lbiZlcz0wDQoN
Ckludml0YXRpb24gZnJvbSBHb29nbGUgQ2FsZW5kYXI6IGh0dHBzOi8vY2FsZW5kYXIuZ29vZ2xl
LmNvbS9jYWxlbmRhci8NCg0KWW91IGFyZSByZWNlaXZpbmcgdGhpcyBjb3VydGVzeSBlbWFpbCBh
dCB0aGUgYWNjb3VudCAgDQpsaW51eC1zdGFnaW5nQGxpc3RzLmxpbnV4LmRldiBiZWNhdXNlIHlv
dSBhcmUgYW4gYXR0ZW5kZWUgb2YgdGhpcyBldmVudC4NCg0KVG8gc3RvcCByZWNlaXZpbmcgZnV0
dXJlIHVwZGF0ZXMgZm9yIHRoaXMgZXZlbnQsIGRlY2xpbmUgdGhpcyBldmVudC4gIA0KQWx0ZXJu
YXRpdmVseSB5b3UgY2FuIHNpZ24gdXAgZm9yIGEgR29vZ2xlIGFjY291bnQgYXQgIA0KaHR0cHM6
Ly9jYWxlbmRhci5nb29nbGUuY29tL2NhbGVuZGFyLyBhbmQgY29udHJvbCB5b3VyIG5vdGlmaWNh
dGlvbiAgDQpzZXR0aW5ncyBmb3IgeW91ciBlbnRpcmUgY2FsZW5kYXIuDQoNCkZvcndhcmRpbmcg
dGhpcyBpbnZpdGF0aW9uIGNvdWxkIGFsbG93IGFueSByZWNpcGllbnQgdG8gc2VuZCBhIHJlc3Bv
bnNlIHRvICANCnRoZSBvcmdhbml6ZXIgYW5kIGJlIGFkZGVkIHRvIHRoZSBndWVzdCBsaXN0LCBv
ciBpbnZpdGUgb3RoZXJzIHJlZ2FyZGxlc3MgIA0Kb2YgdGhlaXIgb3duIGludml0YXRpb24gc3Rh
dHVzLCBvciB0byBtb2RpZnkgeW91ciBSU1ZQLiBMZWFybiBtb3JlIGF0ICANCmh0dHBzOi8vc3Vw
cG9ydC5nb29nbGUuY29tL2NhbGVuZGFyL2Fuc3dlci8zNzEzNSNmb3J3YXJkaW5nDQo=
--0000000000003e209205cbaf90bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span itemscope itemtype=3D"http://schema.org/InformAction"><span style=3D"=
display:none" itemprop=3D"about" itemscope itemtype=3D"http://schema.org/Pe=
rson"><meta itemprop=3D"description" content=3D"Invitation from fmdefrances=
co@gmail.com"/></span><span itemprop=3D"object" itemscope itemtype=3D"http:=
//schema.org/Event"><div style=3D""><table cellspacing=3D"0" cellpadding=3D=
"8" border=3D"0" summary=3D"" style=3D"width:100%;font-family:Arial,Sans-se=
rif;border:1px Solid #ccc;border-width:1px 2px 2px 1px;background-color:#ff=
f;"><tr><td><meta itemprop=3D"eventStatus" content=3D"http://schema.org/Eve=
ntScheduled"/><h4 style=3D"padding:6px 0;margin:0 0 4px 0;font-family:Arial=
,Sans-serif;font-size:13px;line-height:1.4;border:1px Solid #fff;background=
:#fff;color:#090;font-weight:normal"><strong>You have been invited to the f=
ollowing event.</strong></h4><div style=3D"padding:2px"><span itemprop=3D"p=
ublisher" itemscope itemtype=3D"http://schema.org/Organization"><meta itemp=
rop=3D"name" content=3D"Google Calendar"/></span><meta itemprop=3D"eventId/=
googleCalendar" content=3D"0cbdpg36lcji28btihlm9hm9fd"/><h3 style=3D"paddin=
g:0 0 6px 0;margin:0;font-family:Arial,Sans-serif;font-size:16px;font-weigh=
t:bold;color:#222"><span itemprop=3D"name">[PATCH] staging: rtl8723bs: remo=
ve possible deadlock when disconnect</span></h3><table style=3D"display:inl=
ine-table" cellpadding=3D"0" cellspacing=3D"0" border=3D"0" summary=3D"Even=
t details"><tr><td style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-ser=
if;font-size:13px;color:#888;white-space:nowrap;width:90px" valign=3D"top">=
<div><i style=3D"font-style:normal">When</i></div></td><td style=3D"padding=
-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=
=3D"top"><div style=3D"text-indent:-1px"><time itemprop=3D"startDate" datet=
ime=3D"20210911T033000Z"></time><time itemprop=3D"endDate" datetime=3D"2021=
0911T043000Z"></time>Sat 2021-09-11 05:30 =E2=80=93 06:30 <span style=3D"co=
lor:#888">Central European Time - Rome</span></div></td></tr><tr><td style=
=3D"padding:0 1em 4px 0;font-family:Arial,Sans-serif;font-size:13px;color:#=
888;white-space:nowrap;width:90px" valign=3D"top"><div><i style=3D"font-sty=
le:normal">Joining info</i></div></td><td style=3D"padding-bottom:4px;font-=
family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><div styl=
e=3D"text-indent:-1px">Join with Google Meet</div></td></tr><tr><td style=
=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px;color:=
#888;white-space:nowrap;width:90px"></td><td style=3D"padding-bottom:10px;f=
ont-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top"><div =
style=3D"text-indent:-1px"><div style=3D"text-indent:-1px"><span itemprop=
=3D"potentialaction" itemscope itemtype=3D"http://schema.org/JoinAction"><s=
pan itemprop=3D"name" content=3D"meet.google.com/dbz-zgqx-avd"><span itempr=
op=3D"target" itemscope itemtype=3D"http://schema.org/EntryPoint"><span ite=
mprop=3D"url" content=3D"https://meet.google.com/dbz-zgqx-avd?hs=3D224"><sp=
an itemprop=3D"httpMethod" content=3D"GET"><a href=3D"https://meet.google.c=
om/dbz-zgqx-avd?hs=3D224" style=3D"color:#20c;white-space:nowrap" target=3D=
"_blank">meet.google.com/dbz-zgqx-avd</a></span></span></span></span></span=
> </div></div></td></tr><tr><td style=3D"padding:0 1em 10px 0;font-family:A=
rial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width:90px" va=
lign=3D"top"><div><i style=3D"font-style:normal">Calendar</i></div></td><td=
 style=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;c=
olor:#222" valign=3D"top"><div style=3D"text-indent:-1px">linux-staging@lis=
ts.linux.dev</div></td></tr><tr><td style=3D"padding:0 1em 10px 0;font-fami=
ly:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width:90px=
" valign=3D"top"><div><i style=3D"font-style:normal">Who</i></div></td><td =
style=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;co=
lor:#222" valign=3D"top">(Guest list has been hidden at organizer's request=
)</td></tr></table><div style=3D"float:right;font-weight:bold;font-size:13p=
x"> <a href=3D"https://calendar.google.com/calendar/event?action=3DVIEW&amp=
;eid=3DMGNiZHBnMzZsY2ppMjhidGlobG05aG05ZmQgbGludXgtc3RhZ2luZ0BsaXN0cy5saW51=
eC5kZXY&amp;tok=3DMjMjZm1kZWZyYW5jZXNjb0BnbWFpbC5jb20yYTVmNDZlYzZlMzk0NzAzN=
zA0MGQ1YTdjYzgwYjlmNTNlZTI2ZTky&amp;ctz=3DEurope%2FRome&amp;hl=3Den&amp;es=
=3D0" style=3D"color:#20c;white-space:nowrap" itemprop=3D"url">more details=
 &raquo;</a><br></div><div style=3D"padding-bottom:15px;font-family:Arial,S=
ans-serif;font-size:13px;color:#222;white-space:pre-wrap!important;white-sp=
ace:-moz-pre-wrap!important;white-space:-pre-wrap!important;white-space:-o-=
pre-wrap!important;white-space:pre;word-wrap:break-word"><span>Hi,<p><br>On=
 9/2/21 11:35 AM, Fabio Aiuto wrote:<br>&gt; when turning off a connection,=
 lockdep complains with the<br>&gt; following warning (a modprobe has been =
done but the same<br>&gt; happens with a disconnection from NetworkManager,=
<br>&gt; it&#39;s enough to trigger a cfg80211_disconnect call):<br>&gt;<br=
>&gt; [  682.855867] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt; [  682.855877] WARNING: possible =
circular locking dependency detected<br>&gt; [  682.855887] 5.14.0-rc6+ #16=
 Tainted: G         C OE<br>&gt; [  682.855898] ---------------------------=
---------------------------...</p></span><meta itemprop=3D"description" con=
tent=3D"Hi,


On 9/2/21 11:35 AM, Fabio Aiuto wrote:
&amp;gt; when turning off a connection, lockdep complains with the
&amp;gt; following warning (a modprobe has been done but the same
&amp;gt; happens with a disconnection from NetworkManager,
&amp;gt; it&#39;s enough to trigger a cfg80211_disconnect call):
&amp;gt;
&amp;gt; [  682.855867] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
&amp;gt; [  682.855877] WARNING: possible circular locking dependency detec=
ted
&amp;gt; [  682.855887] 5.14.0-rc6+ #16 Tainted: G         C OE
&amp;gt; [  682.855898] ---------------------------------------------------=
---..."/></div></div><p style=3D"color:#222;font-size:13px;margin:0"><span =
style=3D"color:#888">Going (linux-staging@lists.linux.dev)?&nbsp;&nbsp;&nbs=
p;</span><wbr><strong><span itemprop=3D"potentialaction" itemscope itemtype=
=3D"http://schema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"=
http://schema.org/RsvpAttendance/Yes"/><span itemprop=3D"handler" itemscope=
 itemtype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"method"=
 href=3D"http://schema.org/HttpRequestMethod/GET"/><a href=3D"https://calen=
dar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DMGNiZHBnMzZsY2ppMj=
hidGlobG05aG05ZmQgbGludXgtc3RhZ2luZ0BsaXN0cy5saW51eC5kZXY&amp;rst=3D1&amp;t=
ok=3DMjMjZm1kZWZyYW5jZXNjb0BnbWFpbC5jb20yYTVmNDZlYzZlMzk0NzAzNzA0MGQ1YTdjYz=
gwYjlmNTNlZTI2ZTky&amp;ctz=3DEurope%2FRome&amp;hl=3Den&amp;es=3D0" style=3D=
"color:#20c;white-space:nowrap" itemprop=3D"url">Yes</a></span></span><span=
 style=3D"margin:0 0.4em;font-weight:normal"> - </span><span itemprop=3D"po=
tentialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"><meta it=
emprop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/Maybe"/><=
span itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/HttpActio=
nHandler"><link itemprop=3D"method" href=3D"http://schema.org/HttpRequestMe=
thod/GET"/><a href=3D"https://calendar.google.com/calendar/event?action=3DR=
ESPOND&amp;eid=3DMGNiZHBnMzZsY2ppMjhidGlobG05aG05ZmQgbGludXgtc3RhZ2luZ0BsaX=
N0cy5saW51eC5kZXY&amp;rst=3D3&amp;tok=3DMjMjZm1kZWZyYW5jZXNjb0BnbWFpbC5jb20=
yYTVmNDZlYzZlMzk0NzAzNzA0MGQ1YTdjYzgwYjlmNTNlZTI2ZTky&amp;ctz=3DEurope%2FRo=
me&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowrap" itemprop=
=3D"url">Maybe</a></span></span><span style=3D"margin:0 0.4em;font-weight:n=
ormal"> - </span><span itemprop=3D"potentialaction" itemscope itemtype=3D"h=
ttp://schema.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"http:=
//schema.org/RsvpAttendance/No"/><span itemprop=3D"handler" itemscope itemt=
ype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"method" href=
=3D"http://schema.org/HttpRequestMethod/GET"/><a href=3D"https://calendar.g=
oogle.com/calendar/event?action=3DRESPOND&amp;eid=3DMGNiZHBnMzZsY2ppMjhidGl=
obG05aG05ZmQgbGludXgtc3RhZ2luZ0BsaXN0cy5saW51eC5kZXY&amp;rst=3D2&amp;tok=3D=
MjMjZm1kZWZyYW5jZXNjb0BnbWFpbC5jb20yYTVmNDZlYzZlMzk0NzAzNzA0MGQ1YTdjYzgwYjl=
mNTNlZTI2ZTky&amp;ctz=3DEurope%2FRome&amp;hl=3Den&amp;es=3D0" style=3D"colo=
r:#20c;white-space:nowrap" itemprop=3D"url">No</a></span></span></strong>&n=
bsp;&nbsp;&nbsp;&nbsp;<wbr><a href=3D"https://calendar.google.com/calendar/=
event?action=3DVIEW&amp;eid=3DMGNiZHBnMzZsY2ppMjhidGlobG05aG05ZmQgbGludXgtc=
3RhZ2luZ0BsaXN0cy5saW51eC5kZXY&amp;tok=3DMjMjZm1kZWZyYW5jZXNjb0BnbWFpbC5jb2=
0yYTVmNDZlYzZlMzk0NzAzNzA0MGQ1YTdjYzgwYjlmNTNlZTI2ZTky&amp;ctz=3DEurope%2FR=
ome&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowrap" itempro=
p=3D"url">more options &raquo;</a></p></td></tr><tr><td style=3D"background=
-color:#f6f6f6;color:#888;border-top:1px Solid #ccc;font-family:Arial,Sans-=
serif;font-size:11px"><p>Invitation from <a href=3D"https://calendar.google=
.com/calendar/" target=3D"_blank" style=3D"">Google Calendar</a></p><p>You =
are receiving this courtesy email at the account linux-staging@lists.linux.=
dev because you are an attendee of this event.</p><p>To stop receiving futu=
re updates for this event, decline this event. Alternatively you can sign u=
p for a Google account at https://calendar.google.com/calendar/ and control=
 your notification settings for your entire calendar.</p><p>Forwarding this=
 invitation could allow any recipient to send a response to the organizer a=
nd be added to the guest list, or invite others regardless of their own inv=
itation status, or to modify your RSVP. <a href=3D"https://support.google.c=
om/calendar/answer/37135#forwarding">Learn More</a>.</p></td></tr></table><=
/div></span></span>
--0000000000003e209205cbaf90bd
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART:20210911T033000Z
DTEND:20210911T043000Z
DTSTAMP:20210911T030943Z
ORGANIZER;CN=fmdefrancesco@gmail.com:mailto:fmdefrancesco@gmail.com
UID:0cbdpg36lcji28btihlm9hm9fd@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=linux-staging@lists.linux.dev;X-NUM-GUESTS=0:mailto:linux-staging@l
 ists.linux.dev
X-MICROSOFT-CDO-OWNERAPPTID:2050649180
CREATED:20210911T030941Z
DESCRIPTION:Hi\,\n\n\nOn 9/2/21 11:35 AM\, Fabio Aiuto wrote:\n> when turni
 ng off a connection\, lockdep complains with the\n> following warning (a mo
 dprobe has been done but the same\n> happens with a disconnection from Netw
 orkManager\,\n> it's enough to trigger a cfg80211_disconnect call):\n>\n> [
   682.855867] ======================================================\n> [  
 682.855877] WARNING: possible circular locking dependency detected\n> [  68
 2.855887] 5.14.0-rc6+ #16 Tainted: G         C OE\n> [  682.855898] -------
 -----------------------------------------------...\n\n-::~:~::~:~:~:~:~:~:~
 :~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-\nDo not 
 edit this section of the description.\n\nThis event has a video call.\nJoin
 : https://meet.google.com/dbz-zgqx-avd\n\nView your event at https://calend
 ar.google.com/calendar/event?action=VIEW&eid=MGNiZHBnMzZsY2ppMjhidGlobG05aG
 05ZmQgbGludXgtc3RhZ2luZ0BsaXN0cy5saW51eC5kZXY&tok=MjMjZm1kZWZyYW5jZXNjb0Bnb
 WFpbC5jb20yYTVmNDZlYzZlMzk0NzAzNzA0MGQ1YTdjYzgwYjlmNTNlZTI2ZTky&ctz=Europe%
 2FRome&hl=en&es=1.\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~
 :~:~:~:~:~:~:~:~:~:~:~:~::~:~::-
LAST-MODIFIED:20210911T030941Z
LOCATION:
SEQUENCE:0
STATUS:CONFIRMED
SUMMARY:[PATCH] staging: rtl8723bs: remove possible deadlock when disconnec
 t
TRANSP:OPAQUE
END:VEVENT
END:VCALENDAR

--0000000000003e209205cbaf90bd--
--0000000000003e209405cbaf90bf
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjEwOTExVDAzMzAwMFoNCkRURU5EOjIwMjEwOTEx
VDA0MzAwMFoNCkRUU1RBTVA6MjAyMTA5MTFUMDMwOTQzWg0KT1JHQU5JWkVSO0NOPWZtZGVmcmFu
Y2VzY29AZ21haWwuY29tOm1haWx0bzpmbWRlZnJhbmNlc2NvQGdtYWlsLmNvbQ0KVUlEOjBjYmRw
ZzM2bGNqaTI4YnRpaGxtOWhtOWZkQGdvb2dsZS5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklE
VUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRS
VUU7Q049bGludXgtc3RhZ2luZ0BsaXN0cy5saW51eC5kZXY7WC1OVU0tR1VFU1RTPTA6bWFpbHRv
OmxpbnV4LXN0YWdpbmdAbA0KIGlzdHMubGludXguZGV2DQpYLU1JQ1JPU09GVC1DRE8tT1dORVJB
UFBUSUQ6MjA1MDY0OTE4MA0KQ1JFQVRFRDoyMDIxMDkxMVQwMzA5NDFaDQpERVNDUklQVElPTjpI
aVwsXG5cblxuT24gOS8yLzIxIDExOjM1IEFNXCwgRmFiaW8gQWl1dG8gd3JvdGU6XG4+IHdoZW4g
dHVybmkNCiBuZyBvZmYgYSBjb25uZWN0aW9uXCwgbG9ja2RlcCBjb21wbGFpbnMgd2l0aCB0aGVc
bj4gZm9sbG93aW5nIHdhcm5pbmcgKGEgbW8NCiBkcHJvYmUgaGFzIGJlZW4gZG9uZSBidXQgdGhl
IHNhbWVcbj4gaGFwcGVucyB3aXRoIGEgZGlzY29ubmVjdGlvbiBmcm9tIE5ldHcNCiBvcmtNYW5h
Z2VyXCxcbj4gaXQncyBlbm91Z2ggdG8gdHJpZ2dlciBhIGNmZzgwMjExX2Rpc2Nvbm5lY3QgY2Fs
bCk6XG4+XG4+IFsNCiAgIDY4Mi44NTU4NjddID09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PVxuPiBbICANCiA2ODIuODU1ODc3XSBXQVJOSU5HOiBw
b3NzaWJsZSBjaXJjdWxhciBsb2NraW5nIGRlcGVuZGVuY3kgZGV0ZWN0ZWRcbj4gWyAgNjgNCiAy
Ljg1NTg4N10gNS4xNC4wLXJjNisgIzE2IFRhaW50ZWQ6IEcgICAgICAgICBDIE9FXG4+IFsgIDY4
Mi44NTU4OThdIC0tLS0tLS0NCiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS4uLlxuXG4tOjp+On46On46fjp+On46fjp+On4NCiA6fjp+On46fjp+On46fjp+
On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+Ojp+On46Oi1cbkRvIG5v
dCANCiBlZGl0IHRoaXMgc2VjdGlvbiBvZiB0aGUgZGVzY3JpcHRpb24uXG5cblRoaXMgZXZlbnQg
aGFzIGEgdmlkZW8gY2FsbC5cbkpvaW4NCiA6IGh0dHBzOi8vbWVldC5nb29nbGUuY29tL2Riei16
Z3F4LWF2ZFxuXG5WaWV3IHlvdXIgZXZlbnQgYXQgaHR0cHM6Ly9jYWxlbmQNCiBhci5nb29nbGUu
Y29tL2NhbGVuZGFyL2V2ZW50P2FjdGlvbj1WSUVXJmVpZD1NR05pWkhCbk16WnNZMnBwTWpoaWRH
bG9iRzA1YUcNCiAwNVptUWdiR2x1ZFhndGMzUmhaMmx1WjBCc2FYTjBjeTVzYVc1MWVDNWtaWFkm
dG9rPU1qTWpabTFrWldaeVlXNWpaWE5qYjBCbmINCiBXRnBiQzVqYjIweVlUVm1ORFpsWXpabE16
azBOekF6TnpBME1HUTFZVGRqWXpnd1lqbG1OVE5sWlRJMlpUa3kmY3R6PUV1cm9wZSUNCiAyRlJv
bWUmaGw9ZW4mZXM9MS5cbi06On46fjo6fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+
On46fjp+On46fjp+On4NCiA6fjp+On46fjp+On46fjp+On46fjp+On46On46fjo6LQ0KTEFTVC1N
T0RJRklFRDoyMDIxMDkxMVQwMzA5NDFaDQpMT0NBVElPTjoNClNFUVVFTkNFOjANClNUQVRVUzpD
T05GSVJNRUQNClNVTU1BUlk6W1BBVENIXSBzdGFnaW5nOiBydGw4NzIzYnM6IHJlbW92ZSBwb3Nz
aWJsZSBkZWFkbG9jayB3aGVuIGRpc2Nvbm5lYw0KIHQNClRSQU5TUDpPUEFRVUUNCkVORDpWRVZF
TlQNCkVORDpWQ0FMRU5EQVINCg==
--0000000000003e209405cbaf90bf--
