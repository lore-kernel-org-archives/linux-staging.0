Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737DE72
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 19:03:15 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id h9so15147365ejs.4
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 12:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HM0U8aFAgyxYkE6pP3iIT4ysY9lJ8YRKLSjNY12/S5U=;
        b=k+ERlf7N6CImlG/BnP9qmfyvgRtud9iTlFQfbcI6AaMa+VImVY70nKv2BFqt4hqmFr
         IwGQulK6D/SJKsR2Wtp+3J6F40udNd4QyN/lGzrgy4Ehvvb8a6YQUXmXT3KVtQEiYSMH
         f1VggSixvNT3luCI4Zn7WD1jWgnAXdzKXagCwcqFh1jdrn7Cyn2e1Ks/zCNcJVp9aMoh
         zWqFwlen1h8qz4DgtaJQFQoaOBGadg9Q0Hg97tZc9CQH+32LkLL6z7yZtkCbnAraLPvw
         2zgdj1j1UtkYQt25H8TH87rX2hKyuZF+DepVezAmEtG1IiGTT1eMid9J8enu4F1qeinn
         aYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HM0U8aFAgyxYkE6pP3iIT4ysY9lJ8YRKLSjNY12/S5U=;
        b=USqNr1ufG68be/OJ4aW2k793cuhoW87zmsqiCyPgpjaeVqU6uUyBwdkMiVn6i8LI0B
         qWxFIJn6BhXkV9dUdAeKhW6BQAx0wDQOeqjUt2AfbfRnX2HmOz3GkIMm/6Eg2amZhwDu
         ckN3sutCTLbZ4Z3ffj7h/8W6ltfCvnqnRfCTcY71/hvkNLqIkDYmUkVtwVcXCdfaQi4p
         2hUY4ZoQ03CCw6auF7J35nUW8EGYbsnNNYebY+5QZ2QCX7H2JAwZsiQubGsukohuM6bE
         xWVZHLWpHQaOoYZZQ5or6vuOhfxB4FdAaev3VnEuP23m6/7l/+lUNZ2WN1XMX9FyFG7O
         2vPA==
X-Gm-Message-State: AOAM531xNKiM+Z5bGZn6eTQu3so3p6RPYyRWF0cp6WfZdfoy2wGlB75b
	LyljWPCY4l2V7yrZIu9aypI=
X-Google-Smtp-Source: ABdhPJzreOz0KWGKSBg8URpKj5232g+puUsZxNZnz6gYbJoX30KxAjCl/6BNaZxgkmps+EijEomZZg==
X-Received: by 2002:a17:906:130a:: with SMTP id w10mr14763960ejb.89.1630954993916;
        Mon, 06 Sep 2021 12:03:13 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id k15sm4372018ejb.92.2021.09.06.12.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 12:03:13 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 39/40] staging: r8188eu: remove SetBeaconRelatedRegistersHandler from hal_ops
Date: Mon,  6 Sep 2021 21:02:22 +0200
Message-Id: <20210906190223.11396-40-straube.linux@gmail.com>
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

Remove SetBeaconRelatedRegistersHandler from hal_ops and remove its
wrapper rtw_hal_bcn_related_reg_setting().
Call SetBeaconRelatedRegisters8188EUsb() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 2 +-
 drivers/staging/r8188eu/hal/hal_intf.c       | 6 ------
 drivers/staging/r8188eu/hal/usb_halinit.c    | 3 +--
 drivers/staging/r8188eu/include/hal_intf.h   | 5 ++---
 4 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index cd4f1ae61dca..c2f664bdb979 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -1525,7 +1525,7 @@ void correct_TSF(struct adapter *padapter, struct mlme_ext_priv *pmlmeext)
 
 void beacon_timing_control(struct adapter *padapter)
 {
-	rtw_hal_bcn_related_reg_setting(padapter);
+	SetBeaconRelatedRegisters8188EUsb(padapter);
 }
 
 static struct adapter *pbuddy_padapter;
diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 17ac271e2417..d38a8134b243 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -180,12 +180,6 @@ void rtw_hal_write_rfreg(struct adapter *adapt, enum rf_radio_path rfpath,
 					      bitmask, data);
 }
 
-void rtw_hal_bcn_related_reg_setting(struct adapter *adapt)
-{
-	if (adapt->HalFunc.SetBeaconRelatedRegistersHandler)
-		adapt->HalFunc.SetBeaconRelatedRegistersHandler(adapt);
-}
-
 int rtw_hal_iol_cmd(struct adapter  *adapter, struct xmit_frame *xmit_frame,
 		    u32 max_wating_ms, u32 bndy_cnt)
 {
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 2c010f12118a..4d60b5156995 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -2147,7 +2147,7 @@ static void UpdateHalRAMask8188EUsb(struct adapter *adapt, u32 mac_id, u8 rssi_l
 	psta->init_rate = init_rate;
 }
 
-static void SetBeaconRelatedRegisters8188EUsb(struct adapter *adapt)
+void SetBeaconRelatedRegisters8188EUsb(struct adapter *adapt)
 {
 	u32 value32;
 	struct mlme_ext_priv	*pmlmeext = &adapt->mlmeextpriv;
@@ -2231,7 +2231,6 @@ void rtl8188eu_set_hal_ops(struct adapter *adapt)
 	halfunc->SetHalDefVarHandler = &SetHalDefVar8188EUsb;
 
 	halfunc->UpdateRAMaskHandler = &UpdateHalRAMask8188EUsb;
-	halfunc->SetBeaconRelatedRegistersHandler = &SetBeaconRelatedRegisters8188EUsb;
 
 	halfunc->hal_xmit = &rtl8188eu_hal_xmit;
 	halfunc->mgnt_xmit = &rtl8188eu_mgnt_xmit;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 9b0a44659f57..668a21cbe71e 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -149,7 +149,6 @@ struct hal_ops {
 
 	void	(*UpdateRAMaskHandler)(struct adapter *padapter,
 				       u32 mac_id, u8 rssi_level);
-	void	(*SetBeaconRelatedRegistersHandler)(struct adapter *padapter);
 
 	s32	(*hal_xmit)(struct adapter *padapter,
 			    struct xmit_frame *pxmitframe);
@@ -205,6 +204,8 @@ int rtl8188e_Efuse_PgPacketWrite(struct adapter *pAdapter, u8 offset, u8 word_en
 
 void hal_notch_filter_8188e(struct adapter *adapter, bool enable);
 
+void SetBeaconRelatedRegisters8188EUsb(struct adapter *adapt);
+
 uint rtw_hal_init(struct adapter *padapter);
 uint rtw_hal_deinit(struct adapter *padapter);
 void rtw_hal_stop(struct adapter *padapter);
@@ -232,8 +233,6 @@ void rtw_hal_update_ra_mask(struct adapter *padapter, u32 mac_id, u8 level);
 void	rtw_hal_clone_data(struct adapter *dst_adapt,
 			   struct adapter *src_adapt);
 
-void rtw_hal_bcn_related_reg_setting(struct adapter *padapter);
-
 u32	rtw_hal_read_bbreg(struct adapter *padapter, u32 RegAddr, u32 BitMask);
 void	rtw_hal_write_bbreg(struct adapter *padapter, u32 RegAddr, u32 BitMask,
 			    u32 Data);
-- 
2.33.0

