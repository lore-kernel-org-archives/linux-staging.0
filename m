Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0982F12A1
	for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 18:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784399017; cv=none; b=UHzjGLYmrfV4nQyqR4f8HD8mKy3E3XXoEsh7TzxN2YnNfD15n1SpbcHiEkhcxLfffB7n+GNnl2NA9obf6OSinYFcydvta0iFnMyBXYMI92/+VoS0IAwetiS3w0PBjUI6L5qqtnUhh2O8jGX8OPU5Yd30p2tGxo7cCjlP3IM3RXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784399017; c=relaxed/simple;
	bh=tgqxdQE/XO2OskQNWT7Hv3Jrb9yWSUauRxFhYp/Q6Lw=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject; b=ATI4im6A1K9SWB7lZuitbnsrwEX2tLKMSoOXneOkwdjaC55VqEZgPdgvyviL7OOI38SUfoK+C4m4yKo83ekVMpsSYDRDsVdYByJU1+9nh0CGNuBbm4gQZt6iNtknETE1akvIMy2/1D8G8Y42OiW4aZlKpVqYn3GpYKeQrjRKXOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+jyIZ90; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+jyIZ90"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-384c94c9423so974650a91.2
        for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 11:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784399016; x=1785003816; darn=lists.linux.dev;
        h=subject:cc:to:from:mime-version:content-type:date:message-id:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5bmlimQrWEZJP9wXnBlZyV/J+SO0CL4FeYe6T+B47Hc=;
        b=g+jyIZ90ospZSXpim2zygcHGnOlFTRJ84KUcJUcX6KcuaogGYqPGo7UqkuSwDzp2nZ
         MPXsogeeOBZAERQvn+YL7g8mE+l3/edUsIKV4jMrPEEBnk+cF44y+1phyMahB5n2hYqr
         jycIh+cYu32Yhbla12Ck31fkIS5tmcxDz7yLpCrVw+fTHQm+mMvBNw+XpfIO4WoZel0y
         MA3x9KbR42ABqH0YcJRz0dVRGNTIkFKhXhUC7Vzbu1S2I+pFny7HwL38QrbFQycy0cHs
         vjvpW1m7pNMXB91FO8gpOlup9wCEbj8f90ziTOKBPc9EO02vrV9AJ+KJxf2kJbwGc5+w
         e+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784399016; x=1785003816;
        h=subject:cc:to:from:mime-version:content-type:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5bmlimQrWEZJP9wXnBlZyV/J+SO0CL4FeYe6T+B47Hc=;
        b=TRX/xdEXv95n5vYFcINjMN0RJRhWJpaDu6D5cMUcQZYzlYdCXn4HtpQN5F8aE9bJW4
         BGCU5KitLsmajzDx5ZaPU3vD4IhwSaWzvORbbKZry4d2c6HU0yI5+sJgIyDmd7gyn+a9
         nRu1qpGqYTmvnvoa8VCScrOl1fYhWOPcjABhyd4wPVLcrBoAPyjsLkm8GdCQWhkV8rL2
         pZM4J/gnHF4Hual43yJcP3Oc7qHeWhyYZqvUjvR+u4aHKf8K0lg5zFIWsHsuR4C907Eb
         nPR3vW7IkLElDVVCbzj2htQu6S6RyZvaZ7N9+i0u31cJwCHdgxcg0qyYHjXUURlP7VdI
         7CqA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2FkZYuHp4PJaHToOWF9kwYJbqiJaBsKvRmCdDaSVzatyumn1aBikEklGuvzZACpPQEVDxD2/rRalTQThb@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8obgIdJiTLA/gz8VwYZ8IUzNhQikDH5Ga87LoQ0M6CSXzw3Q6
	TLU3pkjdCGwBifQHSww5dJiKdUmdjhCNTj5aSBsup3r1SI0ytvjDjtDX
X-Gm-Gg: AfdE7cn0JJyVL5jPklBWkykOLr47XRwhCL451Pv26pWxvk+84rycx3IxjNmZP/eVOCj
	9lDRFrFOvpXNGF3CRV00toDRKwEZEzZ3sD249keBrUe76ysKqT1eiyEvP07iS5xhJFKVy1Z6r1d
	qNX/h8k4nh/lx/2SB4u53ExZWFqxjNTDeR+bssVl+gu4suK/dQStWO+YkjywTiskcAKgCEsKmCx
	EemiBDafIHLUs0Egm3llHqnZzCJ7Ux6YwWJcYyoHR0t3K0/Id92VTb/lqKIKntZVauPZV65I04f
	jOdG1GGHFoOp99fiN0OagXRA1KX/oVaEjiqe3H+OqJ8HF0RfVeAHtM/mVhi8Li5GT32kAuvIex7
	oqvaGCyEWp9uO7+AP4r9xQuoawInNyZ/Vrt/gYP7HXl87TMda3ZjgA1KTzmF0GjTG4NIKzxvzU3
	nCXdoyhi5D8t2QtT85vG32SpBx
X-Received: by 2002:a17:90b:53c3:b0:38d:90c1:2485 with SMTP id 98e67ed59e1d1-38e4b5d6aebmr6068293a91.5.1784399015906;
        Sat, 18 Jul 2026 11:23:35 -0700 (PDT)
Received: from Potato.localdomain ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbda9sm19113650eec.19.2026.07.18.11.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 11:23:35 -0700 (PDT)
Message-ID: <6a5bc4a7.f1c1923d.2d2b59.05d9@mx.google.com>
Date: Sat, 18 Jul 2026 11:23:35 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============5043740731053490976=="
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shivesh <chanelshivesh@gmail.com>
To: andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: fix checkpatch errors in fbtft-bus.c

--===============5043740731053490976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From 7e9684b26176644bc92c2285acc7444f3f7ddb4d Mon Sep 17 00:00:00 2001
From: Shivesh <chanelshivesh@gmail.com>
Date: Sat, 18 Jul 2026 18:08:04 +0000
Subject: [PATCH] staging: fbtft: fix checkpatch errors in fbtft-bus.c

Fix space-related checkpatch errors in macro invocations. When the
modifier argument is empty, remove the trailing comma to avoid
'space required after comma' and 'space prohibited before close
parenthesis' conflicting errors.

Signed-off-by: Shivesh <chanelshivesh@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..409770891c54 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.53.0


--===============5043740731053490976==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-staging-fbtft-fix-checkpatch-errors-in-fbtft-bus.c.patch"

RnJvbSA3ZTk2ODRiMjYxNzY2NDRiYzkyYzIyODVhY2M3NDQ0ZjNmN2RkYjRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaGl2ZXNoIDxjaGFuZWxzaGl2ZXNoQGdtYWlsLmNvbT4KRGF0
ZTogU2F0LCAxOCBKdWwgMjAyNiAxODowODowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN0YWdp
bmc6IGZidGZ0OiBmaXggY2hlY2twYXRjaCBlcnJvcnMgaW4gZmJ0ZnQtYnVzLmMKCkZpeCBzcGFj
ZS1yZWxhdGVkIGNoZWNrcGF0Y2ggZXJyb3JzIGluIG1hY3JvIGludm9jYXRpb25zLiBXaGVuIHRo
ZQptb2RpZmllciBhcmd1bWVudCBpcyBlbXB0eSwgcmVtb3ZlIHRoZSB0cmFpbGluZyBjb21tYSB0
byBhdm9pZAonc3BhY2UgcmVxdWlyZWQgYWZ0ZXIgY29tbWEnIGFuZCAnc3BhY2UgcHJvaGliaXRl
ZCBiZWZvcmUgY2xvc2UKcGFyZW50aGVzaXMnIGNvbmZsaWN0aW5nIGVycm9ycy4KClNpZ25lZC1v
ZmYtYnk6IFNoaXZlc2ggPGNoYW5lbHNoaXZlc2hAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvc3Rh
Z2luZy9mYnRmdC9mYnRmdC1idXMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZmJ0
ZnQvZmJ0ZnQtYnVzLmMgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtYnVzLmMKaW5kZXgg
MzBlNDM2ZmYxOWU0Li40MDk3NzA4OTFjNTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9m
YnRmdC9mYnRmdC1idXMuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtYnVzLmMK
QEAgLTYyLDkgKzYyLDkgQEAgb3V0OgkJCQkJCQkJCSAgICAgIFwKIH0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKIEVYUE9SVF9TWU1CT0woZnVuYyk7CiAKLWRlZmluZV9mYnRmdF93cml0ZV9yZWcoZmJ0
ZnRfd3JpdGVfcmVnOF9idXM4LCB1OCwgdTgsICkKK2RlZmluZV9mYnRmdF93cml0ZV9yZWcoZmJ0
ZnRfd3JpdGVfcmVnOF9idXM4LCB1OCwgdTgpCiBkZWZpbmVfZmJ0ZnRfd3JpdGVfcmVnKGZidGZ0
X3dyaXRlX3JlZzE2X2J1czgsIF9fYmUxNiwgdTE2LCBjcHVfdG9fYmUxNikKLWRlZmluZV9mYnRm
dF93cml0ZV9yZWcoZmJ0ZnRfd3JpdGVfcmVnMTZfYnVzMTYsIHUxNiwgdTE2LCApCitkZWZpbmVf
ZmJ0ZnRfd3JpdGVfcmVnKGZidGZ0X3dyaXRlX3JlZzE2X2J1czE2LCB1MTYsIHUxNikKIAogdm9p
ZCBmYnRmdF93cml0ZV9yZWc4X2J1czkoc3RydWN0IGZidGZ0X3BhciAqcGFyLCBpbnQgbGVuLCAu
Li4pCiB7Ci0tIAoyLjUzLjAKCg==

--===============5043740731053490976==--
