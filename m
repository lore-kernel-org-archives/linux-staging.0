Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C46C41613E
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119859; cv=none; b=YRTaNemZCJRtolSQO7/xGmeqwrIPaxP8reYmJkCei0uDvj4k//Q5FhizH65+KmbAQkmov7c6gWMqSL8U48izwxw2HouGwPgKzbTKWMPj9VAN3sswtMIB6XjQVxNQiCQJ3KLXZqssWH8MuMcavurQVaexdAd2xmLgXqedNQS0UuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119859; c=relaxed/simple;
	bh=wtfrGOSbYySqm4h0oIWWSq7cMn7fwHq4h1Zh+gzcI6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bz1C02jBP2IwLMPrNqb2NujeQAfcUZLv9vMXK7zsYsEKtdIfZdAhbQTMhD7uJ0SOSEE944PCQNlaiOLeYla+y2O6ryFMh9AEDeOQtl0pcF0/jl4botWUYS4Ps815AmtUVeXbWIUsabnyGLZqFXFyZtLlcJV6gJ5pCtJvbhpUPXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWxozFxK; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWxozFxK"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c9bb9d2fbso17825501fa.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119848; x=1784724648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjto6yW0lhXk7pSEPdKcvcJzxoNat2gyFFa/JjfwEhA=;
        b=bWxozFxKcmoO6rWICU4g9IJa9LmqIUznMHOwPr05k6UGCRrH6Sh0ybjLe9Ezw6xl+D
         Q8kH1ajLxpYNx1cF2bV5cUjETd3zVqfH/jcMJbafjrtmHu3nNQAIIyRkOOsj6nVJzRlx
         pvN/086+9WCM8ejOk6XAJLO4PfWgelE0HQ1/zGTDuxO2BRacpHcL0pg4xAhELp9rWMrk
         Wln0P2nTiFxUyt7Syx7e2gvi5qKVz/QSHRadvp7huDs6jjhet2AlBtD97JV9rWymMtF2
         67hkK0XxrhNT+l7ibyX/ekN/Ft80y5dNt9CacuGA9GsJx+JSNZs2bljWMvX4IhD9Rrzu
         6aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119848; x=1784724648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fjto6yW0lhXk7pSEPdKcvcJzxoNat2gyFFa/JjfwEhA=;
        b=dRkRFYvcg2Xvu1Or+SJoYmh/1ertMUQvy+mmzKLQDWawTcIcx+/VJRYeoLC9jw0rX6
         /V6LKeFG7vpX+YqLaqDZcn0hmCudYS9dEC8KvC8p7o+aiLdke84s1h1aqxVKpVpgajR8
         aLyqzs+x6mfyvsHGQq8ivZYeEUCN7SKHXL7sGfcjh9vcVJ1tC5iz48AWRD6yiIZVIBAI
         q9eT+wb/JN8hQfoiU82/mb9jGyVVBefVy/vzyYqQc94viZUq6A44QVIIH7h4dIWb4WjJ
         2g2QT1EtZKI+03D8fqj/VcYAFo9LnxzGOtT2h9gYqjivuJvFKLGz2cjfQ912o4T/SHsI
         a3+A==
X-Gm-Message-State: AOJu0YzLmq5PRXefbo4vx5eF7vUMRPOntAHrHrTHKaz46iOaLOSYjLKl
	Q1ZyF8gOu1lgCGiye/vrlOA5yOZAn45R7EbFSRIkv1sYr0GFlOFuuexQ
X-Gm-Gg: AfdE7cmq3CiI77RYZeEPFRrng4TbWKjgoFI2WqjbmrncT1oGwFoTaB4ijDuYtpOZH4T
	cspZC0jD4EcQ0JA+MYxdV2jhpDzghnZegpw66XFvZfHKKsZhvPUERXb2dp83rxVDN3MPKOw9fHm
	hH1gfaIt8B5KAEqXp9QVKsracGHsIm/jMDVhx415BCElQhev8kM8xQMNpbQfNu12tRit4YeB3KS
	PlXJtyEU1B7x2RbHDz5EcN6+lpBvGm412ayPAzOiBEH3OxTktsgzg0XTsGaN/uT8e3o8IETLgg4
	WYGqgGXabSFtxAogo1+WHzyXtRGaffCbibYmQodpyyJwo1/f2NwT5XEe/klx7f1Jo04LNXDOTmn
	lvLR3qmufbkSr2HC8OWquqz2RTcji4p9SwLz5gkUpcAc0uXkxjkgUBJzf3mMtLRggYzVUFxiCHZ
	pdgSkvORa62HIaKuMvb0QXLBFcoVgAYsj83hswtXhpmBE5LO/w6owwuiEpzIiDa0G0HLlaRpYSH
	yuGEMNd1qqRFzf6P4oe1Yl+
X-Received: by 2002:a05:6512:2390:b0:5b1:5dab:4640 with SMTP id 2adb3069b0e04-5b15dab4eeemr757981e87.57.1784119848012;
        Wed, 15 Jul 2026 05:50:48 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:47 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 41/61] staging: rtl8723bs: remove EXhalbtc8723b1ant_InitHwConfig
Date: Wed, 15 Jul 2026 19:48:09 +0700
Message-ID: <20260715124829.90290-42-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the useless external wrapper function
EXhalbtc8723b1ant_InitHwConfig. Call the internal function
halbtc8723b1ant_InitHwConfig directly, passing true as the second
argument to preserve the original behavior and clean up the code.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 6 +-----
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h | 3 ++-
 drivers/staging/rtl8723bs/hal/hal_btcoex.c      | 2 +-
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 522e4dd4c..0fde1654a 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -2018,7 +2018,7 @@ static void halbtc8723b1ant_InitCoexDm(struct btc_coexist *pBtCoexist)
 	pCoexSta->popEventCnt = 0;
 }
 
-static void halbtc8723b1ant_InitHwConfig(
+void halbtc8723b1ant_InitHwConfig(
 	struct btc_coexist *pBtCoexist,
 	bool bBackUp,
 	bool bWifiOnly
@@ -2107,10 +2107,6 @@ void EXhalbtc8723b1ant_PowerOnSetting(struct btc_coexist *pBtCoexist)
 	}
 }
 
-void EXhalbtc8723b1ant_InitHwConfig(struct btc_coexist *pBtCoexist, bool bWifiOnly)
-{
-	halbtc8723b1ant_InitHwConfig(pBtCoexist, true, bWifiOnly);
-}
 
 void EXhalbtc8723b1ant_InitCoexDm(struct btc_coexist *pBtCoexist)
 {
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
index f39c93ac7..8180b6071 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
@@ -168,7 +168,6 @@ struct coex_sta_8723b_1ant {
 /*  The following is interface which will notify coex module. */
 /*  */
 void EXhalbtc8723b1ant_PowerOnSetting(struct btc_coexist *pBtCoexist);
-void EXhalbtc8723b1ant_InitHwConfig(struct btc_coexist *pBtCoexist, bool bWifiOnly);
 void EXhalbtc8723b1ant_InitCoexDm(struct btc_coexist *pBtCoexist);
 void EXhalbtc8723b1ant_IpsNotify(struct btc_coexist *pBtCoexist, u8 type);
 void EXhalbtc8723b1ant_LpsNotify(struct btc_coexist *pBtCoexist, u8 type);
@@ -182,3 +181,5 @@ void EXhalbtc8723b1ant_BtInfoNotify(
 void EXhalbtc8723b1ant_HaltNotify(struct btc_coexist *pBtCoexist);
 void EXhalbtc8723b1ant_PnpNotify(struct btc_coexist *pBtCoexist, u8 pnpState);
 void EXhalbtc8723b1ant_Periodical(struct btc_coexist *pBtCoexist);
+
+void halbtc8723b1ant_InitHwConfig(struct btc_coexist *pBtCoexist, bool bBackUp,	bool bWifiOnly);
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index c2d355ef1..5a3aa9b16 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -835,7 +835,7 @@ void EXhalbtcoutsrc_InitHwConfig(struct btc_coexist *pBtCoexist, u8 bWifiOnly)
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		halbtc8723b2ant_InitHwConfig(pBtCoexist);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
-		EXhalbtc8723b1ant_InitHwConfig(pBtCoexist, bWifiOnly);
+		halbtc8723b1ant_InitHwConfig(pBtCoexist, true, bWifiOnly);
 }
 
 void EXhalbtcoutsrc_InitCoexDm(struct btc_coexist *pBtCoexist)
-- 
2.55.0

