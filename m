Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D5B72
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:54:12 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id n27so15090786eja.5
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gDDbV5k8w+ZNilfMRl6tEIv8pUv9RSEpEzotQr9O7i4=;
        b=q31hFjL0IQZ5XdwzFCmEReu0H3IUHIukaDj6js8My/+dsZN7p85RWlt6RLljH1wFdR
         zQ0Pc35pUfSEqsJ+PqI+9fE4GWy22FBcOQUmY1rAIOsSkg4zQa/xDvNg2IB9fchltQiR
         QyVtLzDQ0hKNCE0zwFk+uiwQlTfZcBArGIrDcdHcLWn/Ve/0hnONm6Is4jy0L3L4W0hu
         eMjcAq7EMkLu6Qevk8p2T473ASsdLfA0ieFlpBbgi3W2IicVbirVVK41a0h7KLWSgsBh
         NtwpZjU5iJrUEyNEi9U9CcJRpkShNraKnEBisTNS1x6nQ0y8EuqCv7w2cf1YHy49UH8d
         XX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gDDbV5k8w+ZNilfMRl6tEIv8pUv9RSEpEzotQr9O7i4=;
        b=Zy+UwWEqMXH1PuwVs3nE0PaFcCk8Ubji1+4KlhjFyjJ+tlXZytfuJLrqk22NhcPyn8
         QNlD4/w2TXNaaxVfRKoHeOP3EoEsQm/qCQczsZrwNyA1+ucRdcLxvlowf1xg7RxsCbYu
         SwFtckyJtIdFru4ielJWzMVIv02EKarsWj0IuGXxpdwyXX79eM499SrQ+EvFAbjxj7KD
         pGv0khGD3XPI8j9QQ8zX5PpW+oWqS48Q4VAlUNkXEI7Qf/UAAEsDFU4Ft6evDfL1blL2
         gaah19GgCyefQ7Is2dM64hTA1OIzkjudKYk6MHCrI2kGFtXi9eumK4CWV+flxNR+VI7K
         K1LA==
X-Gm-Message-State: AOAM5337vutrJfF25Q1umm3WFvQRFkIXr92A7oYSIDPEO0NaXCSU6PIP
	K07XDGvtvZ8n/s2Fmk6NXnE=
X-Google-Smtp-Source: ABdhPJzSiHLiEYRIxsFosm8Q3alY7SBEavmJqxf9NwTsN4lL7uPmmHp6LH4tEBnYuQl6RKKHefWONQ==
X-Received: by 2002:a17:906:ae4f:: with SMTP id lf15mr15308396ejb.124.1630954450643;
        Mon, 06 Sep 2021 11:54:10 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id kk2sm4329128ejc.114.2021.09.06.11.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:54:10 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 11/40] staging: r8188eu: remove set_channel_handler from hal_ops
Date: Mon,  6 Sep 2021 20:52:58 +0200
Message-Id: <20210906185327.10326-12-straube.linux@gmail.com>
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

Remove set_channel_handler from hal_ops and remove its wrapper
rtw_hal_set_chan(). Call PHY_SwChnl8188E() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c    | 4 ++--
 drivers/staging/r8188eu/hal/hal_intf.c          | 6 ------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 2 --
 drivers/staging/r8188eu/include/hal_intf.h      | 4 ----
 4 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 37400e29eec4..cd4f1ae61dca 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -318,7 +318,7 @@ void SelectChannel(struct adapter *padapter, unsigned char channel)
 {
 	/* saved channel info */
 	rtw_set_oper_ch(padapter, channel);
-	rtw_hal_set_chan(padapter, channel);
+	PHY_SwChnl8188E(padapter, channel);
 }
 
 void SetBWMode(struct adapter *padapter, unsigned short bwmode,
@@ -359,7 +359,7 @@ void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigne
 	rtw_set_oper_bw(padapter, bwmode);
 	rtw_set_oper_choffset(padapter, channel_offset);
 
-	rtw_hal_set_chan(padapter, center_ch); /*  set center channel */
+	PHY_SwChnl8188E(padapter, center_ch); /*  set center channel */
 	SetBWMode(padapter, bwmode, channel_offset);
 }
 
diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 93691e72e263..79a2a5a0abd9 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -215,12 +215,6 @@ void rtw_hal_write_rfreg(struct adapter *adapt, enum rf_radio_path rfpath,
 					      bitmask, data);
 }
 
-void rtw_hal_set_chan(struct adapter *adapt, u8 channel)
-{
-	if (adapt->HalFunc.set_channel_handler)
-		adapt->HalFunc.set_channel_handler(adapt, channel);
-}
-
 void rtw_hal_bcn_related_reg_setting(struct adapter *adapt)
 {
 	if (adapt->HalFunc.SetBeaconRelatedRegistersHandler)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 8a73294d8bec..4274b11e456c 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1784,8 +1784,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 {
 	pHalFunc->free_hal_data = &rtl8188e_free_hal_data;
 
-	pHalFunc->set_channel_handler = &PHY_SwChnl8188E;
-
 	pHalFunc->Add_RateATid = &rtl8188e_Add_RateATid;
 	pHalFunc->run_thread = &rtl8188e_start_thread;
 	pHalFunc->cancel_thread = &rtl8188e_stop_thread;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index f3f294aa6a24..eab0b8576c92 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -143,8 +143,6 @@ struct hal_ops {
 	s32	(*init_recv_priv)(struct adapter *padapter);
 	void	(*free_recv_priv)(struct adapter *padapter);
 
-	void	(*set_channel_handler)(struct adapter *padapter, u8 channel);
-
 	void	(*SetHwRegHandler)(struct adapter *padapter, u8	variable,
 				   u8 *val);
 	void	(*GetHwRegHandler)(struct adapter *padapter, u8	variable,
@@ -281,8 +279,6 @@ void	rtw_hal_write_rfreg(struct adapter *padapter,
 			    enum rf_radio_path eRFPath, u32 RegAddr,
 			    u32 BitMask, u32 Data);
 
-void	rtw_hal_set_chan(struct adapter *padapter, u8 channel);
-
 u8	rtw_hal_antdiv_before_linked(struct adapter *padapter);
 void	rtw_hal_antdiv_rssi_compared(struct adapter *padapter,
 				     struct wlan_bssid_ex *dst,
-- 
2.33.0

