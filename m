Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758BB282F02
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 11:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773660880; cv=none; b=iZlgH0mK6KJgbSmCDapf7q9naiwyAKi7DIBYyfIUYK0fM+EPJ+LBxcTMFyx9mRpRKvFF68SLUEHVOA4CyKOeFmF80sVir2nJ2knt2OrXwJDG1YpTflNfh463KWc/dA2Fy0mrYwv0aZceHXla6G4bBLtQdkhEOD6ne/o6XKSpeZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773660880; c=relaxed/simple;
	bh=DkUKwiJ5S++THYBlw+Drm62FrHtHxFOROFkOWkVzZmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kC9F9Ep+VtxuUaxBYaWAefjg0kSIfBEJMJ5POM9wJCXPxzdcRTABTVJQA8D9BQy/fUaPSY2dOU7BbMMwCZ3GuosGSjoGK82SWRW15VqNoGJtNINu0+Qeu4uXw1AdYogH8AuqBpW13fL+OCh5P2PWMv02lN9XC0FKdFEZJS6TeCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fj08LTUx; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fj08LTUx"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79a40fb9890so10282567b3.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 04:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773660877; x=1774265677; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7dBom8pLNVe2zSIucLOOVTECVvEW6WWebx7jcMyvWfU=;
        b=fj08LTUxH2QMAkXHOXIIM1HUWrYunGIBSTApt02Y7s6s7iJYExHj7PRGdNtFFR8Nfr
         jzVLlHtdhwmd/vWKN5oEt19BqyQvhgpwR0HwGHUIJXxIEJq4Hog/tEQO2RE+kiN3CAms
         0RKdJ2/b8X9FjUD0hNe8oL/p4d3Fp3i2bDD5OuYlqfOPzCb5OGST9Mx03B8wdnU/hay8
         EAMnbRf9xFWVEqO97ue5EDPfE7D7uFSxJlaUChcJKDMtXIFOmtSA34SDo9VDH+LxHn8N
         ioZaz/JlfHXIYKCKM3XpcFkJhlzwlK4VYE6HILWcfmGEPKr+cUssYoFlerXod15bAxas
         0geQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773660877; x=1774265677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dBom8pLNVe2zSIucLOOVTECVvEW6WWebx7jcMyvWfU=;
        b=JDAiPt5vSf5XIcMOM80IPfR96H32vxAmnjoZm7y8MO0KxPXZGVLWU0xd9qyay4BGYK
         CQW9fTXZzXNq6KtBHGnYclK+2/vYblxJ8urTIEDRSXdoZSxO77MgBRbiqktn/iTHhE1Z
         8bSFSAgrPtN4dV3EnQkkjjUc+7UsoXJGr9ByP1wdoPpc+y1O5ks0yAdGTHg0zcM3DcfX
         OnIyBe38xHjR9qXe606pdJxE1+SX0/18Keujy6bJwZtKbmiQ00VQX4WkvvuhPPHocq3Z
         drmT73GUil5Bl/J4s4BXAzzkoIAB4sMddwQvdzOMvpbCsWhLKYtT1aOrnUhhzSr4ozgI
         lghg==
X-Gm-Message-State: AOJu0YwanE6a6K6wI/zbUtTaOmvCy0OT+HMOq2QjjiHr0LhTbVHa/fGM
	Ko5cm88JwBnuJ2xBu8wBktx/1kh5DArvZQPKjggjqiAS+7+77BIGhLPBtnsRdg==
X-Gm-Gg: ATEYQzwx77saqG8SGpiIInEez/MVyOmhh7Usz7Klc6ma8au79+x+KSAAmm4vSZ3Mu/D
	15bKwptwxx9e6J1se4BTsi+CZTCwLpq5AQKVyhaPyHLroQEV7ARQCIY84FxLK9IB2O1v2Z4mXkd
	mb9czSDdVph7iEbLa1dDbjLklb7ydAYBovP+YIDLHwcltrc3bHtB3B7w5H0BnUpvDP2k+Upil7f
	TUmtDZPjfGW2R0V/eqaI6aATz6hwfZM3rMXqQBPWIBxHQCMJx9iAumDA6iepaAEbWLva5odSlan
	hxqrKcnOgKwhBp8ZUTglmYMq5R/cj1bVDAw9+xH1pLTAvRjbHGnmTM8ZsC8rGhUQmv6ofeXVRHP
	9QByUwmnlIb5a0Ofh720Sg28ou3E8/M5vLDKI84HY4ctt8Y90vMs+1mlUyKsk5tjQP1IYmpfoY2
	icH52Nsl8QWAZA7K/GV/3uzbvmxMlczwPp
X-Received: by 2002:a05:690c:112:b0:79a:53b8:8214 with SMTP id 00721157ae682-79a53b885e3mr17462297b3.29.1773660877147;
        Mon, 16 Mar 2026 04:34:37 -0700 (PDT)
Received: from archlinux ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917f1cf02sm85639557b3.41.2026.03.16.04.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 04:34:36 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unusual 'NDIS_802_11_MAC_ADDRESS' type
Date: Mon, 16 Mar 2026 14:33:58 +0300
Message-ID: <20260316113427.3696-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the 'NDIS_802_11_MAC_ADDRESS' type and replace all variables of
this type with an array of 'u8', which will make the code more
understandable and get rid of unnecessary 'typedef'.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---

Also format the corrected lines to fix checkpatch.pl checks.

 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c      |  2 +-
 drivers/staging/rtl8723bs/include/wlan_bssdef.h   |  5 ++---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 12 ++++++------
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 9d222ae87d79..07a6db1d2317 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -491,7 +491,7 @@ struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 u32 rtw_init_bcmc_stainfo(struct adapter *padapter)
 {
 	struct sta_info *psta;
-	NDIS_802_11_MAC_ADDRESS	bcast_addr = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
+	u8 bcast_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
 	struct	sta_priv *pstapriv = &padapter->stapriv;
 	/* struct __queue	*pstapending = &padapter->xmitpriv.bm_pending; */
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index eb38594c8f5c..812a68394268 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -15,7 +15,6 @@
 #define NDIS_802_11_LENGTH_RATES        8
 #define NDIS_802_11_LENGTH_RATES_EX     16
 
-typedef unsigned char   NDIS_802_11_MAC_ADDRESS[6];
 typedef unsigned char   NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
 typedef unsigned char   NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
 
@@ -64,7 +63,7 @@ struct ndis_80211_var_ie {
 };
 
 /* Length is the 4 bytes multiples of the sum of
- * sizeof (NDIS_802_11_MAC_ADDRESS) + 2 +
+ * ETH_ALEN + 2 +
  * sizeof (struct ndis_802_11_ssid) + sizeof (u32) +
  * sizeof (long) + sizeof (enum ndis_802_11_network_type) +
  * sizeof (struct ndis_802_11_conf) + sizeof (NDIS_802_11_RATES_EX) + ie_length
@@ -155,7 +154,7 @@ struct wlan_bcn_info {
 */
 struct wlan_bssid_ex {
 	u32  length;
-	NDIS_802_11_MAC_ADDRESS  mac_address;
+	u8 mac_address[ETH_ALEN];
 	u8  reserved[2];/* 0]: IS beacon frame */
 	struct ndis_802_11_ssid  ssid;
 	u32  privacy;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 453ba1db773f..098456e97c96 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -380,9 +380,9 @@ void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter)
 				rtw_warn_on(1);
 				return;
 			}
-			if (!memcmp(&(scanned->network.ssid), &(pnetwork->ssid), sizeof(struct ndis_802_11_ssid))
-				&& !memcmp(scanned->network.mac_address, pnetwork->mac_address, sizeof(NDIS_802_11_MAC_ADDRESS))
-			)
+			if (!memcmp(&scanned->network.ssid, &pnetwork->ssid,
+				    sizeof(struct ndis_802_11_ssid)) &&
+			    !memcmp(scanned->network.mac_address, pnetwork->mac_address, ETH_ALEN))
 				rtw_cfg80211_inform_bss(padapter, scanned);
 			else
 				rtw_warn_on(1);
@@ -422,9 +422,9 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 			goto check_bss;
 		}
 
-		if (!memcmp(scanned->network.mac_address, pnetwork->mac_address, sizeof(NDIS_802_11_MAC_ADDRESS))
-			&& !memcmp(&(scanned->network.ssid), &(pnetwork->ssid), sizeof(struct ndis_802_11_ssid))
-		)
+		if (!memcmp(scanned->network.mac_address, pnetwork->mac_address, ETH_ALEN) &&
+		    !memcmp(&scanned->network.ssid, &pnetwork->ssid,
+			    sizeof(struct ndis_802_11_ssid)))
 			rtw_cfg80211_inform_bss(padapter, scanned);
 		else
 			rtw_warn_on(1);
-- 
2.53.0

