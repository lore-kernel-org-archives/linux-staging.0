Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C512346A0A
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 19:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293312; cv=none; b=gfB+OsqBbfs2ZGYFYSTJbV6kaBJCFwYPulVEeYI0sJAdKut3EZ9nrNn7KzWHxAzaBU2mbTvtoOxj3/5u0E4JTQu2AYXO64jiD7GZ+XSxofnhZ9lUviEcsfm+NjcAy4ZeQ9I/EzgZxzj2IizHzYWtr/zo8atTja/e50f8DhwsZFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293312; c=relaxed/simple;
	bh=Kd6KKIheG7pQLbd6FU+S2/RcQuFgLQL0deoLQ+NA5Us=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xo6qHlhWzyru8KJBw2583u/ubInV91hnRxOTZTA0atAxpnTH4b9PuGIXTBZQK9PUlQGhNoXbK49NqzM+0fPfeB9iy3kVLW7yH0JM8b19I1WPwwoYLejnZYk6x6T8LY2fgifQwg2aklJLk3BEOFONBEx8me17ztBtYFeVWkiPYHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BeYe1hPc; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BeYe1hPc"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b07069e2efso3403235ad.3
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 12:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774293310; x=1774898110; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JdAivQo6ek5gX+/XlxKAoxnMD3pS4ApRyuhPygqnWTQ=;
        b=BeYe1hPcOS7Fa+3SCH0O8kVT/kVeEGaxk0YgXAituMlIIIler6uCKEmxMH3hpFIpsF
         CprDKc+LOumjGZ/u/sWX+Jb5UffpXb03EFHegO5w6+W9wDxM8Rk7RJj+uQk1W3LO2n/P
         hlCZ7dq8lXzmcQuGqCrm84Zv4RpnsmYAK3t2KlxVQw8gKNeSQbMeaaQmANu2TeZCVNhf
         o+1o9M0rrtDXDxAhkAUKP+nF4HYgN8/jQ9K68x0mCQhQ02feXtmZzJMEsmmwRLusG9Gi
         GXjjFlk3qZ1b/Egf1bgAB14xR44YWToxb0ms7ehEeptcms4h/3WeMlqlgv5/5RZgeCvo
         xofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774293310; x=1774898110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdAivQo6ek5gX+/XlxKAoxnMD3pS4ApRyuhPygqnWTQ=;
        b=W25+a+sKyuPw0+IA3yj997jB9wpMcbrVatxPxO9rB3CCn7mLd90uBYkiWzBGFqsl/m
         6/3qPmn/VQEUgtj8UaFfO3vy6RqG/6No1/CqLGxjy+vMd8tylRkpa13Ck0M4/ep8AoFM
         +8ziCKwDAyo8HtPw5C2lytAwazNiWrk6ub+opgpD3mTkDWre8Rck0wB6uBmp53LLQFWU
         bbWe56HlfGZDBNAJh9ihnHEPouLyIMb/UuVnKllYbZqTIpXzBRHOf4Ci32Afeglqwlki
         11GyZLeJUPw1vK40T+phdMKWGUZumnV86XwlJFuhDmgbKP7UMOpXgsKNl3v7pzCdSons
         PCVg==
X-Forwarded-Encrypted: i=1; AJvYcCVlagdnTdadyvzqMVyS+4+nPdfqOLq59pTG5X5qgLUJzmspszgSN0qHoNUaG9YdF/xGnKMwSYDNXaRXA5el@lists.linux.dev
X-Gm-Message-State: AOJu0YzaCvQ4+cFZni2lR8R2YooGKyHso2Ctaz7nQgNtMQo5ExXrma0x
	wLCmJOmZeAZb8ukcl+ffLP+ri0Sez+qVWdGJNIoaR2/k60i14mXA85SBuytpolzp
X-Gm-Gg: ATEYQzy0AlSaX3wOll+nSvDlv+A8qTcLGmM4qaECi3loaflfuqnjNcaBeT1UR2i02sC
	JHXa9MBDgJPe+QCxIwnu/Zem0YQiUK8W6vOGKD11si27tviGuLT9GnzfN19D6nwEursQeTGlpNb
	0BxgFFnvYeCkoX8Ncto33P/4tl8baInpiA5zACBR2qbjKX6di15ERoPuFER3MY+XtTEba7j6XVV
	NkSaXZH8vPNNjrOzx5j+c41nNOm4xsAwh/YeS37XLorLkd+F0GhddAA/mlnvPYpsy+D3kqtwRH4
	AOAzlfBGslrFozjNbAjwES7uz6HcGDveR4kctbd99S6AdZkx+AnJozaQrrlpr+SfSPC0rA/Yb2q
	6tDJOz2RARPER0DqPjUHRfI7QMCX9V5CdwXzl5RIc9v5/h1/LGcXbyL088veTpUJlZsqaN3iubm
	yUvzU7cXIYsNlVA/6czzI0x4E5d7bJYLL0hQ==
X-Received: by 2002:a17:902:f605:b0:2b0:5084:eb1e with SMTP id d9443c01a7336-2b0827d60d6mr119926545ad.42.1774293309687;
        Mon, 23 Mar 2026 12:15:09 -0700 (PDT)
Received: from arch-btw ([106.0.57.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c74dsm159957025ad.62.2026.03.23.12.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:15:08 -0700 (PDT)
From: sajal90 <sajal2005gupta@gmail.com>
To: gregkh@linuxfoundation.org,
	s9430939@naver.com
Cc: andriy.shevchenko@intel.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sajal2005gupta@gmail.com
Subject: [PATCH] staging: rtl8723bs: tidy logical continuations in xmit_linux.c
Date: Tue, 24 Mar 2026 00:45:01 +0530
Message-ID: <20260323191501.40269-1-sajal2005gupta@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 0be3143fffe5..d5027aafbdb1 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -193,12 +193,11 @@ void _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 
 	rtw_check_xmit_resource(padapter, pkt);
 
-	if (!rtw_mc2u_disable
-		&& check_fwstate(pmlmepriv, WIFI_AP_STATE) == true
-		&& (IP_MCAST_MAC(pkt->data)
-			|| ICMPV6_MCAST_MAC(pkt->data)
-			)
-		&& padapter->registrypriv.wifi_spec == 0) {
+	if (!rtw_mc2u_disable &&
+		check_fwstate(pmlmepriv, WIFI_AP_STATE) == true &&
+		(IP_MCAST_MAC(pkt->data) ||
+		 ICMPV6_MCAST_MAC(pkt->data)) &&
+		padapter->registrypriv.wifi_spec == 0) {
 		if (pxmitpriv->free_xmitframe_cnt > (NR_XMITFRAME / 4)) {
 			res = rtw_mlcst2unicst(padapter, pkt);
 			if (res)
-- 
2.53.0

