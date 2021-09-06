Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80F072
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 19:03:00 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id lc21so15112321ejc.7
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 12:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K8j2ZRB4ao6UP+171+LDKHORW3G/O4Ani+xbmAGpa/c=;
        b=BrC5fqyDl0qqJsfb18clx3IgHFTzjWpJFUvb6jxrnbYUmqiSRf4XULAG7TYIlSOoYm
         XnfnM9BYG6Tp0UGwxl4+ElDTmHA65zQU5LfJ2NM7Msboqwvop2Tb4Ht18GuX/SFiPWb2
         8qkP6Ch5HRZrDeaVtXKPjQKY0x+dwmVUxvm/maeYbmBCDCAdDu2ee3d7pe6Ax6B8VUHJ
         /UCYIaUCZymiRl5qwxFn7Ua7kS5seGCzmc0T9g9cx9dqnyTt3NzQ+vfJzUL5CJaXLX4E
         FQnrmkJA0suTlF9r2/IcyQCMkAHTZ3ptKtCVKu0CzQlMCp/rF0ep7/FlvK/5ictq9Zkw
         +7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K8j2ZRB4ao6UP+171+LDKHORW3G/O4Ani+xbmAGpa/c=;
        b=ReBGGgn4Bjp4dHHMRrBIfnM5WZtHi1hMLg1z3kEDz6qs2k2ekzP4BYrDhWEcauuWnR
         DIGCxRhaTD+Vf7JBXT6jvMEM342lgVDoBDJmbWnktwaeXtoz5LVrPrjEPfDzKwHA/v7X
         LrHRT2krYcMx7RPuAc2SgHDPGH/35Gy8QBNYiCC792VDBJbBKqYegsF7z5CdKLERy8nv
         qxZHj9nLBnQwFYFGe8aMbTW7YeqcCai3XTyIkBXiVsha8e/x+ivP8mUORvsSFQ1aMnBg
         pkt1MyXV34X1I1xx27CT3LIpcfaVyfHIkNMmu9MK52cXgex0oM3IO7ecJNYUeWM7sCWj
         InyA==
X-Gm-Message-State: AOAM531Y8nVOKYGr/qWU4CANwCM1oy+gCqMZVbmN2viu3gGFzDegO03t
	B9ym24p8uw+KZRiB8W7kyYM=
X-Google-Smtp-Source: ABdhPJylrk56e364J0sFnShqqStPldRZytV54foJytFn9Rz8p7+6ofbQz7ydXVYb8kRLKIlvvHEMAg==
X-Received: by 2002:a17:906:130a:: with SMTP id w10mr14762951ejb.89.1630954979346;
        Mon, 06 Sep 2021 12:02:59 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id k15sm4372018ejb.92.2021.09.06.12.02.58
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
Subject: [PATCH v3 19/40] staging: r8188eu: remove sreset_linked_status_check from hal_ops
Date: Mon,  6 Sep 2021 21:02:02 +0200
Message-Id: <20210906190223.11396-20-straube.linux@gmail.com>
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

Remove sreset_linked_status_check from hal_ops and remove its wrapper
rtw_hal_sreset_linked_status_check().
Call rtl8188e_sreset_linked_status_check() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c     | 3 ++-
 drivers/staging/r8188eu/hal/hal_intf.c          | 6 ------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 1 -
 drivers/staging/r8188eu/include/hal_intf.h      | 2 --
 4 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 57cf74d30984..2bdc1ed18149 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -10,6 +10,7 @@
 #include "../include/wlan_bssdef.h"
 #include "../include/mlme_osdep.h"
 #include "../include/recv_osdep.h"
+#include "../include/rtl8188e_sreset.h"
 
 static struct mlme_handler mlme_sta_tbl[] = {
 	{WIFI_ASSOCREQ,		"OnAssocReq",	&OnAssocReq},
@@ -7400,7 +7401,7 @@ void linked_status_chk(struct adapter *padapter)
 	if (padapter->bRxRSSIDisplay)
 		_linked_rx_signal_strehgth_display(padapter);
 
-	rtw_hal_sreset_linked_status_check(padapter);
+	rtl8188e_sreset_linked_status_check(padapter);
 
 	if (is_client_associated_to_ap(padapter)) {
 		/* linked infrastructure client mode */
diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index b1a71a8fdf38..1840c4046859 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -221,12 +221,6 @@ void rtw_hal_antdiv_rssi_compared(struct adapter *adapt,
 		adapt->HalFunc.AntDivCompareHandler(adapt, dst, src);
 }
 
-void rtw_hal_sreset_linked_status_check(struct adapter *adapt)
-{
-	if (adapt->HalFunc.sreset_linked_status_check)
-		adapt->HalFunc.sreset_linked_status_check(adapt);
-}
-
 u8   rtw_hal_sreset_get_wifi_status(struct adapter *adapt)
 {
 	u8 status = 0;
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 9b44fd2d93d7..0ee7da10633a 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1803,7 +1803,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->Efuse_PgPacketWrite = &rtl8188e_Efuse_PgPacketWrite;
 	pHalFunc->Efuse_WordEnableDataWrite = &rtl8188e_Efuse_WordEnableDataWrite;
 
-	pHalFunc->sreset_linked_status_check  = &rtl8188e_sreset_linked_status_check;
 	pHalFunc->sreset_get_wifi_status  = &sreset_get_wifi_status;
 
 	pHalFunc->IOL_exec_cmds_sync = &rtl8188e_IOL_exec_cmds_sync;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 2f4bc16aeabd..baa08d9346f9 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -193,7 +193,6 @@ struct hal_ops {
 					     u16 efuse_addr, u8 word_en,
 					     u8 *data, bool bPseudoTest);
 
-	void (*sreset_linked_status_check) (struct adapter *padapter);
 	u8 (*sreset_get_wifi_status)(struct adapter *padapter);
 
 	int (*IOL_exec_cmds_sync)(struct adapter *padapter,
@@ -270,7 +269,6 @@ void	rtw_hal_antdiv_rssi_compared(struct adapter *padapter,
 				     struct wlan_bssid_ex *dst,
 				     struct wlan_bssid_ex *src);
 
-void rtw_hal_sreset_linked_status_check(struct adapter *padapter);
 u8   rtw_hal_sreset_get_wifi_status(struct adapter *padapter);
 
 int rtw_hal_iol_cmd(struct adapter  *adapter, struct xmit_frame *xmit_frame,
-- 
2.33.0

