Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146C03FD5
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 19:02:55 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id g21so10643685edw.4
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 12:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gDDbV5k8w+ZNilfMRl6tEIv8pUv9RSEpEzotQr9O7i4=;
        b=B8ev//TV78FOBxVTErZRDAHnkokYkUYQcgH/VXTjUXaQ7QVS073I5ka0hUPV+XLRVS
         h7k8IgAwmQAWkmkxssmHhySJCeuumIOcGoAVnzXhGjY3I8aNQ/fuzu5dmxksxCKLPgiO
         Fm03fRu/A1yc/lu0/jPTGdhJzMF1ADDok9eErOFE3SMxXJPXA5i3oOItGxNiPTwBiuEf
         LY+y4UnBZFeKWQxJYNXmGvlMO2D1OsyTo8DGaF/Wmt+cV7aIiVlHQwFSwkzP6wTVn0Bv
         CU4DN5Ym84Pxa0Ld6MsrTrExwH80J5T1DIYk1NoAQi0YxKteBdewWOKRNf3UyjUHYayr
         EzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gDDbV5k8w+ZNilfMRl6tEIv8pUv9RSEpEzotQr9O7i4=;
        b=GHrYxPmmA1VJq1amGGOOW1D4u8nmsXPAoNGh6wGNIPNmKQa9DvFvvVP52t8MJo4/rU
         1G8cZQlAXIUTfETMPMB6lOlzs9obTHS4tb4L6V2IfoDk8ympgPJOgz5P4pu8SL8+djud
         yXpPa0API/ExX5PB7RM/qDzhBVKHboREYqFgFP5g9FdIXCduTGx+Hg39gGU8wsAbgdQv
         qOOCQOoBxdtOHV0QhfMI6aiXcztWwbATlXXcXD/pUwFSfAcFE2XBMVW4VPsTeStczeAj
         mYM9XeBXqjhDaOMT41BehZ6Fn7UFB5tvWBjgeg0DJl9tjJZpqZlJLnNQT9tx3v177BHU
         XakA==
X-Gm-Message-State: AOAM533kh9e5eFlD988JAsnicYnfElfHWyor6kUkBsd9dvq/KFy7m5xD
	5Whduprc0l94aBSxtLF1zRw=
X-Google-Smtp-Source: ABdhPJyi2I8RO9aZg+ZEp3AgNo97aGVh3Aoh7PRebK7Av1tl6XBjxJ5QBcEDdU8RZQhVPJ576M6pXQ==
X-Received: by 2002:aa7:cb8a:: with SMTP id r10mr14459016edt.237.1630954973540;
        Mon, 06 Sep 2021 12:02:53 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id k15sm4372018ejb.92.2021.09.06.12.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 12:02:53 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 11/40] staging: r8188eu: remove set_channel_handler from hal_ops
Date: Mon,  6 Sep 2021 21:01:54 +0200
Message-Id: <20210906190223.11396-12-straube.linux@gmail.com>
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

