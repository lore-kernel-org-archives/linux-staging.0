Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C37373
	for <linux-staging@lists.linux.dev>; Fri,  6 May 2022 12:35:09 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id l19so9083447ljb.7
        for <linux-staging@lists.linux.dev>; Fri, 06 May 2022 05:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to;
        bh=liCHqqDBpZMTi3vrfIOE5FXF4Xt6Thg/t+huQqOBdF8=;
        b=fW6DSwVrERaLyBwiCWLdUfOp9J0+5xgM9SBhcEWuGXzpAx0MrQrzsnifFRcJGMBX51
         RH6Ugj1JKwetlrcfiwiFfUyY1qmFlqWcvQQEfdS5yC6V9Tak1IUo9yQKvL4SF3rW7WRD
         twcQ95xxAfgFn4v2p0t/rYfezGOhYEpVfuImXP+JuO479PLKyJODy1Zrx6N8+QJADKsu
         +tGb86pxGts+icATt1VPqfLhg0DC5iL0HaPEnHbvKJ9gT1mBWBLl+Fuw6WcXjEaIjVbK
         v6UrkaDAvaB/32KXGPnGtvm2Sy4+M8ivQyFpVZINd61Me2mF88acig/e7cg0d1eoT+rD
         0Bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to;
        bh=liCHqqDBpZMTi3vrfIOE5FXF4Xt6Thg/t+huQqOBdF8=;
        b=yqC61pXprX2otbOIRQ0wI/lJLLEkF2fn0g5hNK64/ZaVZwX5GmEC7jSbU3kpq05k7G
         XShkTnQkcNJ2QOhmS9VwezLuuu5NjdDi0KtSebauxvizB9lDHmwOwFSOHawwUPmq84j2
         dHFehS5xg/NI66MlVqbzBDozk5hZCXXhXXa4tgUqE/hWvE1IZgw6AB6pVqCvE/15A59D
         ucPpsIAVrXia9ED8352W8LuyfKOnVAOiY79HTRHwVdl0ICNN95nmGtTrf1CvN1smDmCy
         Zdq29jLV/+Rxvf+4SLyF9QMMPewu1KacHcYVpXzMFvTROzxWka1EbatulVBYnMeaAjKt
         9aFA==
X-Gm-Message-State: AOAM531c6LCLnnt+Mk4C7c31k3pUWRWs0TsRo/8MMhsL6KUtHvSu6zie
	kr6xfGLt9IDW1xsPQcBO6cI=
X-Google-Smtp-Source: ABdhPJwRPyHT+4RjlEQ1/Z85UO3Q/IkIdKETIgN3+ehXAMmVlJvDLVjWZInM/KcEIV8ana4lCjrR3g==
X-Received: by 2002:a2e:8554:0:b0:24f:2b8e:f26e with SMTP id u20-20020a2e8554000000b0024f2b8ef26emr1922539ljj.487.1651840507234;
        Fri, 06 May 2022 05:35:07 -0700 (PDT)
Received: from [192.168.1.11] ([217.117.246.114])
        by smtp.gmail.com with ESMTPSA id c9-20020a197609000000b0047255d210e4sm673893lff.19.2022.05.06.05.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 05:35:06 -0700 (PDT)
Message-ID: <972ec318-680d-e13c-4aac-07c2c039706c@gmail.com>
Date: Fri, 6 May 2022 15:35:05 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/3] staging: rtl8712: fix uninit-value in
 r871xu_drv_init()
Content-Language: en-US
From: Pavel Skripkin <paskripkin@gmail.com>
To: Wang Cheng <wanngchenng@gmail.com>, dan.carpenter@oracle.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1651833575.git.wanngchenng@gmail.com>
 <14c3886173dfa4597f0704547c414cfdbcd11d16.1651833575.git.wanngchenng@gmail.com>
 <9f0bf5e0-87e8-ce27-7c2d-8e247e7b5f4f@gmail.com>
In-Reply-To: <9f0bf5e0-87e8-ce27-7c2d-8e247e7b5f4f@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K5IrKYjXwmIhR00iOPLTa9hZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------K5IrKYjXwmIhR00iOPLTa9hZ
Content-Type: multipart/mixed; boundary="------------c958OhEGTSYp2fSZDZ6BnswN";
 protected-headers="v1"
From: Pavel Skripkin <paskripkin@gmail.com>
To: Wang Cheng <wanngchenng@gmail.com>, dan.carpenter@oracle.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Message-ID: <972ec318-680d-e13c-4aac-07c2c039706c@gmail.com>
Subject: Re: [PATCH v3 2/3] staging: rtl8712: fix uninit-value in
 r871xu_drv_init()
References: <cover.1651833575.git.wanngchenng@gmail.com>
 <14c3886173dfa4597f0704547c414cfdbcd11d16.1651833575.git.wanngchenng@gmail.com>
 <9f0bf5e0-87e8-ce27-7c2d-8e247e7b5f4f@gmail.com>
In-Reply-To: <9f0bf5e0-87e8-ce27-7c2d-8e247e7b5f4f@gmail.com>

--------------c958OhEGTSYp2fSZDZ6BnswN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgUGF2ZWwsDQoNCk9uIDUvNi8yMiAxNToyNywgUGF2ZWwgU2tyaXBraW4gd3JvdGU6DQo+
IEhpIFdhbmcsDQo+IA0KPiBPbiA1LzYvMjIgMTQ6NTksIFdhbmcgQ2hlbmcgd3JvdGU6DQo+
PiBSZXBvcnRlZC1hbmQtdGVzdGVkLWJ5OiBzeXpib3QrNmY1ZWNkMTQ0ODU0YzBkODU4MGJA
c3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQ0KPj4gU2lnbmVkLW9mZi1ieTogV2FuZyBDaGVu
ZyA8d2FubmdjaGVubmdAZ21haWwuY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvc3RhZ2lu
Zy9ydGw4NzEyL3VzYl9pbnRmLmMgfCA2ICsrKy0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9zdGFnaW5nL3J0bDg3MTIvdXNiX2ludGYuYyBiL2RyaXZlcnMvc3RhZ2luZy9y
dGw4NzEyL3VzYl9pbnRmLmMNCj4+IGluZGV4IGVlNGM2MWY4NWEwNy4uNTBkY2QzZWNiNjg1
IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL3J0bDg3MTIvdXNiX2ludGYuYw0K
Pj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL3J0bDg3MTIvdXNiX2ludGYuYw0KPj4gQEAgLTUz
OCwxMyArNTM4LDEzIEBAIHN0YXRpYyBpbnQgcjg3MXh1X2Rydl9pbml0KHN0cnVjdCB1c2Jf
aW50ZXJmYWNlICpwdXNiX2ludGYsDQo+PiAgIAkJfSBlbHNlIHsNCj4+ICAgCQkJQXV0b2xv
YWRGYWlsID0gZmFsc2U7DQo+PiAgIAkJfQ0KPj4gLQkJaWYgKCgobWFjWzBdID09IDB4ZmYp
ICYmIChtYWNbMV0gPT0gMHhmZikgJiYNCj4+ICsJCWlmICgoIUF1dG9sb2FkRmFpbCkgfHwN
Cj4+ICsJCSAgICAoKG1hY1swXSA9PSAweGZmKSAmJiAobWFjWzFdID09IDB4ZmYpICYmDQo+
PiAgIAkJICAgICAobWFjWzJdID09IDB4ZmYpICYmIChtYWNbM10gPT0gMHhmZikgJiYNCj4+
ICAgCQkgICAgIChtYWNbNF0gPT0gMHhmZikgJiYgKG1hY1s1XSA9PSAweGZmKSkgfHwNCj4+
ICAgCQkgICAgKChtYWNbMF0gPT0gMHgwMCkgJiYgKG1hY1sxXSA9PSAweDAwKSAmJg0KPj4g
ICAJCSAgICAgKG1hY1syXSA9PSAweDAwKSAmJiAobWFjWzNdID09IDB4MDApICYmDQo+PiAt
CQkgICAgIChtYWNbNF0gPT0gMHgwMCkgJiYgKG1hY1s1XSA9PSAweDAwKSkgfHwNCj4+IC0J
CSAgICAgKCFBdXRvbG9hZEZhaWwpKSB7DQo+PiArCQkgICAgIChtYWNbNF0gPT0gMHgwMCkg
JiYgKG1hY1s1XSA9PSAweDAwKSkpIHsNCj4+ICAgCQkJbWFjWzBdID0gMHgwMDsNCj4+ICAg
CQkJbWFjWzFdID0gMHhlMDsNCj4+ICAgCQkJbWFjWzJdID0gMHg0YzsNCj4gDQo+IEhtbSwN
Cj4gDQo+IHRoZSB3aG9sZSByODcxeHVfZHJ2X2luaXQoKSBsb29rcyBvZGQsIGJ1dCBpdCdz
IHVucmVsYXRlZC4NCj4gDQo+IEkgc2VlIHRoYXQgdGhpcyBwYXRjaCBkb2VzIG5vdCBoZWxw
IHdpdGggYmVsb3cga2VybmVsIHBhdGgNCj4gDQo+IHI4NzF4dV9kcnZfaW5pdCgpDQo+ICAg
ICBpZiAodG1wVTFiICYgX0VFUFJPTV9FTikgPC0gdHJ1ZSBbMV0NCj4gCWlmICghcjg3MTJf
aW5pdG1hYyB8fCAhbWFjX3B0b24ocjg3MTJfaW5pdG1hYywgbWFjKSkgPC0gKCopDQo+IAkJ
aWYgKCghQXV0b2xvYWRGYWlsKSB8fAk8LSBmYWxzZSwgc2luY2UgWzFdIGJyYW5jaCB0YWtl
bg0KPiAJCQlbY29kZSB0b3VjaGVzIHN0YWNrIGRhdGFdDQo+IA0KPiAoKikgZmFsc2UgYmVj
YXVzZSBvZiByODcxMl9pbml0bWFjIGlzIGVxdWFsIHRvIE5VTEwNCj4gDQoNCk9vcHMsIEkg
YW0gYmxpbmQsIGlnbm9yZSB0aGF0IG9uZSwgcGxlYXNlLiBUaGUgd2hvbGUgaWRlYSBpcyB3
cm9uZy4NCg0KSSBuZWVkIHRvIGdvIHRvIHNsZWVwIGVhcmxpZXIgdG9kYXkNCg0Kc29ycnkg
YWJvdXQgdGhhdCwNCg0KDQpXaXRoIHJlZ2FyZHMsDQpQYXZlbCBTa3JpcGtpbg0K

--------------c958OhEGTSYp2fSZDZ6BnswN--

--------------K5IrKYjXwmIhR00iOPLTa9hZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEER3XL3TplLQE8Qi40bk1w61LbBA0FAmJ1FfkFAwAAAAAACgkQbk1w61LbBA3w
ZA//aeRovqtd9j/JNUn0uCdomKPvlQkHzASLdmoKIrURF1vbUOTl3XzXYXX3cI40JK1EdfgH1svF
TEly8K1+xJCJYsip9+fIUjhlknlZD4+enbILj32q5uGXrqjj+pSnyQm3cxQXK/Y2+TYOzsCssAB+
o38znZkNzEb+zHSnA/ejUWRGnDg6u1XadeavWguw6wbFMIEkA3TUOAyHb5p/V472LIOviKXJD7eP
sQm7YUAxBBvDWgnqcNDdl4MTsyXfvefnNkaWOCSTlBgcuxxvtxZmcg2xccc6PfWsl8YfunAv7YYI
aquqGldPsu4rsgqb3crOujbWufjoir4S69N7egZMNeq03C4PYcCDZ6NlxIpeMxjpI4ffINDlTzJ2
06xHsBz+Tl1cmIV3Izze/M7gt3MEXWED7ru4dQKmTf7/eSlZjnOPUUK+NzGT3195BsYvdYnVquQz
5XXHODjDjK21eJ3WLgE08IQwQBQHArChJOc287GwHobUn5euzUpMntg6705W5zYitSQnnplBgjRx
98wqNAU4Z3oXVuN/T7frUvAue1YF8HilB/q03sfxpPCJw07IG/hh2oKqPlGQZQIM78/npVyTLZgW
DLU2Mz6AzFL4zq5BodBErB5NXB/XZcberkg0wD04hVEdU4F/7GvugCO0ifLmoDB7MKOEAC7ldl2J
zxg=
=Nmxq
-----END PGP SIGNATURE-----

--------------K5IrKYjXwmIhR00iOPLTa9hZ--
