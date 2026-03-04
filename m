Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7877A37EFE3
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 17:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772644810; cv=none; b=Zcv2cfkMsVD5obpksYj8YGc2UgKGrSnegT3+0es3CAezMRPkAlliAbYANvaR3O9IM2i44tVb5RyqEebirJoySFab03xzaIRMd+98NLqSFjd+BBKmWstc/gi+dYWhDcUjinhDV7Ygsx+PA/+dOdzkrPrtMnVRlzJfc6ocGvftwHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772644810; c=relaxed/simple;
	bh=KWHyThrwuZNil0A00PidFSNGFJga41QkaFzSTnPrN5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qRjPkvyOD9+pADQiqYCMDSgeHfLt4I5Sokjgn7vibjcA99aJw7+m3QHE3hulZyFM9eP6uOGjCba3LaeV1uVONmjV0RNunxnvwOrDLIPD1AmXoyHPdwe4Zj2Yn056gtJNsewB4UEZoBpH6ktq8u1DfQu7/wGMiLFSf3GGktkErH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtrcGwAn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtrcGwAn"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483487335c2so58968575e9.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 09:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772644805; x=1773249605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3PR3VgpT1CYqvwaGDXzshrJr5Ao+HKyOHhHzhoGcnm0=;
        b=OtrcGwAnBc0C+khCIwH6RI0UeqAAAy2mQw+MPmzehrsq034TVOlcY3gnb8vi5Ytw9H
         CWiDeuYro4ns/TwtEO4pIXGtY+gTJwTmDgHYqqFVjyXeYp4ylB0Ki7BKj8xp8U6VU/ta
         7VHtLyok1xSOF7oekgTLO3I23h/xBrxkULSiJTbKxUQAXEANNlIkU7Odd+d1Afp6In6u
         rE0qLNkNt1WbJ5Frb/KoQIuMr4//TdDXNMnInJGaVzoxK9SU++VPL6/zIis88ROllgZ2
         OIgveDojJfWJnggF//gKVk658X5IFacpsOOYT0naW665Wud51ZqhlRBBBA80GyVO04bc
         SK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772644805; x=1773249605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PR3VgpT1CYqvwaGDXzshrJr5Ao+HKyOHhHzhoGcnm0=;
        b=kxxdIVtz7aL06pnK7VIBSbfab35NV8lO3vOyZOesKgnAnzwXCLCSBiCBdiC0Qn20oF
         VpT4dojYupVayDLVjlTRL29M9/utfF3hbuTZLotprAQaPYlMaLoMpCsXShtz7CzBvZSY
         U156EaZRZoffhvo1pG8jpXN1lgS3vuI5MURkoQZE4uX11coH84uD777WdTYsjA9OQgv8
         rlTerz8MaSWI4MrqTitR9YdxJBxGCiYyA7xsyaT67AM5aXhNurEIH8rjxjIAdFmQEKrH
         hZcoDqyi/aEF9hpWy2Z7AU+9vhsTMrW3HQGVzfen5ECuD1n/nuUlEPH2siVr8Eo77MHZ
         /H1g==
X-Forwarded-Encrypted: i=1; AJvYcCW87j5MZQ5UEk/JxjLqHzOZQp4rzOGUkj2ZOJNAoAKxkefqrjTdoCYrqf3zGFrjUZfMryD7T+ofpuUaW4+k@lists.linux.dev
X-Gm-Message-State: AOJu0YyWa5Dq+8kEei/iXFT8yJYeA290CXRu2YqXJV0czyprHH8EhgAc
	q2GZb81rGBTyu6coY4y1O54RG+7b2zoMKCxzCxFGOQdr/ZLjJXTlTW4k
X-Gm-Gg: ATEYQzy5cOeBtXt+HLWlHeSsIHvGcMMVj3htN4zGVCWqHaEHXkelN77thlIwTXABxdm
	qIuAE7EDUQoHjWWhJTcyWb2unq1WMWXr3vHnoC6bG4NdXJd1vCG52lR0PLpRnEHfluhfNZksYoc
	FOsPLLBs0jc3bqUDHpOXk+00IrUNnED7o0A6JZ0RsMEpe4T2O2nrH1estig25JZlQn8WiIexpe2
	gshywdy6JMtRr1ak0U15SeN8hdasiZTP5s43AlT0tWvEsgZ+JH/lFpAyEVqjb9ISEjgTonH7UNx
	f3O0fxjU/ofCnmzMl+2/2HqwBRSqeq9bi6do2OiCqnLkazj8YSl/MgBlkjJCyMZSGbbhi6/ODFu
	Alhk6a9mhiTTQtfWQG3MG9mcrMZdswPjFLH0nI1xeDpHrvdwfpNPLRv86CJJTSx0JGZDBjay/tA
	BgzSXLmeJlTGYGxjAkUd5e4AKOyqE49kdnHpZw9+crz9xA23+vzWwe
X-Received: by 2002:a05:600c:1d0c:b0:482:df17:bbbc with SMTP id 5b1f17b1804b1-48519874e2amr42203295e9.20.1772644805390;
        Wed, 04 Mar 2026 09:20:05 -0800 (PST)
Received: from LAPTOP-9UVTTJTF.localdomain ([88.236.145.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b503424fsm29131985f8f.22.2026.03.04.09.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:20:04 -0800 (PST)
From: Zeynep Dicle <zeynep.dicle.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: broonie@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	Zeynep Dicle <zeynep.dicle.dev@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces
Date: Wed,  4 Mar 2026 20:19:41 +0300
Message-ID: <20260304171941.594-1-zeynep.dicle.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces to obey Linux coding style and also fix
the following checkpatch issue:

WARNING: braces {} are not necessary for any arm of this statement

Signed-off-by: Zeynep Dicle <zeynep.dicle.dev@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c b/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c
index 1df42069b..b0ca46aec 100644
--- a/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c
+++ b/drivers/staging/rtl8723bs/hal/odm_RegConfig8723B.c
@@ -125,9 +125,8 @@ void odm_ConfigBB_PHY_REG_PG_8723B(
 {
 	if (Addr == 0xfe || Addr == 0xffe)
 		msleep(50);
-	else {
+	else
 		PHY_StoreTxPowerByRate(pDM_Odm->Adapter, RfPath, Addr, Bitmask, Data);
-	}
 }
 
 void odm_ConfigBB_PHY_8723B(
@@ -149,9 +148,8 @@ void odm_ConfigBB_PHY_8723B(
 		udelay(5);
 	else if (Addr == 0xf9)
 		udelay(1);
-	else {
+	else
 		PHY_SetBBReg(pDM_Odm->Adapter, Addr, Bitmask, Data);
-	}
 
 	/*  Add 1us delay between BB/RF register setting. */
 	udelay(1);
-- 
2.43.0

