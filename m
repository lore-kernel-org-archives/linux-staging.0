Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9422F80
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:25:09 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id u19so10543540edb.3
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3tDGXKtpZmrXTW/NI9hHWNVg4jLQ4sKJiRKhYqlYVho=;
        b=FaBxzlIxaSIfrMJfo9diJRL42XzNxUCclJ05q/z7H3ymKYNdrnomHCXDSS9qsEQW3Q
         5Bw1dDmQ9gx3rsTRAxmm/b9JjSyWydmmv2fLn8GdGycN+JDLgSEfIlEz3pfigHqX4hrI
         EgrGzLORDq39jCM5vVbwODL6S5xdaX19nNwdaTLrNix1n4AR6m8W1AlCGWdyiMIJe4mj
         PuQjs+vFVxPpxf1Zw/W92s4Q8deY320F9iENruZcvX9B+40E7ryYpWUp172Dy1B4Ckd8
         XISblNa7IEzjvhbjSz1lU8FOFZOiglJK+tmvU42Wzsm07gqD1d4wBvmeGBIX6dcqu+fI
         zZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3tDGXKtpZmrXTW/NI9hHWNVg4jLQ4sKJiRKhYqlYVho=;
        b=mu5KN9NcFuDIJShB0xpbhKIfGPPQ8uFpf8Sql7t3jqAgDwO0LuUBzVaVQbhIGS2ULy
         kdwgfHyLxXq66x3bmKqWKrK0Ym74IjdHNu/XUFwjWLhjFrN1wVSdI2r8h7MKMurYMHIt
         mgSh7cUjEFmu/uMIUt4YjPJ71JtYQvMmT1aswdsRcegnPwGZ+4IcnoP1qZqbt/4XyTpA
         fBTrKTJWdBCAQuof1J7Om8SyjRka/93VFE5pbb8B+ZMiB/0hLp+Agh5tk6lyxRWyFdvv
         YuVrISDHevPOT3nN7N9TNOe96KKqV7M5kyoAlvkgsVSPttBpB11wmsdk3DnwnAArWLfu
         u9Uw==
X-Gm-Message-State: AOAM532H/J5w2PgFpha3kg6n5tAsNpyZi8gSsv6/KghXz4mP/Rz+aP/f
	2/XHLIPbT0b1IkdNpgvrZE8=
X-Google-Smtp-Source: ABdhPJztXwlCwhj/HQrizTF01WNhCnTa0ALa0EkTC+BUonIxuYs6t2Fy+br8Izjhi036xCQ5DRd/cw==
X-Received: by 2002:a05:6402:b7c:: with SMTP id cb28mr14408933edb.152.1630952708101;
        Mon, 06 Sep 2021 11:25:08 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id s25sm4284492ejq.17.2021.09.06.11.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:25:07 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 09/40] staging: r8188eu: remove hal_dm_watchdog from hal_ops
Date: Mon,  6 Sep 2021 20:24:07 +0200
Message-Id: <20210906182438.5417-10-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906182438.5417-1-straube.linux@gmail.com>
References: <20210906182438.5417-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove hal_dm_watchdog from hal_ops and remove its wrapper
rtw_hal_dm_watchdog(). Call rtl8188e_HalDmWatchDog directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c          | 3 ++-
 drivers/staging/r8188eu/hal/hal_intf.c          | 6 ------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 2 --
 drivers/staging/r8188eu/include/hal_intf.h      | 3 ---
 4 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 738e1ec749be..67b4fe1304a5 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -9,6 +9,7 @@
 #include "../include/mlme_osdep.h"
 #include "../include/rtw_br_ext.h"
 #include "../include/rtw_mlme_ext.h"
+#include "../include/rtl8188e_dm.h"
 
 /*
 Caller and the rtw_cmd_thread can protect cmd_q by spin_lock.
@@ -1496,7 +1497,7 @@ static void dynamic_chk_wk_hdl(struct adapter *padapter, u8 *pbuf, int sz)
 	linked_status_chk(padapter);
 	traffic_status_watchdog(padapter);
 
-	rtw_hal_dm_watchdog(padapter);
+	rtl8188e_HalDmWatchDog(padapter);
 }
 
 static void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 45166f160756..9374e5ecb13b 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -229,12 +229,6 @@ void rtw_hal_set_chan(struct adapter *adapt, u8 channel)
 		adapt->HalFunc.set_channel_handler(adapt, channel);
 }
 
-void rtw_hal_dm_watchdog(struct adapter *adapt)
-{
-	if (adapt->HalFunc.hal_dm_watchdog)
-		adapt->HalFunc.hal_dm_watchdog(adapt);
-}
-
 void rtw_hal_bcn_related_reg_setting(struct adapter *adapt)
 {
 	if (adapt->HalFunc.SetBeaconRelatedRegistersHandler)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index ca020f2ed7a2..844a18117f09 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1787,8 +1787,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->set_bwmode_handler = &PHY_SetBWMode8188E;
 	pHalFunc->set_channel_handler = &PHY_SwChnl8188E;
 
-	pHalFunc->hal_dm_watchdog = &rtl8188e_HalDmWatchDog;
-
 	pHalFunc->Add_RateATid = &rtl8188e_Add_RateATid;
 	pHalFunc->run_thread = &rtl8188e_start_thread;
 	pHalFunc->cancel_thread = &rtl8188e_stop_thread;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 44a8943eadfe..caf759a9eb48 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -148,8 +148,6 @@ struct hal_ops {
 				      u8 Offset);
 	void	(*set_channel_handler)(struct adapter *padapter, u8 channel);
 
-	void	(*hal_dm_watchdog)(struct adapter *padapter);
-
 	void	(*SetHwRegHandler)(struct adapter *padapter, u8	variable,
 				   u8 *val);
 	void	(*GetHwRegHandler)(struct adapter *padapter, u8	variable,
@@ -289,7 +287,6 @@ void	rtw_hal_write_rfreg(struct adapter *padapter,
 void	rtw_hal_set_bwmode(struct adapter *padapter,
 			   enum ht_channel_width Bandwidth, u8 Offset);
 void	rtw_hal_set_chan(struct adapter *padapter, u8 channel);
-void	rtw_hal_dm_watchdog(struct adapter *padapter);
 
 u8	rtw_hal_antdiv_before_linked(struct adapter *padapter);
 void	rtw_hal_antdiv_rssi_compared(struct adapter *padapter,
-- 
2.33.0

