Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710C234E764
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 23:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781567043; cv=none; b=SVDC5r1H39En6L6EtII6KP4gvBiHOYZSpQrxpZI46edzqKtQIFiK8HTUvGCA0SP0xQYW7kH7+cckpUVnYMN4WOK6IcAXyFZQ+fdb7tSxpze77crt4dXCG1hhuX/nRQMbhbPflNhNOjYytSlPmHvyWGpIQ4FfY0Rv9js60DDBKCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781567043; c=relaxed/simple;
	bh=GGAV5Bs+klUPVkudLojPNBVoQ1862lo0EbXYz/LpQaw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nRJ4HNZMNJMn1BjlC8DAhJFC/7Ut3y/dZ3f9E8bPM54VlWJMC0KbiEUj/jaQx/10BHULUoNJ8MK11/du5nReyJC1CsGjY9L4xHGEvQfyH0aVOkBlGi3vkM9DIlZP4y8ES2l4kG3rbdE2tkanQ/+h7UjC2yp1Dk4Y7FA4Il+IQt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kc9skDFl; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kc9skDFl"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-30b6dad2382so3301164eec.0
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 16:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781567042; x=1782171842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJEo/vTjAgusuqqxFMwIrCPx+m0XRfNRvmNhqxqv3rw=;
        b=Kc9skDFlWFDXqZdnJ0n9Vh1OgUn+voe+l61cuhVXycYBVue9Ca1GWheD29CflmZ+iz
         d0dG/1LOoEPx8jmFSARf1AntLU3wIXuju1Z0tS+UskgH1OUyxWiW1KYYlkP9ydR+de4A
         bygPpzrGa335ohsu0DMKXQrUBZLm3o0+yVhmSib6fCK7CBTiBuv8+FUN6g/LESArUs+g
         HsNSC9cZcUeY9enp7/a3k2YV2BBSybJXUmfGqpgpDxjwwXBKLvLbs1JLDTaljN09aYmP
         3sSAIrhHwsI5i8vKSLagEnCaPBn8NUlU+pNi6kI+Ekmq+KMeC22qhvJ2TrG3mKPycuec
         siBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781567042; x=1782171842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lJEo/vTjAgusuqqxFMwIrCPx+m0XRfNRvmNhqxqv3rw=;
        b=PkwX8cuS32x/ch63rLZgYyM0FPHBQRmmHEqZ/G4V8XTWV89fclEmuCnG9YowrLDe6z
         4xJWqgo3Z978yvA7EvvDLdZO12Rv6Cwh7amoRwBPTYc8T8DX8CZG7VnSYQJhec0kXnXF
         2YRm/wUJM0J02+Nqo+B6mMFQJ4C1NQwkEcPgvecg30dnCBlHte8t9/wJxbPBM29ab8vQ
         x5hDsr3V9f7+U2t76KLWnahF18PveBiUcyCNL8Q1LolDhyd5vgEERNEuR3SGqtk8/3VQ
         gHUfVIzru2AgrsCiuyvC0lru6qFjlsZ6mmTL95MsFC2SkujOndLf5UepCCwdh54Yf92M
         eJzg==
X-Forwarded-Encrypted: i=1; AFNElJ/BJRiPaWkvhYlSt+oJmGAYN9mytpu6ns/8wQG6IOu3Jjmjo1dhXoerLE+/VTdiOGjO1CfFvzbTJkaSksAA@lists.linux.dev
X-Gm-Message-State: AOJu0YyOLNryXeZbN9JApBlo2ZnAI7mti+FFi1t6r1Di6xm7Nk2FdYZt
	jPl03es6HLph3hUkT8f5lLPreVkMWuaJq+PGGyguijNbkcG2MZjAuOUm
X-Gm-Gg: Acq92OHLlzm2kkk9xr3j7S1lztBbL7BJHZZfzP7FPs9aPeGhh8WoCeSv4xxbyINgSVD
	+6JODcKpEGTKv9/07jfuPG7hlF3uEOEZfnp8EwNAJSPDwHg07IqquZ3iRrZfUgk0JS4MQIOs4Sa
	EzjmT3tpL3O0j0Whbw6tIJ2SGfVsdZD6Mvg/rcQ7OB/JVPSqvroXtCOG1DsIIJ6p+MqS2bMBh/f
	tULAHKliScv+1Nqs7yxNfDzw3mLQctUoeu1GKum9gJad6tU0ZO+IPIXzSP15Gg7EP60SvuM9eg6
	yFbiRPDCYOcyQH7YtEWBVYQ84AZbarIecaekInRXNJ6sD9ixa+4yTD776WPta8q7oNnQhNxoyI1
	VZcnfubbus0bGiww+UNHj7ca1krOJzuLPjBRI7LpzFmpjizK8I7OptLFhp+CSQHRBOjOJx+ZKU9
	slCIZ3Ktvet1RScSbQDMkiLfrZy0yyHLyBU99WtO6r/Kn8i4GtYIm3oxo=
X-Received: by 2002:a05:7300:641b:b0:2ef:8b72:1b9 with SMTP id 5a478bee46e88-3081fcd0213mr8007820eec.0.1781567041600;
        Mon, 15 Jun 2026 16:44:01 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e92096esm16988335eec.15.2026.06.15.16.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 16:44:01 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2 3/4] staging: rtl8723bs: convert update_attrib_sec_info to return errno
Date: Mon, 15 Jun 2026 23:43:39 +0000
Message-Id: <20260615234340.97299-4-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615234340.97299-1-dennylin0707@gmail.com>
References: <20260615234340.97299-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert update_attrib_sec_info() to return 0 on success and
a negative errno on failure.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 69b6d3a2554a..0fd2415e7bb7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -505,7 +505,7 @@ static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *
 	pattrib->retry_ctrl = false;
 }
 
-static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *pattrib, struct sta_info *psta)
+static int update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *pattrib, struct sta_info *psta)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
@@ -519,7 +519,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		pattrib->encrypt = 0;
 
 		if ((pattrib->ether_type != 0x888e) && !check_fwstate(pmlmepriv, WIFI_MP_STATE))
-			return _FAIL;
+			return -EINVAL;
 	} else {
 		GET_ENCRY_ALGO(psecuritypriv, psta, pattrib->encrypt, bmcast);
 
@@ -558,7 +558,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		pattrib->icv_len = 4;
 
 		if (psecuritypriv->busetkipkey == _FAIL)
-			return _FAIL;
+			return -EINVAL;
 
 		if (bmcast)
 			TKIP_IV(pattrib->iv, psta->dot11txpn, pattrib->key_idx);
@@ -596,7 +596,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	else
 		pattrib->bswenc = false;
 
-	return _SUCCESS;
+	return 0;
 }
 
 u8 qos_acm(u8 acm_mask, u8 priority)
-- 
2.34.1

