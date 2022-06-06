Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B35E7E
	for <linux-staging@lists.linux.dev>; Mon,  6 Jun 2022 06:41:04 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id v1so16321272ejg.13
        for <linux-staging@lists.linux.dev>; Sun, 05 Jun 2022 23:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=weCjhvxDXvUAz2aIdH1y4c6h+2MqQ+dMhhGf8P/t7Pw=;
        b=Mukqk75gZ6o4PfDaUwDrUwLXy3EWq6WKFDbRY6MQc+x7m6Dbbf6v2J+I4EE7Qj5P72
         JGSCOlBZ4WKMXvQ84VWbBemYtqzEabpIjy1/C3oC9RtFuc7W3Zys6dBUUXwM13OnJmnF
         QsOaxdWDvqpmGJT5JQBeZB1ZXHPhzuEgZRToS62eykf80QaREPNFxopads0eLkqIOWP2
         SHlrrYxyh150aI+ZrXXeIkW/Fupd6NJmzCmdWYPHEdqcerTNsl0OfbQ8LltUxoXQwK7J
         zPTarw1zsNl22HtIU3uvMgqUI/VL9c2jkN5QGSZUSJK5rFSQ+ls0zVz8Vtl4fUNayTmo
         tbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=weCjhvxDXvUAz2aIdH1y4c6h+2MqQ+dMhhGf8P/t7Pw=;
        b=gWB9dFPuL1s7hOObURBIt6Z3mSu4rKpJ3WKczb3HwnSW0dcZExFFWZFQpDFYKsQE9L
         q2ODtRR3y/ISj+aVadzhEdCcws2aYJ+VBVcrYCFhMrvaCzRlZTfAoryjJ29cTtT/P5Rs
         78A/m7GWRJlfG1D7HuR8bWYBRnBlEqUvet2ZJhcOvjr6yDpAhXdEvPG0HkWiUMwHoNk7
         PyzHIO72Skex3a8BWMAxojJ0aPM2KKa5h93ZIgXU0wYb8qM/DyJClFAylwD/pczsubrl
         nIL/oXt5kMPrTzjp3E45s5zn+K03AJN0tpcRUhilQknB5tZD/L+KRHw05P7jiWFcCdrU
         aCPQ==
X-Gm-Message-State: AOAM530fXrmd/pJkvyoj9hVG3Z91kIH1rVMcxfN3tEUg+9QuYak2ujKP
	/Gi3iwqXiyWxbsswCk1NOEQ=
X-Google-Smtp-Source: ABdhPJzWS0y2iPGO3+TmD0V+7BhOAZDnxyWe99KsVtI529ChPEZju5kDEnfeGJdw2lhKWJWDJSxvdA==
X-Received: by 2002:a17:907:d8d:b0:711:d82f:5d33 with SMTP id go13-20020a1709070d8d00b00711d82f5d33mr681891ejc.595.1654497662731;
        Sun, 05 Jun 2022 23:41:02 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb61.dynamic.kabel-deutschland.de. [95.90.187.97])
        by smtp.gmail.com with ESMTPSA id ee36-20020a056402292400b0042bca34bd15sm7912578edb.95.2022.06.05.23.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 23:41:01 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove HW_VAR_SLOT_TIME from SetHwReg8188EU()
Date: Mon,  6 Jun 2022 08:40:55 +0200
Message-Id: <20220606064055.12565-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to get rid of the function SetHwReg8188EU() remove the
HW_VAR_SLOT_TIME case from that function and move the functionality
into a static function in rtw_wlan_util.c.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 26 +++++++++++++++++++-
 drivers/staging/r8188eu/hal/usb_halinit.c    | 24 ------------------
 drivers/staging/r8188eu/include/hal_intf.h   |  1 -
 3 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 392a65783f32..9f0a823b6e52 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -1348,6 +1348,30 @@ static void set_ack_preamble(struct adapter *adapter, bool short_preamble)
 	rtw_write8(adapter, REG_RRSR + 2, val8);
 };
 
+static void set_slot_time(struct adapter *adapter, u8 slot_time)
+{
+	u8 u1bAIFS, aSifsTime;
+	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
+
+	rtw_write8(adapter, REG_SLOT, slot_time);
+
+	if (pmlmeinfo->WMM_enable == 0) {
+		if (pmlmeext->cur_wireless_mode == WIRELESS_11B)
+			aSifsTime = 10;
+		else
+			aSifsTime = 16;
+
+		u1bAIFS = aSifsTime + (2 * pmlmeinfo->slotTime);
+
+		/*  <Roger_EXP> Temporary removed, 2008.06.20. */
+		rtw_write8(adapter, REG_EDCA_VO_PARAM, u1bAIFS);
+		rtw_write8(adapter, REG_EDCA_VI_PARAM, u1bAIFS);
+		rtw_write8(adapter, REG_EDCA_BE_PARAM, u1bAIFS);
+		rtw_write8(adapter, REG_EDCA_BK_PARAM, u1bAIFS);
+	}
+}
+
 void update_capinfo(struct adapter *Adapter, u16 updateCap)
 {
 	struct mlme_ext_priv	*pmlmeext = &Adapter->mlmeextpriv;
@@ -1386,7 +1410,7 @@ void update_capinfo(struct adapter *Adapter, u16 updateCap)
 		}
 	}
 
-	SetHwReg8188EU(Adapter, HW_VAR_SLOT_TIME, &pmlmeinfo->slotTime);
+	set_slot_time(Adapter, pmlmeinfo->slotTime);
 }
 
 void update_wireless_mode(struct adapter *padapter)
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index a217272a07f8..895619fea501 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1036,30 +1036,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			rtw_write32(Adapter, REG_RCR, rtw_read32(Adapter, REG_RCR) | RCR_CBSSID_BCN);
 		}
 		break;
-	case HW_VAR_SLOT_TIME:
-		{
-			u8 u1bAIFS, aSifsTime;
-			struct mlme_ext_priv	*pmlmeext = &Adapter->mlmeextpriv;
-			struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
-
-			rtw_write8(Adapter, REG_SLOT, val[0]);
-
-			if (pmlmeinfo->WMM_enable == 0) {
-				if (pmlmeext->cur_wireless_mode == WIRELESS_11B)
-					aSifsTime = 10;
-				else
-					aSifsTime = 16;
-
-				u1bAIFS = aSifsTime + (2 * pmlmeinfo->slotTime);
-
-				/*  <Roger_EXP> Temporary removed, 2008.06.20. */
-				rtw_write8(Adapter, REG_EDCA_VO_PARAM, u1bAIFS);
-				rtw_write8(Adapter, REG_EDCA_VI_PARAM, u1bAIFS);
-				rtw_write8(Adapter, REG_EDCA_BE_PARAM, u1bAIFS);
-				rtw_write8(Adapter, REG_EDCA_BK_PARAM, u1bAIFS);
-			}
-		}
-		break;
 	case HW_VAR_DM_FLAG:
 		podmpriv->SupportAbility = *((u8 *)val);
 		break;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index a56f3d6ca399..0104ee463a10 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -13,7 +13,6 @@ enum hw_variables {
 	HW_VAR_BASIC_RATE,
 	HW_VAR_CORRECT_TSF,
 	HW_VAR_MLME_SITESURVEY,
-	HW_VAR_SLOT_TIME,
 	HW_VAR_DM_FLAG,
 	HW_VAR_DM_FUNC_OP,
 	HW_VAR_DM_FUNC_RESET,
-- 
2.36.1

