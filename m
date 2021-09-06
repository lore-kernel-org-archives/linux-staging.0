Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BA63FCD
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:54:11 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id i21so15113222ejd.2
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uYnkOq4yxqkoB1rb/ew5x0vj+H8yKqRwDVySAJFiDa4=;
        b=GsPWQt2KvJPKFGkAVd1syygkqCHUt55dbVnKj3KVoYoprVqGP89+dYdlUV12QtxS83
         kAlx+RfQ4znVtqN7OQmxrJEdIrTloHCzdxcSssShAEqCF1rIUhxNV91dPJu8M9dQMsvs
         QfTpH2yaj2tHPrlrnAKAJRjFV96g8q0oNxC17HPa2AmofwNBBO38VxB5RxjgtY+yIkFA
         iKszxNP+ByrHg9MLrNUeZUeHRRWZM8E5IQuFMUGPdM9Wc8BjUE4ij/AwTqp2XbdGr74H
         BJjUlhQjnl2DkKuCUL+hxwJDyHmuePLYKR44fb8L4pYwJDn0HvDnhbhbb0a5WZHqWji1
         4lWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uYnkOq4yxqkoB1rb/ew5x0vj+H8yKqRwDVySAJFiDa4=;
        b=Y43qpql1FluYUgKrFKfZ75ZiippauOWwVJuSMSHw0/Fqc/OXTOgfiN8AHo7b7Jj+8q
         BUDbp5yHM6KjaFiP7iiet6hwIORrAf+Mb7U/u176wvRdHTGb9Rq4t6CfgGa8IuTBWuCH
         ccYfYeo9gC/QGuSgFZdsP4UKESwFgzlQxjgFD1doSwXDymk/6srENXRf/hERiX3hce1v
         p2CGMJJxDoh1xbtwNDsFXzuNySPQNJ1FGjxnsAyAEYPQU1aCDNiBG0gRXOqztm1+hpK4
         zlVcDHZqFQkLo3HmHyd4o+RNa0ERomffA3jzmOZkk6j4DpFJJK9aCdd7NArlkalkct2q
         QXMQ==
X-Gm-Message-State: AOAM531LvBtAlIzb5E0qotOGn2eOiq4XjVbZqkUf9I/gmDPwXTKHBUpB
	p+DzmZS+nTziKsZ7VOc2d8A=
X-Google-Smtp-Source: ABdhPJzYDwQi0AXRjmihpO0emVpvNxKSPuaYKchs31LU0Y7LzRRVCY9UMVXpWJZBsW5e+AcmWQr/Tw==
X-Received: by 2002:a17:906:29d0:: with SMTP id y16mr15346359eje.477.1630954449888;
        Mon, 06 Sep 2021 11:54:09 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id kk2sm4329128ejc.114.2021.09.06.11.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:54:09 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 10/40] staging: r8188eu: remove set_bwmode_handler from hal_ops
Date: Mon,  6 Sep 2021 20:52:57 +0200
Message-Id: <20210906185327.10326-11-straube.linux@gmail.com>
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

Remove set_bwmode_handler from hal_ops and remove its wrapper
rtw_hal_set_bwmode(). Call PHY_SetBWMode8188E() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c    | 2 +-
 drivers/staging/r8188eu/hal/hal_intf.c          | 8 --------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 1 -
 drivers/staging/r8188eu/include/hal_intf.h      | 5 -----
 4 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index ccb5fbbc3ffb..37400e29eec4 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -328,7 +328,7 @@ void SetBWMode(struct adapter *padapter, unsigned short bwmode,
 	rtw_set_oper_bw(padapter, bwmode);
 	rtw_set_oper_choffset(padapter, channel_offset);
 
-	rtw_hal_set_bwmode(padapter, (enum ht_channel_width)bwmode, channel_offset);
+	PHY_SetBWMode8188E(padapter, (enum ht_channel_width)bwmode, channel_offset);
 }
 
 void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigned char channel_offset, unsigned short bwmode)
diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index 9374e5ecb13b..93691e72e263 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -215,14 +215,6 @@ void rtw_hal_write_rfreg(struct adapter *adapt, enum rf_radio_path rfpath,
 					      bitmask, data);
 }
 
-void rtw_hal_set_bwmode(struct adapter *adapt,
-			enum ht_channel_width bandwidth, u8 offset)
-{
-	if (adapt->HalFunc.set_bwmode_handler)
-		adapt->HalFunc.set_bwmode_handler(adapt, bandwidth,
-						     offset);
-}
-
 void rtw_hal_set_chan(struct adapter *adapt, u8 channel)
 {
 	if (adapt->HalFunc.set_channel_handler)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 844a18117f09..8a73294d8bec 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1784,7 +1784,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 {
 	pHalFunc->free_hal_data = &rtl8188e_free_hal_data;
 
-	pHalFunc->set_bwmode_handler = &PHY_SetBWMode8188E;
 	pHalFunc->set_channel_handler = &PHY_SwChnl8188E;
 
 	pHalFunc->Add_RateATid = &rtl8188e_Add_RateATid;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index caf759a9eb48..f3f294aa6a24 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -143,9 +143,6 @@ struct hal_ops {
 	s32	(*init_recv_priv)(struct adapter *padapter);
 	void	(*free_recv_priv)(struct adapter *padapter);
 
-	void	(*set_bwmode_handler)(struct adapter *padapter,
-				      enum ht_channel_width Bandwidth,
-				      u8 Offset);
 	void	(*set_channel_handler)(struct adapter *padapter, u8 channel);
 
 	void	(*SetHwRegHandler)(struct adapter *padapter, u8	variable,
@@ -284,8 +281,6 @@ void	rtw_hal_write_rfreg(struct adapter *padapter,
 			    enum rf_radio_path eRFPath, u32 RegAddr,
 			    u32 BitMask, u32 Data);
 
-void	rtw_hal_set_bwmode(struct adapter *padapter,
-			   enum ht_channel_width Bandwidth, u8 Offset);
 void	rtw_hal_set_chan(struct adapter *padapter, u8 channel);
 
 u8	rtw_hal_antdiv_before_linked(struct adapter *padapter);
-- 
2.33.0

