Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4C672
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 19:02:59 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id lc21so15112213ejc.7
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 12:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KuNxZwRTVgjFNWkdcTAaEszvzH8ZSmNqL8GXmzgUcKE=;
        b=XMF3pYzXFo9sL+6ZA4F7fhZDj8cpmYA2bFwhf8v73aMffs5OrusqF3Tt65Fp8ECIR1
         UhOlb7gp9qYV5c+wkibAHcqPHv2/2IBGJPO8MMPXRxxQU6UU0pCcNzXPwYZ5W9oZCWoc
         aWOsonNaZgSESU3dXTCuN8xmv1BLzLDEOe3p3Z1WLJr1UmRT01mY6S7GVj4Q0QJglsbe
         n2pGadnJ5yDC7x9lpM6gaSCLmeG1r40XEwq5i0aD6vTYxcjYGqAOkWf3yGDd8UCDbAMr
         73OBJeAMYtv1j2bM5OqEO775L1QoGhntkaiZlW4TPjYeFa0CNS+MBoChJd5Di6NRD+Wn
         mbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KuNxZwRTVgjFNWkdcTAaEszvzH8ZSmNqL8GXmzgUcKE=;
        b=mBre6oUTbWkANlyUsf0PNPWErNFv9okjx2GQyA26AoDuk8vf9P2eUog6NQLc/2v38k
         byUKQOaxEAFXzXnQ4WxWpOat8AEe8NKmz0Xe4GTYZkkzr5cE7p9krbcKgQw4X7eXaFoG
         /ZVf0IUnetj+pD+rdp1EhLFBJbcJ8QvilCBJkn8jNtcahW/Xln/+eI6tT71/FS9Anq4Z
         fFotMd0NlLXHfAuExfO87+P5OMguADAmUTakqqsQdbIkeNuiOsBLRLV3neVtfBtbu3wG
         k4jpHi39W33uZoT+BgJVvehRU1ybPVeUQjqkBCpWfWDkMtBzWu8ORU7BVuJEMyyu4utE
         BhZg==
X-Gm-Message-State: AOAM530QaiP5sKlidPHlxPqeIzIaaIkPJZ4JA4xKUBEKv9itvUAlzOiC
	nDzz2nGh1lHvNbWUmwts1gE=
X-Google-Smtp-Source: ABdhPJwyPN13m3SxXszq8bFh2yE7R7LEaa9/qPy8N3AEhx7pjLp8yfQiO9JOfiLPHgPMSI6C3e3LzQ==
X-Received: by 2002:a17:906:6dcb:: with SMTP id j11mr14798259ejt.202.1630954977835;
        Mon, 06 Sep 2021 12:02:57 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id k15sm4372018ejb.92.2021.09.06.12.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 12:02:57 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 17/40] staging: r8188eu: remove silentreset from hal_ops
Date: Mon,  6 Sep 2021 21:02:00 +0200
Message-Id: <20210906190223.11396-18-straube.linux@gmail.com>
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

Remove silentreset from hal_ops and remove its wrapper
rtw_hal_sreset_reset().
Call rtl8188e_silentreset_for_specific_platform() directly instead.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/hal_intf.c          | 6 ------
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 1 -
 drivers/staging/r8188eu/include/hal_intf.h      | 2 --
 drivers/staging/r8188eu/os_dep/ioctl_linux.c    | 2 +-
 4 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/hal_intf.c b/drivers/staging/r8188eu/hal/hal_intf.c
index e5267c23ab86..51f6160f7dec 100644
--- a/drivers/staging/r8188eu/hal/hal_intf.c
+++ b/drivers/staging/r8188eu/hal/hal_intf.c
@@ -221,12 +221,6 @@ void rtw_hal_antdiv_rssi_compared(struct adapter *adapt,
 		adapt->HalFunc.AntDivCompareHandler(adapt, dst, src);
 }
 
-void rtw_hal_sreset_reset(struct adapter *adapt)
-{
-	if (adapt->HalFunc.silentreset)
-		adapt->HalFunc.silentreset(adapt);
-}
-
 void rtw_hal_sreset_xmit_status_check(struct adapter *adapt)
 {
 	if (adapt->HalFunc.sreset_xmit_status_check)
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 222e66656aa9..f9852eae7c74 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1803,7 +1803,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->Efuse_PgPacketWrite = &rtl8188e_Efuse_PgPacketWrite;
 	pHalFunc->Efuse_WordEnableDataWrite = &rtl8188e_Efuse_WordEnableDataWrite;
 
-	pHalFunc->silentreset = &rtl8188e_silentreset_for_specific_platform;
 	pHalFunc->sreset_xmit_status_check = &rtl8188e_sreset_xmit_status_check;
 	pHalFunc->sreset_linked_status_check  = &rtl8188e_sreset_linked_status_check;
 	pHalFunc->sreset_get_wifi_status  = &sreset_get_wifi_status;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 946896698655..1a85f11ba596 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -193,7 +193,6 @@ struct hal_ops {
 					     u16 efuse_addr, u8 word_en,
 					     u8 *data, bool bPseudoTest);
 
-	void (*silentreset)(struct adapter *padapter);
 	void (*sreset_xmit_status_check)(struct adapter *padapter);
 	void (*sreset_linked_status_check) (struct adapter *padapter);
 	u8 (*sreset_get_wifi_status)(struct adapter *padapter);
@@ -272,7 +271,6 @@ void	rtw_hal_antdiv_rssi_compared(struct adapter *padapter,
 				     struct wlan_bssid_ex *dst,
 				     struct wlan_bssid_ex *src);
 
-void rtw_hal_sreset_reset(struct adapter *padapter);
 void rtw_hal_sreset_xmit_status_check(struct adapter *padapter);
 void rtw_hal_sreset_linked_status_check(struct adapter *padapter);
 u8   rtw_hal_sreset_get_wifi_status(struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index c7229878ee53..803caf94da4c 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -4304,7 +4304,7 @@ static int rtw_dbg_port(struct net_device *dev,
 		case 0x0f:
 			if (extra_arg == 0) {
 				DBG_88E("###### silent reset test.......#####\n");
-				rtw_hal_sreset_reset(padapter);
+				rtl8188e_silentreset_for_specific_platform(padapter);
 			}
 			break;
 		case 0x15:
-- 
2.33.0

