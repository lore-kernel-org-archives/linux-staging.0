Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2362740B383
	for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 16:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790180224; cv=none; b=I93lw5Hz7E3XNrA849ZUIBwVdqT1zs/VCiSk5E3yiWWfS0pTdAGJFG8xJHd31F4XeKaXkRZFggC1PsaHNuqI7asv2CphVRTqv2BGg4PPXNYH5Vw+PiIdI4LSOZnmyWq7/TJCuG8Id7jX5q6popNCbkyZW6hUcRmUqxrP7TEz1Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790180224; c=relaxed/simple;
	bh=O2H1JqE5eKhA4nle7+NJGPZcT/lhXou48K8NVRXwhcw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L/qEGLXPdoKdY/qxT/+rJr3Yn4sIpUInMHmu9Zd3JJrimjS9UBuqPllxPGd8RmFMFEpsKM8p+4OR1Neq09/94GUevN3acGYqmhi3woqArjiCOyC4uGWqP7RtEPsn82SSLMRcyOgVE617lC8+z4vf/b5I1C4di5bfAHRm1/e+4aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rSeCq/Dj; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rSeCq/Dj"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396cccbba92so849701a91.0
        for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 09:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790180222; x=1790785022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zDmUDt4wtJfsRkSR0DM1YQ/ag+cNN2NUAkzr2LI5PBc=;
        b=rSeCq/Dj5AFOazl2ItT63YN4Q+8qMDrINIiRdO1lZS++4Mjn+S8+mmLmBFNgtgYFQn
         J+gvCaMIHTSGuGYvN26NJ9YREaXMV0wEAJP4ItMtan3QLlwdeEhr5we3Z1G16vxVgCI5
         6osdaBBpQ7ZwCLKypK5gHW0IFTMSzw2o3Ov2sfaR7wJUOVdg2xIDPC7cP8I+kKHil/Gn
         dCiAYfb3Hcs/NzdmAAAwkynVSbAK5zp/Dm9F/FJwXSV8+vnSoDtb7mxuDZ6xByhmc+0w
         zSNGZOIUOydaMUeap/Quy/oC1pMQCaBRF3c9Fe+ZFUuDtxcgxoIylYxWyL52eNtaW2Bk
         LetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790180222; x=1790785022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDmUDt4wtJfsRkSR0DM1YQ/ag+cNN2NUAkzr2LI5PBc=;
        b=RGBC5MrEtI16IhdUtQ2B/CeHaMtTBF+K/6RJCHcRrLAd3kFADNjkcMBSo/OrBUvBo9
         B1fDaNukeNR4w0kIjo6VWd+hFCqJEb1kG/qLOUnIqtiDkwMJWZun+ARYvi2e92BRAMqh
         J8PUTXBhHrxt0Qa7X8R5gTHSbMv5W0+lwkjv3g4KQo7AIgTthl6ICn/Ssjw34rehY+At
         fitugL4qrAGmxRyYqDiGF8lRHzxERjwOP3blcFMgo8Ylz8YkGq6WQATeCbO+FUMbi9TB
         yIQYyL9X7zANhFc3ZCkiDWS/2YdBvRWJUmYFkItsMDYKnpi3CdL0o8OdnU+P1gPxwJb5
         huFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLziX90dOEC9DFRvuORrNBUAB5NIC8MqWfDeK0905HRrwAGcvvUIDsDdhT7kdCjyMqDQVU0J+aFEjarEkr@lists.linux.dev
X-Gm-Message-State: AFuF++lwKiftw1h6bnUZw23YeyBAFmjpqR+HwGtAwWCIifExOAmVp5gr
	LmIuYMBz/NTDefL7OnhTU6a7XQB9JlC5JpHdBHaMKKQT7hAwszZ06xP0
X-Gm-Gg: AYBFou2Tjufj8zYlREK/e2lVS2RqNb+I2S/XvaWg51Mcn5tSq7Dpi0173B3OP4fluyE
	0r1//f9nhj53GvUyHY+FNq5SfdSPqHa/0Z1Ri9zLM5QINcKdwOWGTqMC9s0VYE6MFqHOzKBk9UP
	i0mk8JSAmhT1ujACIXrNObDQThneWncSiRu3LSaqgkUWkXl15qJGPTUakkiaBvgroBMlyzKQZwB
	lnBynHOHukALcCmj47EcD5O7qnSecWvWog/eI4I921bKxOsAaYUzqanGoFrYcaz05c/Fa2WDLnS
	ZWlitjiTH5mEVLfZkwHLFaIjQ56IvuOdUkqXlpswC2iSbqOezsvdd5ELP3R+iqDV+Iuod6L+du4
	Zvpzn4ahmnS+3BKdGDgh2cFytGqkT3X4Cfu2RcEZsbe1fdSNl1dVQMy7GRwLu7sGGPIMq2od+uw
	QkwYdrD78dYyOEUrtphckO0yCDxDocagaFpHACUUH5imEKG9p23l6FsXj+K4rLS2IbVqldRCP1D
	L8pPQXVP+SlzrpP
X-Received: by 2002:a17:90a:d443:b0:3a0:22bd:6ee5 with SMTP id 98e67ed59e1d1-3a07e4e34a8mr2968262a91.14.1790180222330;
        Wed, 23 Sep 2026 09:17:02 -0700 (PDT)
Received: from localhost.localdomain ([223.167.219.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddf23desm5743233a91.10.2026.09.23.09.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:17:01 -0700 (PDT)
From: "Eric LI (Honggang)" <eric.lee0305@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hungyu Lin <dennylin0707@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Jennifer Guo <guojy.bj@gmail.com>,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove unused-but-set-variable phal
Date: Thu, 24 Sep 2026 00:16:42 +0800
Message-Id: <20260923161642.318671-1-eric.lee0305@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unused variable phal in the function rtl8723bs_init_xmit_priv as it is not
used anymore after removing SdioTxFIFOFreePageLock spinlock (in commit e9b50a2821bb).

Signed-off-by: Eric LI (Honggang) <eric.lee0305@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 7f55448d544e..0441e84ea87d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -525,9 +525,6 @@ s32	rtl8723bs_hal_xmitframe_enqueue(
 s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
 {
 	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
-	struct hal_com_data *phal;
-
-	phal = GET_HAL_DATA(padapter);
 
 	init_completion(&xmitpriv->SdioXmitStart);
 	init_completion(&xmitpriv->SdioXmitTerminate);
-- 
2.34.1

