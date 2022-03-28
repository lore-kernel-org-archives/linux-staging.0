Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7844435A
	for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 11:39:53 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id b15so16557652edn.4
        for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 04:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NqlenlfkIdPIxhhz0bGQm5CSsmhIboo593gX7DqUXRY=;
        b=PMQIQIXdb+GvtPrU7PnzM+dUHYQmICOXrBzwZWkBxuMoh1fL4XFlPrz8/hUjKGivt2
         n2BkiNAOr62MIXic0GBIwtYZcs21b2+LlDY1QBRCppAGk7V1W91olErQ9fIszsdub4AK
         Lo7dw/E/EOIcInoPoy3hqMbbroC7a50S8ogOsken2NZab/otLMa6sjnBlLckjoP826Sz
         NEi5iQq00D/XGXPAUbZOEfwx+tf5cEistwisbP8+s1eQpcZU6uwDiQLEgr828XKJR99z
         zvtGIlKS6sPiELWyNtCIug8Pn999EVfRi11Zu81Jlc+fU7CzR/uP5f0YtSrcmn5kAIBe
         cIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NqlenlfkIdPIxhhz0bGQm5CSsmhIboo593gX7DqUXRY=;
        b=HXAc6sYdBagmcGzcesh6VHjuO20x08C4jM3F9jyxdqYXeCfVTWzQ4sAHzRVW6Yr4Px
         /ZbijC5e0bFQ55yOWJfQ5d6yf3JJ7IJRzgpjEYETBakxwE/3jUZo67bdTZFnPbqY1J7D
         f6bRJkT25gUc/fEWNuUOXJbZ/MMQ9PXtyaT5sZvGHk0NXNJh637iunG5518My672gyB2
         URatZRueTi7nsx3t2DVUG/9JStq/b5i+B8qsUqNLIYg3uHajWrFmbArB8YhBbAU2UOPs
         WVSTfY2ptzdh+MEQMpBTso7zRlS83EKqHqsmes4OcJnKYG4mxTkYnnX7g7Ud2MxJNZuL
         bJgg==
X-Gm-Message-State: AOAM5338XF71M1zQbWVn6xhZAsV5ozzQHxnq8pJxTiF/4BF32uB6k6l8
	HUICuz/aUcx0sRS4tDJE4wM=
X-Google-Smtp-Source: ABdhPJw8yVKXQTMacjlW8K6Uz3SAsBFnmLxWnE5oMuo/XynkFTzgggH8ce8YF4HzFZmZZ+0Y3JDQcg==
X-Received: by 2002:aa7:d98f:0:b0:419:1200:91e0 with SMTP id u15-20020aa7d98f000000b00419120091e0mr15730786eds.145.1648467592053;
        Mon, 28 Mar 2022 04:39:52 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id hq39-20020a1709073f2700b006dfc58efab9sm5938556ejc.73.2022.03.28.04.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 04:39:51 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/9] staging: r8188eu: remove HW_VAR_MLME_DISCONNECT from SetHwReg8188EU()
Date: Mon, 28 Mar 2022 13:39:33 +0200
Message-Id: <20220328113940.6396-3-straube.linux@gmail.com>
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

SetHwReg8188EU() is called with HW_VAR_MLME_DISCONNECT only from
functions in rtw_mlme_ext.c. Move the functionality into a static
function in rtw_mlme_ext.c and remove the HW_VAR_MLME_DISCONNECT case
from SetHwReg8188EU(). This is part of the ongoing effort to get rid
of the unwanted hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 19 ++++++++++++++++---
 drivers/staging/r8188eu/hal/usb_halinit.c   | 11 -----------
 drivers/staging/r8188eu/include/hal_intf.h  |  1 -
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 10d5f1222936..b2adb05856a0 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -6800,13 +6800,26 @@ void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *p
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
@@ -7170,7 +7183,7 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 		/* set MSR to nolink -> infra. mode */
 		Set_MSR(padapter, _HW_STATE_STATION_);
 
-		SetHwReg8188EU(padapter, HW_VAR_MLME_DISCONNECT, NULL);
+		mlme_disconnect(padapter);
 	}
 
 	rtw_antenna_select_cmd(padapter, pparm->network.PhyInfo.Optimum_antenna, false);
@@ -7266,7 +7279,7 @@ u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
 	if (is_client_associated_to_ap(padapter))
 		issue_deauth_ex(padapter, pnetwork->MacAddress, WLAN_REASON_DEAUTH_LEAVING, param->deauth_timeout_ms / 100, 100);
 
-	SetHwReg8188EU(padapter, HW_VAR_MLME_DISCONNECT, NULL);
+	mlme_disconnect(padapter);
 	SetHwReg8188EU(padapter, HW_VAR_BSSID, null_addr);
 
 	/* restore to initial setting. */
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 4ee12e260d36..cf1e4bbfd6a9 100644
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
index d49e6e6505ea..a2c5724790f6 100644
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

