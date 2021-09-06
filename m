Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670C93FDD
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:25:15 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id e21so14896080ejz.12
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KuNxZwRTVgjFNWkdcTAaEszvzH8ZSmNqL8GXmzgUcKE=;
        b=Auwh7shzf+y1i1vQTcTVr0QwNjcc5dp+HxXis3DoeZdH7WCI3PDfvW8gfXKf9zA7xz
         EDPlPIfJpbKYma7gORZITzS2msRggxA4VL7FRsf5bkWubPuPjmzvxQnSxiWOITErIVz+
         IFJOD/zNA1SHRLRFS411T220AbF/RQcyW7h0E3xbYj2oMyZ6U21cGnbtU7QHuvbrSOp4
         EROeohZ9w2Sc20JbOqwB7KyoFtzLSMOrw4Xd7PFrPlPQ0IHR79pyJQG+VePYcjPrjIYC
         kLcKv4fD5KviOGaSNdKpMWOm2YQL579bTbCu6C06QrVuIueRBfaAeBR809JTf7C827jo
         dExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KuNxZwRTVgjFNWkdcTAaEszvzH8ZSmNqL8GXmzgUcKE=;
        b=InTodqQebEKy2rfkI7lo05nRdmKBWNWx9/tmn6O5ttRD5NzfddZgbFLwsbBfpX2JQ7
         6BMpI2nMcP65ZsZ1eynvlInMfEEw8ZO9quuRIGvQm6ijszNBDOqq3JhezLM2P0cKRLvZ
         3nXn+2W6NIz380EsOiAkDU4rcaLKEFUietEdx6kHi960Pk+RXqMRg9CEpUa9oBCVLW7z
         +aVMvm1TlTa20VOidtstbyXZJW2IrT0Nncd+kbkN06rFEw9xgJObswD6JQJJINHhsEhw
         0cu5XUSLkypDfE6p37oemi3azUBOvF/HLAw7a5WXHlodF2KuO63zCAyBD2+ARhT9LjP2
         LaFw==
X-Gm-Message-State: AOAM53222C+7vNcZ1sQlJVjzN+std0M3S4+JuDJDi9400ggUYCgk1NqA
	00Gue5+tReSYmpZmR8OybSE=
X-Google-Smtp-Source: ABdhPJwHgCSIUrfupiWN27tAReCe0302VFy4g+I1nDKlBCUR2SHpFRYyw2fxcqJ5urPgjD6hJp4h+w==
X-Received: by 2002:a17:906:9914:: with SMTP id zl20mr14979515ejb.263.1630952713861;
        Mon, 06 Sep 2021 11:25:13 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id s25sm4284492ejq.17.2021.09.06.11.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:25:13 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 17/40] staging: r8188eu: remove silentreset from hal_ops
Date: Mon,  6 Sep 2021 20:24:15 +0200
Message-Id: <20210906182438.5417-18-straube.linux@gmail.com>
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

