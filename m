Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4302EAB6F
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 19:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770319624; cv=none; b=hW6MiUz5apzWb+KKUU0BoKF/VUryq1bUjdIr6XDUuJvjGZsGsYzA7wlS/b4Jf+ETg+CkSYTu5eI3yNhSx7BpPtZnzDtbc0yTMFBzHDqz1qxo9xySRuHxfGjvuvZGyatnSw0AjOC+CHhNzXFx+f37PtN/iFz1Ti3ObpwHS1XtDK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770319624; c=relaxed/simple;
	bh=WIAyNQ65IRJOfRf5wFBjJjYpr4Iy9U0kjN7vrYENAnE=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-ID:Date:
	 In-Reply-To:References; b=Yi38UHp6AkRqPOwROxpLDa2GVd75b7b3brxOXUBJlekjfEZCI85Hh7JUsYw/8X/yTS3D+37iWisORbgnsufYTb6dFFujj3ykKQWOvn/ER4GHeAD60Qix8Fhy1j64FUxpXyTIop3Op9rZ+mMAaJlzGq2OzPM5S0OJp0qGBhJnZRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZphnwxy; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZphnwxy"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59dd3e979ceso1576661e87.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 11:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770319622; x=1770924422; darn=lists.linux.dev;
        h=references:in-reply-to:date:message-id:subject:cc:to:from
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIAyNQ65IRJOfRf5wFBjJjYpr4Iy9U0kjN7vrYENAnE=;
        b=MZphnwxyYsyHunkCbUcnamsMjnpL0T8gxlGRYHTA5dto4MkzLit9odCygTRTSnutZ/
         VI+sdqzVFofYg34id2Dzvb29+BmE3LWBM+f/SvvIXeBbPYEjusyXqf+P3SVWZ1ql2V2k
         vWcpjhbLtqfI4QkY0QR4yvb5dKUc5lqJYYFRtxmToRAMgeLjaxuQ76aSErSGkPb4MB1u
         bJISN1ZQiOTSXoATLMEli5HeBRzWsNGNRipWExfcFm6Xs49e9xM2iOV4E4pVi9b+p0S9
         5ZUWKI9zIYhoxEFESP+clhWFk1kFu7smYwON1POGXc5JdQ9HYF1G4FwgfPWq2XEalK+t
         Xx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770319622; x=1770924422;
        h=references:in-reply-to:date:message-id:subject:cc:to:from
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WIAyNQ65IRJOfRf5wFBjJjYpr4Iy9U0kjN7vrYENAnE=;
        b=CEtdi/wLnOj7MkLAy27oEV6r/Ao8nyZejntOFe02QbT9p86lxaC8uis+OOHesQdLDi
         uggzLRG6I9pgJj9bOg4z+GUzxH/0dC/jUVDst1MR1DClTamzSakVfEX5tbuojJjtE3qN
         FHWDMZOaM3nfTwzh4ni8s0/qI2+7VxXZVV6LQpscRHqKKF8eAZb8Odk0Xuv6wkiXolEf
         +rCzkpklaacWgnl4C3dZm/TS8YacDjz7hfNuKqeRROR32sZyb3jx4jm5HhGztnkYz+i5
         /4+ympnmCdsQ8Gp82n9B+F2hC1DAbjZMZIQyx3AFWughAd+hThpj4p8iML6JOLl1wbga
         kY3Q==
X-Gm-Message-State: AOJu0Yy7+J6p1PEqBuogHKc/bF22UOfVM4tZofBAIXLZqpvl7KG7MSyl
	5Aa6IRpVB8hFvjzLf4xqhkNL+Tf3Raax63PaYiRUHf2+XwJ5khFGu22d2yEqJD7q
X-Gm-Gg: AZuq6aIYNS2a7sdLKqfieYLJskYYMvZ6lMka07x/Oxz7cFLb8FZTx724Nu0PNLU92iE
	pLMosXgLpEsB54zcxhdjzKbzG3z3+irLxXnJvjgO3F2Mw7PVUFw6F39FR3PQTVPD+9ofRgZQjsU
	1Zed61+koof642sKM9s+dgXDCf5BLgjIJGmFNvrB9049E1Iqpx+IuAK+scRiWPbV9tZuYdlBiVU
	iYAOX5FCuji4GaXrMnoOjepyfFvodRu0n+xp+z+uvSR9iNvXUDrsbj/XqBjiwnNVNbIMiX5KswF
	wbemKNCDp8CGjKTF7O5RyAn/CJ9AXWaeYS/z+kwIUafC36VdbcUKsAkVLSqMSfYbCn2+DonWbXB
	iOqv69/TBXDCuSN8TLjW6qsZ/MPnNk4Mj9+sZ5XsgemHHUkN9y8ATDDebZ+Y6xgOGTOQSDDIRKh
	A=
X-Received: by 2002:ac2:51ce:0:b0:59e:3cd:f1db with SMTP id 2adb3069b0e04-59e4514c20dmr14221e87.14.1770319622180;
        Thu, 05 Feb 2026 11:27:02 -0800 (PST)
Received: from [26.61.26.19] ([95.104.166.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b6408bbasm22381fa.39.2026.02.05.11.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 11:27:01 -0800 (PST)
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
Subject: [PATCH 2/5] staging: rtl8723bs: fix spelling errors in hal driver files
Message-ID: <1770319622.2.pryanishnikovartem@gmail.com>
Date: Thu, 05 Feb 2026 23:27:01 +0400
In-Reply-To: <1770319619.1.pryanishnikovartem@gmail.com>
References: <1770319619.1.pryanishnikovartem@gmail.com>

Rml4IHNwZWxsaW5nIGVycm9ycyBmb3VuZCBieSBjb2Rlc3BlbGwgaW4gdGhlIHJ0bDg3MjNicyBz
dGFnaW5nCmRyaXZlciBoYWwgZmlsZXM6CgotIHNkaW9faGFsaW5pdC5jOiBndXJhbnRlZSAtPiBn
dWFyYW50ZWUKLSBzZGlvX29wcy5jOiBFbmFsYmUgLT4gRW5hYmxlCi0gcnRsODcyM2JfY21kLmM6
IGxhc3Rlc3QgLT4gbGFzdAoKU2lnbmVkLW9mZi1ieTogZnJhbmtmbXkgPHByeWFuaXNobmlrb3Zh
cnRlbUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9oYWwvcnRsODcy
M2JfY21kLmMgfCAyICstCiBkcml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2hhbC9zZGlvX2hhbGlu
aXQuYyB8IDIgKy0KIGRyaXZlcnMvc3RhZ2luZy9ydGw4NzIzYnMvaGFsL3NkaW9fb3BzLmMgICAg
IHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9oYWwvcnRsODcyM2JfY21k
LmMgYi9kcml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2hhbC9ydGw4NzIzYl9jbWQuYwppbmRleCBh
ZjZjZGRhODIuLmVkNTQyZTkzNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNi
cy9oYWwvcnRsODcyM2JfY21kLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9oYWwv
cnRsODcyM2JfY21kLmMKQEAgLTgzNSw3ICs4MzUsNyBAQCBzdGF0aWMgdm9pZCBTZXRGd1JzdmRQ
YWdlUGt0X0JUQ29leChzdHJ1Y3QgYWRhcHRlciAqcGFkYXB0ZXIpCiAKIAlCdWZJbmRleCArPSAo
Q3VydFBrdFBhZ2VOdW0qUGFnZVNpemUpOwogCi0JLyogIEp1bXAgdG8gbGFzdGVzdCBwYWdlICov
CisJLyogIEp1bXAgdG8gbGFzdCBwYWdlICovCiAJaWYgKEJ1ZkluZGV4IDwgKE1heFJzdmRQYWdl
QnVmU2l6ZSAtIFBhZ2VTaXplKSkgewogCQlCdWZJbmRleCA9IFR4RGVzY09mZnNldCArIChNYXhS
c3ZkUGFnZUJ1ZlNpemUgLSBQYWdlU2l6ZSk7CiAJCVRvdGFsUGFnZU51bSA9IEJDTlFfUEFHRV9O
VU1fODcyM0IgLSAxOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9oYWwv
c2Rpb19oYWxpbml0LmMgYi9kcml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2hhbC9zZGlvX2hhbGlu
aXQuYwppbmRleCA0ZTgxZWY1M2QuLmJiOGE0Yzk5OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFn
aW5nL3J0bDg3MjNicy9oYWwvc2Rpb19oYWxpbml0LmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL3J0
bDg3MjNicy9oYWwvc2Rpb19oYWxpbml0LmMKQEAgLTM4OCw3ICszODgsNyBAQCBzdGF0aWMgdm9p
ZCBfSW5pdFdNQUNTZXR0aW5nKHN0cnVjdCBhZGFwdGVyICpwYWRhcHRlcikKIAogCS8qICAyMDEw
LjA5LjA4IGhwZmFuICovCiAJLyogIFNpbmNlIEFERiBpcyByZW1vdmVkIGZyb20gUkNSLCBwcy1w
b2xsIHdpbGwgbm90IGJlIGluZGljYXRlIHRvIGRyaXZlciwgKi8KLQkvKiAgUnhGaWx0ZXJNYXAg
c2hvdWxkIG1hc2sgcHMtcG9sbCB0byBndXJhbnRlZSBBUCBtb2RlIGNhbiByeCBwcy1wb2xsLiAq
LworCS8qICBSeEZpbHRlck1hcCBzaG91bGQgbWFzayBwcy1wb2xsIHRvIGd1YXJhbnRlZSBBUCBt
b2RlIGNhbiByeCBwcy1wb2xsLiAqLwogCXZhbHVlMTYgPSAweDQwMDsKIAlydHdfd3JpdGUxNihw
YWRhcHRlciwgUkVHX1JYRkxUTUFQMSwgdmFsdWUxNik7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c3RhZ2luZy9ydGw4NzIzYnMvaGFsL3NkaW9fb3BzLmMgYi9kcml2ZXJzL3N0YWdpbmcvcnRsODcy
M2JzL2hhbC9zZGlvX29wcy5jCmluZGV4IDBlZTUwYjRhMS4uOGU4OTc3ZGFjIDEwMDY0NAotLS0g
YS9kcml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2hhbC9zZGlvX29wcy5jCisrKyBiL2RyaXZlcnMv
c3RhZ2luZy9ydGw4NzIzYnMvaGFsL3NkaW9fb3BzLmMKQEAgLTcxOSw3ICs3MTksNyBAQCB2b2lk
IEluaXRTeXNJbnRlcnJ1cHQ4NzIzQlNkaW8oc3RydWN0IGFkYXB0ZXIgKmFkYXB0ZXIpCiAKIC8q
ICAqLwogLyoJRGVzY3JpcHRpb246ICovCi0vKgkJRW5hbGJlIFNESU8gSG9zdCBJbnRlcnJ1cHQg
TWFzayBjb25maWd1cmF0aW9uIG9uIFNESU8gbG9jYWwgZG9tYWluLiAqLworLyoJCUVuYWJsZSBT
RElPIEhvc3QgSW50ZXJydXB0IE1hc2sgY29uZmlndXJhdGlvbiBvbiBTRElPIGxvY2FsIGRvbWFp
bi4gKi8KIC8qICAqLwogLyoJQXNzdW1wdGlvbjogKi8KIC8qCQkxLiBVc2luZyBTRElPIExvY2Fs
IHJlZ2lzdGVyIE9OTFkgZm9yIGNvbmZpZ3VyYXRpb24uICovCi0tIAoyLjM0LjEK
