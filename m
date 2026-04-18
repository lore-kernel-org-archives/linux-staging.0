Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE286BB5B
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 03:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776481325; cv=pass; b=c3DXxXgkCeWH1sqb3/VMqQ13pTDXtZutW9GwCzA66cRftmk899OR/+C/Y9Txccv76bdOozRq+9Grz7UuhscWX0FVEglcFHwSiLjTTlPvNJ/vtUFd3QVZO6C4ypoHUKGOMGeX4tX2R69QAFxx2+arWPljf7Xk8pWSwBgmG4ch1SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776481325; c=relaxed/simple;
	bh=WnNkGTUHKSdThqJuZRumXLbC3kuptcCAijjM2BI8Fnw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=YOg9e9WPZNi7S6w4nqcJN5dVkk9KxCtjM4E9P6XO33qL+FA+Wp0nunWgld905+LHOJFa0aXEqTMAhq8AL43cT4x2+s3qh5jtDpToG9o+TxmtVI//LZ36zB46xn6RqU18KCM/YaK0JpX3h+o0SlbYZ9e/gkqN7oVT1lT0lX/aTdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r01dXK3R; arc=pass smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r01dXK3R"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-47952229034so827523b6e.3
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 20:02:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776481323; cv=none;
        d=google.com; s=arc-20240605;
        b=DAD8HwWdLb35BjohR0iX/ItTPhJMmOVbCLthQMFWDwrOmldvj7aOB5AM/RF4pPH9GL
         ruJ3uWHx/FqMwtZk/FOv/NYGzFhbhp6YQp4/dXgx8iYrCs5SyTjxyCwsoAEwX+H2A7/4
         Frcb0Vj99o+FHxmpCCnD9uba/aPm0R4IM9AlM5l+XEJu/aew3RP9Np+RzrMY6uRyJVjy
         kCWt9MYAVgoY3GrmkckzDIPJ+werl7fZd23rKJe9TTmoG5ly0nLYJsuqr6gsfNfXnm2r
         71bY9mRFf/04kyhC4/xPb/+9t8CfUCf1uQRN9OPyNL0TLHsk3ECzK8d+8XHQ1Aqe5Nb2
         wB6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=cpKszotJECG4tsYtG4U2R21XgPRMXofoFThmm1L53mU=;
        fh=xtoB+calFDHJbJSy1POjf9N0LKEL/5xnn2saNItJ04w=;
        b=h2CWaIhSOATAHKBYJYOWRdeCAYiO3d85gJ9Ri3Heub7cEe5LwtHS9FPqS0ZUZrd8pX
         lkW4RPMDpp9/FO2xPZ6ShN3EoHyrr7N3ESURu2Tr8XDxHO/w7qI/sdcwo4RGfIOwblhd
         Po4iLEaJHFu9GtXLKIEEZK+3Dp5gZKTZZbAczFc/Q1PyPW6DvOk94bgQdUK6fuVYsJM0
         hHBqAmWPohxqOeE4vu38mGuo+XkQqz0GpCPixRIp6sBrBQxH7zVSsk0pZLg9Er6gbX5a
         DddqxHlPMpld2b50hTIV5G2VzSTal0XFI7EzbhAt6ZnrNlxPX8JN5yCM3EoHP9YDvaDb
         b62Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776481323; x=1777086123; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cpKszotJECG4tsYtG4U2R21XgPRMXofoFThmm1L53mU=;
        b=r01dXK3R2nwYa+71NTE6xhicpQY1HsYQzibxOjZeDhOHMQT/xaCUMKosGIqS+0OMYK
         PiM8awB9NmxxEyHFwDh4MWGD2UKyyE9T7XCeMhHTErmRzz0jKkaIKhsslGr90Nu7xSUe
         sRajBgwejkAGcTceODMxncP5NKwcwTlpxBGaZqRFn3Yv5OH1tDKmTY7pVnslOQfzLejf
         wh8Ks8zN8CD4WMlIyvUHKJ3RlylIe4DT4kFsh7VWTJ5dGSOEX66daQpVIsO0/Jol6iU2
         YKPiFtWarowC+APzMjMC2Isr0yE9FCnJovNzxnGdvhK9zrhMblFrC2pV6MgS69xlCPQy
         ZNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776481323; x=1777086123;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cpKszotJECG4tsYtG4U2R21XgPRMXofoFThmm1L53mU=;
        b=GzI5GUADd4A8yMTM7mm6NlRj0L5Kpimm7bH4lrmG46sz3mksMtewFDJ78RnyBs7R8b
         4tDIUaWJSy3YbpcUrjkKsmkDF48Ys9kUSQZwpSJCU5+aE62qxpZMyQ909le+vlTvj/UJ
         AgGXc60Y61Sv+ezqpOFGszcsfUcsrKwfd5qIVCOtcpsyZno5+nCRDO+YPYI0qQIbf0ab
         OjVzqJY2y3Euxk8cVNDoyRAxil0EeSSgLSAwBJwPdso2LH/JkkuMq+w+0XdiaKdNsDyK
         Wb7lewb+bsTrPvqd1ZlJ3+hBM1egBr1VmED3L6j+kBQzBt8klpcDGRkEHSwiCLHZ/dOr
         fG8A==
X-Gm-Message-State: AOJu0YwVdY0jMKp8gWAGcieFBgkZgn0ndO4soP7rk401l9ptJtcWXYSe
	regY2KyhlaVGx6zMtBQ1hzS4WXY5aPG0+f5HcycpJ15ENCLUXBXCsSjPqnh8hruDEmIWXL1AGil
	l15JKl9VUcrO1AR7n/5HCtqIM2GNuv7MARSUl
X-Gm-Gg: AeBDievVMVO1GtNrO7bgnRthy6Vb00sJYJf6xfXFQUFTcBTglszb0PXXjLIGBMZm6U2
	3FlD4tcg6W5tUARGTpWCc5P56fejB0CUbXkxVmmK6onuifaHqtbkgTuSt6UZJ6yoTHZbZtDCKVr
	IpxijMlopbMgRiAl+IGIYBIKUVIE3js9MXJVRow+u6Rzy+eaRm7M5yoTuGvvOrFntGyLNvALdmK
	MiuK3BKDtIRK1AqoW5vTzaljkRuLbIKRUOPh7DWihktt+3TIsMKVaBY38z26K3fv34UfmTffBPB
	kXpH2ks5+0+olIJUkar7Dqct5agLSBMfCLJjFwuTKyq2LRNEa+g=
X-Received: by 2002:a05:6808:4f1e:b0:467:1941:1f18 with SMTP id
 5614622812f47-4799c951609mr3126344b6e.14.1776481323007; Fri, 17 Apr 2026
 20:02:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Hari Haran <osdevhari@gmail.com>
Date: Sat, 18 Apr 2026 08:31:51 +0530
X-Gm-Features: AQROBzAXO8XhI1w4i6gsQX9Qi3ttUzFcXsi8KB4HBaIxP1l0s87fKAOrou6XLZw
Message-ID: <CA+TGEkGJ4HaZZOVSXhkb93y9gdBZZf3e0G=zajdx9sAo4iBU5w@mail.gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix alignment issue in rtw_xmit.c
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000355cb8064fb34aa5"

--000000000000355cb8064fb34aa5
Content-Type: multipart/alternative; boundary="000000000000355cb6064fb34aa3"

--000000000000355cb6064fb34aa3
Content-Type: text/plain; charset="UTF-8"

From e49981e80ea3535189a2ff2a5b6c0185ccac5acb Mon Sep 17 00:00:00 2001
From: Haribytecode <osdevhari@gmail.com>
Date: Fri, 17 Apr 2026 22:57:13 +0530
Subject: [PATCH] staging: rtl8723bs: fix alignment issue in rtw_xmit.c

Fix checkpatch alignment warning to match kernel coding style.

Signed-off-by: Haribytecode <osdevhari@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c
b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 7b18be8912e6..d77a2f3603ae 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -2483,8 +2483,8 @@ struct xmit_buf
*dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpri
  type = GetFrameSubType(pxmitbuf->pbuf + TXDESC_OFFSET);

  if ((type == WIFI_PROBEREQ) ||
- (type == WIFI_DATA_NULL) ||
- (type == WIFI_QOS_DATA_NULL)) {
+    (type == WIFI_DATA_NULL) ||
+    (type == WIFI_QOS_DATA_NULL)) {
  list_del_init(&pxmitbuf->list);
  break;
  }
-- 
2.53.0

--000000000000355cb6064fb34aa3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From e49981e80ea3535189a2ff2a5b6c0185ccac5acb Mon Sep 17 0=
0:00:00 2001<br>From: Haribytecode &lt;<a href=3D"mailto:osdevhari@gmail.co=
m">osdevhari@gmail.com</a>&gt;<br>Date: Fri, 17 Apr 2026 22:57:13 +0530<br>=
Subject: [PATCH] staging: rtl8723bs: fix alignment issue in rtw_xmit.c<br><=
br>Fix checkpatch alignment warning to match kernel coding style.<br><br>Si=
gned-off-by: Haribytecode &lt;<a href=3D"mailto:osdevhari@gmail.com">osdevh=
ari@gmail.com</a>&gt;<br>---<br>=C2=A0drivers/staging/rtl8723bs/core/rtw_xm=
it.c | 4 ++--<br>=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br><=
br>diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging=
/rtl8723bs/core/rtw_xmit.c<br>index 7b18be8912e6..d77a2f3603ae 100644<br>--=
- a/drivers/staging/rtl8723bs/core/rtw_xmit.c<br>+++ b/drivers/staging/rtl8=
723bs/core/rtw_xmit.c<br>@@ -2483,8 +2483,8 @@ struct xmit_buf *dequeue_pen=
ding_xmitbuf_under_survey(struct xmit_priv *pxmitpri<br>=C2=A0			type =3D G=
etFrameSubType(pxmitbuf-&gt;pbuf + TXDESC_OFFSET);<br>=C2=A0<br>=C2=A0			if=
 ((type =3D=3D WIFI_PROBEREQ) ||<br>-				(type =3D=3D WIFI_DATA_NULL) ||<br=
>-				(type =3D=3D WIFI_QOS_DATA_NULL)) {<br>+			 =C2=A0 =C2=A0(type =3D=3D=
 WIFI_DATA_NULL) ||<br>+			 =C2=A0 =C2=A0(type =3D=3D WIFI_QOS_DATA_NULL)) =
{<br>=C2=A0				list_del_init(&amp;pxmitbuf-&gt;list);<br>=C2=A0				break;<b=
r>=C2=A0			}<br>-- <br>2.53.0<br><br></div>

--000000000000355cb6064fb34aa3--
--000000000000355cb8064fb34aa5
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-staging-rtl8723bs-fix-alignment-issue-in-rtw_xmit.c.patch"
Content-Disposition: attachment; 
	filename="0001-staging-rtl8723bs-fix-alignment-issue-in-rtw_xmit.c.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mo3r31nf0>
X-Attachment-Id: f_mo3r31nf0

RnJvbSBlNDk5ODFlODBlYTM1MzUxODlhMmZmMmE1YjZjMDE4NWNjYWM1YWNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYXJpYnl0ZWNvZGUgPG9zZGV2aGFyaUBnbWFpbC5jb20+CkRh
dGU6IEZyaSwgMTcgQXByIDIwMjYgMjI6NTc6MTMgKzA1MzAKU3ViamVjdDogW1BBVENIXSBzdGFn
aW5nOiBydGw4NzIzYnM6IGZpeCBhbGlnbm1lbnQgaXNzdWUgaW4gcnR3X3htaXQuYwoKRml4IGNo
ZWNrcGF0Y2ggYWxpZ25tZW50IHdhcm5pbmcgdG8gbWF0Y2gga2VybmVsIGNvZGluZyBzdHlsZS4K
ClNpZ25lZC1vZmYtYnk6IEhhcmlieXRlY29kZSA8b3NkZXZoYXJpQGdtYWlsLmNvbT4KLS0tCiBk
cml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2NvcmUvcnR3X3htaXQuYyB8IDQgKystLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2NvcmUvcnR3X3htaXQuYyBiL2RyaXZlcnMvc3RhZ2lu
Zy9ydGw4NzIzYnMvY29yZS9ydHdfeG1pdC5jCmluZGV4IDdiMThiZTg5MTJlNi4uZDc3YTJmMzYw
M2FlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2NvcmUvcnR3X3htaXQu
YworKysgYi9kcml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2NvcmUvcnR3X3htaXQuYwpAQCAtMjQ4
Myw4ICsyNDgzLDggQEAgc3RydWN0IHhtaXRfYnVmICpkZXF1ZXVlX3BlbmRpbmdfeG1pdGJ1Zl91
bmRlcl9zdXJ2ZXkoc3RydWN0IHhtaXRfcHJpdiAqcHhtaXRwcmkKIAkJCXR5cGUgPSBHZXRGcmFt
ZVN1YlR5cGUocHhtaXRidWYtPnBidWYgKyBUWERFU0NfT0ZGU0VUKTsKIAogCQkJaWYgKCh0eXBl
ID09IFdJRklfUFJPQkVSRVEpIHx8Ci0JCQkJKHR5cGUgPT0gV0lGSV9EQVRBX05VTEwpIHx8Ci0J
CQkJKHR5cGUgPT0gV0lGSV9RT1NfREFUQV9OVUxMKSkgeworCQkJICAgICh0eXBlID09IFdJRklf
REFUQV9OVUxMKSB8fAorCQkJICAgICh0eXBlID09IFdJRklfUU9TX0RBVEFfTlVMTCkpIHsKIAkJ
CQlsaXN0X2RlbF9pbml0KCZweG1pdGJ1Zi0+bGlzdCk7CiAJCQkJYnJlYWs7CiAJCQl9Ci0tIAoy
LjUzLjAKCg==
--000000000000355cb8064fb34aa5--
