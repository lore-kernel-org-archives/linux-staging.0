Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5965370
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 13:50:20 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id y124-20020a1c32820000b029010c93864955so1179378wmy.5
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 06:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4+cDHoJ+jrWHAkqxsythjW2eEWwKS5Q9yUuIeMD/mmE=;
        b=Df79wapfcAeNq2OtQkHzj7Ppc7SOaqB1UyprEjCmOgXtKOSmRGdqUYbeHOBcBf/kHZ
         6r/7rWcubWU8SKqO44fNrGsmGFgPGhr+3DeKYal67MXmB6RRMHvuTV0BfnX1JkhI6uOj
         77xp4a6Hr2JPUu+2jFmWVFG9OP9QPFcwmRV0KC94w99gBFZ8O48lLwwOy64I4qgtjBgM
         hixn7IxFck/hqFVjPo6UVL0Z2TfL3wzBU2hDkld7mNlHAsXIBBoVrkp6sZTAKr+YZ/u9
         TQALhJtcekkjaIiamFhXPpu7z1PPUf4e/ewwLjbESOB4IVqAY4X9wd+B1OvummRTSrZ5
         Rl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4+cDHoJ+jrWHAkqxsythjW2eEWwKS5Q9yUuIeMD/mmE=;
        b=btE55EFTT/ap6tfz35NXJpC7YlxLnrJ0gNurqhkv9vG2C3jAmHSq6C2EiXeISlT7QU
         witYpsjMGSinsSksIjgOwdJ0Sc/0mWc7aVkPqVjUgjDV3N7GYHIQs0i0P2SVxDSrw8xR
         Eyy8IMTxNO0igINPJ2kZ/mRFnpS5jaf6yoEu3mug8eYO/Ct+kaQVNx3jHSGttXoDPkdV
         LVDYfzb6uDV/E73LD9pXNLQ1BuvrAOt++KX9ovc5lZhDVgNB9m3Eo+mO4Mi7WnGtTsWS
         MW/WYPi6xtWrf/3+DYFcPB8HXT/cH6xKpC0fQGI91YOef/fjoTNy+bhskXuockzu9xMI
         6hmg==
X-Gm-Message-State: AOAM530xMzNsQKn0MVHq2ppl1Oac6bQYP5ltY2BBMosPgDyvHrQXDO//
	A7WcKS37plobsc9jvQLKRbA=
X-Google-Smtp-Source: ABdhPJx4v/FE0ar33x5CT2rr014fopMWjHoExtj9VT1MXOnyauEXHPKcL3T3harfB/QWkbd+Y02R6g==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr3193920wmc.90.1617803418882;
        Wed, 07 Apr 2021 06:50:18 -0700 (PDT)
Received: from agape ([5.171.81.68])
        by smtp.gmail.com with ESMTPSA id a11sm1270882wrv.21.2021.04.07.06.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 06:50:18 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 14/19] staging: rtl8723bs: add spaces around operators
Date: Wed,  7 Apr 2021 15:49:38 +0200
Message-Id: <28885311d4351d4df4508a50765a9b92a2b8da77.1617802415.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617802415.git.fabioaiuto83@gmail.com>
References: <cover.1617802415.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following post-commit checkpatch issues:

CHECK: spaces preferred around that '|' (ctx:VxV)
187: FILE: drivers/staging/rtl8723bs/core/rtw_mlme.c:1659:
+			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY|_FW_UNDER_LINKING) == true)
--
CHECK: spaces preferred around that '|' (ctx:VxV)
373: FILE: drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:3023:
+					== (sta_bssrate[j]|IEEE80211_BASIC_RATE_MASK))
--
CHECK: spaces preferred around that '-' (ctx:VxV)
456: FILE: drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:4098:
+		if (len > (NDIS_802_11_LENGTH_RATES_EX-i))
--
CHECK: spaces preferred around that '+' (ctx:VxV)
770: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:1590:
+		if (pframe[hdrlen+8+plen-8+i] != message[hdrlen+8+plen-8+i])
--
CHECK: spaces preferred around that '+' (ctx:VxV)
770: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:1590:
+		if (pframe[hdrlen+8+plen-8+i] != message[hdrlen+8+plen-8+i])
--
CHECK: spaces preferred around that '-' (ctx:VxV)
770: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:1590:
+		if (pframe[hdrlen+8+plen-8+i] != message[hdrlen+8+plen-8+i])
--
CHECK: spaces preferred around that '+' (ctx:VxV)
770: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:1590:
+		if (pframe[hdrlen+8+plen-8+i] != message[hdrlen+8+plen-8+i])
--
CHECK: spaces preferred around that '+' (ctx:VxV)
770: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:1590:
+		if (pframe[hdrlen+8+plen-8+i] != message[hdrlen+8+plen-8+i])
--
CHECK: spaces preferred around that '+' (ctx:VxV)
770: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:1590:
+		if (pframe[hdrlen+8+plen-8+i] != message[hdrlen+8+plen-8+i])
--
CHECK: spaces preferred around that '-' (ctx:VxV)
770: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:1590:
+		if (pframe[hdrlen+8+plen-8+i] != message[hdrlen+8+plen-8+i])
--
CHECK: spaces preferred around that '+' (ctx:VxV)
770: FILE: drivers/staging/rtl8723bs/core/rtw_security.c:1590:
+		if (pframe[hdrlen+8+plen-8+i] != message[hdrlen+8+plen-8+i])
--
CHECK: spaces preferred around that '-' (ctx:VxV)
1001: FILE: drivers/staging/rtl8723bs/core/rtw_wlan_util.c:1849:
+	if (i > (NUM_STA-1))
--
CHECK: spaces preferred around that '&' (ctx:VxV)
1647: FILE: drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:211:
+		if (mcs_rate&0x8000) /* MCS15 */

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c      | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_security.c  | 2 +-
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 585048c2520b..a7e40aaae2d9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1656,7 +1656,7 @@ static void rtw_auto_scan_handler(struct adapter *padapter)
 		&& jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time) > pmlmepriv->auto_scan_int_ms) {
 
 		if (!padapter->registrypriv.wifi_spec) {
-			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY|_FW_UNDER_LINKING) == true)
+			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING) == true)
 				goto exit;
 
 			if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 93eb12130066..1ed43423f2de 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3019,8 +3019,8 @@ void issue_assocreq(struct adapter *padapter)
 		/*  Check if the AP's supported rates are also supported by STA. */
 		for (j = 0; j < sta_bssrate_len; j++) {
 			 /*  Avoid the proprietary data rate (22Mbps) of Handlink WSG-4000 AP */
-			if ((pmlmeinfo->network.SupportedRates[i]|IEEE80211_BASIC_RATE_MASK)
-					== (sta_bssrate[j]|IEEE80211_BASIC_RATE_MASK))
+			if ((pmlmeinfo->network.SupportedRates[i] | IEEE80211_BASIC_RATE_MASK)
+					== (sta_bssrate[j] | IEEE80211_BASIC_RATE_MASK))
 				break;
 		}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 302479d9236b..bb15b5af744c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1587,7 +1587,7 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 
 	/* compare the mic */
 	for (i = 0; i < 8; i++) {
-		if (pframe[hdrlen+8+plen-8+i] != message[hdrlen+8+plen-8+i])
+		if (pframe[hdrlen + 8 + plen - 8 + i] != message[hdrlen + 8 + plen - 8 + i])
 			res = _FAIL;
 	}
 	return res;
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 7a73186de69d..8c516ed370f4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1846,7 +1846,7 @@ void rtw_alloc_macid(struct adapter *padapter, struct sta_info *psta)
 	}
 	spin_unlock_bh(&pdvobj->lock);
 
-	if (i > (NUM_STA-1))
+	if (i > (NUM_STA - 1))
 		psta->mac_id = NUM_STA;
 	else
 		psta->mac_id = i;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 21e85409edd1..40adecbb66d6 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -208,7 +208,7 @@ static char *translate_scan(struct adapter *padapter,
 	if (vht_cap) {
 		max_rate = vht_data_rate;
 	} else if (ht_cap) {
-		if (mcs_rate&0x8000) /* MCS15 */
+		if (mcs_rate & 0x8000) /* MCS15 */
 			max_rate = (bw_40MHz) ? ((short_GI)?300:270):((short_GI)?144:130);
 		else /* default MCS7 */
 			max_rate = (bw_40MHz) ? ((short_GI)?150:135):((short_GI)?72:65);
-- 
2.20.1

