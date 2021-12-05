Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE9E2CAC
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 17:14:41 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id r25so33220545edq.7
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 09:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gAS0cKvETcknOrMPrbKidw5V5Godx+Ja70TOG5Jm99M=;
        b=fxCle58pxpV2zm/+RE28LYJnZCZ5yC6PHbV+CzS9CsQPaDDC4Pwsfb12ENDRquN4y/
         vYzTHtHREonL/Bzkm4ze7Z1dOhEnpAA7TljKoWF9oRbgpWIsQVt9kGT1xfO+fytOntHb
         fk5/ix3f4I/1n5RWcahiqmCATDDTie3uDi37MGvUPIBSoq7qpN3iMdm6cPWivxRnzxFa
         oZuRsP9el/KGf6k75ccDBDA8WlbhYcYuVsYaTl3IXRbbWCDG89HnycONIvrtmUvYDk90
         ajd/G//Q01unrXAnR45lcW6ruqUnYvqmj4kWzPXiEEq1pfab6+544jyqdjETnQi8FESG
         zWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gAS0cKvETcknOrMPrbKidw5V5Godx+Ja70TOG5Jm99M=;
        b=ymJSQwOGBQSu0MI42TPxNBEWd0lydsrf+Y7b8ihW/MjvPv7mXfffceG1jDvXA7/khB
         LaoN7HUEfdQAZ21WI0FgIzTAp5Cx/VmXpECAU21KCfh486qeyLIxctwmh4p9nLDHhNVD
         y13WBPHhxRNbbC2yA3qpSaocJIEyqs7DoEr3OkPezKIdMR8I/Xb7dR103LVUpzOeWB4H
         iVySPwT67nGJ9v7coIjyNRssjhpV26hvoFmWUSByP83+FgNyLF1FfAnPYVKW0OucqlH5
         FyOBoIacliwmraBZmAOeimnBW0zSfqcbdVDPaiczLS/EL2ksO5TG8IOKbs0h9C5hRUXy
         sicQ==
X-Gm-Message-State: AOAM531X43ij6VfMO91Ij5RqUxHnxCXFeY1cxxFQZ1Nb9wHXXqQmlhK4
	yQ9KtlFae0RexNigPKpkNgM=
X-Google-Smtp-Source: ABdhPJymbhdBxLudvXRx7IH7AxhbaCXN5L8R76uEvozYMXtDDh5gX9zO2Gxc5nuPHQzf2hiG6uEesw==
X-Received: by 2002:a05:6402:3512:: with SMTP id b18mr46837090edd.347.1638724479726;
        Sun, 05 Dec 2021 09:14:39 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::b792])
        by smtp.gmail.com with ESMTPSA id ch28sm6071773edb.72.2021.12.05.09.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 09:14:39 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 09/10] staging: r8188eu: bWIFI_Display is set but never used
Date: Sun,  5 Dec 2021 18:13:41 +0100
Message-Id: <20211205171342.20551-10-straube.linux@gmail.com>
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

