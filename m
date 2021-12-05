Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77112C9E
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 17:14:40 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id r11so33197016edd.9
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 09:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FRkJ3vqagMiphf+5S4sQxNeN85AmGcBUzfK5lHDgLOE=;
        b=BqBGgDJ2+8QBb0T/X1Zyw5WpvAWQjgw8tNFRzl8ySid6bRJKFzX/cL9b31uhdeknK6
         bfIQc5pAWMeEt9v173xb3go3O7mFXOnDTdk/KSqMhG+fxxlVTB4F1AcyUTKY0UTtZ0bN
         kDa+szOXNKNeIO0bYsVAZsH/xQSqzyvP9swquqVuvrbbE/3+H7/YXhqPLsT8QqzJSYGn
         PJGh8k4V127Ptl6okpLN17Z/HcgYbxrLnR12HabLUrucaqHr39EDvzOU3gTa0imW+c6Q
         AQ5azRa5lewTTTsyDz9HnwE7JBar9YiCHkKw+i7PK8gxHt/Revj3p0QDkG4TqNRpIPxH
         Xw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FRkJ3vqagMiphf+5S4sQxNeN85AmGcBUzfK5lHDgLOE=;
        b=vw9xjxLKY9pqqK4WJh8calT73YW8Ym/lK1ThaTZJ33tQ26912bfC7OaC7m/xZZVdaN
         vBjhFyg5LovdDZplQcSRxFxSh/c0Ej95J6uQhKZYL9kAOf/UuNBEC1BTtyAA228c0ml0
         9QxbCVExgd/DxnkWw0X/rkWqehEIMivSQy6uNH6LK5pGr9Igok3WwpqpEhYp2pzHeHKQ
         bn2DUYTc/klMPd4P66ArGesQpuIzEXM390cpSEFVXhkeejGWB59yXjcp1PcgiMOBDv+9
         Dc/Zj12EiYbyt1ERLH2yQHCK/av5w7HfC1q39i2z1/DVosyvmOB+UZiu1hmgQWKW+2D6
         Fr+g==
X-Gm-Message-State: AOAM531tRuNBlferhierAUXtumABnxZlbfEEDK6Zz/atPflQ8oYSr/qE
	JI/+/0uNvTH0AQIiaFNKLmY=
X-Google-Smtp-Source: ABdhPJwodYyDyOV53o/Rfjf8cAmLez9ZjfmgW4SHZSDDvuLZGdmu/gpfO2hMAWkoRwjZEOFkDkBmow==
X-Received: by 2002:a17:906:cb82:: with SMTP id mf2mr39627694ejb.266.1638724479060;
        Sun, 05 Dec 2021 09:14:39 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::b792])
        by smtp.gmail.com with ESMTPSA id ch28sm6071773edb.72.2021.12.05.09.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 09:14:38 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 08/10] staging: r8188eu: bWIFI_Direct is set but never used
Date: Sun,  5 Dec 2021 18:13:40 +0100
Message-Id: <20211205171342.20551-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211205171342.20551-1-straube.linux@gmail.com>
References: <20211205171342.20551-1-straube.linux@gmail.com>
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

