Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EE33FC7
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 19:03:01 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id h9so15146570ejs.4
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 12:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I71lkep6zOcslL4BykWHkhODqaJTjlyYljZt7QjV/g0=;
        b=N94F0YREbGRcpMj2XFkMp8wetZYYmLkfLk3WNG6u2eKeKZ73yVGuWqHbGlLu+EuFus
         uc0QAjAqBOFeOhJIyfPUuIrzmoyyxw5eAS0odzUaVsRmAk01BMdY92jH7btSvlyOYlku
         1RQ0HX+Ny4D2I6XfC2+3ndbLHlNNKj7UgHnKg+6sgrb2FzzNjtN/sFxIeGomy4bDCE80
         nFDSJLmKDduIeLjm9t48ZJMKqA/QjlOmAaQQSmweAxhVJISVOaw1nKwjXOei4ka4VZTs
         l3si4C3JQJ3wIQdWAv5bNYZh2S/5v5fdyIxLlXR9e549F0r/dmDy0PKx8uyJQgAXSiwv
         xehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I71lkep6zOcslL4BykWHkhODqaJTjlyYljZt7QjV/g0=;
        b=ThkK5e9JsOQmXmxF0WPW9tPcBRVcy9sLiSG5FP1Zre/AkI8FKO7GDSttVeAH6t3Lw4
         4ynwBws0RTPFyyBGkOtZiU55VkawjTqRC/8yXOIdM9rRUAN2feEQwhaOn/HjiI+nsawK
         Wq1S4dMe6coavGgT5V7uDHqV0H6//qf46nsXY8KC+TW8oB6FJs8TaPOfR6xLJN/rY9Wt
         ranvOOLMJ5hHnQZqWG5cL0Rl4/f3gXsgFjSGLD5bDf5ggzO17p30OlYbAJ8bAPAKGUZd
         56ApEMzOThgahKSE0qVjEPW5KBubpwRBTLCCDTjJFoJ+yURUeAfMuzbwtK1SmLYiJkai
         ejLQ==
X-Gm-Message-State: AOAM533f2imTajZ8HJYJ06SQUz8LV79OD37zr4+CfXEDmfh9g9lhgAV6
	kqtZDmGk60MBFaB4GYnthH4=
X-Google-Smtp-Source: ABdhPJzHfs9487pxNA/LtWUGTju6F5PUluAQUKeyJ8juibCqYZFFXWvyTf29eieMouaW2aR4rNUTEA==
X-Received: by 2002:a17:907:7f93:: with SMTP id qk19mr14371694ejc.433.1630954980057;
        Mon, 06 Sep 2021 12:03:00 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id k15sm4372018ejb.92.2021.09.06.12.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 12:02:59 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 20/40] staging: r8188eu: remove sreset_get_wifi_status from hal_ops
Date: Mon,  6 Sep 2021 21:02:03 +0200
Message-Id: <20210906190223.11396-21-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906190223.11396-1-straube.linux@gmail.com>
References: <20210906190223.11396-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove sreset_get_wifi_status from hal_ops and remove its wrapper
rtw_hal_sreset_get_wifi_status(). Call sreset_get_wifi_status()
directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c          | 9 ---------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 2 --
 drivers/staging/r8188eu/include/hal_intf.h      | 4 ----
 drivers/staging/r8188eu/os_dep/ioctl_linux.c    | 2 +-
 4 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 1840c4046859..27adaea61f84 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -221,15 +221,6 @@ void rtw_hal_antdiv_rssi_compared(struct adapter *adapt,
 		adapt->HalFunc.AntDivCompareHandler(adapt, dst, src);
 }
 
-u8   rtw_hal_sreset_get_wifi_status(struct adapter *adapt)
-{
-	u8 status = 0;
-
-	if (adapt->HalFunc.sreset_get_wifi_status)
-		status = adapt->HalFunc.sreset_get_wifi_status(adapt);
-	return status;
-}
-
 int rtw_hal_iol_cmd(struct adapter  *adapter, struct xmit_frame *xmit_frame,
 		    u32 max_wating_ms, u32 bndy_cnt)
 {
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 0ee7da10633a..04c382e698f9 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1803,8 +1803,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->Efuse_PgPacketWrite = &rtl8188e_Efuse_PgPacketWrite;
 	pHalFunc->Efuse_WordEnableDataWrite = &rtl8188e_Efuse_WordEnableDataWrite;
 
-	pHalFunc->sreset_get_wifi_status  = &sreset_get_wifi_status;
-
 	pHalFunc->IOL_exec_cmds_sync = &rtl8188e_IOL_exec_cmds_sync;
 
 	pHalFunc->hal_notch_filter = &hal_notch_filter_8188e;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index baa08d9346f9..f85385cc9288 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -193,8 +193,6 @@ struct hal_ops {
 					     u16 efuse_addr, u8 word_en,
 					     u8 *data, bool bPseudoTest);
 
-	u8 (*sreset_get_wifi_status)(struct adapter *padapter);
-
 	int (*IOL_exec_cmds_sync)(struct adapter *padapter,
 				  struct xmit_frame *frame, u32 max_wait,
 				  u32 bndy_cnt);
@@ -269,8 +267,6 @@ void	rtw_hal_antdiv_rssi_compared(struct adapter *padapter,
 				     struct wlan_bssid_ex *dst,
 				     struct wlan_bssid_ex *src);
 
-u8   rtw_hal_sreset_get_wifi_status(struct adapter *padapter);
-
 int rtw_hal_iol_cmd(struct adapter  *adapter, struct xmit_frame *xmit_frame,
 		    u32 max_wating_ms, u32 bndy_cnt);
 
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 803caf94da4c..19354eb41031 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2305,7 +2305,7 @@ static void rtw_dbg_mode_hdl(struct adapter *padapter, u32 id, u8 *pdata, u32 le
 		rtw_hal_set_hwreg(padapter, HW_VAR_TRIGGER_GPIO_0, NULL);
 		break;
 	case GEN_MP_IOCTL_SUBCODE(GET_WIFI_STATUS):
-		*pdata = rtw_hal_sreset_get_wifi_status(padapter);
+		*pdata = sreset_get_wifi_status(padapter);
 		break;
 	default:
 		break;
-- 
2.33.0

