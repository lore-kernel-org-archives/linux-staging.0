Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8018930EF8E
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 07:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770016099; cv=none; b=MT/WyYYIxlCJVXhIQV61hp7kPip2Y5iMN3asBLKKJEGV24M/Pwef8XvTLlXhvSAcRvos9Lai7OYq4xsPl/jCuehM62dm0YDZKN5UzJ5awZlCjLsvUmS4OJl0fzg95/2bfqkCxzwbwuV7T8Za3EclkmJuNPcYosU0EEC8EKbJlj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770016099; c=relaxed/simple;
	bh=xyFUA+Rr1fD0C/mj0m8k1z2I36E46fObyTvKQ2wzAhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EQLFSPZzGQUNNOq4wHqMBZxgWrn/P/aAOWjo6mc7beKj9H8OkJ3PoSpvHHO2FllWpN3frxTXMSyDjc/qA+WOKGxQk2Eth2FJc1FULwgbtarJ89r9khdZRKtPgk2T0OzhRMl1tVJL9HUxegkQGQCggGvGnvtVWnyemg7U0qIsQvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ID++EMuQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ID++EMuQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4807068eacbso33399235e9.2
        for <linux-staging@lists.linux.dev>; Sun, 01 Feb 2026 23:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770016096; x=1770620896; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48woEiIX85ekoCemrmYDBxnq2r9PqULP0TC+DEo87X0=;
        b=ID++EMuQAh8NZfkUcRDJJYHNpuw3VOFsZrzOTs7I/rKyYiSj3r2MBQQ3Q7Ol5dtv81
         L75wZqznYBjTcQXTQ7w85EII83RUEHDvmTXIX63INUdOlYC30BRbLcWr4AtN9mRrfDCl
         iarOTfgHI1teevKnRYz/k72A4ArsVNM6wFJQ+XQF3Tgo64mtEwNIKp1b5oULe+8qiMO2
         Z/zvNJKyb9Upju8fI7BL/gT1IHko3Cz6/3qXMzCrX6Fi3lC8R7pmiucxWwGyWtXeLNWq
         x3QTmuvCA0rbHc87ON1ztjVKyRoX8mO1x5BGsOy4nuA1vnUeawVI7litsTIp+E7fAXng
         iwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770016096; x=1770620896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=48woEiIX85ekoCemrmYDBxnq2r9PqULP0TC+DEo87X0=;
        b=UnTNMHUDtn1P+WX31J+yl9Lz+ZznraB20zEPDeLAYf7xCSJq0l4c6wdk2WyvQR3PyV
         hDxbMQKX/m/z/xBR5n+AfELSkX8lqvsUETNKXo6fG/AtkB2C6ag6sfzGh7DlJColcY16
         vruZNEJbg6kcem4WXRDRaHyLN3VdiqugKctO0DaZYPAfQpOPXTwTEk+J8GULCSE5R9hN
         3dI1+7BFWLfVa7B4aLusYJiRjj5rxupvK4PPtZMXP1g6LOofVghAciL92rCuvnICfnGU
         jHe/8f8hmxv9p8vtKrRTNL4FxJk25JDpgeBF6I+JDCpahapzldwID9Ku3bN0m8aM9oXA
         s+Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWe5gKr3RosNwI/v1jPV/cLCsLnXXQRgy71ZYgOCREGjB7eBtAg1ykB6TrtQ+98il8lDSGcnoK/Z1mDxHj3@lists.linux.dev
X-Gm-Message-State: AOJu0YxnYgp83twtjTwQQgzdPSb8TPiEv9x4wTZkvGWn4d+WozvYEmC1
	ULRQnt4/kFh9ho8z7EIE8dT1koMQoDCKwno76wfRg3cDq6CKPmQ0lLk=
X-Gm-Gg: AZuq6aK5D5YLlOv39BHPzIvUi4ngDe9eJdKaj9QdhJIk+k15jKQpI+aiwncqZAOV/ep
	kN5pH42t5pkMzQqodU+eDmMT6jQQrUB+HLVFTQYNSlZ1AfCCPNiYXkAbWzwoN7X+CJwE6KBdlb6
	YO8f2yiVkdSZkAX+pofDdyiCwxlXjDTvQMYLmV7tnJCIH6FDEdQREoPGMWAGikYJOE/SKEwmfCo
	D0hH7BtmvKBcars4Pkb+8ePQvpyDRzh+A6UZ6biLRUzXydsibscKu22C8myz8pAwZyeDD7zzvHl
	V8zrGZnULtDRmhzkgmDkb3VUc4V7RF/LDAkNIffBYrFcP85VRECnOaQ7KbR+bYev4sEqQc+YXuh
	WAcAxTR6Gk7WSsj1SUzyZIq7B+mknf9F+d1osHg8SPr/ijY3f11coA7gc+N4n2j9t6x9olljMYo
	xt2t2jgJnNWoiqe+CP9LHXZJV8LPCP07VlWI8QPPTiZYyysGcc4RLumSfdGHBgNw==
X-Received: by 2002:a05:600c:350c:b0:47f:8c05:786b with SMTP id 5b1f17b1804b1-482db48d476mr124123015e9.28.1770016095464;
        Sun, 01 Feb 2026 23:08:15 -0800 (PST)
Received: from LGPC ([31.223.131.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cde00e8sm371369315e9.6.2026.02.01.23.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:08:14 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v1 3/5] staging: rtl8723bs: remove NDIS type aliases
Date: Mon,  2 Feb 2026 08:07:50 +0100
Message-ID: <20260202070752.3391-4-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202070752.3391-1-lukagejak5@gmail.com>
References: <20260202070752.3391-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove Windows NDIS-style type aliases and replace with standard Linux
kernel types:

- Remove NDIS_802_11_MAC_ADDRESS typedef, use u8[ETH_ALEN] directly
- Remove NDIS_802_11_RATES typedef (unused)
- Remove NDIS_802_11_RATES_EX typedef, use u8[NDIS_802_11_LENGTH_RATES_EX]
- Remove NDIS_802_11_PMKID_VALUE typedef (unused)
- Update struct wlan_bssid_ex and struct FW_Sta_Info members
- Replace sizeof(NDIS_802_11_MAC_ADDRESS) with ETH_ALEN

This makes the code more readable and follows Linux kernel coding style
by using explicit types instead of Windows-style typedefs.

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c      |  2 +-
 drivers/staging/rtl8723bs/include/rtw_ioctl_set.h |  3 ---
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h  |  2 +-
 drivers/staging/rtl8723bs/include/wlan_bssdef.h   | 12 ++++--------
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  4 ++--
 5 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 3e80d03c4ec9..f67732e44082 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -492,7 +492,7 @@ struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 u32 rtw_init_bcmc_stainfo(struct adapter *padapter)
 {
 	struct sta_info *psta;
-	NDIS_802_11_MAC_ADDRESS	bcast_addr = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
+	u8 bcast_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
 	struct	sta_priv *pstapriv = &padapter->stapriv;
 	/* struct __queue	*pstapending = &padapter->xmitpriv.bm_pending; */
diff --git a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
index ab349de733c8..d8dd4b6d7aca 100644
--- a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
+++ b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
@@ -7,9 +7,6 @@
 #ifndef __RTW_IOCTL_SET_H_
 #define __RTW_IOCTL_SET_H_
 
-
-typedef u8 NDIS_802_11_PMKID_VALUE[16];
-
 u8 rtw_set_802_11_authentication_mode(struct adapter *pdapter, enum ndis_802_11_authentication_mode authmode);
 u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep);
 u8 rtw_set_802_11_disassociate(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index dd5080056e58..e6d4c47a6729 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -253,7 +253,7 @@ struct FW_Sta_Info {
 	u32 status;
 	u32 rx_pkt;
 	u32 retry;
-	NDIS_802_11_RATES_EX  SupportedRates;
+	u8  SupportedRates[NDIS_802_11_LENGTH_RATES_EX];
 };
 
 /*
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index eb38594c8f5c..7071bd1a02fa 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -15,10 +15,6 @@
 #define NDIS_802_11_LENGTH_RATES        8
 #define NDIS_802_11_LENGTH_RATES_EX     16
 
-typedef unsigned char   NDIS_802_11_MAC_ADDRESS[6];
-typedef unsigned char   NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
-typedef unsigned char   NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
-
 struct ndis_802_11_ssid {
 	u32  ssid_length;
 	u8  ssid[32];
@@ -64,10 +60,10 @@ struct ndis_80211_var_ie {
 };
 
 /* Length is the 4 bytes multiples of the sum of
- * sizeof (NDIS_802_11_MAC_ADDRESS) + 2 +
+ * 6 (mac_address) + 2 +
  * sizeof (struct ndis_802_11_ssid) + sizeof (u32) +
  * sizeof (long) + sizeof (enum ndis_802_11_network_type) +
- * sizeof (struct ndis_802_11_conf) + sizeof (NDIS_802_11_RATES_EX) + ie_length
+ * sizeof (struct ndis_802_11_conf) + 16 (supported_rates) + ie_length
  *
  * Except for ie_length, all other fields are fixed length. Therefore, we can
  * define a macro to present the partial sum.
@@ -155,7 +151,7 @@ struct wlan_bcn_info {
 */
 struct wlan_bssid_ex {
 	u32  length;
-	NDIS_802_11_MAC_ADDRESS  mac_address;
+	u8  mac_address[ETH_ALEN];
 	u8  reserved[2];/* 0]: IS beacon frame */
 	struct ndis_802_11_ssid  ssid;
 	u32  privacy;
@@ -163,7 +159,7 @@ struct wlan_bssid_ex {
 	enum ndis_802_11_network_type  network_type_in_use;
 	struct ndis_802_11_conf  configuration;
 	enum ndis_802_11_network_infrastructure  infrastructure_mode;
-	NDIS_802_11_RATES_EX  supported_rates;
+	u8  supported_rates[NDIS_802_11_LENGTH_RATES_EX];
 	struct wlan_phy_info phy_info;
 	u32  ie_length;
 	u8  ies[MAX_IE_SZ];	/* timestamp, beacon interval, and capability information) */
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 60edeae1cffe..5488940ffe2e 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -378,7 +378,7 @@ void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter)
 				return;
 			}
 			if (!memcmp(&(scanned->network.ssid), &(pnetwork->ssid), sizeof(struct ndis_802_11_ssid))
-				&& !memcmp(scanned->network.mac_address, pnetwork->mac_address, sizeof(NDIS_802_11_MAC_ADDRESS))
+				&& !memcmp(scanned->network.mac_address, pnetwork->mac_address, ETH_ALEN)
 			)
 				rtw_cfg80211_inform_bss(padapter, scanned);
 			else
@@ -419,7 +419,7 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 			goto check_bss;
 		}
 
-		if (!memcmp(scanned->network.mac_address, pnetwork->mac_address, sizeof(NDIS_802_11_MAC_ADDRESS))
+		if (!memcmp(scanned->network.mac_address, pnetwork->mac_address, ETH_ALEN)
 			&& !memcmp(&(scanned->network.ssid), &(pnetwork->ssid), sizeof(struct ndis_802_11_ssid))
 		)
 			rtw_cfg80211_inform_bss(padapter, scanned);
-- 
2.52.0

