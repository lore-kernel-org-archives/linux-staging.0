Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8963FCD
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:54:17 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id mf2so15049251ejb.9
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kWKIkb6qgsNd1sghd+Gu94KZJMj3gN+DQLl2UZMTmdk=;
        b=fX/9rV0qjOVmK2NDhowM4YFQ8527hkq8+4Eu8b1X47eXJrtS7Vo5TuO9cilD90nCJS
         DFFB0S60OlAxFKVUuF9UPa3I7CWhwLBTHTRqoIf7ZiDXDBxirglVyU+lm/obEB7uWQWn
         eaA4nolw6DAPe9sjteJS5ZIopN7V/8lgK5wxSWg+jEj0dmxfP7lSjuDFD2eRnHD23mVV
         YKJ7zNte180T+8o9kH3N8hG08e/ILTrTbI2ERbNG8L7RgWEMP+Wj+KEs5eavLMXxLL9T
         n8hsSUBLnIjyyG8o9TjMcqqooc839gQs/h7PiAZrmhKY9G1uX3LosTZabQqMFxS3CY7q
         YSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kWKIkb6qgsNd1sghd+Gu94KZJMj3gN+DQLl2UZMTmdk=;
        b=O12o3KNvLqcWF/dJGY7JsT7VY2OE9e16l0/k7SYRCi/FzLHyt2oaoCtF2GTqQK1IEw
         LTQ/V1tshw9H194t43dXBCLdTWXiN8dGLY9qSD/zXtWtfEo+hB+2/iF+Nr3kHsqsi1a+
         ovxJX/QVlgDJB+4evKJXdnLY6fyIezna6rYVRqIqGqP/RYW7qm9ELGyANStl2eAkLXT7
         BgvHoQkX1R5LPA0XRUdpTnQ/shB2v5s+rs6JnzsQaTDp2sNXxJWstcUE78jaeXHesEn2
         1mzdaiSXabmCa3MBO3E+7NjsBCuAuuzi7FPdDRIBmaJzJls4vJ3cSOTQyfuL9iZNl2zD
         OFEw==
X-Gm-Message-State: AOAM531tw6kwsAvtQLqIj2FyXpwfktlfS3teILEBZfPtWcrzjAx9nQ77
	RRoveCZDmlX9KcBDsj5HPZ0=
X-Google-Smtp-Source: ABdhPJx8SzfH3ussyQWxFySZ1rLzql7eLYYkkkmGmJwJZypd3TxjT2pPuf5CVg45/oPBj0XT7caHtg==
X-Received: by 2002:a17:907:75d0:: with SMTP id jl16mr14789312ejc.166.1630954455918;
        Mon, 06 Sep 2021 11:54:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id kk2sm4329128ejc.114.2021.09.06.11.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:54:15 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 18/40] staging: r8188eu: remove sreset_xmit_status_check from hal_ops
Date: Mon,  6 Sep 2021 20:53:05 +0200
Message-Id: <20210906185327.10326-19-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906185327.10326-1-straube.linux@gmail.com>
References: <20210906185327.10326-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove sreset_xmit_status_check from hal_ops and remove its wrapper
rtw_hal_sreset_xmit_status_check().
Call rtl8188e_sreset_xmit_status_check() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c          | 3 ++-
 drivers/staging/r8188eu/hal/hal_intf.c          | 6 ------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 1 -
 drivers/staging/r8188eu/include/hal_intf.h      | 2 --
 4 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 67b4fe1304a5..a52c17dd2e5a 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -10,6 +10,7 @@
 #include "../include/rtw_br_ext.h"
 #include "../include/rtw_mlme_ext.h"
 #include "../include/rtl8188e_dm.h"
+#include "../include/rtl8188e_sreset.h"
 
 /*
 Caller and the rtw_cmd_thread can protect cmd_q by spin_lock.
@@ -1492,7 +1493,7 @@ static void dynamic_chk_wk_hdl(struct adapter *padapter, u8 *pbuf, int sz)
 		expire_timeout_chk(padapter);
 #endif
 
-	rtw_hal_sreset_xmit_status_check(padapter);
+	rtl8188e_sreset_xmit_status_check(padapter);
 
 	linked_status_chk(padapter);
 	traffic_status_watchdog(padapter);
diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 51f6160f7dec..b1a71a8fdf38 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -221,12 +221,6 @@ void rtw_hal_antdiv_rssi_compared(struct adapter *adapt,
 		adapt->HalFunc.AntDivCompareHandler(adapt, dst, src);
 }
 
-void rtw_hal_sreset_xmit_status_check(struct adapter *adapt)
-{
-	if (adapt->HalFunc.sreset_xmit_status_check)
-		adapt->HalFunc.sreset_xmit_status_check(adapt);
-}
-
 void rtw_hal_sreset_linked_status_check(struct adapter *adapt)
 {
 	if (adapt->HalFunc.sreset_linked_status_check)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index f9852eae7c74..9b44fd2d93d7 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1803,7 +1803,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->Efuse_PgPacketWrite = &rtl8188e_Efuse_PgPacketWrite;
 	pHalFunc->Efuse_WordEnableDataWrite = &rtl8188e_Efuse_WordEnableDataWrite;
 
-	pHalFunc->sreset_xmit_status_check = &rtl8188e_sreset_xmit_status_check;
 	pHalFunc->sreset_linked_status_check  = &rtl8188e_sreset_linked_status_check;
 	pHalFunc->sreset_get_wifi_status  = &sreset_get_wifi_status;
 
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 1a85f11ba596..2f4bc16aeabd 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -193,7 +193,6 @@ struct hal_ops {
 					     u16 efuse_addr, u8 word_en,
 					     u8 *data, bool bPseudoTest);
 
-	void (*sreset_xmit_status_check)(struct adapter *padapter);
 	void (*sreset_linked_status_check) (struct adapter *padapter);
 	u8 (*sreset_get_wifi_status)(struct adapter *padapter);
 
@@ -271,7 +270,6 @@ void	rtw_hal_antdiv_rssi_compared(struct adapter *padapter,
 				     struct wlan_bssid_ex *dst,
 				     struct wlan_bssid_ex *src);
 
-void rtw_hal_sreset_xmit_status_check(struct adapter *padapter);
 void rtw_hal_sreset_linked_status_check(struct adapter *padapter);
 u8   rtw_hal_sreset_get_wifi_status(struct adapter *padapter);
 
-- 
2.33.0

