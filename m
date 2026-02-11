Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E976F315D35
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 13:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770818182; cv=none; b=Fd8uzbbpLJstGsVFQFKzRXGpK+YO/5VHank7FklX3AGlEtqg+jzn6sO4hG4eZR0sLRoJTu6kex/u9Q9NleQrpJ8IqAsKsSgmBVVRekLzg9X9LIhx9+HeFUzWkm2qruMOYjspq/9wV0EW268nmFTrVzZKI+I4OUCLI6mF0JGwm78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770818182; c=relaxed/simple;
	bh=nOpcu90WA2R9uXSKx6/TlPQ/HvBsepY7KRcRGH70Ntc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mA1rKjGePo4Bhx/KRcqLwmav7pr7b6LpLRaflBpubL688Vy3XJeRo3b3cilRHZ7OCbKlQXcqu7VqGDX7qOdgwSNeJfb2wLRkfrzMOQe5TUodtRciwhl1YjTLTh6ewTaE36RrXN/kI4WyI3Lhe/WQd3XenSZcfcEnjkYyb0Fr57U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MpXby/Ow; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MpXby/Ow"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so52895735e9.3
        for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 05:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770818179; x=1771422979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d+9TfAUjeBuACIB/Bd1iQF+yD56azf2MlLBlQed5AnI=;
        b=MpXby/OwnegG5gxnTUG4brWvigitXH/h8xdQQP5nvjU941/q9xQAMmGX0tEGo226ue
         EGlWE1t/hzqqFNwC84yCb/SyNKT5fBEu+BXAcpqN0ynfRd7s/v5QYmdHwLAZ+fgw1PK7
         mRTQHz+AUBAmLxokHKq7etvbMKoHlHWyawpzAVnJlOTbNyBmLHqO9OkLR9S2W6nxiu2f
         b5jyPTZ2EOhdMI7WsI/kMtKxUQpvGzmF9HaN7ti298Z/HIkmRgXq3IeTGMpxmOooZfQx
         w6UnZkuO7brIKsR2nigFaVn2Zb0PaZnudVkY6V6dzewUmt3r00lmuAOWCWzeK7ndkwUz
         MXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770818179; x=1771422979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+9TfAUjeBuACIB/Bd1iQF+yD56azf2MlLBlQed5AnI=;
        b=II8Dk5O5FMJp+cnLnxIRXTKCbtsgNxXemYif/DhhNjmvW2KczDHTbbbwvLl6K6EtCQ
         R/0s/VO8j5JkoF/g9O5B5LGfqnUwipgF+IYq43srn5iPj58JBZ0JDfWF0fFB5WrdOAZ7
         +gxZxlhVrSOeEXOb/CyHe5XK5qArsawUIZU+m1SWKcCh7Lzy0rxws6DxzuCSRSI1BRJM
         r5jH2EKR2w3s1yviAl4f2WHrxcBBv993m/RWwxPnd8ET3YsrZOyC7FO2QcRZF1LrPWX6
         wGAsdSizjUlxtebnTbEeItJ2Hc/qKzT9wSqw1q4QIzYXMUDCi2YUUhlW1sdERKmMfcSr
         QU0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfN0BInVleODUr6lBN61Lq2g4IPDiqfhHVWhLaXTArPZqQR7UfuRogL2CiwXVuteS8GAHne0LhAmFjvxCg@lists.linux.dev
X-Gm-Message-State: AOJu0YwEEfaYycLQxNQ6y4svdGUthkVnBqIVA7f1S7zToDsJyVwkPUP8
	Nkm+a80oxNaYhbvHz16mRAtofBvH6hVJ10H4thjmLgtFZFLJ3FAAUo53
X-Gm-Gg: AZuq6aK1n62CGWrpPWg+NKYAG4EQ1EhgKYWfqcwU8EwZ8z18W+91BcK3VRZvo2KFNTo
	ffrzOk9BF2dyPYOi64/3hjVToYwDyQW49CK7/5PP8YbvCmixzo4q2V9GwlL8BpAvWEHV4Yd/Ts8
	2Xks/aoi9vH2waRW8rDOjHX8DgSdy7IMUBa329LMGShiNv14/Cb42c9QsG4QG74SWVlanxO4TkZ
	0ddXdyHJ2764S4FW/Q7VXwgx+SIyLyiKgnuDNXFDaIs40dnQbCq8qC54myoN0r1yVqpoa55/LsS
	j3mdfbfmZK1mS14ddDFfNFTOsKBRmrhGbyvdy0hakR1UuQLP9nQLxGKHkffD75OJRpHDDA+a1cP
	rQy04/y1ElaGNfESWohpNI0Ltb/LLg1nP0gCe0+nyWFhgzV44i22I39ZOEyTWNCN0TYXEiqTDgk
	BMDCC1r1WjbipRwIE7j+hsQP12yE+jMFgaR3SXVrBStf6lEbwUBnt9E/C1KQBRykA=
X-Received: by 2002:a05:600c:3506:b0:477:b642:9dc9 with SMTP id 5b1f17b1804b1-4835e1cb056mr24566265e9.28.1770818178864;
        Wed, 11 Feb 2026 05:56:18 -0800 (PST)
Received: from mariyam-Latitude-5310.. ([39.37.133.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd0e327sm44195465e9.14.2026.02.11.05.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 05:56:18 -0800 (PST)
From: Mariyam Shahid <mariyam.shahid135@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mariyam Shahid <mariyam.shahid135@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix YODA condition warnings
Date: Wed, 11 Feb 2026 18:55:45 +0500
Message-ID: <20260211135545.13505-1-mariyam.shahid135@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Place the constants on right side of the comparison in rtw_security.c
to follow kernel coding style. This resolves a checkpatch warning.

Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 8ee5bed252bf..601178dafcc7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1488,7 +1488,8 @@ void rtw_sec_restore_wep_key(struct adapter *adapter)
 	struct security_priv *securitypriv = &(adapter->securitypriv);
 	signed int keyid;
 
-	if ((_WEP40_ == securitypriv->dot11PrivacyAlgrthm) || (_WEP104_ == securitypriv->dot11PrivacyAlgrthm)) {
+	if ((securitypriv->dot11PrivacyAlgrthm == _WEP40_) ||
+	    (securitypriv->dot11PrivacyAlgrthm == _WEP104_)) {
 		for (keyid = 0; keyid < 4; keyid++) {
 			if (securitypriv->key_mask & BIT(keyid)) {
 				if (keyid == securitypriv->dot11PrivacyKeyIndex)
-- 
2.43.0

