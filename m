Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F23C244675
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 03:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776483426; cv=pass; b=q69/61wmgF6PfmlCZkU9yH4fs99Ji+lpMi83VcaZucUZX9dLVIs+lWKfoG25WAcp20RuhHNfAS5O6InrQD48TFCWUU3olN3fXZ/8snH/H8kmNF8xAxXXKuZ9WL/5T8OIXhMsv3RoEXAREZ//eFvkqZdVt0Ia9UJXjVMLvf/VN8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776483426; c=relaxed/simple;
	bh=883HPdgecEwH3mVCh7ztUD2DCTPr0UhX2zYX9o6X5Co=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=boR4SusU8jEhXNfkU7YZyzvYJ5NBKX3kBEX9V9V3FleEGdd/0ZsfPKqBhGssC2OG+YCL7ddAsmsnOARq05C3/NHIoiPSiq1HA2JgEK665ZPIgyRhwZi/Ibrfn1FuFJ2XQ61VOtq9RhB1hLzxIgTRK2A0tOn9yYI3LjH+zJ5jPGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2u+Y9/4; arc=pass smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2u+Y9/4"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-41c4d660b19so362894fac.1
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 20:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776483424; cv=none;
        d=google.com; s=arc-20240605;
        b=k8thn/miiZGnoQqcP2S+iOR3zMqIa1HYTPXflyWPEykr2g1u85eD/0/sr4MGBPaBPA
         7UvPGTv9Y7VfMpxEsxEdG9lZMu9F068PQka+vbVzVVwHJubNlrgonT/v3LPGFw77ofiz
         slJ+Fw18CB0hpWrSU//s/8aVG3dEa46WQTnEZOjbB0tcJJ1MEDB6b7GBDci9sQVWp/Rr
         bRigbAULoNmsa9IU/EXxmxUcW5tOv/6+3VPt5s1GdoA8P/FuAgp0PGT9N+C0QvO1rcIl
         qeVSmcLAKTEu1mjDwR16tx6OCF/tkcsnKLcJoXKzsYMqzNo+XAaV5HshI6jayPrLtmPc
         9qFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=0cbQ2Rr+d5GVZ/yG/o4dmwp/E/+LtbkWxwQURGbcW4E=;
        fh=xtoB+calFDHJbJSy1POjf9N0LKEL/5xnn2saNItJ04w=;
        b=SRvEeehBj5tEduZv0PY6T8k1nngkT0lkjdcMlPjI0tT13SGFh1PPNwyCgU/c5Kbay3
         uEbgdkUp8+yskO9lUP657dku2AldPjUVKfzlqcGAHZxl4sndF6BZyUS7SuqW9cyfVXOC
         3j8GUxFkOzfkGml+ELSxbsV5/5K+oo9VtZomy1dTj7KHXdo2HY8rgx9EMEOd0hzVEcAo
         JgpN3y412B90hG1gZ6ynh0lt8MvKeowX/eq6Mxv6YWFgaRv2GRyqrvmUm6JNBh9lNLnA
         o53TujT/NkPUCmLuI/sAkNkouNwpy80bUKWBrw0LBcWAPbbXKLBkByeXVrlZh31XKVP0
         4a0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776483424; x=1777088224; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0cbQ2Rr+d5GVZ/yG/o4dmwp/E/+LtbkWxwQURGbcW4E=;
        b=k2u+Y9/4iN1PtuZz9sZ+s/ZHRHZj4LBQUGxmsjaK70vlZ0Recoz5Ngxe6P206SppPe
         oXbPo8FN/ZFMAQWP/Sd5x98/1W33seuPhaJLIhwxfxQOD4BU12E1UuecGn4UGjnUb1Ml
         5mrqN4aYNqea7ZReb41OYjDHcmOhdF+iM2CwXOnEITD5mWTEaER+h0yNWAvVEXLmz0lb
         g28xMLIMauFsA5/Y1yodfgz+INLsJ+leg4S4w64YqTUpD2iwI0u8aKYkzAbb7mlsHB0I
         xbD3Lsa1parKu1wwgRCjAS8EF3Udqitp7KRWd4L/OxI3ofNmQvIlDTUipiO6lpMCQRTU
         4+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776483424; x=1777088224;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0cbQ2Rr+d5GVZ/yG/o4dmwp/E/+LtbkWxwQURGbcW4E=;
        b=DdYRN9rRO0tBOs5rr5E5OvrQdefjZcdYGCja08M90yLrdUz8/t7u5SRhNDa0Finljf
         K5eSPwiEnG+eoMEDajuYUxd0jxCeO+4KZD1iKbGtfIOXny+j1qZSvfta+wv6lqnATKaC
         vEz/GkWCpgGfXXsrGLqHxoWQSR1b8j2+2UPvLjB1DOE6mNEWvtLvWFBtDDppn5b32PPw
         5L7WKfELwj9KW1gRLnacig0qRpPCRzyPSkN9d6RNXXta6vRCusL/vSSj/TxHjXkxmkzW
         1H5LPUOfscY3UgdbaWJQVeeMz8VuS5uqzBwwolhphbQcGYrNk1M3Lk7MgK9XW/uUCA//
         sl9Q==
X-Gm-Message-State: AOJu0YylbthjJeiFIbCEL1J6tYIIiQX4ydb7XxZRlykTJEgBzsyreu2S
	7kGAcgXlX+fXMOPou6LVWOwzmsxdlHUntOoxBynWU1pqXACn/V1PR07nc3rwDUXmE3RsiRPhpST
	8cKUdcfeY74gCzCd0StTcR3AJ8bLTmG4=
X-Gm-Gg: AeBDieuh3I0krVkZpDf0cgMbjgBR3BfeiP3dBA5S9giLgG00AAG8QnF2sF+5f6lTmrQ
	QsFoXPzI2+aExGV9NDOZ6/MJAwgtnNqVsaBRs5q0yvm4qzlvPpDTurgTqb/npvADnJo2p1T7/cQ
	a0RXDHI/D9mgEwgLO/NRo+YGzSD6LzOBocq6YpNlBx6OjJ2Dg3HgjDZhVLoOA5h/FnxavQx7Zso
	71VXLVMRf9EZ+FcSFJmKGdM6wVqvgIjq+MVwo0bDN3T9CUgq4HJlTn6QA7UHQUIo5apOWNYYP6e
	4uMIgqM4k+zOBk+O4c35tDVUbwLKCa0UVKSzRFBc/arIXnMirGk=
X-Received: by 2002:a05:6871:d3c4:b0:417:359c:292e with SMTP id
 586e51a60fabf-42abf2f29f1mr3430575fac.12.1776483424121; Fri, 17 Apr 2026
 20:37:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Hari Haran <osdevhari@gmail.com>
Date: Sat, 18 Apr 2026 09:06:52 +0530
X-Gm-Features: AQROBzCFkMWkP7JSr7fSQ51LEWeUvSdyo9FmU-Cnh2-8gHXvz-cnOXIFP3S7uG4
Message-ID: <CA+TGEkHXoCfY0RhmKFnfLrnPO+dKwKXAnGu84RNsNcE0=MaGAQ@mail.gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove trailing whitespace in rtw_xmit.c
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000071cbba064fb3c781"

--00000000000071cbba064fb3c781
Content-Type: multipart/alternative; boundary="00000000000071cbb9064fb3c77f"

--00000000000071cbb9064fb3c77f
Content-Type: text/plain; charset="UTF-8"

From 6bc4478708261b77cd9eea568a4de8f60ce5cd7c Mon Sep 17 00:00:00 2001
From: Haribytecode <osdevhari@gmail.com>
Date: Sat, 18 Apr 2026 08:54:59 +0530
Subject: [PATCH] staging: rtl8723bs: remove trailing whitespace in
rtw_xmit.c

Fix checkpatch error for trailing whitespace.

Signed-off-by: Haribytecode <osdevhari@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c
b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index d77a2f3603ae..4cedb6a06f45 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -2176,13 +2176,12 @@ static void
dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struc

  ret = xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe);

- if (true == ret) {
+ if (ret) {
  ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority, (u8
*)(&ac_index));

  ptxservq->qcnt--;
  phwxmits[ac_index].accnt--;
- } else {
- }
+ }
  }
 }

-- 
2.53.0

--00000000000071cbb9064fb3c77f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From 6bc4478708261b77cd9eea568a4de8f60ce5cd7c Mon Sep 17 0=
0:00:00 2001<br>From: Haribytecode &lt;<a href=3D"mailto:osdevhari@gmail.co=
m">osdevhari@gmail.com</a>&gt;<br>Date: Sat, 18 Apr 2026 08:54:59 +0530<br>=
Subject: [PATCH] staging: rtl8723bs: remove trailing whitespace in rtw_xmit=
.c<br><br>Fix checkpatch error for trailing whitespace.<br><br>Signed-off-b=
y: Haribytecode &lt;<a href=3D"mailto:osdevhari@gmail.com">osdevhari@gmail.=
com</a>&gt;<br>---<br>=C2=A0drivers/staging/rtl8723bs/core/rtw_xmit.c | 5 +=
+---<br>=C2=A01 file changed, 2 insertions(+), 3 deletions(-)<br><br>diff -=
-git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723b=
s/core/rtw_xmit.c<br>index d77a2f3603ae..4cedb6a06f45 100644<br>--- a/drive=
rs/staging/rtl8723bs/core/rtw_xmit.c<br>+++ b/drivers/staging/rtl8723bs/cor=
e/rtw_xmit.c<br>@@ -2176,13 +2176,12 @@ static void dequeue_xmitframes_to_s=
leeping_queue(struct adapter *padapter, struc<br>=C2=A0<br>=C2=A0		ret =3D =
xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe);<br>=C2=A0<br>-		i=
f (true =3D=3D ret) {<br>+		if (ret) {<br>=C2=A0			ptxservq =3D rtw_get_sta=
_pending(padapter, psta, pattrib-&gt;priority, (u8 *)(&amp;ac_index));<br>=
=C2=A0<br>=C2=A0			ptxservq-&gt;qcnt--;<br>=C2=A0			phwxmits[ac_index].accn=
t--;<br>-		} else {<br>-		}<br>+		} <br>=C2=A0	}<br>=C2=A0}<br>=C2=A0<br>--=
 <br>2.53.0<br><br></div>

--00000000000071cbb9064fb3c77f--
--00000000000071cbba064fb3c781
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-staging-rtl8723bs-remove-trailing-whitespace-in-rtw_.patch"
Content-Disposition: attachment; 
	filename="0001-staging-rtl8723bs-remove-trailing-whitespace-in-rtw_.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mo3sc97v0>
X-Attachment-Id: f_mo3sc97v0

RnJvbSA2YmM0NDc4NzA4MjYxYjc3Y2Q5ZWVhNTY4YTRkZThmNjBjZTVjZDdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYXJpYnl0ZWNvZGUgPG9zZGV2aGFyaUBnbWFpbC5jb20+CkRh
dGU6IFNhdCwgMTggQXByIDIwMjYgMDg6NTQ6NTkgKzA1MzAKU3ViamVjdDogW1BBVENIXSBzdGFn
aW5nOiBydGw4NzIzYnM6IHJlbW92ZSB0cmFpbGluZyB3aGl0ZXNwYWNlIGluIHJ0d194bWl0LmMK
CkZpeCBjaGVja3BhdGNoIGVycm9yIGZvciB0cmFpbGluZyB3aGl0ZXNwYWNlLgoKU2lnbmVkLW9m
Zi1ieTogSGFyaWJ5dGVjb2RlIDxvc2RldmhhcmlAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvc3Rh
Z2luZy9ydGw4NzIzYnMvY29yZS9ydHdfeG1pdC5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0
YWdpbmcvcnRsODcyM2JzL2NvcmUvcnR3X3htaXQuYyBiL2RyaXZlcnMvc3RhZ2luZy9ydGw4NzIz
YnMvY29yZS9ydHdfeG1pdC5jCmluZGV4IGQ3N2EyZjM2MDNhZS4uNGNlZGI2YTA2ZjQ1IDEwMDY0
NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2NvcmUvcnR3X3htaXQuYworKysgYi9k
cml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2NvcmUvcnR3X3htaXQuYwpAQCAtMjE3NiwxMyArMjE3
NiwxMiBAQCBzdGF0aWMgdm9pZCBkZXF1ZXVlX3htaXRmcmFtZXNfdG9fc2xlZXBpbmdfcXVldWUo
c3RydWN0IGFkYXB0ZXIgKnBhZGFwdGVyLCBzdHJ1YwogCiAJCXJldCA9IHhtaXRmcmFtZV9lbnF1
ZXVlX2Zvcl9zbGVlcGluZ19zdGEocGFkYXB0ZXIsIHB4bWl0ZnJhbWUpOwogCi0JCWlmICh0cnVl
ID09IHJldCkgeworCQlpZiAocmV0KSB7CiAJCQlwdHhzZXJ2cSA9IHJ0d19nZXRfc3RhX3BlbmRp
bmcocGFkYXB0ZXIsIHBzdGEsIHBhdHRyaWItPnByaW9yaXR5LCAodTggKikoJmFjX2luZGV4KSk7
CiAKIAkJCXB0eHNlcnZxLT5xY250LS07CiAJCQlwaHd4bWl0c1thY19pbmRleF0uYWNjbnQtLTsK
LQkJfSBlbHNlIHsKLQkJfQorCQl9IAogCX0KIH0KIAotLSAKMi41My4wCgo=
--00000000000071cbba064fb3c781--
