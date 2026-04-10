Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D3831E848
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 01:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775785352; cv=none; b=JekOdSv2hvnulk1ZxG7EzA5QfBCUttGVo9QvGsGuJwcucrTCPG/lgywNPIyTMt7mFkm009hSN1rhpgoOjRMXdtUkmdiyYzAnhRErO6GySbzMpuiXlyT7TbbxZ96PmrlNKfNk8CvVb/+HvB13yFueYo7wSUcIkJa0hD5kuOt4PFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775785352; c=relaxed/simple;
	bh=ysRJ/+JLUP6TlOUE2fMHmzrsmdg9B1SNIK8Tgd9Esk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FR9onIS+2T6wsj2h2OXBkEin6C5HyHpi7HZii8xD7L7Tng9VVoJiwD1iuAy7wG96VicieepAH/jcIIKP2sXBKQK9jeaHqjk7uGDm4RVYqw5z3R7Ylwkvk+KQcfsL5Y62VluDXRSa4oHmRZRCGkxj1N4xXCN22pLcjgZBfSjQTvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cC0/w+tT; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cC0/w+tT"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-824c9da9928so1395521b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 18:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775785350; x=1776390150; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgwbsg5hoI4oQozXtBDed4fSHMsFNvd0fgS9a6/7QJo=;
        b=cC0/w+tTP9+SW2v73nCAfbq4rZTIHum0XSXGpyVCq6T09xPQSZ2xpTZRmWRxvj3z8r
         GnTLX9+mx7hcdUQnFGouAXvjWexcEHjmmQFrXDHMEXHeBx2I8s1H9Lme6OY0UbiHRQef
         9dMBzTg8Rc3aWtWSbUUCyquneAKaJ2CTCW4Cw1jm7x1BOa4qYHdj9wy5GC0cpyLpYqxH
         r08tOBkPkBVNibJrk3HvhuGudrTNr1pUzp4C4Olfhj3TK1YEMFtZ9hQ6cfIkO+O5/Dob
         xXf+Lulc6RwlCS5RcfX2G3W1QX5DRLKUDff8BorzMtjzkbS0kIB0n01B+ttst/EWMTQ7
         4OhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775785350; x=1776390150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sgwbsg5hoI4oQozXtBDed4fSHMsFNvd0fgS9a6/7QJo=;
        b=KW8aaIga8w7ocUo3OPctMhdyboO0oV7YI986o5aTU9J2du5HSjTYMdawcfeINEJr5l
         DE0VTGAqA2LPEe/cavEkwksf2MeIVlnZw70yLXUKW8o17FtqL/Pm6XAGLTLMgM9KYRr0
         mGPv8nfMpILMxt0jJWKtixbM49lOLgx3Xvd20ASK/J+0SWrkmpx+urRSc6buvTwKRl/N
         EVhGhDxYT3vo+o/3+NfnoR2F8baGh03yrtJLKM2O0fvjec4yrrnXxcbL/8H+Wyg1ZGAi
         zwOzB1YeE06gqlFDonZ1WyuP7EJiFA82qgTif55ZnRH6qFXnR7UjP3U2OCETlj+wVAOh
         XTog==
X-Gm-Message-State: AOJu0Yzh1Fu3jAPn+TZ7WPpX8Bw/dP83MdG3jSHxzFDWDq/c+9lnRWle
	Ds2uTdg9flNcajSTO01fwNCRP5CcVch65RY9dtRAhAFYM36ECTkXAdKy
X-Gm-Gg: AeBDiesstv25Uypt1V5u4NlhvYJQ+xIMjq+Y+dvjdiYiUXQ8d1LAtAOB5t+1FS9pvzY
	gM/06/6wnecOo90hDCzfyLoCmJ0IoCFiHxpLWq/G07Hs4e7hVUM0xR4o04UHC5tyipmX8cxxmmi
	93CWLxHZEzMen/HJGZX2z2qq5Y++DTdNoqiOEWH5xzqH7jvaCV+yy6EJlGl1hfcKPtphsY6EvBw
	226QZK1SyC7obLEUpJw4TiWvae4QJ2rSTth/DOp5lP65JwDwM/KfC3T3pZ52sEl6Lm9yDL9s2e0
	GgJiWuW6E0tGF3Y/RuB5O7XtyUCwsHjjvw+UCt1gi0vjp9f7bcaP+dsxvEyB24O4c8T69lyXeSW
	cZSQBTdvCUYf13IWnl57T6qRj3ctOe/nQlpjGFO6bCa94rlCNdVLuFhcPO9iBMoMNw4fccumEqQ
	voNAvuxxMYJ2T1L8EkcDSU2r27XmIgR13M3CHXdROMKZDs5LoE38lguA==
X-Received: by 2002:a05:6a20:3954:b0:394:3001:8b59 with SMTP id adf61e73a8af0-39fe409d626mr1352683637.53.1775785349596;
        Thu, 09 Apr 2026 18:42:29 -0700 (PDT)
Received: from localhost (as040201.dynamic.ppp.asahi-net.or.jp. [150.9.40.201])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-82f0c3145acsm898563b3a.6.2026.04.09.18.42.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 18:42:29 -0700 (PDT)
From: osjin83@gmail.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	osjin83@gmail.com
Subject: [PATCH v3 2/4] staging: rtl8723bs: remove space after type cast
Date: Fri, 10 Apr 2026 10:42:12 +0900
Message-ID: <20260410014214.10684-3-osjin83@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410014214.10684-1-osjin83@gmail.com>
References: <20260410014214.10684-1-osjin83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinemon Tama <osjin83@gmail.com>

Remove the unnecessary space between a type cast and the variable as
reported by checkpatch.pl. This improves code consistency and conforms
to the Linux kernel coding style.

Signed-off-by: Jinemon Tama <osjin83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index a7266a758c45..09893a43f54f 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -531,7 +531,7 @@ u8 PHY_GetTxPowerIndex(
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	s8 txPower = 0, powerDiffByRate = 0, limit = 0;
 
-	txPower = (s8) PHY_GetTxPowerIndexBase(padapter, RFPath, Rate, BandWidth, Channel);
+	txPower = (s8)PHY_GetTxPowerIndexBase(padapter, RFPath, Rate, BandWidth, Channel);
 	powerDiffByRate = PHY_GetTxPowerByRate(padapter, RF_PATH_A, Rate);
 
 	limit = phy_get_tx_pwr_lmt(
@@ -551,7 +551,7 @@ u8 PHY_GetTxPowerIndex(
 	if (txPower > MAX_POWER_INDEX)
 		txPower = MAX_POWER_INDEX;
 
-	return (u8) txPower;
+	return (u8)txPower;
 }
 
 void PHY_SetTxPowerLevel8723B(struct adapter *Adapter, u8 Channel)
-- 
2.53.0

