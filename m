Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF07472
	for <linux-staging@lists.linux.dev>; Thu, 18 Nov 2021 21:51:06 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id t30so14238377wra.10
        for <linux-staging@lists.linux.dev>; Thu, 18 Nov 2021 13:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O1CE+It5LGQeMKrU6ZNtsZm7wmjUY9uOAMaQ6NetijQ=;
        b=KQEA1SaGT1smZzB0334GQFomjb63SxcQGszAMCy25BLy3pXopGeUhIBWn9i5mRkOEa
         J6Kz5LKu0FkM0Kxqe9ucOJzY1wYn213tSDa2jAMMN3G+vMpApeW+MXDxWBwTVwNmKVrC
         9qNDwuPWB5HQVTJQqMJ1Q1xgWV4LKlS1C56pnuXPEuHeeAzqwlcwYSNmPTiy+q9d9y6p
         SXyXkagMcchCU0++1HyOFQQyYV+UNNl2sQ+0pMhwdsqzNViS6LcwP0qgbAeHG2/bpGjU
         Uk65oF2d1vjwLON8HaRPzpKlmd3mh5GHe+30rK7EB+UsZECMZ3ZOmoGo8p3yjZdPxY4u
         EGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O1CE+It5LGQeMKrU6ZNtsZm7wmjUY9uOAMaQ6NetijQ=;
        b=fNHpxnYKX3v8UahHihRPioPGF+0nnzVc/UImhdYqB6dC8OgvAwOlfA0H7fvq5/zu0B
         vb0BRiNYqMuScR1HtTgoUgCY5pvDVWSP/lfve13UcaIiHdR0cQes79sJGVI+xEucuqV3
         joD29W05BynIRGhHSBkn5YCkSGTTm9YXiTLAKajtv9tZdVfhPIekXC7kbzvLBBxga87k
         NR4Y2exgKfru3NeYGBqi5pUy+i6Sa8OtFb3tUw24HGnubPyeo6AH5ZQjsB3I89uUDGH6
         1ppXIS9qX0C5YazY2PuMUbDWpkJHVEldwbgHoDV5AL8QX4m2CkVOfrPfAt6I6rty+Zvn
         XDLQ==
X-Gm-Message-State: AOAM5310qvj0/1WKsHWDZDML1GOyKIOKnYwWwLnpcoQ/1ia7kX+ZjuU/
	yo19HNvwT4A0y+xT7svjdlw=
X-Google-Smtp-Source: ABdhPJz0MfmzYcxEbqZbnRbAlaF3MEY/Y1a4L8uQWE+WDhNhR5Swemt73oRkUcAzq6Hu8OgAmY3y6A==
X-Received: by 2002:a5d:5850:: with SMTP id i16mr875214wrf.410.1637272265035;
        Thu, 18 Nov 2021 13:51:05 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::9b8e])
        by smtp.gmail.com with ESMTPSA id m2sm10010897wml.15.2021.11.18.13.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 13:51:04 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove rf_type from rtw_mcs_rate()
Date: Thu, 18 Nov 2021 22:50:52 +0100
Message-Id: <20211118215052.5215-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rf_type is always RF_1T1R. Remove it from rtw_mcs_rate() and remove
related dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 73 +++++---------------
 drivers/staging/r8188eu/core/rtw_ioctl_set.c | 13 ++--
 drivers/staging/r8188eu/include/ieee80211.h  |  3 +-
 3 files changed, 23 insertions(+), 66 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 343c2f9a4ce8..ad87954bdeb4 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -1160,63 +1160,26 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 }
 
 /* show MCS rate, unit: 100Kbps */
-u16 rtw_mcs_rate(u8 rf_type, u8 bw_40MHz, u8 short_GI_20, u8 short_GI_40, unsigned char *MCS_rate)
+u16 rtw_mcs_rate(u8 bw_40MHz, u8 short_GI_20, u8 short_GI_40, unsigned char *MCS_rate)
 {
 	u16 max_rate = 0;
 
-	if (rf_type == RF_1T1R) {
-		if (MCS_rate[0] & BIT(7))
-			max_rate = (bw_40MHz) ? ((short_GI_40) ? 1500 : 1350) : ((short_GI_20) ? 722 : 650);
-		else if (MCS_rate[0] & BIT(6))
-			max_rate = (bw_40MHz) ? ((short_GI_40) ? 1350 : 1215) : ((short_GI_20) ? 650 : 585);
-		else if (MCS_rate[0] & BIT(5))
-			max_rate = (bw_40MHz) ? ((short_GI_40) ? 1200 : 1080) : ((short_GI_20) ? 578 : 520);
-		else if (MCS_rate[0] & BIT(4))
-			max_rate = (bw_40MHz) ? ((short_GI_40) ? 900 : 810) : ((short_GI_20) ? 433 : 390);
-		else if (MCS_rate[0] & BIT(3))
-			max_rate = (bw_40MHz) ? ((short_GI_40) ? 600 : 540) : ((short_GI_20) ? 289 : 260);
-		else if (MCS_rate[0] & BIT(2))
-			max_rate = (bw_40MHz) ? ((short_GI_40) ? 450 : 405) : ((short_GI_20) ? 217 : 195);
-		else if (MCS_rate[0] & BIT(1))
-			max_rate = (bw_40MHz) ? ((short_GI_40) ? 300 : 270) : ((short_GI_20) ? 144 : 130);
-		else if (MCS_rate[0] & BIT(0))
-			max_rate = (bw_40MHz) ? ((short_GI_40) ? 150 : 135) : ((short_GI_20) ? 72 : 65);
-	} else {
-		if (MCS_rate[1]) {
-			if (MCS_rate[1] & BIT(7))
-				max_rate = (bw_40MHz) ? ((short_GI_40) ? 3000 : 2700) : ((short_GI_20) ? 1444 : 1300);
-			else if (MCS_rate[1] & BIT(6))
-				max_rate = (bw_40MHz) ? ((short_GI_40) ? 2700 : 2430) : ((short_GI_20) ? 1300 : 1170);
-			else if (MCS_rate[1] & BIT(5))
-				max_rate = (bw_40MHz) ? ((short_GI_40) ? 2400 : 2160) : ((short_GI_20) ? 1156 : 1040);
-			else if (MCS_rate[1] & BIT(4))
-				max_rate = (bw_40MHz) ? ((short_GI_40) ? 1800 : 1620) : ((short_GI_20) ? 867 : 780);
-			else if (MCS_rate[1] & BIT(3))
-				max_rate = (bw_40MHz) ? ((short_GI_40) ? 1200 : 1080) : ((short_GI_20) ? 578 : 520);
-			else if (MCS_rate[1] & BIT(2))
-				max_rate = (bw_40MHz) ? ((short_GI_40) ? 900 : 810) : ((short_GI_20) ? 433 : 390);
-			else if (MCS_rate[1] & BIT(1))
-				max_rate = (bw_40MHz) ? ((short_GI_40) ? 600 : 540) : ((short_GI_20) ? 289 : 260);
-			else if (MCS_rate[1] & BIT(0))
-				max_rate = (bw_40MHz) ? ((short_GI_40) ? 300 : 270) : ((short_GI_20) ? 144 : 130);
-		} else {
-			if (MCS_rate[0] & BIT(7))
-				max_rate = (bw_40MHz) ? ((short_GI_40) ? 1500 : 1350) : ((short_GI_20) ? 722 : 650);
-			else if (MCS_rate[0] & BIT(6))
-				max_rate = (bw_40MHz) ? ((short_GI_40) ? 1350 : 1215) : ((short_GI_20) ? 650 : 585);
-			else if (MCS_rate[0] & BIT(5))
-				max_rate = (bw_40MHz) ? ((short_GI_40) ? 1200 : 1080) : ((short_GI_20) ? 578 : 520);
-			else if (MCS_rate[0] & BIT(4))
-				max_rate = (bw_40MHz) ? ((short_GI_40) ? 900 : 810) : ((short_GI_20) ? 433 : 390);
-			else if (MCS_rate[0] & BIT(3))
-				max_rate = (bw_40MHz) ? ((short_GI_40) ? 600 : 540) : ((short_GI_20) ? 289 : 260);
-			else if (MCS_rate[0] & BIT(2))
-				max_rate = (bw_40MHz) ? ((short_GI_40) ? 450 : 405) : ((short_GI_20) ? 217 : 195);
-			else if (MCS_rate[0] & BIT(1))
-				max_rate = (bw_40MHz) ? ((short_GI_40) ? 300 : 270) : ((short_GI_20) ? 144 : 130);
-			else if (MCS_rate[0] & BIT(0))
-				max_rate = (bw_40MHz) ? ((short_GI_40) ? 150 : 135) : ((short_GI_20) ? 72 : 65);
-		}
-	}
+	if (MCS_rate[0] & BIT(7))
+		max_rate = (bw_40MHz) ? ((short_GI_40) ? 1500 : 1350) : ((short_GI_20) ? 722 : 650);
+	else if (MCS_rate[0] & BIT(6))
+		max_rate = (bw_40MHz) ? ((short_GI_40) ? 1350 : 1215) : ((short_GI_20) ? 650 : 585);
+	else if (MCS_rate[0] & BIT(5))
+		max_rate = (bw_40MHz) ? ((short_GI_40) ? 1200 : 1080) : ((short_GI_20) ? 578 : 520);
+	else if (MCS_rate[0] & BIT(4))
+		max_rate = (bw_40MHz) ? ((short_GI_40) ? 900 : 810) : ((short_GI_20) ? 433 : 390);
+	else if (MCS_rate[0] & BIT(3))
+		max_rate = (bw_40MHz) ? ((short_GI_40) ? 600 : 540) : ((short_GI_20) ? 289 : 260);
+	else if (MCS_rate[0] & BIT(2))
+		max_rate = (bw_40MHz) ? ((short_GI_40) ? 450 : 405) : ((short_GI_20) ? 217 : 195);
+	else if (MCS_rate[0] & BIT(1))
+		max_rate = (bw_40MHz) ? ((short_GI_40) ? 300 : 270) : ((short_GI_20) ? 144 : 130);
+	else if (MCS_rate[0] & BIT(0))
+		max_rate = (bw_40MHz) ? ((short_GI_40) ? 150 : 135) : ((short_GI_20) ? 72 : 65);
+
 	return max_rate;
 }
diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
index 411b06e135be..84c320d4a478 100644
--- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
@@ -458,7 +458,6 @@ u16 rtw_get_cur_max_rate(struct adapter *adapter)
 	struct mlme_priv	*pmlmepriv = &adapter->mlmepriv;
 	struct wlan_bssid_ex  *pcur_bss = &pmlmepriv->cur_network.network;
 	struct ieee80211_ht_cap *pht_capie;
-	u8	rf_type = 0;
 	u8	bw_40MHz = 0, short_GI_20 = 0, short_GI_40 = 0;
 	u16	mcs_rate = 0;
 	u32	ht_ielen = 0;
@@ -480,14 +479,10 @@ u16 rtw_get_cur_max_rate(struct adapter *adapter)
 			short_GI_20 = (le16_to_cpu(pmlmeinfo->HT_caps.u.HT_cap_element.HT_caps_info) & IEEE80211_HT_CAP_SGI_20) ? 1 : 0;
 			short_GI_40 = (le16_to_cpu(pmlmeinfo->HT_caps.u.HT_cap_element.HT_caps_info) & IEEE80211_HT_CAP_SGI_40) ? 1 : 0;
 
-			GetHwReg8188EU(adapter, HW_VAR_RF_TYPE, (u8 *)(&rf_type));
-			max_rate = rtw_mcs_rate(
-				rf_type,
-				bw_40MHz & (pregistrypriv->cbw40_enable),
-				short_GI_20,
-				short_GI_40,
-				pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate
-			);
+			max_rate = rtw_mcs_rate(bw_40MHz & (pregistrypriv->cbw40_enable),
+						short_GI_20,
+						short_GI_40,
+						pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate);
 		}
 	} else {
 		while ((pcur_bss->SupportedRates[i] != 0) && (pcur_bss->SupportedRates[i] != 0xFF)) {
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index 6c8206bd5466..3a23d5299314 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -1149,7 +1149,6 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork);
 
 void rtw_macaddr_cfg(u8 *mac_addr);
 
-u16 rtw_mcs_rate(u8 rf_type, u8 bw_40MHz, u8 short_GI_20, u8 short_GI_40,
-		 unsigned char *MCS_rate);
+u16 rtw_mcs_rate(u8 bw_40MHz, u8 short_GI_20, u8 short_GI_40, unsigned char *MCS_rate);
 
 #endif /* IEEE80211_H */
-- 
2.33.1

