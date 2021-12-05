Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B292CAB
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 13:59:34 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id l25so31980603eda.11
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 05:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FRkJ3vqagMiphf+5S4sQxNeN85AmGcBUzfK5lHDgLOE=;
        b=LNsgQKdgplikNjQMv8qVNqmdsgEtADlv1oWuvUGoKprfu7zLqyXJCuyQrUItcH9Xeb
         z1dZa7YQs65Ub1GlF88xl9McNazyHEoi1NI8WlUDzr3mxVsVyc55BXPvJvKXuGqwluGS
         tLg/S6uQPhZbIs577XfYpXyqZWSjk6O5uhyyDoHcQkqgU6roOG3t6zBEHYztnu2pMGHd
         LRyvLXni0xnZAomxipG0N7a5fhnI3QQY5t8oZom8Kj4okk6kUO4fj878o3LVtzvYozcS
         JKslh6Y1+jjzcN5qAiT6Cm6OXwhQaKWw7O0KmEXHJeYzaHVIImGCCFeo2YpzeqWf4A/K
         Ag0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FRkJ3vqagMiphf+5S4sQxNeN85AmGcBUzfK5lHDgLOE=;
        b=4vsBRG8aEjHhCx6MLchQERElkARnh+xSuyIFEjD7CG9eeBc67DttJmU3DW9Bq4DED/
         2PI+EXi+H57KuaxRW1mg8e9zQKIq8Ok/xgoXsFBvEFHz1RABuji/SLn3oL/PRsWO4jYQ
         a3qZyDCYOrENkIHVrVXYqZJ301Vr1C9VyzIqRrJjVh+Le6qokUSK4VKCyC8O8aSvqQi8
         aNQEiBXWZT6g5O5DHb3Z8JthKWDjqD2/Vg03T7R5/X8kOILAzJ2SQtFbZb5ZeO/jRAXx
         dA7sreWTkJ6hIR4lxTP8NJIxRfDlLbRK0HYJKtpm+WvzzzcD8M7TSNBPiy7QsHzDArIL
         Lj4w==
X-Gm-Message-State: AOAM532IZYqOOVpUb4aMSbgnv7HgmIFK0imMqBFibW6As7pJtXBcQIpW
	tnpkUXXyIQEo5e42hIvav01jYIarpzE=
X-Google-Smtp-Source: ABdhPJwIyAXt3zs+68XOj80CAvRF1x3vsdQRUfNdeussv8ZjlXX3tGZLPFK3DFy5BkV+lN3QphoUyg==
X-Received: by 2002:a17:906:640d:: with SMTP id d13mr38460797ejm.444.1638712773243;
        Sun, 05 Dec 2021 05:59:33 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::5a05])
        by smtp.gmail.com with ESMTPSA id yd20sm5146451ejb.47.2021.12.05.05.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:59:32 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 08/12] staging: r8188eu: bWIFI_Direct is set but never used
Date: Sun,  5 Dec 2021 14:59:15 +0100
Message-Id: <20211205135919.30460-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211205135919.30460-1-straube.linux@gmail.com>
References: <20211205135919.30460-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bWIFI_Direct in odm_dm_struct is set but never used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_p2p.c          | 3 ---
 drivers/staging/r8188eu/hal/odm.c               | 3 ---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 3 ---
 drivers/staging/r8188eu/include/hal_intf.h      | 1 -
 drivers/staging/r8188eu/include/odm.h           | 2 --
 5 files changed, 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_p2p.c b/drivers/staging/r8188eu/core/rtw_p2p.c
index b265b5e46851..9ea1d935724a 100644
--- a/drivers/staging/r8188eu/core/rtw_p2p.c
+++ b/drivers/staging/r8188eu/core/rtw_p2p.c
@@ -1944,7 +1944,6 @@ int rtw_p2p_enable(struct adapter *padapter, enum P2P_ROLE role)
 		/* Enable P2P function */
 		init_wifidirect_info(padapter, role);
 
-		rtl8188e_SetHalODMVar(padapter, HAL_ODM_P2P_STATE, NULL, true);
 	} else if (role == P2P_ROLE_DISABLE) {
 		if (_FAIL == rtw_pwr_wakeup(padapter)) {
 			ret = _FAIL;
@@ -1963,8 +1962,6 @@ int rtw_p2p_enable(struct adapter *padapter, enum P2P_ROLE role)
 			memset(&pwdinfo->rx_prov_disc_info, 0x00, sizeof(struct rx_provdisc_req_info));
 		}
 
-		rtl8188e_SetHalODMVar(padapter, HAL_ODM_P2P_STATE, NULL, false);
-
 		/* Restore to initial setting. */
 		update_tx_basic_rate(padapter, padapter->registrypriv.wireless_mode);
 	}
diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index 8779d5accf52..b1cebdfb7d88 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -260,9 +260,6 @@ void ODM_CmnInfoUpdate(struct odm_dm_struct *pDM_Odm, u32 CmnInfo, u64 Value)
 	case	ODM_CMNINFO_ABILITY:
 		pDM_Odm->SupportAbility = (u32)Value;
 		break;
-	case	ODM_CMNINFO_WIFI_DIRECT:
-		pDM_Odm->bWIFI_Direct = (bool)Value;
-		break;
 	case	ODM_CMNINFO_WIFI_DISPLAY:
 		pDM_Odm->bWIFI_Display = (bool)Value;
 		break;
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index acd343eec280..ed54da84e40b 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -874,9 +874,6 @@ void rtl8188e_SetHalODMVar(struct adapter *Adapter, enum hal_odm_variable eVaria
 		       }
 		}
 		break;
-	case HAL_ODM_P2P_STATE:
-			ODM_CmnInfoUpdate(podmpriv, ODM_CMNINFO_WIFI_DIRECT, bSet);
-		break;
 	case HAL_ODM_WIFI_DISPLAY_STATE:
 			ODM_CmnInfoUpdate(podmpriv, ODM_CMNINFO_WIFI_DISPLAY, bSet);
 		break;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 7385ebaaba5c..3383570c2bf3 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -96,7 +96,6 @@ enum hal_def_variable {
 
 enum hal_odm_variable {
 	HAL_ODM_STA_INFO,
-	HAL_ODM_P2P_STATE,
 	HAL_ODM_WIFI_DISPLAY_STATE,
 };
 
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index f83b94a74b70..d6c10ac2b8a8 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -230,7 +230,6 @@ enum odm_common_info_def {
 /*  POINTER REFERENCE----------- */
 
 /* CALL BY VALUE------------- */
-	ODM_CMNINFO_WIFI_DIRECT,
 	ODM_CMNINFO_WIFI_DISPLAY,
 	ODM_CMNINFO_LINK,
 	ODM_CMNINFO_RSSI_MIN,
@@ -480,7 +479,6 @@ struct odm_dm_struct {
 /*  POINTER REFERENCE----------- */
 	/*  */
 /* CALL BY VALUE------------- */
-	bool	bWIFI_Direct;
 	bool	bWIFI_Display;
 	bool	bLinked;
 	u8	RSSI_Min;
-- 
2.34.1

