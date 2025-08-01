Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD2B2236E8
	for <linux-staging@lists.linux.dev>; Fri,  1 Aug 2025 08:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754037166; cv=none; b=P4vvBop2V+eLgMD18xDHkv/ypvOGpQXuU/eT+q/zD/K4O/1CaAtejuXWjvmcTDc9YzD/eK9wYuJ69qF5iqt9HBCKX6V35fY63QRYXRS82gL6TDApL9hCK76BY6xCWk9U2Qxz2V89/mm/C3LCMTM3HgGaJ+4dgX1ZZ14b9bgJ8rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754037166; c=relaxed/simple;
	bh=FMIUakQSKLWOnogEyddNVDBaxSVMMCzVFcBzoICkKek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OvEXyNT5szrkMocHgqNxXFzdE1ivJO9vSkA7MjSDL6xMTpkqDmJgA6aH3xVG6fwW0Fb5hDdpIhaSX5bCTsKeS3kSNFmqjiREEG0OoDQIY7fX25htrAJc49DkrJtXRsja3vH2DPESkHVCRk9LwkO6CTeD6iJJ6MxOjzssmE2ikls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7K1nGbe; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7K1nGbe"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-615d1865b2dso459173a12.0
        for <linux-staging@lists.linux.dev>; Fri, 01 Aug 2025 01:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754037163; x=1754641963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2onPGbHFtOLNzYANYUg22nvBv6obu2eVACcu780+yPI=;
        b=i7K1nGbeQLZOyX0rpuKCevPEB6miGlXmQXm9PvVvxMMvWeo467xWipDfHxANC0S9Hn
         yVY9QskG91XY7c/IWXEqRZUyQ/A28xKYDWrappyFMf6AY1WXukPhO0gVTJlI9hOCUwwp
         tWatncl79X2n6vdOm5nxig+Xx3Y+++zMCwyaq3Fb/iFo1ZUwAXm2z3+JluQtXEGzUFVH
         sGvElelWwi1uDM9VcsD+JcoWrma3kkJABTT6No6PU27gg40e30EKHikR1P6/C9FQHvrv
         iCvVnctSoNURfv7iDbzqOZ/+YaYFSy8/Alr7LEow97mV0OMxD8bau1Y0QhLcpRPjvrpo
         RO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754037163; x=1754641963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2onPGbHFtOLNzYANYUg22nvBv6obu2eVACcu780+yPI=;
        b=RN3/A6B4/AL6TbFnj76xImaCMTZMCG7P8uxBaaq6ZoKiuYFXFSi9KPzm+UXk8PycyF
         2FCugFO0w1F1j9mDH/5jN7udGC7b71KQVxw7P+ukA8bnY19vJfiPf14iZHe++hKqlb5h
         Zt41soOTmONOgosAde5ADazMJqWUZ8z9DFTpEHD5H7lrLzlxduGnq5hgzigWAIywyMGa
         0/RMrGl2aLaoeTFhsmKOaxpLveMIl1MKpBvt13nMrl4o6RPioN6lFQPl6VT5caWjgSKj
         eL3YmBabNsBe8+8TBGv7QAyEbyGngkRx/lZiKmCoe0ePC/3oTdDgjYz0riGtjd65/i44
         lvEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZwqcXNi+eoB5qKIha4E5EF+Pa36Nq6m1gAiT/1Y2qckYP+uukUP+ow/rXhCI6XboUJSO6IpB4JkgBwo9r@lists.linux.dev
X-Gm-Message-State: AOJu0YzYj4Ke3cJHcDqzrRHGogbJOzJaptMLxBWU73S22218M5TLFZSh
	us9MQN8/ccT2yTKoQQ4zxoKGy1wBeCjs3ksLiwkYVcnDGXIorNtmOCs7
X-Gm-Gg: ASbGnct/HS4ifMxJYrPouysmhyGZ5mx2v0pvOhrN3ZZbiDZR7YndAR2NjUTMmaG3XtW
	KJBvMwdSS/aWh8cGIb7nke45W8DEWABFpD4l0bZM4v6/0ySIcl2m8YSikAT3m55sKDPjWY+Qecl
	UVGbxXUM7M+5cGOCKbATx4EjYyCdygg8x6U/sQxmTLpzjzPEEzF5h+TQzyT97Qv3jvi3xpScc5c
	gdj5ZBIyO2h3xHWNS55damq8+4fDsKhe/YILW1ZezHt+UdVBg2xP+2W9d4yjyOQL1gi5B84tFX9
	uNvjArfYg13Jm5BEqA0KSp9tlfMFUFy6GizKwSqH1VpI2DnJ5qH89VuIM3GJWZ4oyDmbVB0tHpb
	FKcvjEs8A59Zuhs8v97sgVVwyR/2LlF5/vMX6a9xnPq/DKsFYeZQptIEhQf8gaA==
X-Google-Smtp-Source: AGHT+IG9Hl6jL80/ej1OiTE+v72RAZtbDeDDG6cYH8dWMac1qZxeD3bRaCW0Cat7/5EFvSCZeScwyg==
X-Received: by 2002:a05:6402:5cb:b0:612:b9bf:2a56 with SMTP id 4fb4d7f45d1cf-615871ba1c9mr10039662a12.21.1754037162382;
        Fri, 01 Aug 2025 01:32:42 -0700 (PDT)
Received: from tumbleweed (ip-77-25-33-2.web.vodafone.de. [77.25.33.2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a911a59dsm2362735a12.62.2025.08.01.01.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 01:32:41 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 8/8] staging: rtl8723bs: move rtw_reset_securitypriv to core/rtw_mlme.c
Date: Fri,  1 Aug 2025 10:31:31 +0200
Message-ID: <20250801083131.82915-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801083131.82915-1-straube.linux@gmail.com>
References: <20250801083131.82915-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the function rtw_reset_securitypriv from os_dep/mlme_linux.c to
core/rtw_mlme.c to reduce code in the os_dep directory.

The file os_dep/mlme_linux.c is finally empty now and we can remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v1 -> v2: no changes

 drivers/staging/rtl8723bs/Makefile            |  1 -
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 60 +++++++++++++++++
 drivers/staging/rtl8723bs/include/drv_types.h |  1 -
 .../staging/rtl8723bs/include/mlme_osdep.h    | 13 ----
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  1 +
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c | 67 -------------------
 6 files changed, 61 insertions(+), 82 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/include/mlme_osdep.h
 delete mode 100644 drivers/staging/rtl8723bs/os_dep/mlme_linux.c

diff --git a/drivers/staging/rtl8723bs/Makefile b/drivers/staging/rtl8723bs/Makefile
index 8560b84a3146..19c0525ec3e0 100644
--- a/drivers/staging/rtl8723bs/Makefile
+++ b/drivers/staging/rtl8723bs/Makefile
@@ -48,7 +48,6 @@ r8723bs-y = \
 		hal/HalHWImg8723B_RF.o \
 		hal/HalPhyRf_8723B.o \
 		os_dep/ioctl_cfg80211.o \
-		os_dep/mlme_linux.o \
 		os_dep/osdep_service.o \
 		os_dep/os_intfs.o \
 		os_dep/recv_linux.o \
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 4c816fb2500b..84984de45788 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1116,6 +1116,66 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
 }
 
+static struct rt_pmkid_list   backupPMKIDList[NUM_PMKID_CACHE];
+void rtw_reset_securitypriv(struct adapter *adapter)
+{
+	u8 backupPMKIDIndex = 0;
+	u8 backupTKIPCountermeasure = 0x00;
+	u32 backupTKIPcountermeasure_time = 0;
+	/*  add for CONFIG_IEEE80211W, none 11w also can use */
+	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
+
+	spin_lock_bh(&adapter->security_key_mutex);
+
+	if (adapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
+		/* 802.1x */
+		/*  Added by Albert 2009/02/18 */
+		/*  We have to backup the PMK information for WiFi PMK Caching test item. */
+		/*  */
+		/*  Backup the btkip_countermeasure information. */
+		/*  When the countermeasure is trigger, the driver have to disconnect with AP for 60 seconds. */
+
+		memcpy(&backupPMKIDList[0], &adapter->securitypriv.PMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
+		backupPMKIDIndex = adapter->securitypriv.PMKIDIndex;
+		backupTKIPCountermeasure = adapter->securitypriv.btkip_countermeasure;
+		backupTKIPcountermeasure_time = adapter->securitypriv.btkip_countermeasure_time;
+
+		/* reset RX BIP packet number */
+		pmlmeext->mgnt_80211w_IPN_rx = 0;
+
+		memset((unsigned char *)&adapter->securitypriv, 0, sizeof(struct security_priv));
+
+		/*  Added by Albert 2009/02/18 */
+		/*  Restore the PMK information to securitypriv structure for the following connection. */
+		memcpy(&adapter->securitypriv.PMKIDList[0], &backupPMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
+		adapter->securitypriv.PMKIDIndex = backupPMKIDIndex;
+		adapter->securitypriv.btkip_countermeasure = backupTKIPCountermeasure;
+		adapter->securitypriv.btkip_countermeasure_time = backupTKIPcountermeasure_time;
+
+		adapter->securitypriv.ndisauthtype = Ndis802_11AuthModeOpen;
+		adapter->securitypriv.ndisencryptstatus = Ndis802_11WEPDisabled;
+
+	} else {
+		/* reset values in securitypriv */
+		/* if (adapter->mlmepriv.fw_state & WIFI_STATION_STATE) */
+		/*  */
+		struct security_priv *psec_priv = &adapter->securitypriv;
+
+		psec_priv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;  /* open system */
+		psec_priv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
+		psec_priv->dot11PrivacyKeyIndex = 0;
+
+		psec_priv->dot118021XGrpPrivacy = _NO_PRIVACY_;
+		psec_priv->dot118021XGrpKeyid = 1;
+
+		psec_priv->ndisauthtype = Ndis802_11AuthModeOpen;
+		psec_priv->ndisencryptstatus = Ndis802_11WEPDisabled;
+		/*  */
+	}
+	/*  add for CONFIG_IEEE80211W, none 11w also can use */
+	spin_unlock_bh(&adapter->security_key_mutex);
+}
+
 /* Notes: the function could be > passive_level (the same context as Rx tasklet) */
 /* pnetwork : returns from rtw_joinbss_event_callback */
 /* ptarget_wlan: found from scanned_queue */
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 080c321665c0..f1c16ddacc83 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -40,7 +40,6 @@
 #include <rtw_qos.h>
 #include <rtw_pwrctrl.h>
 #include <rtw_mlme.h>
-#include <mlme_osdep.h>
 #include <rtw_io.h>
 #include <rtw_ioctl_set.h>
 #include <osdep_intf.h>
diff --git a/drivers/staging/rtl8723bs/include/mlme_osdep.h b/drivers/staging/rtl8723bs/include/mlme_osdep.h
deleted file mode 100644
index 3930d9e6dab7..000000000000
--- a/drivers/staging/rtl8723bs/include/mlme_osdep.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-#ifndef	__MLME_OSDEP_H_
-#define __MLME_OSDEP_H_
-
-
-void rtw_reset_securitypriv(struct adapter *adapter);
-
-#endif	/* _MLME_OSDEP_H_ */
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 3cf68b85eb32..4c15d0194d4f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -395,5 +395,6 @@ u8 rtw_to_roam(struct adapter *adapter);
 int rtw_select_roaming_candidate(struct mlme_priv *pmlmepriv);
 
 void rtw_sta_media_status_rpt(struct adapter *adapter, struct sta_info *psta, u32 mstatus);
+void rtw_reset_securitypriv(struct adapter *adapter);
 
 #endif /* __RTL871X_MLME_H_ */
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
deleted file mode 100644
index 918d9496d7cc..000000000000
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ /dev/null
@@ -1,67 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/******************************************************************************
- *
- * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
- *
- ******************************************************************************/
-#include <drv_types.h>
-
-static struct rt_pmkid_list   backupPMKIDList[NUM_PMKID_CACHE];
-void rtw_reset_securitypriv(struct adapter *adapter)
-{
-	u8 backupPMKIDIndex = 0;
-	u8 backupTKIPCountermeasure = 0x00;
-	u32 backupTKIPcountermeasure_time = 0;
-	/*  add for CONFIG_IEEE80211W, none 11w also can use */
-	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
-
-	spin_lock_bh(&adapter->security_key_mutex);
-
-	if (adapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
-		/* 802.1x */
-		/*  Added by Albert 2009/02/18 */
-		/*  We have to backup the PMK information for WiFi PMK Caching test item. */
-		/*  */
-		/*  Backup the btkip_countermeasure information. */
-		/*  When the countermeasure is trigger, the driver have to disconnect with AP for 60 seconds. */
-
-		memcpy(&backupPMKIDList[0], &adapter->securitypriv.PMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
-		backupPMKIDIndex = adapter->securitypriv.PMKIDIndex;
-		backupTKIPCountermeasure = adapter->securitypriv.btkip_countermeasure;
-		backupTKIPcountermeasure_time = adapter->securitypriv.btkip_countermeasure_time;
-
-		/* reset RX BIP packet number */
-		pmlmeext->mgnt_80211w_IPN_rx = 0;
-
-		memset((unsigned char *)&adapter->securitypriv, 0, sizeof(struct security_priv));
-
-		/*  Added by Albert 2009/02/18 */
-		/*  Restore the PMK information to securitypriv structure for the following connection. */
-		memcpy(&adapter->securitypriv.PMKIDList[0], &backupPMKIDList[0], sizeof(struct rt_pmkid_list) * NUM_PMKID_CACHE);
-		adapter->securitypriv.PMKIDIndex = backupPMKIDIndex;
-		adapter->securitypriv.btkip_countermeasure = backupTKIPCountermeasure;
-		adapter->securitypriv.btkip_countermeasure_time = backupTKIPcountermeasure_time;
-
-		adapter->securitypriv.ndisauthtype = Ndis802_11AuthModeOpen;
-		adapter->securitypriv.ndisencryptstatus = Ndis802_11WEPDisabled;
-
-	} else {
-		/* reset values in securitypriv */
-		/* if (adapter->mlmepriv.fw_state & WIFI_STATION_STATE) */
-		/*  */
-		struct security_priv *psec_priv = &adapter->securitypriv;
-
-		psec_priv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;  /* open system */
-		psec_priv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
-		psec_priv->dot11PrivacyKeyIndex = 0;
-
-		psec_priv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-		psec_priv->dot118021XGrpKeyid = 1;
-
-		psec_priv->ndisauthtype = Ndis802_11AuthModeOpen;
-		psec_priv->ndisencryptstatus = Ndis802_11WEPDisabled;
-		/*  */
-	}
-	/*  add for CONFIG_IEEE80211W, none 11w also can use */
-	spin_unlock_bh(&adapter->security_key_mutex);
-}
-- 
2.50.1

