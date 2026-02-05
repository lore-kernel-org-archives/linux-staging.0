Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A0C326D4D
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 19:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770319629; cv=none; b=p33n/b/aNzWkSPMf+70YC79749nKgmmqQgkDyzscbmu9QL1C6DUFtYuigzqTIeBTePYsML/7K+Ywp8FCbglyT4iNdid01XynDeGic+VVEiw0iJSP8Qsc7xiADTn5GOs7rp2PA+KXDP8CG+WsffKUhpTT24G4UqAD51VAllA7fC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770319629; c=relaxed/simple;
	bh=q6934COXasrTxdm8/9vT4aj4rMt4jxOPMnYrM3hu7X0=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-ID:Date:
	 In-Reply-To:References; b=AYzl+j5n9eDcVfPtziBjtTNK22P1fgYg10beZzWSNShhDiWRfvbyOadKJLbOUEby5FEkiysdg5OnKD/PlR4BmpuyFWbBvWKHkwYTZnEG80UIcPpiO9gj3KlBruY6WcESjqCKumRq3wvl5W58Jm2LluQELHFlKT4xtmMcRegTZww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OM8+uToL; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OM8+uToL"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38305d006faso11864281fa.3
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 11:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770319627; x=1770924427; darn=lists.linux.dev;
        h=references:in-reply-to:date:message-id:subject:cc:to:from
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6934COXasrTxdm8/9vT4aj4rMt4jxOPMnYrM3hu7X0=;
        b=OM8+uToL4ir5BBFUKtAdGzXxppKyfpFqoUGH1pPpJowOb6vug+QMLsaQ3+P5NHqRT4
         dB7ocgtimLNl8v6dlM53/wE98RzxPm8kmMqPRp360hsYmlMWIP9/3OPpjNdoWjx7PohT
         fZ+o+Fu4WzDoCATb+SeiEHKE97rW8dSosK2w7gz9I0vkM+uIcTLg3L8J0ll3bU6snKIy
         mpKYFdkFRQrx0wsUahnBxLPEOWPhaBZeTc3pj7CMkfodoJbgUo1LLceccdiA1wEbNNXp
         ez7gHoVbFddAwh8K40mtdX5VFihzany+95tzYpxjAdIDrdO81Sw4QES8xWdKCER1DBai
         6LBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770319627; x=1770924427;
        h=references:in-reply-to:date:message-id:subject:cc:to:from
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q6934COXasrTxdm8/9vT4aj4rMt4jxOPMnYrM3hu7X0=;
        b=TXtS+Irt75EqUFz2Owikjc7stOcbzfJHu+WkQHgLdj6w/8pJhIwAUUx4tdOofWeHzh
         sueKH9o22ZXbc9PR8rHD81VscDEpybNZjosEHOCoa90b8M3qHIUs3c6NJF2rKCx1bfQ6
         Ir3cRyu5zZ406GHie7KwOd/pase+vz/2ijnYkYDm2Koj3D3ZJwXXezhGDf7jhGqRMTIg
         FcUAf0iLSBCmWLQHlAwIi2nn8joJ6049/WZzkesLfaK+naVar/MZ6vBErFCBbSdeYF/z
         I5g3DLB5u7iGurPlghrUsVudYtH1N5+8TOdFkzojfYPDUWSHxYWH9gQYqpn1b7CDdk6Q
         cd1w==
X-Gm-Message-State: AOJu0YzDWVq7UuASaEjLyesdiDxQL3C+6bNLwfuOORXvfkXTgsvC9pdA
	Caujsmnc4gz5M/zwOuKlSln0MNqp8VqNf9RL0K5VyMfLyBolZDerJDwE0UWWBAwp
X-Gm-Gg: AZuq6aJSAFcMCj7+Xp0WVg0o6cyqw9nhx8/1LCOskjqkRIP3EBuw2mMXImpNaUOlCrr
	bLS8BZV4FEwxTTbuo+ZvjbohwOQE+8xcxTkI1//2N4QNF8OQs6qhlOiKxrj/EVRMpiAdq1YgmHK
	XjUi75tgFL8Mvu4aXUyFaR2IzDwDPlX6nv1wvYUoAmIkzMsGTlcQjYRcL+x8YkoDxdSE1/EKxnO
	76GN+6wQW1aPE9P2h47zy3HvCtJ1rYr4otmc/QHH/q3lPr0AVZ0qoG3WEx1ieUWgbdsTS5oPKPr
	W7e8w0WkZBa+kYNcTIp+99pFvj4dglprvkhrdkQvOlaP2kzb/YF8aCkHc2NzuVziCee9YNES89I
	6EH6BgMjcharAJyNRplarh8vTLIQzbloIHa7pkQLnFHne69tmzZdlsRbGl7X2kMMtM0+U5DrMeJ
	s=
X-Received: by 2002:a05:651c:210d:b0:37f:aad0:4080 with SMTP id 38308e7fff4ca-386b515e8c6mr1287851fa.31.1770319627321;
        Thu, 05 Feb 2026 11:27:07 -0800 (PST)
Received: from [26.61.26.19] ([95.104.166.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b6408bbasm22381fa.39.2026.02.05.11.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 11:27:07 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: frankfmy <pryanishnikovartem@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH 4/5] staging: rtl8723bs: fix spelling errors in header files
Message-ID: <1770319629.4.pryanishnikovartem@gmail.com>
Date: Thu, 05 Feb 2026 23:27:06 +0400
In-Reply-To: <1770319619.1.pryanishnikovartem@gmail.com>
References: <1770319619.1.pryanishnikovartem@gmail.com>

Rml4IHNwZWxsaW5nIGVycm9ycyBmb3VuZCBieSBjb2Rlc3BlbGwgaW4gdGhlIHJ0bDg3MjNicyBz
dGFnaW5nCmRyaXZlciBoZWFkZXIgZmlsZXM6CgotIHJ0d19jbWQuaDogc2VxdWNuZSAtPiBzZXF1
ZW5jZQotIGhhbF9jb21fcmVnLmg6IGNvbnRybCAtPiBjb250cm9sCi0gZHJ2X3R5cGVzLmg6IGJ1
aWxkLWluIC0+IGJ1aWx0LWluCi0gd2xhbl9ic3NkZWYuaDogaW5mb3IgLT4gaW5mbwotIEhhbFB3
clNlcUNtZC5oOiBkaXJ2ZXIgLT4gZHJpdmVyCgpTaWduZWQtb2ZmLWJ5OiBmcmFua2ZteSA8cHJ5
YW5pc2huaWtvdmFydGVtQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvcnRsODcyM2Jz
L2luY2x1ZGUvSGFsUHdyU2VxQ21kLmggfCAyICstCiBkcml2ZXJzL3N0YWdpbmcvcnRsODcyM2Jz
L2luY2x1ZGUvZHJ2X3R5cGVzLmggICAgfCAyICstCiBkcml2ZXJzL3N0YWdpbmcvcnRsODcyM2Jz
L2luY2x1ZGUvaGFsX2NvbV9yZWcuaCAgfCAyICstCiBkcml2ZXJzL3N0YWdpbmcvcnRsODcyM2Jz
L2luY2x1ZGUvcnR3X2NtZC5oICAgICAgfCAyICstCiBkcml2ZXJzL3N0YWdpbmcvcnRsODcyM2Jz
L2luY2x1ZGUvd2xhbl9ic3NkZWYuaCAgfCAyICstCiA1IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvcnRs
ODcyM2JzL2luY2x1ZGUvSGFsUHdyU2VxQ21kLmggYi9kcml2ZXJzL3N0YWdpbmcvcnRsODcyM2Jz
L2luY2x1ZGUvSGFsUHdyU2VxQ21kLmgKaW5kZXggYjgxMjUyZDM3Li5lNTA4NDJjNWMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ydGw4NzIzYnMvaW5jbHVkZS9IYWxQd3JTZXFDbWQuaAor
KysgYi9kcml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2luY2x1ZGUvSGFsUHdyU2VxQ21kLmgKQEAg
LTE2LDcgKzE2LDcgQEAKICAgICAgLyogIG9mZnNldDogdGhlIHJlYWQgcmVnaXN0ZXIgb2Zmc2V0
ICovCiAgICAgIC8qICBtc2s6IHRoZSBtYXNrIG9mIHRoZSByZWFkIHZhbHVlICovCiAgICAgIC8q
ICB2YWx1ZTogTi9BLCBsZWZ0IGJ5IDAgKi8KLSAgICAgLyogIG5vdGU6IGRpcnZlciBzaGFsbCBp
bXBsZW1lbnQgdGhpcyBmdW5jdGlvbiBieSByZWFkICYgbXNrICovCisgICAgIC8qICBub3RlOiBk
cml2ZXIgc2hhbGwgaW1wbGVtZW50IHRoaXMgZnVuY3Rpb24gYnkgcmVhZCAmIG1zayAqLwogCiAj
ZGVmaW5lIFBXUl9DTURfV1JJVEUJCQkweDAxCiAgICAgIC8qICBvZmZzZXQ6IHRoZSByZWFkIHJl
Z2lzdGVyIG9mZnNldCAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9p
bmNsdWRlL2Rydl90eXBlcy5oIGIvZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9pbmNsdWRlL2Ry
dl90eXBlcy5oCmluZGV4IGY4NjE4MGRjMy4uY2U1MGJjMDg0IDEwMDY0NAotLS0gYS9kcml2ZXJz
L3N0YWdpbmcvcnRsODcyM2JzL2luY2x1ZGUvZHJ2X3R5cGVzLmgKKysrIGIvZHJpdmVycy9zdGFn
aW5nL3J0bDg3MjNicy9pbmNsdWRlL2Rydl90eXBlcy5oCkBAIC0zMTgsNyArMzE4LDcgQEAgZW51
bSB7CiBzdHJ1Y3QgYWRhcHRlciB7CiAJaW50CURyaXZlclN0YXRlOy8qICBmb3IgZGlzYWJsZSBk
cml2ZXIgdXNpbmcgbW9kdWxlLCB1c2UgZG9uZ2xlIHRvIHJlcGxhY2UgbW9kdWxlLiAqLwogCWlu
dAlwaWRbM107LyogcHJvY2VzcyBpZCBmcm9tIFVJLCAwOndwcywgMTpob3N0YXBkLCAyOmRoY3Bj
ZCAqLwotCWludAliRG9uZ2xlOy8qIGJ1aWxkLWluIG1vZHVsZSBvciBleHRlcm5hbCBkb25nbGUg
Ki8KKwlpbnQJYkRvbmdsZTsvKiBidWlsdC1pbiBtb2R1bGUgb3IgZXh0ZXJuYWwgZG9uZ2xlICov
CiAKIAlzdHJ1Y3QgZHZvYmpfcHJpdiAqZHZvYmo7CiAJc3RydWN0CW1sbWVfcHJpdiBtbG1lcHJp
djsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ydGw4NzIzYnMvaW5jbHVkZS9oYWxfY29t
X3JlZy5oIGIvZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9pbmNsdWRlL2hhbF9jb21fcmVnLmgK
aW5kZXggY2Y1YzE1ZGMyLi43OTVmZWY0OGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9y
dGw4NzIzYnMvaW5jbHVkZS9oYWxfY29tX3JlZy5oCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ydGw4
NzIzYnMvaW5jbHVkZS9oYWxfY29tX3JlZy5oCkBAIC0yMCw3ICsyMCw3IEBACiAjZGVmaW5lIFJF
R19SU1ZfQ1RSTAkJCQkJMHgwMDFDCiAjZGVmaW5lIFJFR19SRl9DVFJMCQkJCQkJMHgwMDFGCiAj
ZGVmaW5lIFJFR19BRkVfWFRBTF9DVFJMCQkJCTB4MDAyNAotI2RlZmluZSBSRUdfTUFDX1BIWV9D
VFJMCQkJCTB4MDAyYyAvKiBmb3IgOTJkLCBETURQLCBTTVNQLCBETVNQIGNvbnRybCAqLworI2Rl
ZmluZSBSRUdfTUFDX1BIWV9DVFJMCQkJCTB4MDAyYyAvKiBmb3IgOTJkLCBETURQLCBTTVNQLCBE
TVNQIGNvbnRyb2wgKi8KICNkZWZpbmUgUkVHX0VGVVNFX0NUUkwJCQkJCTB4MDAzMAogI2RlZmlu
ZSBSRUdfRUZVU0VfVEVTVAkJCQkJMHgwMDM0CiAjZGVmaW5lIFJFR19QV1JfREFUQQkJCQkJMHgw
MDM4CmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2luY2x1ZGUvcnR3X2Nt
ZC5oIGIvZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9pbmNsdWRlL3J0d19jbWQuaAppbmRleCBj
YjQ0MTE5Y2UuLmM0YzNlZGVlOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNi
cy9pbmNsdWRlL3J0d19jbWQuaAorKysgYi9kcml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2luY2x1
ZGUvcnR3X2NtZC5oCkBAIC01NTksNyArNTU5LDcgQEAgc3RydWN0IFJ1bkluVGhyZWFkX3BhcmFt
IHsKIFJlc3VsdDoKIDB4MDA6IHN1Y2Nlc3MKIDB4MDE6IHN1Y2Nlc3MsIGFuZCBjaGVjayBSZXNw
b25zZS4KLTB4MDI6IGNtZCBpZ25vcmVkIGR1ZSB0byBkdXBsaWNhdGVkIHNlcXVjbmUgbnVtYmVy
CisweDAyOiBjbWQgaWdub3JlZCBkdWUgdG8gZHVwbGljYXRlZCBzZXF1ZW5jZSBudW1iZXIKIDB4
MDM6IGNtZCBkcm9wcGVkIGR1ZSB0byBpbnZhbGlkIGNtZCBjb2RlCiAweDA0OiByZXNlcnZlZC4K
IApkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9pbmNsdWRlL3dsYW5fYnNz
ZGVmLmggYi9kcml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2luY2x1ZGUvd2xhbl9ic3NkZWYuaApp
bmRleCBlYjM4NTk0YzguLjUzZjE2NDdiNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL3J0
bDg3MjNicy9pbmNsdWRlL3dsYW5fYnNzZGVmLmgKKysrIGIvZHJpdmVycy9zdGFnaW5nL3J0bDg3
MjNicy9pbmNsdWRlL3dsYW5fYnNzZGVmLmgKQEAgLTEzOCw3ICsxMzgsNyBAQCBzdHJ1Y3Qgd2xh
bl9waHlfaW5mbyB7CiB9OwogCiBzdHJ1Y3Qgd2xhbl9iY25faW5mbyB7Ci0JLyogdGhlc2UgaW5m
b3IgZ2V0IGZyb20gcnR3X2dldF9lbmNyeXB0X2luZm8gd2hlbgorCS8qIHRoZXNlIGluZm8gZ2V0
IGZyb20gcnR3X2dldF9lbmNyeXB0X2luZm8gd2hlbgogCSAqICogdHJhbnNsYXRlIHNjYW4gdG8g
VUkgKi8KIAl1OCBlbmNyeXBfcHJvdG9jb2w7LyogRU5DUllQX1BST1RPQ09MX0U6IE9QRU4vV0VQ
L1dQQS9XUEEyL1dBUEkgKi8KIAlpbnQgZ3JvdXBfY2lwaGVyOyAvKiBXUEEvV1BBMiBncm91cCBj
aXBoZXIgKi8KLS0gCjIuMzQuMQo=
