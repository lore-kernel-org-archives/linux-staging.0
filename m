Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC7172
	for <linux-staging@lists.linux.dev>; Mon, 26 Jul 2021 09:10:38 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id ga41so15236777ejc.10
        for <linux-staging@lists.linux.dev>; Mon, 26 Jul 2021 02:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yl7CupfQBRHivtmWrPtpI7/TUlZwh31U/GvJWFLimQ4=;
        b=rNCoEe0Goq1rhpi2aFAuXK08hyQrUT7HX4EakktKx14Ke0ZIuNCbRCWJtxdAZzF0gi
         OG+DeTF9f1sb/RdF/p8TGbLIMTtqDWQohf8nPVrA4+MyFj0Qv8MpV34Fpc5XKzanAF3S
         QZFHYM+fW7t1J3elT0n1aEOJ0OyOIWdMKwWA2vJM38A0QpNG4PnNQ7s8rZVXILiPvq5x
         pTI+P1ANjopIlsqtRICVJD6b2rOQ7MLZNfnM96j/Y5X60ERqXbACiatWEuT4xnjGs7JB
         vsrvf9Kg7q6QW654s4l4NKMn+utxovUgZhRSjqMpmokOxlwCbUdMlW5MF1saY77Wp8GV
         Emxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yl7CupfQBRHivtmWrPtpI7/TUlZwh31U/GvJWFLimQ4=;
        b=rbljQFvmMydydIY0wn3fdlPWFywYE6KDyfxi841xPe3XBc+/2fP6cRt0Ie8rUXp3zd
         DiKJI5G2TsRz74ScchJSfeEBlFRUIICz3BCrkW+ZHaLEzWxGXd/LU3RhH6Yh7BELwSiv
         ukoWZDe9qm5ZKa0Sb0BRJebbwB3BAIfAshr7AmvbR2w5GW321axKySuDkZcfFVCxdh9a
         obFOCOdwCynM52+yLQSxLO08WGNl7icwBAMXeAaSRvfuxA1tt668GQ0T7KDWKIRgwOPo
         I3IFl2agt0VsQprGoym7Sza06LGp08KWsQyAtFqhQY2mxUTv0KOPNvJk7fdHQMVaDDeL
         bBeQ==
X-Gm-Message-State: AOAM531opckiJf6f2iLti78ytUciDM72oURdz6Z4zIC7Moi4pXczWiFY
	tdG+GwaCqE0IOdW4D9LZC0qOkTxtf8g=
X-Google-Smtp-Source: ABdhPJz5COJjMIP1Epi4BOUioeC9uXPs3GQrWZf9sDP+RROCNt87NcaBznzYib0LFfzH8Ry4WKWK5A==
X-Received: by 2002:a17:906:585a:: with SMTP id h26mr16251647ejs.31.1627290636937;
        Mon, 26 Jul 2021 02:10:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4bf9])
        by smtp.gmail.com with ESMTPSA id p3sm14536647ejy.20.2021.07.26.02.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 02:10:36 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8188eu: remove blank lines
Date: Mon, 26 Jul 2021 11:10:14 +0200
Message-Id: <20210726091014.21405-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank lines reported by checkpatch.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8188eu/core/rtw_ap.c           | 3 ---
 drivers/staging/rtl8188eu/core/rtw_mlme_ext.c     | 1 -
 drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c | 1 -
 drivers/staging/rtl8188eu/os_dep/ioctl_linux.c    | 1 -
 4 files changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_ap.c b/drivers/staging/rtl8188eu/core/rtw_ap.c
index b817aa8b9de4..a2aeb78733d5 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ap.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ap.c
@@ -381,7 +381,6 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 		/* set ra_id, init_rate */
 		psta->raid = raid;
 		psta->init_rate = init_rate;
-
 	}
 }
 
@@ -453,7 +452,6 @@ static void update_bmc_sta(struct adapter *padapter)
 		spin_lock_bh(&psta->lock);
 		psta->state = _FW_LINKED;
 		spin_unlock_bh(&psta->lock);
-
 	}
 }
 
@@ -1140,7 +1138,6 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 
 static void update_bcn_vendor_spec_ie(struct adapter *padapter, u8 *oui)
 {
-
 	if (!memcmp(WPS_OUI, oui, 4))
 		update_bcn_wps_ie(padapter);
 }
diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
index 25653ebfaafd..b1fe30e9a2b4 100644
--- a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
@@ -4723,7 +4723,6 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 						pmlmeext->cur_ch_offset = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
 						break;
 					}
-
 				}
 			}
 			break;
diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
index 2afef26ddb56..6cf87312bc36 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
@@ -455,7 +455,6 @@ void rtl8188e_EfuseParseChnlPlan(struct adapter *padapter, u8 *hwinfo, bool Auto
 		 hal_com_get_channel_plan(hwinfo ? hwinfo[EEPROM_ChannelPlan_88E] : 0xFF,
 					  padapter->registrypriv.channel_plan,
 					  RT_CHANNEL_DOMAIN_WORLD_WIDE_13, AutoLoadFail);
-
 }
 
 void Hal_EfuseParseCustomerID88E(struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail)
diff --git a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
index d4dce8ef0322..2b43c7eab71f 100644
--- a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
@@ -1212,7 +1212,6 @@ static int rtw_wx_set_essid(struct net_device *dev,
 
 			if ((!memcmp(dst_ssid, src_ssid, ndis_ssid.ssid_length)) &&
 			    (pnetwork->network.ssid.ssid_length == ndis_ssid.ssid_length)) {
-
 				if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 					if (pnetwork->network.InfrastructureMode != pmlmepriv->cur_network.network.InfrastructureMode)
 						continue;
-- 
2.32.0

