Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9394435F
	for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 11:39:52 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id g22so5455804edz.2
        for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 04:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pA2M4InBcSa1/UC/P+oxkaND7wrYasrDOMFK/BPCor0=;
        b=MDF/PWyeCXv4HfFg55AOtsh8gwNWgUkCYefIjBVbFKfg7uefeHhoFh5sTId3RRusqP
         jDJjH64/PpguGDaCwazJ8yMajbYFwRd2r8JibTHOrn6ZHbdx6PXmVeTWIkxhKFVX5W37
         ca9atZpGw84YrN6XWVtkK5F3xyi7muqH/MnosWSCmFHZRt6EHaOiAtXyP7uLxsiLZTpZ
         whd0rOXJftizSWSWqMVyMrjCS/bt61q8H3Q2sEK4L3do4htuvoMvkulCJQXIEPq9Lznv
         Oy2nPPZIMysa1kHfw09xW27SV5zFCPHAcfsES5EXx9hzPgf63ENP1T/+wd1kz2671PWE
         FDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pA2M4InBcSa1/UC/P+oxkaND7wrYasrDOMFK/BPCor0=;
        b=EKvB9qSYGYb/OKAPjMTq0gMyFaYRxJkgzvzCyMRmv0RGc2vQ9RzbrM9Js/x3pEV1BG
         iXunbjY6lj1xZGEgjvcg67sONVJiTZxDpe3MIApKr/vRxKB6kbui7jHWV2nzW+gmboo2
         LVB+15tCLp6ybc+7myxhbZuq7SeUyVfQO7LsN4wgtDHI2TNtgWSPv5F+s76/03cR5L16
         0Bx2Ghjb9tC4YrU/hQEA8zAedKKB2D1IV3aDqATXQ6iQHEJvv+j+kMmLLZnHLG1Tf7C7
         itUL2wvskO/kWwZv12K6/o6mmaUQCn8Y/CouGox9wu+FuNPudtSUfDTQdQttzY+8mNXc
         xReA==
X-Gm-Message-State: AOAM531PLT0ZCpxXR0YxZxfz8e+o48tQi6GIsxS5Ux7qV48dBXT4RB6k
	HrteOasVM8jcxHOwxT9e3mM=
X-Google-Smtp-Source: ABdhPJztCfvXETlz6E0qv5EG04xoV64MmlCLDzXEAnGW24zHt/nEcGXLz55B+63BOshcdC2irVGXOQ==
X-Received: by 2002:a05:6402:1217:b0:419:249:8461 with SMTP id c23-20020a056402121700b0041902498461mr15759207edw.10.1648467591168;
        Mon, 28 Mar 2022 04:39:51 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id hq39-20020a1709073f2700b006dfc58efab9sm5938556ejc.73.2022.03.28.04.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 04:39:50 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/9] staging: r8188eu: remove HW_VAR_RESP_SIFS from SetHwReg8188EU()
Date: Mon, 28 Mar 2022 13:39:32 +0200
Message-Id: <20220328113940.6396-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328113940.6396-1-straube.linux@gmail.com>
References: <20220328113940.6396-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SetHwReg8188EU() is called with HW_VAR_RESP_SIFS only in one place.
Remove the HW_VAR_RESP_SIFS case from SetHwReg8188EU() and call
rtw_write8() directly instead. This is part of the ongoing effort to
get rid of the unwanted hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 11 ++++++-----
 drivers/staging/r8188eu/hal/usb_halinit.c    |  8 --------
 drivers/staging/r8188eu/include/hal_intf.h   |  1 -
 3 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 665b077190bc..eda4e5f9a6af 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -1338,7 +1338,6 @@ void update_capinfo(struct adapter *Adapter, u16 updateCap)
 void update_wireless_mode(struct adapter *padapter)
 {
 	int ratelen, network_type = 0;
-	u32 SIFS_Timer;
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex	*cur_network = &pmlmeinfo->network;
@@ -1365,10 +1364,12 @@ void update_wireless_mode(struct adapter *padapter)
 
 	pmlmeext->cur_wireless_mode = network_type & padapter->registrypriv.wireless_mode;
 
-	SIFS_Timer = 0x0a0a0808;/* 0x0808 -> for CCK, 0x0a0a -> for OFDM */
-				/* change this value if having IOT issues. */
-
-	SetHwReg8188EU(padapter, HW_VAR_RESP_SIFS, (u8 *)&SIFS_Timer);
+	/* RESP_SIFS for CCK */
+	rtw_write8(padapter, REG_R2T_SIFS, 0x08);
+	rtw_write8(padapter, REG_R2T_SIFS + 1, 0x08);
+	/* RESP_SIFS for OFDM */
+	rtw_write8(padapter, REG_T2T_SIFS, 0x0a);
+	rtw_write8(padapter, REG_T2T_SIFS + 1, 0x0a);
 
 	if (pmlmeext->cur_wireless_mode & WIRELESS_11B)
 		update_mgnt_tx_rate(padapter, IEEE80211_CCK_RATE_1MB);
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index a92774352d2d..4ee12e260d36 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1119,14 +1119,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			}
 		}
 		break;
-	case HW_VAR_RESP_SIFS:
-		/* RESP_SIFS for CCK */
-		rtw_write8(Adapter, REG_R2T_SIFS, val[0]); /*  SIFS_T2T_CCK (0x08) */
-		rtw_write8(Adapter, REG_R2T_SIFS + 1, val[1]); /* SIFS_R2T_CCK(0x08) */
-		/* RESP_SIFS for OFDM */
-		rtw_write8(Adapter, REG_T2T_SIFS, val[2]); /* SIFS_T2T_OFDM (0x0a) */
-		rtw_write8(Adapter, REG_T2T_SIFS + 1, val[3]); /* SIFS_R2T_OFDM(0x0a) */
-		break;
 	case HW_VAR_ACK_PREAMBLE:
 		{
 			u8 regTmp;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 3cededa4dcfc..d49e6e6505ea 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -17,7 +17,6 @@ enum hw_variables {
 	HW_VAR_MLME_SITESURVEY,
 	HW_VAR_MLME_JOIN,
 	HW_VAR_SLOT_TIME,
-	HW_VAR_RESP_SIFS,
 	HW_VAR_ACK_PREAMBLE,
 	HW_VAR_BCN_VALID,
 	HW_VAR_DM_FLAG,
-- 
2.35.1

