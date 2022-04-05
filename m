Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BF917D4
	for <linux-staging@lists.linux.dev>; Tue,  5 Apr 2022 10:49:29 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a6so14914879ejk.0
        for <linux-staging@lists.linux.dev>; Tue, 05 Apr 2022 03:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DdE0cWQr6i8HJhNHJBVncn9A4zrQB0bj2Lr35kMyNmk=;
        b=CWQ2TqmLik4q8+yl73JOsZj5n+wxS+EVpOHhkpJexOg6GbcnUHH3dCdjFKcSmYysma
         kOWBR/Zrsl5/fZEf/1CcoEqOJYcZ3gpXa3eYWI7X/sOSe5ty83bac33uYZ2AcLbBTo/k
         ZiLFHBht5P2+ZJ6jgDeO8vhvU0xXqYdn59qaSz1XJy8Jntfy2fV6Es19Doo1I6x+Ant4
         KouAqcvyUgPzgLxeXyXX4FtGaR8hrK/1Wu5+0r2rPzsRn3MZnDMt0CFKLflG80wFbELz
         2EblNgLwjvxhcMSCdwjMhEuxw/p3xJtVr3nOzcE4e+N9b84wap7Y2mXL5Az3Judso/1L
         bMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DdE0cWQr6i8HJhNHJBVncn9A4zrQB0bj2Lr35kMyNmk=;
        b=BbBeyv32qk6hU282sZLganqGGpagODn6cE63AVHzS5JouIp27x+09VbJVEV8NZMlaN
         U/hPc3gxiQ/2/9CyBH6CZoR9+XCAdVE+Epm4oRNDtJdQuqMLSprzr+qCcieclcLSEHiz
         bx35l/i6YRzmoi0y15ul/A83sD9n9ABTvJ23yPIQUgS+Qz101hHwPCxYCCNdNaS/Wrvp
         +A+8JfEESOaEV0Wt1rRPnOQJm/QKMCBYSAztHm5vZECH5Px+z/kR6gcsWhS3DCOBs7oM
         cmUnQUJV/SfQtdAfxhnGuvlMum3hP+lmanxmQJ5yQIs+TkPHYL4aQvyh4RQ8t4nkHGPh
         lwkg==
X-Gm-Message-State: AOAM530cR9KTf9OZ/sDZGpaloHWVcQLGC1Asx90BBquGwqtBfDCl4l4O
	o3Hy5VhM/BouodEjo9njVe4=
X-Google-Smtp-Source: ABdhPJzJVrMx3iD6K5VVfUAuj2M5QlJy/tVSJ3xDQ0LPjP9PckN3Tv9IgWrskNJ97ZmX1VgAcuh3zA==
X-Received: by 2002:a17:906:c104:b0:6e4:a223:1af9 with SMTP id do4-20020a170906c10400b006e4a2231af9mr2749446ejc.441.1649155768137;
        Tue, 05 Apr 2022 03:49:28 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id j12-20020a50e0cc000000b0041cd813ac01sm2436702edl.28.2022.04.05.03.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 03:49:27 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 3/4] staging: r8188eu: remove HAL_DEF_CURRENT_ANTENNA
Date: Tue,  5 Apr 2022 12:49:09 +0200
Message-Id: <20220405104910.9769-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405104910.9769-1-straube.linux@gmail.com>
References: <20220405104910.9769-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to get rid of the function GetHalDefVar8188EUsb(), remove
the HAL_DEF_CURRENT_ANTENNA case from it and move the functionality
into a new function. This is part of the ongoing effort to get rid of
the unwanted hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2:
- added rtw_ prefix to the function name
- added the function in rtw_mlme.c

 drivers/staging/r8188eu/core/rtw_mlme.c     | 12 ++++++++++--
 drivers/staging/r8188eu/core/rtw_mlme_ext.c |  2 +-
 drivers/staging/r8188eu/hal/usb_halinit.c   |  3 ---
 drivers/staging/r8188eu/include/hal_intf.h  |  1 -
 drivers/staging/r8188eu/include/rtw_mlme.h  |  2 ++
 5 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 24ceb8028f89..e98d77676e6d 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -464,6 +464,13 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 
 }
 
+u8 rtw_current_antenna(struct adapter *adapter)
+{
+	struct hal_data_8188e *haldata = &adapter->haldata;
+
+	return haldata->CurAntenna;
+}
+
 /*
 Caller must hold pmlmepriv->lock first.
 */
@@ -497,7 +504,8 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 			/* If there are no more slots, expire the oldest */
 			pnetwork = oldest;
 
-			GetHalDefVar8188EUsb(adapter, HAL_DEF_CURRENT_ANTENNA, &target->PhyInfo.Optimum_antenna);
+			target->PhyInfo.Optimum_antenna = rtw_current_antenna(adapter);
+
 			memcpy(&pnetwork->network, target,  get_wlan_bssid_ex_sz(target));
 			/*  variable initialize */
 			pnetwork->fixed = false;
@@ -520,7 +528,7 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 
 			bssid_ex_sz = get_wlan_bssid_ex_sz(target);
 			target->Length = bssid_ex_sz;
-			GetHalDefVar8188EUsb(adapter, HAL_DEF_CURRENT_ANTENNA, &target->PhyInfo.Optimum_antenna);
+			target->PhyInfo.Optimum_antenna = rtw_current_antenna(adapter);
 			memcpy(&pnetwork->network, target, bssid_ex_sz);
 
 			pnetwork->last_scanned = jiffies;
diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 2c073219c13f..6207fd8cccae 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5995,7 +5995,7 @@ u8 collect_bss_info(struct adapter *padapter, struct recv_frame *precv_frame, st
 	bssid->Rssi = precv_frame->attrib.phy_info.recvpower; /*  in dBM.raw data */
 	bssid->PhyInfo.SignalQuality = precv_frame->attrib.phy_info.SignalQuality;/* in percentage */
 	bssid->PhyInfo.SignalStrength = precv_frame->attrib.phy_info.SignalStrength;/* in percentage */
-	GetHalDefVar8188EUsb(padapter, HAL_DEF_CURRENT_ANTENNA,  &bssid->PhyInfo.Optimum_antenna);
+	bssid->PhyInfo.Optimum_antenna = rtw_current_antenna(padapter);
 
 	/*  checking SSID */
 	p = rtw_get_ie(bssid->IEs + ie_offset, _SSID_IE_, &len, bssid->IELength - ie_offset);
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 805460bd6340..9d39c5ca56a7 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1204,9 +1204,6 @@ void GetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariab
 	struct hal_data_8188e *haldata = &Adapter->haldata;
 
 	switch (eVariable) {
-	case HAL_DEF_CURRENT_ANTENNA:
-		*((u8 *)pValue) = haldata->CurAntenna;
-		break;
 	case HAL_DEF_DBG_DM_FUNC:
 		*((u32 *)pValue) = haldata->odmpriv.SupportAbility;
 		break;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 6a80e517a7ad..0bc274a695d9 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -28,7 +28,6 @@ enum hw_variables {
 };
 
 enum hal_def_variable {
-	HAL_DEF_CURRENT_ANTENNA,
 	HAL_DEF_DBG_DM_FUNC,/* for dbg */
 };
 
diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index 37d217aaf524..1dc1fbf049af 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -598,4 +598,6 @@ void rtw_set_max_rpt_macid(struct adapter *adapter, u8 macid);
 void rtw_sta_media_status_rpt(struct adapter *adapter, struct sta_info *psta,
 			      u32 mstatus);
 
+u8 rtw_current_antenna(struct adapter *adapter);
+
 #endif /* __RTL871X_MLME_H_ */
-- 
2.35.1

