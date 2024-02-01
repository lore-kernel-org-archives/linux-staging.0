Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ED9158D88
	for <linux-staging@lists.linux.dev>; Thu,  1 Feb 2024 08:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706775525; cv=none; b=dIyJ1N7Z2kwV9OsV2J1p6ARmqXGMsb+p5cA1rQaYhKJNkfkWErgizt4v/b+bcofRiIrAb6Wyjquq7CxotgyShRDmHqkugdBtEafS6734WVJuSsGEWj+QqYCGRBgEt4jWSzqpGzyQUSKq3oXncD1YerPyQVJ5IFwPO6mqYfVK0Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706775525; c=relaxed/simple;
	bh=lYzIATM6Ne/sGhUcvtQWKGAMfEC3nM6zrkVczqOJRKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VXWhH9n/aPq4EUNpzjh94mCBDqzZ68mT8ApuwbomO9JcLdGgsxhwztP+6ZjdFeKhihpXqx852CB7BMnIAaFwVuMKEvgK9205wJe15XWn3N1gsD/XssO+M5yLqESMuei/3/YX7VlW0EcXRDrVCrRKL2LFMzgNkIZHBRPTn9fuNXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4fG2vQb; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4fG2vQb"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55f50cf2021so769959a12.1
        for <linux-staging@lists.linux.dev>; Thu, 01 Feb 2024 00:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706775522; x=1707380322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFI5dVucRdVTbeql8T1bAFgclvq+0WY1kjSsHUwH7Zs=;
        b=i4fG2vQbnS0DcjzkMzzIlMtluo0w3t5+jeujiRlfWO+XEK0RtVoi49pq961i2Swoxc
         c/G1EgenErayD3QWKMUrpvexQ673RbdZSpbjTuCaNJOPjY+5HIsBxfy6+fx3GHS2g/QI
         HOQJ/PYFPtRoSwwQ4Uk8Dg7kWzRTAW4Vu+C+oBi9F1SjrHLIOi5fhujZAfOix4e5lRTJ
         fB1L3GEQzr1h1XM9spKkTm8W/UqW+1BO7A3Udnw7VftAP1l8F1Sk4+RqrBq3bVOaqV/e
         oI9sE1q+7gUim9RuU0+iNxP3Fj83cEpMNeOdwd86V0Cqcx27Q8v2tCfoBHa/GP+YYPZZ
         qDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706775522; x=1707380322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFI5dVucRdVTbeql8T1bAFgclvq+0WY1kjSsHUwH7Zs=;
        b=ChxheMF/nn8cE7t4gPgKXt3FbjuW0Efv880ul159zK5+K9gZ+ez4htu8hkWX95gia+
         jolIWrAPtghw8371Bvr9nZvXzs/9mauuSAmz9EBN9ukX7/7LWnSjrRa9srCm/+zrDE4s
         Uf1jqhdtffF1zcPrOAM0LyO+fHiT52o/bOVg8Zyu0hiHap8yh3enP82tWc1t6CJ4/bGC
         nwnYkvNh7mSK9h8I3q8Oq7yPp8jDcHh3u/bpdU0ipHEIw6XD6hJSemcJXjgg7Nm3CiIT
         faay5J8gYgxI/bsVlv9HS4I6hkz/YrmhoJ6hlawFfjcG5MtVsGBvGEAD5BvtOU7ig9OB
         LUJw==
X-Gm-Message-State: AOJu0Yxcl9E/1lIculUPhAAg6pGqh5ok80qXdg5t8u8Z9vlrQZIan5gn
	dIs2rumPTtlhJBdJGRWnpiEMZwlAsbX6HufPKf2WM4Lf/NzufK6B
X-Google-Smtp-Source: AGHT+IFh2lINn1gSQY5SoLQ2pmbnCzXZ+DQTv1t9qPwNqnouKCPs1Gunues1LSWrEZZfFfvy4B7M5Q==
X-Received: by 2002:a17:906:5587:b0:a35:360f:ae69 with SMTP id y7-20020a170906558700b00a35360fae69mr2653121ejp.54.1706775522106;
        Thu, 01 Feb 2024 00:18:42 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV/jyzmzFIxtk+8BSXnVPj2yPP6KtBpQhiZjvXEU/fOdRgbY6luRO/+S3YRVR4fUkldVjT8mOlOlTs/sn1Sghy6eOGphNbwQDyEf8gD5RjtgemRZraX17HJXnmtToT0Zo+GagV3vzM1whHn+Ke3Mp2qgxHex2Q8wUV8aWAvvt6TpjWbBUs=
Received: from localhost.localdomain (ip-77-25-34-59.web.vodafone.de. [77.25.34.59])
        by smtp.gmail.com with ESMTPSA id p7-20020a170906784700b00a310f2b4b91sm6954069ejm.48.2024.02.01.00.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 00:18:41 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/3] staging: rtl8192e: remove braces from single statement blocks
Date: Thu,  1 Feb 2024 09:18:22 +0100
Message-ID: <20240201081824.6998-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201081824.6998-1-straube.linux@gmail.com>
References: <20240201081824.6998-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove braces from single statement blocks to clear some checkpatch
warnings.

WARNING: braces {} are not necessary for single statement blocks

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 5 ++---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 3 +--
 drivers/staging/rtl8192e/rtl819x_HTProc.c      | 4 ++--
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 9b9d95ba06df..080fe9c4585e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -693,11 +693,10 @@ void rtl92e_link_change(struct net_device *dev)
 		u32 reg;
 
 		reg = rtl92e_readl(dev, RCR);
-		if (priv->rtllib->link_state == MAC80211_LINKED) {
+		if (priv->rtllib->link_state == MAC80211_LINKED)
 			priv->receive_config = reg |= RCR_CBSSID;
-		} else {
+		else
 			priv->receive_config = reg &= ~RCR_CBSSID;
-		}
 
 		rtl92e_writel(dev, RCR, reg);
 	}
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 32acba4ce3f7..9b528cf4dbca 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -964,9 +964,8 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 		     MAC80211_NOLINK) &&
 		     (ieee->rf_power_state == rf_on) && !ieee->is_set_key &&
 		     (!ieee->proto_stoppping) && !ieee->wx_set_enc) {
-			if (ieee->pwr_save_ctrl.ReturnPoint == IPS_CALLBACK_NONE) {
+			if (ieee->pwr_save_ctrl.ReturnPoint == IPS_CALLBACK_NONE)
 				rtl92e_ips_enter(dev);
-			}
 		}
 	}
 	if ((ieee->link_state == MAC80211_LINKED) && (ieee->iw_mode == IW_MODE_INFRA)) {
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 6d0912f90198..49b882c363bf 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -480,9 +480,9 @@ void ht_on_assoc_rsp(struct rtllib_device *ieee)
 	}
 
 	ht_info->current_mpdu_density = pPeerHTCap->MPDUDensity;
-	if (ht_info->iot_action & HT_IOT_ACT_TX_USE_AMSDU_8K) {
+	if (ht_info->iot_action & HT_IOT_ACT_TX_USE_AMSDU_8K)
 		ht_info->current_ampdu_enable = false;
-	}
+
 	ht_info->cur_rx_reorder_enable = 1;
 
 	if (pPeerHTCap->MCS[0] == 0)
-- 
2.43.0

