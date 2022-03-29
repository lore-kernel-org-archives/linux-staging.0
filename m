Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E9F258C
	for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 20:21:52 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id dr20so37384112ejc.6
        for <linux-staging@lists.linux.dev>; Tue, 29 Mar 2022 13:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3IFwCjklhdRZF/g42Am6ngyzxVzMgTYWvicG6NBlRjM=;
        b=G1iMqA5VrU8bfNiRqfkjPG99D1FghY/aI+iNYv291Gxlg440Cq8gTnfKzjelxam0wL
         tGDRpmqIKmY7K26DQiGGl8m9Yu1RA8uXgLLBBGbwZssgCXtRlavVLAwIhsevmQZlU2A4
         QAbZWLsxkAvNXPOJHp75CKhv/nJZ85mDxxbDxfqPqqP+owbqfrlU8EB1ZLkOXG45jJ/5
         lvnCR7E3S1ngFJP1rRfIMP9ARiXcA/CsSQZ+XsJIuLkBzxhlGbwgrkhDWPoNZbxFOZ1p
         uVrCaZiVhXaiZ+1vGPfowv0crlrwdSHzmdtSGpO6fwxJzXVeF/HI1kzYOucGaEhbaoNx
         JHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3IFwCjklhdRZF/g42Am6ngyzxVzMgTYWvicG6NBlRjM=;
        b=xVeT8181fmzqJG+MlhtUtK96K5X6MKTC4Uko9kq7w/ig7Omy42085vNvLMpaxRbnXl
         OPZLvswNusjJx+Uq+A86+pOXUcepwk3RMRJwI/vh6aAHsNVt8Jj+kGjNRRoSCd8EvI74
         KTL1U5zNts1vecYDaaJqlettUJ4vOK9bZ8QJenunFsnBZvI1p53Y+nfBLiISaW1MJ5FI
         OS9LtHWgOSbr/pYQj+nz6MRtPV53hMEISLTg5PvTkhZQhv4uGFpNbHrBElEXAJsOKm0W
         ZSmRyRiWD6wRAkwPLP5JIvPdljrsAc8gYcpAofWDEKOq2JfKhKn8J+3kLIYyQJ/JW/Cj
         YFqA==
X-Gm-Message-State: AOAM532bUXKTLKio7qGK4tCaaO+Xu8XR5RCAGA8PPdtwszzK0zyJMTPA
	9ch6KU7mQGlfEDYh2H8iXRU=
X-Google-Smtp-Source: ABdhPJwrIj+5MAnCgW7GIyGwt8R/AGvQIxzLAUowU6Dz+8h8/P33LuxJRRVek/UUeeFM5V+OKNM61Q==
X-Received: by 2002:a17:906:3283:b0:6ce:78f9:fafd with SMTP id 3-20020a170906328300b006ce78f9fafdmr37454449ejw.534.1648585310502;
        Tue, 29 Mar 2022 13:21:50 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id ss12-20020a170907038c00b006e0ec9e806dsm3938111ejb.136.2022.03.29.13.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 13:21:50 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 2/8] staging: r8188eu: remove HW_VAR_MLME_DISCONNECT from SetHwReg8188EU()
Date: Tue, 29 Mar 2022 22:21:35 +0200
Message-Id: <20220329202141.7028-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329202141.7028-1-straube.linux@gmail.com>
References: <20220329202141.7028-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SetHwReg8188EU() is called with HW_VAR_MLME_DISCONNECT only from
functions in rtw_mlme_ext.c. Move the functionality into a static
function in rtw_mlme_ext.c and remove the HW_VAR_MLME_DISCONNECT case
from SetHwReg8188EU(). This is part of the ongoing effort to get rid
of the unwanted hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2: no changes

 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 19 ++++++++++++++++---
 drivers/staging/r8188eu/hal/usb_halinit.c   | 11 -----------
 drivers/staging/r8188eu/include/hal_intf.h  |  1 -
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index c0a1efcd8b28..4a9321e6e327 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -6799,13 +6799,26 @@ void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *p
 	update_sta_info(padapter, psta);
 }
 
+static void mlme_disconnect(struct adapter *adapter)
+{
+	/* Set RCR to not to receive data frame when NO LINK state */
+	/* reject all data frames */
+	rtw_write16(adapter, REG_RXFLTMAP2, 0x00);
+
+	/* reset TSF */
+	rtw_write8(adapter, REG_DUAL_TSF_RST, (BIT(0) | BIT(1)));
+
+	/* disable update TSF */
+	rtw_write8(adapter, REG_BCN_CTRL, rtw_read8(adapter, REG_BCN_CTRL) | BIT(4));
+}
+
 void mlmeext_sta_del_event_callback(struct adapter *padapter)
 {
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 
 	if (is_client_associated_to_ap(padapter) || is_IBSS_empty(padapter)) {
-		SetHwReg8188EU(padapter, HW_VAR_MLME_DISCONNECT, NULL);
+		mlme_disconnect(padapter);
 		SetHwReg8188EU(padapter, HW_VAR_BSSID, null_addr);
 
 		/* restore to initial setting. */
@@ -7169,7 +7182,7 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 		/* set MSR to nolink -> infra. mode */
 		Set_MSR(padapter, _HW_STATE_STATION_);
 
-		SetHwReg8188EU(padapter, HW_VAR_MLME_DISCONNECT, NULL);
+		mlme_disconnect(padapter);
 	}
 
 	rtw_antenna_select_cmd(padapter, pparm->network.PhyInfo.Optimum_antenna, false);
@@ -7265,7 +7278,7 @@ u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
 	if (is_client_associated_to_ap(padapter))
 		issue_deauth_ex(padapter, pnetwork->MacAddress, WLAN_REASON_DEAUTH_LEAVING, param->deauth_timeout_ms / 100, 100);
 
-	SetHwReg8188EU(padapter, HW_VAR_MLME_DISCONNECT, NULL);
+	mlme_disconnect(padapter);
 	SetHwReg8188EU(padapter, HW_VAR_BSSID, null_addr);
 
 	/* restore to initial setting. */
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 0186f8bf73c7..8e4b84f51a3c 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1024,17 +1024,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 				ResumeTxBeacon(Adapter);
 		}
 		break;
-	case HW_VAR_MLME_DISCONNECT:
-		/* Set RCR to not to receive data frame when NO LINK state */
-		/* reject all data frames */
-		rtw_write16(Adapter, REG_RXFLTMAP2, 0x00);
-
-		/* reset TSF */
-		rtw_write8(Adapter, REG_DUAL_TSF_RST, (BIT(0) | BIT(1)));
-
-		/* disable update TSF */
-		rtw_write8(Adapter, REG_BCN_CTRL, rtw_read8(Adapter, REG_BCN_CTRL) | BIT(4));
-		break;
 	case HW_VAR_MLME_SITESURVEY:
 		if (*((u8 *)val)) { /* under sitesurvey */
 			/* config RCR to receive different BSSID & not to receive data frame */
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 77069cbc1e07..d481cc759e27 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -13,7 +13,6 @@ enum hw_variables {
 	HW_VAR_BSSID,
 	HW_VAR_BASIC_RATE,
 	HW_VAR_CORRECT_TSF,
-	HW_VAR_MLME_DISCONNECT,
 	HW_VAR_MLME_SITESURVEY,
 	HW_VAR_MLME_JOIN,
 	HW_VAR_SLOT_TIME,
-- 
2.35.1

