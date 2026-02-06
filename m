Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7956B346AD5
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364514; cv=none; b=qTCXJ7sg5s4g0uhSW/F3GSTk5Di/YypVyfuSYeifCiezVA/DcVnKiT5lXYh/hzcr32jQWbxL50zFdmIz4ZIYVjvnypuRyNUyV8K9sAdpMW4uBNAGcu/io3dHPvJ74rHcwf46rYiltEjqoHGnd3hWDQzVY7xSVzcT8lxkWceEWHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364514; c=relaxed/simple;
	bh=C1JMtYD6Qeii8ERvqfm5NxcYasJfV0R1A7qg/thSxBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LD8Jt442I7/sNeWvosB7IsQJclDkkpndaU4k424JUWuz1CSVSLwANZ/QrmdQZYrpGNw13h3oeAh5gqQcxqMq4SqHA/k8LLLvCFJPEptqjMIbb3JScPZXrYcZG7Rry5dkGUuzGd8qvJNnQULsGaMeZIl1a6G2xQ4f5d3RAVcWLGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f3myblsG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f3myblsG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-480142406b3so14310305e9.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364512; x=1770969312; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YLBNm9Tii3xCAHms27r5h3rncPdYmKtKNVOy2xHMIg=;
        b=f3myblsG473tWa1gLvuD9G//In9F77a0WkcbaQa/yUttqT+6QNmJ6cNRmGejRH7w7u
         O1aNJEqVI4nhsTnd5NPpOtY5UnJafcfKRZN+mYWuzciVZNGhbo68wKzeMYlqrq3gyHaw
         qRu80Hjl2V55y/J8+c8Vq+BxKx77F704YTQhKR/a103aG6Px7wKvQVvQUQ0XoWQiRZjt
         8CEYvp2e5h2AWLC4FxtxYb8v52mzWurW2PI5xi7JCi84BcNmwCiDeaY1daeupxArx0HA
         N50iZ061D1GD7d9RnunI6KYaoF71Ih+Irc8xGeMCzZnsIDoCTor3WuFwMk7hJ17ZxhG7
         NIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364512; x=1770969312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8YLBNm9Tii3xCAHms27r5h3rncPdYmKtKNVOy2xHMIg=;
        b=AddM4+F3OQ5gPbH1aeZIWJBUee2dZ6veFQLyL3rkCj8Sar5mll1N/BPU6Y8s8n+AMd
         NvsuV/ZJSdR/0ai5PD2uYrcvIVbR0f31Q0Vf6iruszZw3d5pI+NOMmObFIAEcBo0FQO+
         jR8XxVQF0tmPT6aKcWNCC09Cbao7AHsuYhAnLanf7Qf0/zAEXyTOIgjInYkPfRMRuM9U
         6mkVGgWmygHWS55EYK0l63GApHXwdP6KCFWbzIt/RYXOzjAqEoLsJoPFYezK4qixO34n
         Hb9fWSF9+A7IrYVpgxRiCY0NeXce+t5DQE0T3ld5Nv+DLn54hydb34v1ko4w13xZios5
         QYVw==
X-Forwarded-Encrypted: i=1; AJvYcCWQf+dYfaYLBQ5JdPbv3eUF9fZshDHJVsmj3IA6PPgoGYmthxlf89Jg3A8sanU847ioj+Yb25z+OF6sH2nf@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh0th4WqlOw1c3ipjUhv6jtwWnxFXVFrVwZBNHzeC0MpsX+pDQ
	todyAsJPOgmTuB4XUx07SugvasnzeQWOWacr+qo3uL0BvJefCtDoDB0=
X-Gm-Gg: AZuq6aJanpVDDgINA+fLA8DJeHJDfX2FUULSez5+AQ+GPeBosBboGIbEVDs6bl0MLZW
	Q+UQraz6hd5WtiX8a0WfUCNofe2ePQVDrkVJbsyLsqbRlQKXgg3QQ6CPU8ESi3ZNrhgohVqGZcB
	Sz8ZyoIfrBCmp/oeQVYpkbFxH9vY4a5g9rJUTFRXQTqlZSxhEQOof7f5JGLsYHdL5BlwK/T1c+z
	AI0UwjuPXd2mkAsISusx0rbBNSB+9uk8Qh43Egzl6iFEww0ecryWbL7WFcWZmmdAcSbcFiD+Ux3
	7rwghPryvKh5K4gX6aYl1aZiGLADyH/kfqXohMteSeb5AFgoowDfb67od5OsYqHStoCD7JM/c+2
	oBD0oPhPWPSX6bKPDYxgFMcPkrfAmPQSv+0mTfzvnOa6TZeqZ4FtGVFfu4joVqo/Iscya6f3vmO
	KA4rlS7g9loXaed0jssUePrFZxkXceIh8/MhQuuBD5OzlsXqfT2q0EtwankX1npl0=
X-Received: by 2002:a05:6000:220c:b0:436:7d3:b953 with SMTP id ffacd0b85a97d-4362933caf0mr3074689f8f.5.1770364511697;
        Thu, 05 Feb 2026 23:55:11 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:11 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 10/26] staging: rtl8723bs: remove NDIS type aliases
Date: Fri,  6 Feb 2026 08:54:23 +0100
Message-ID: <20260206075439.103287-11-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Remove Windows NDIS-style type aliases and replace with standard Linux
kernel types. This makes the code more readable and follows Linux kernel
coding style by using explicit types instead of Windows-style typedefs.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c      |  2 +-
 drivers/staging/rtl8723bs/include/rtw_ioctl_set.h |  3 ---
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h  |  2 +-
 drivers/staging/rtl8723bs/include/wlan_bssdef.h   | 12 ++++--------
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  4 ++--
 5 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index bdd4b6d8fd2e..2fc966ac5d3f 100644
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
index 476ab055e53e..aacc97bbf171 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -379,7 +379,7 @@ void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter)
 				return;
 			}
 			if (!memcmp(&(scanned->network.ssid), &(pnetwork->ssid), sizeof(struct ndis_802_11_ssid))
-				&& !memcmp(scanned->network.mac_address, pnetwork->mac_address, sizeof(NDIS_802_11_MAC_ADDRESS))
+				&& !memcmp(scanned->network.mac_address, pnetwork->mac_address, ETH_ALEN)
 			)
 				rtw_cfg80211_inform_bss(padapter, scanned);
 			else
@@ -420,7 +420,7 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 			goto check_bss;
 		}
 
-		if (!memcmp(scanned->network.mac_address, pnetwork->mac_address, sizeof(NDIS_802_11_MAC_ADDRESS))
+		if (!memcmp(scanned->network.mac_address, pnetwork->mac_address, ETH_ALEN)
 			&& !memcmp(&(scanned->network.ssid), &(pnetwork->ssid), sizeof(struct ndis_802_11_ssid))
 		)
 			rtw_cfg80211_inform_bss(padapter, scanned);
-- 
2.52.0

