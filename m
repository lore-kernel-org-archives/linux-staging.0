Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0ED2CA8
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 13:59:35 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id x15so32286169edv.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 05:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gAS0cKvETcknOrMPrbKidw5V5Godx+Ja70TOG5Jm99M=;
        b=IOU2GQxttc8BZEb2fFAMSpC0UfeXbd3yLehHOu2YAeF3tZOWnJWZeD2GAS6K/Bg+u0
         zkjjGBaVy4xcQwG5kvxjAmbd2AVNSMTtIVQqH1afT+rF11bveOTe04MNAoFZLdcIxsW0
         5qGemqMFK2pLjjlO7vSgBxdQXjpnWxHS1K5yBYfdfDW1cH0PjbrYj22M9BAfHRAKl+Nt
         Ti5Mf0tQPDiY8qwmsTcbcKHZqIrQHhlGGTqydnz6ETJmooRcTvFChFww1RlKJP+WdTZq
         deOko0Mzb6+N6ioQljtvcs20msCitBNjWZ+SjImwJxqZypbWltW+mYFivJVaQKtnFNzB
         bGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gAS0cKvETcknOrMPrbKidw5V5Godx+Ja70TOG5Jm99M=;
        b=XIoeKbyAAXYGd2vVE1IbIALdtYoIwMOfSxFAwWHXLCwWDbHqMY0fkwmN6upXdOPQr6
         2wcmQ3/fpGr73qGKJPPyrEHlmLa/u6BzMM+b0m2h3F1CCjBOeiOfRCehRK6j/Ipl2jC7
         TPq62Fqji4Rhbuy0BymjNJLuicK4s5ELFiqbbIZF64pQZgw0t7AbInyVPn3NVP6DbfzS
         kuX019pWA7nQEG68MgOzTwekpwsXOKOpaU7fJjdTFAmKW/FjZSaoBnZ72x4q5zB2ZEQR
         lYeJshr4VQU60qK8Y5RhC41c4yE6/VkTdaDzADhsfx9nq234d4MYflE84Dv0VHAWrhvZ
         9ARQ==
X-Gm-Message-State: AOAM530mvKI5t/R5akHcFC1b/Udd88CVAxTBRFpyjfbE/RpLpT9Bsq/g
	mBHokVzUcdReu7+ujFKc9vg=
X-Google-Smtp-Source: ABdhPJxXWZADQzMH825f7+NuESbynuVU6C435b/5sjX+Qs/IKDK92PoxeRMNs1xsGuMl9b7DNtSaTw==
X-Received: by 2002:a17:906:3647:: with SMTP id r7mr39098147ejb.124.1638712773959;
        Sun, 05 Dec 2021 05:59:33 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::5a05])
        by smtp.gmail.com with ESMTPSA id yd20sm5146451ejb.47.2021.12.05.05.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:59:33 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 09/12] staging: r8188eu: bWIFI_Display is set but never used
Date: Sun,  5 Dec 2021 14:59:16 +0100
Message-Id: <20211205135919.30460-10-straube.linux@gmail.com>
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

bWIFI_Display in odm_dm_struct is set but never used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c               | 3 ---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 3 ---
 drivers/staging/r8188eu/include/hal_intf.h      | 1 -
 drivers/staging/r8188eu/include/odm.h           | 2 --
 4 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index b1cebdfb7d88..5629556cca8a 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -260,9 +260,6 @@ void ODM_CmnInfoUpdate(struct odm_dm_struct *pDM_Odm, u32 CmnInfo, u64 Value)
 	case	ODM_CMNINFO_ABILITY:
 		pDM_Odm->SupportAbility = (u32)Value;
 		break;
-	case	ODM_CMNINFO_WIFI_DISPLAY:
-		pDM_Odm->bWIFI_Display = (bool)Value;
-		break;
 	case	ODM_CMNINFO_LINK:
 		pDM_Odm->bLinked = (bool)Value;
 		break;
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index ed54da84e40b..5791172fa5c4 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -874,9 +874,6 @@ void rtl8188e_SetHalODMVar(struct adapter *Adapter, enum hal_odm_variable eVaria
 		       }
 		}
 		break;
-	case HAL_ODM_WIFI_DISPLAY_STATE:
-			ODM_CmnInfoUpdate(podmpriv, ODM_CMNINFO_WIFI_DISPLAY, bSet);
-		break;
 	default:
 		break;
 	}
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 3383570c2bf3..7de35fde15a9 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -96,7 +96,6 @@ enum hal_def_variable {
 
 enum hal_odm_variable {
 	HAL_ODM_STA_INFO,
-	HAL_ODM_WIFI_DISPLAY_STATE,
 };
 
 typedef s32 (*c2h_id_filter)(u8 id);
diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index d6c10ac2b8a8..69faf8b50996 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -230,7 +230,6 @@ enum odm_common_info_def {
 /*  POINTER REFERENCE----------- */
 
 /* CALL BY VALUE------------- */
-	ODM_CMNINFO_WIFI_DISPLAY,
 	ODM_CMNINFO_LINK,
 	ODM_CMNINFO_RSSI_MIN,
 	ODM_CMNINFO_RF_ANTENNA_TYPE,		/*  u8 */
@@ -479,7 +478,6 @@ struct odm_dm_struct {
 /*  POINTER REFERENCE----------- */
 	/*  */
 /* CALL BY VALUE------------- */
-	bool	bWIFI_Display;
 	bool	bLinked;
 	u8	RSSI_Min;
 	bool	bIsMPChip;
-- 
2.34.1

