Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833DD3FC0
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:25:12 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id r7so10511334edd.6
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oCUzF7n3QUF1nNR3jeQewitNVHMSh2p1GXrSnbO7b0c=;
        b=FQ1cQJwKlJu/jgboKL7eFDwa/Jb/ID+YjNaXUOSpOLPg5HwSCCpl9wlhhc1KhqA8XM
         JLWPedcqvzYw5svYN69f+JXT0I6HBhFY+jxuJgVOGfsTGIqot+DgYxLljnEBNYwemREe
         eM7QKBiGJwwhxj0uZUiG3HRDyR1PctN3rmoHD+TUEqkd0E29Oq0WqZBAFkSX9yQW6Xt/
         XtwAcu7zoMT0C/uXzlstUKBFFR8rDg03TupIHxXpH4eZXnLfjHRhkwBd6EMPvrDXcACD
         g2VMscaVXROP0nkcyreujmKjTlOfXgh+tt+ba4DLygOkKAppj9+OrTqf0sxLInGHQZ+E
         a+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oCUzF7n3QUF1nNR3jeQewitNVHMSh2p1GXrSnbO7b0c=;
        b=OMnq0tyrsS2w0nIQY5VmcqqivoJ7MIHrD5n8fjGDOIAL7hTZtHASCMxedMuHpgNX40
         eCQtL+N5z5ug48b77CzMhM38CLJrdM/ekQ32l36hKH64LXqqUHvp7yaOim7RZoeO9Aje
         3m/X6oee4p1Xw7U11rynC2X0kacmZ+AAg+V5+uXr+I7ma+srmqPLT6PA6RdxQhbhbkxk
         KwCwM8sK0RMcUZnWv4SrtObo+c248IeN1ggThABPnFQmudVaU8e+EXJ9XSNt1IJYRTlD
         ayRpM0scvoehydCvyfKioSJhanR5kNPmBN0epLOpunvrblkbUcwZZv0XInN7jbNZdD0p
         N3JA==
X-Gm-Message-State: AOAM532RpY3S1IJ2fmk0J1V17vnXvrNCLq6OS47OTFPYpyL/ZvarJewR
	YASHZpssJ1mv2YCeVaiPM5Q=
X-Google-Smtp-Source: ABdhPJx2+mpwgbOGwHl2gEKohQqmEmLFGPqD8r+Yd2AlM0lKcT86SGrVNDlNWxYkrLRfi8lss5iJYQ==
X-Received: by 2002:a05:6402:14d6:: with SMTP id f22mr14656869edx.274.1630952710978;
        Mon, 06 Sep 2021 11:25:10 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id s25sm4284492ejq.17.2021.09.06.11.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:25:10 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 13/40] staging: r8188eu: remove Add_RateATid from hal_ops
Date: Mon,  6 Sep 2021 20:24:11 +0200
Message-Id: <20210906182438.5417-14-straube.linux@gmail.com>
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

Remove Add_RateATid from hal_ops and remove its wrapper
rtw_hal_add_ra_tid(). Call rtl8188e_Add_RateATid() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c           | 5 +++--
 drivers/staging/r8188eu/hal/hal_intf.c          | 8 --------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 1 -
 drivers/staging/r8188eu/include/hal_intf.h      | 3 ---
 4 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index da8b5332b5e7..8e6b1964f533 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -7,6 +7,7 @@
 #include "../include/drv_types.h"
 #include "../include/wifi.h"
 #include "../include/ieee80211.h"
+#include "../include/rtl8188e_cmd.h"
 
 #ifdef CONFIG_88EU_AP_MODE
 
@@ -393,7 +394,7 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 		/* bitmap[28:31]= Rate Adaptive id */
 		/* arg[0:4] = macid */
 		/* arg[5] = Short GI */
-		rtw_hal_add_ra_tid(padapter, tx_ra_bitmap, arg, rssi_level);
+		rtl8188e_Add_RateATid(padapter, tx_ra_bitmap, arg, rssi_level);
 
 		if (shortGIrate)
 			init_rate |= BIT(6);
@@ -467,7 +468,7 @@ void update_bmc_sta(struct adapter *padapter)
 			/* bitmap[28:31]= Rate Adaptive id */
 			/* arg[0:4] = macid */
 			/* arg[5] = Short GI */
-			rtw_hal_add_ra_tid(padapter, tx_ra_bitmap, arg, 0);
+			rtl8188e_Add_RateATid(padapter, tx_ra_bitmap, arg, 0);
 		}
 		/* set ra_id, init_rate */
 		psta->raid = raid;
diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 79a2a5a0abd9..39b1a8711754 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -158,14 +158,6 @@ void rtw_hal_update_ra_mask(struct adapter *adapt, u32 mac_id, u8 rssi_level)
 	}
 }
 
-void rtw_hal_add_ra_tid(struct adapter *adapt, u32 bitmap, u8 arg,
-			u8 rssi_level)
-{
-	if (adapt->HalFunc.Add_RateATid)
-		adapt->HalFunc.Add_RateATid(adapt, bitmap, arg,
-					       rssi_level);
-}
-
 /*	Start specifical interface thread		*/
 void rtw_hal_start_thread(struct adapter *adapt)
 {
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 4274b11e456c..0b14748e1346 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1784,7 +1784,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 {
 	pHalFunc->free_hal_data = &rtl8188e_free_hal_data;
 
-	pHalFunc->Add_RateATid = &rtl8188e_Add_RateATid;
 	pHalFunc->run_thread = &rtl8188e_start_thread;
 	pHalFunc->cancel_thread = &rtl8188e_stop_thread;
 
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 3bf0d18e2ba8..9f804f9f5363 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -154,8 +154,6 @@ struct hal_ops {
 				       u32 mac_id, u8 rssi_level);
 	void	(*SetBeaconRelatedRegistersHandler)(struct adapter *padapter);
 
-	void	(*Add_RateATid)(struct adapter *adapter, u32 bitmap, u8 arg,
-				u8 rssi_level);
 	void	(*run_thread)(struct adapter *adapter);
 	void	(*cancel_thread)(struct adapter *adapter);
 
@@ -257,7 +255,6 @@ s32	rtw_hal_init_recv_priv(struct adapter *padapter);
 void	rtw_hal_free_recv_priv(struct adapter *padapter);
 
 void rtw_hal_update_ra_mask(struct adapter *padapter, u32 mac_id, u8 level);
-void	rtw_hal_add_ra_tid(struct adapter *adapt, u32 bitmap, u8 arg, u8 level);
 void	rtw_hal_clone_data(struct adapter *dst_adapt,
 			   struct adapter *src_adapt);
 void	rtw_hal_start_thread(struct adapter *padapter);
-- 
2.33.0

