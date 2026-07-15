Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877511624D5
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119762; cv=none; b=Olxx1R9957IegKn0qJwvG+54tHMEm3ofxdgMqmdGOs7FMUsKrmu9IzWQ0AyFTY6IbXPQ/tX6Q/KtcHhZ+eqcMrhB/sgx7hWHY01dszAAEFmezprx7OiNHF00nrEqL70b+zRd9ICIqGO8grUN9BdydS7QlFHEsAbdw4aa3gEAwG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119762; c=relaxed/simple;
	bh=33Zd67ehO5q/W2BvD/Nk7gcgGWYx65taCDXDpvuvQYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CrURmY07tUKjBK3yf4QOWQ5KP7qsq4NLZCybTynKvmJz7HM/4orYxM9V5u1OI77ufP0jXggEp24ejkuKOQFotl4xcp1Co6Lg6IL47gYaBg7//W6CXxaFUnEfHnntY/ShbIdNUOj7QqxJy62+maLNa422SEWY0Y6Rs/WtftzIqYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LyX8gz4D; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LyX8gz4D"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b15c6fb864so763749e87.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119760; x=1784724560; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=19DglOy9oVvwhSIg2qx/B5ubXzP/pIL5UVJQSdZ01P8=;
        b=LyX8gz4DvB1blNkyGzpdAK4wIUFOqrKAP9u7NO0uWRnNPauhtglircYgkVaEhnFzQV
         6okGTkMl4d2VRK+HUHPnvMRIuz/ZMnOdLYbwVV/dSOmveERgwiPp4bSD+UNm6mCJe5tZ
         aCrJeoUJansoiHsk/Pl+U4V41E/sGweFAl6OH91NRsvDUJ3GNnXFFkZsWRZunPjA83x+
         Q7Hc5hDwy1PoMGeIEXhRhhwp2Ml+spyiqrgOnFY7hMiWQDw0+MVdlXO6P1ABnEeGz86N
         tz+S10sG8bnqxC4XRZDxQt1zH3ApjGRRNio0wqc/4IBg6osfJ5tGG4iUicGPbP/x/PWx
         qRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119760; x=1784724560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=19DglOy9oVvwhSIg2qx/B5ubXzP/pIL5UVJQSdZ01P8=;
        b=oJnbCwBq8nNx4VQDmRSlZfWOnTyDn57aoGGPbqWlLVGSVRTicT+Ri1sZVF7Zkha6GP
         K1g7LZQKgge9UsPHVfZfODDUlnjPTfIJujPlHmdJ/W+HbNcsLFHbS0NvyS93jxARcQOG
         0B0ymeNAxARBcyCejOpVtRDN+augW0Obv4SyxeZF+jeqcCrQ9qhVLnAF205CUNMIDNB5
         LK1Gz0DZZQPJ3M6vDvPv/t8VdPcA6YTTcdFnvL/lx6gu5uQPmyQutTj34OegJhJPXX/W
         1EIJ+YU3pxzJURQz96ABeQStBVxEvVp3/lIXCli+TON7Vx642XYQ3thCzU4JrfaCWQ9K
         Zyjg==
X-Gm-Message-State: AOJu0Yw0Int8KZOwvw6kt/2NMtIAwaCLP5ng4rymQMKNSvJUTsBPSMcN
	MDREccSy4goVtGRIQRRxHu6hBOY83df8aUpAceNzaUl2P4RD9AQPQY8c
X-Gm-Gg: AfdE7ckW9Mm3sOV80Qzk8Zpy3aCX1fjKjE1SMY9e3YoIcTsbhY0BtcGK5sL5rT4wlc1
	zZ96M56KAmM84MxSb0sR3EjfDCzZ+e/QqdLScM43WYoK9dAKZ+3p2shtqffZjRMwy2qK0tGW79W
	vjfokVhIVXBc6DDvoPF4VbbJF9Qgx9dng3fsfR0DqAPGoW3wNqKZcm6ao5YgRSgBn0JSoPXhNk0
	rc7K3ZmOrGcnNC76K00JrsWkiv/N6qe6jBEP5ExTihA8JB0ItzZTKL4gvV46+4JB8ZFGa2my3Kq
	fr1znAS948F4R7LJsBWORJ2e75d+QDAfriNT/3XalPZZupCojjzpzN5ExmIT4rmUg5dMG2VAPCY
	zAUoScApBsBdtukImK+uD4B3CADnVCk4lHLP3ImP4++7N5T27NcoouKsT+1XdmXLResZ8lR1soz
	FIo3oXV2STeBl+RSNOK1LIynbhQh0hMzHK4uLRPgzHDO9g24hFx0YH3//KJ1QOFsw07n/uirsEH
	bijRopmAdRExQ0O1iS+0Igb
X-Received: by 2002:a05:6512:3d0d:b0:5b0:1516:8799 with SMTP id 2adb3069b0e04-5b15d7766d5mr683495e87.17.1784119759380;
        Wed, 15 Jul 2026 05:49:19 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:49:19 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 01/61] staging: rtl8723bs: remove redundant rtw_ap_set_group_key wrapper
Date: Wed, 15 Jul 2026 19:47:29 +0700
Message-ID: <20260715124829.90290-2-ulijg308@gmail.com>
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

Eliminate the redundant rtw_ap_set_group_key() wrapper function by
calling rtw_ap_set_key() directly with the set_tx parameter set to 1.
This reduces boilerplate code and cleans up the driver interface.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c           | 7 +------
 drivers/staging/rtl8723bs/include/rtw_ap.h        | 2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 8 ++++++--
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 065850a9e..a6640cd7a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1195,7 +1195,7 @@ u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
 	return res;
 }
 
-static int rtw_ap_set_key(struct adapter *padapter,
+int rtw_ap_set_key(struct adapter *padapter,
 			  u8 *key,
 			  u8 alg,
 			  int keyid,
@@ -1258,11 +1258,6 @@ static int rtw_ap_set_key(struct adapter *padapter,
 	return res;
 }
 
-int rtw_ap_set_group_key(struct adapter *padapter, u8 *key, u8 alg, int keyid)
-{
-	return rtw_ap_set_key(padapter, key, alg, keyid, 1);
-}
-
 int rtw_ap_set_wep_key(struct adapter *padapter,
 		       u8 *key,
 		       u8 keylen,
diff --git a/drivers/staging/rtl8723bs/include/rtw_ap.h b/drivers/staging/rtl8723bs/include/rtw_ap.h
index 83e835eb6..cdd9f291f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_ap.h
+++ b/drivers/staging/rtl8723bs/include/rtw_ap.h
@@ -22,7 +22,7 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *addr);
 void rtw_acl_remove_sta(struct adapter *padapter, u8 *addr);
 
 u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta);
-int rtw_ap_set_group_key(struct adapter *padapter, u8 *key, u8 alg, int keyid);
+int rtw_ap_set_key(struct adapter *padapter, u8 *key, u8 alg, int keyid, u8 set_tx);
 int rtw_ap_set_wep_key(struct adapter *padapter, u8 *key, u8 keylen, int keyid, u8 set_tx);
 
 void associated_clients_update(struct adapter *padapter, u8 updated);
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 1484336d7..ce76a8586 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -604,7 +604,9 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 			psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
 
-			rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
+			rtw_ap_set_key(padapter, param->u.crypt.key,
+						   psecuritypriv->dot118021XGrpPrivacy,
+						   param->u.crypt.idx, 1);
 
 			pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
 			if (pbcmc_sta) {
@@ -678,7 +680,9 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 				psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
 
-				rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
+				rtw_ap_set_key(padapter, param->u.crypt.key,
+							   psecuritypriv->dot118021XGrpPrivacy,
+							   param->u.crypt.idx, 1);
 
 				pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
 				if (pbcmc_sta) {
-- 
2.55.0

