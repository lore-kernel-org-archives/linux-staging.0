Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0E0111D;
	Sat,  2 Apr 2022 16:34:45 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a6so847796ejk.0;
        Sat, 02 Apr 2022 09:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/FUIvc/vDnMsC8g3By0xz2o93YIAaNo0DmbUPR75Tlc=;
        b=Ioi61ehSCrXnxLXiUDHyumdLEB4WVYi0QVlxNUL2ed3iV843fKZaDve+2MpfC/8G5J
         x4KZDzHzRvf5A9KYLawd2xkLz3U3C2lc/ofNKczlkanAj5jwaZVkKKkrmeaKbbiaLeof
         oi8LgC+BF5j3duxC/OEIitiA/o+xBkNhgB09T3wwbJ40k1yBS2K+6FatLnxPu0GHZUrs
         KmuipXAqwxdBUFU+O19jfc2TBpM2iLafe8ARV9lZaphs7EYb+0iDUvB1wKN/rS0Qt4+s
         bkHGMxghC9ZADEqlsTctvDu7TyNIYX17XomcLzYbJ5dMwVBxVI7/VkFC/caEdkepdKuL
         i9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/FUIvc/vDnMsC8g3By0xz2o93YIAaNo0DmbUPR75Tlc=;
        b=HtafNI68IXiU3NksqUOOTTi0bNYq9/A9POdoONLwcsE3EWjyDBNmm5Q/Ofuss9+4w0
         yFmXSl6vltYRql6KfN63/DrAkMMy7ypDTPPLxycFMk/PcYwpnRIxBlByeF97m7JA8B/3
         6GltemOh+F4w3pcbwulWXw1EEK7dIVcjfmjhroT5tmz7B1e/UA/sSVHcQr3saBGRYo53
         UuS6OaqLQ335vsKVMlLJw4k2BfYuDP2DknR809CwMB680asgL+QDbBUs2hPKWN1jcQ0F
         gyh31B2Qaf0EGl83L/UrYv80ji0rzXPFgOEWrYNzbYErcXj0gj9QNrJK2/ipFT1o2e11
         Pdlg==
X-Gm-Message-State: AOAM531XLInobe/x9fRGbQAV9aEfO25qorYKN0EcDJgaLJraENKU1Rju
	em0holpirkWVVT97qQ0Sghg=
X-Google-Smtp-Source: ABdhPJy2M5JbKf2OjnCPA6qJuPiQbgigSFQO/VYzmNX4uOlglDcSFd71pcHoDc/5PYlOC4uf4RS7eg==
X-Received: by 2002:a17:906:b107:b0:6e0:a25a:af6e with SMTP id u7-20020a170906b10700b006e0a25aaf6emr4308839ejy.359.1648917284171;
        Sat, 02 Apr 2022 09:34:44 -0700 (PDT)
Received: from localhost.localdomain (host-95-249-145-232.retail.telecomitalia.it. [95.249.145.232])
        by smtp.gmail.com with ESMTPSA id ka22-20020a170907921600b006e4c1ab0bbdsm2191216ejb.207.2022.04.02.09.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 09:34:42 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: r8188eu: Use the ARRAY_SIZE() macro
Date: Sat,  2 Apr 2022 18:34:39 +0200
Message-Id: <20220402163439.20457-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the ARRAY_SIZE() macro in places where there are open coded
calculations of the size of arrays.

ARRAY_SIZE(arr) makes sure that "arr" is an array, it's safer than
sizeof(arr) / sizeof(arr[0]), and improves readibility.

Detected with the help of Coccinelle.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c     | 2 +-
 drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c  | 6 +++---
 drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c | 2 +-
 drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c  | 2 +-
 drivers/staging/r8188eu/os_dep/ioctl_linux.c    | 6 +++---
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 10d5f1222936..2ce130165b39 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -3985,7 +3985,7 @@ unsigned int OnAction(struct adapter *padapter, struct recv_frame *precv_frame)
 
 	category = frame_body[0];
 
-	for (i = 0; i < sizeof(OnAction_tbl) / sizeof(struct action_handler); i++) {
+	for (i = 0; i < ARRAY_SIZE(OnAction_tbl); i++) {
 		ptable = &OnAction_tbl[i];
 		if (category == ptable->num)
 			ptable->func(padapter, precv_frame);
diff --git a/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c b/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
index e7f834b02567..7901d0afa2e7 100644
--- a/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
+++ b/drivers/staging/r8188eu/hal/HalHWImg8188E_BB.c
@@ -170,7 +170,7 @@ enum HAL_STATUS ODM_ReadAndConfig_AGC_TAB_1T_8188E(struct odm_dm_struct *dm_odm)
 {
 	u32     hex         = 0;
 	u32     i           = 0;
-	u32     arraylen    = sizeof(array_agc_tab_1t_8188e) / sizeof(u32);
+	u32     arraylen    = ARRAY_SIZE(array_agc_tab_1t_8188e);
 	u32    *array       = array_agc_tab_1t_8188e;
 	bool		biol = false;
 	struct adapter *adapter =  dm_odm->Adapter;
@@ -446,7 +446,7 @@ enum HAL_STATUS ODM_ReadAndConfig_PHY_REG_1T_8188E(struct odm_dm_struct *dm_odm)
 {
 	u32     hex         = 0;
 	u32     i           = 0;
-	u32     arraylen    = sizeof(array_phy_reg_1t_8188e) / sizeof(u32);
+	u32     arraylen    = ARRAY_SIZE(array_phy_reg_1t_8188e);
 	u32    *array       = array_phy_reg_1t_8188e;
 	bool	biol = false;
 	struct adapter *adapter =  dm_odm->Adapter;
@@ -651,7 +651,7 @@ void ODM_ReadAndConfig_PHY_REG_PG_8188E(struct odm_dm_struct *dm_odm)
 {
 	u32  hex;
 	u32  i           = 0;
-	u32  arraylen    = sizeof(array_phy_reg_pg_8188e) / sizeof(u32);
+	u32  arraylen    = ARRAY_SIZE(array_phy_reg_pg_8188e);
 	u32 *array       = array_phy_reg_pg_8188e;
 
 	hex = ODM_ITRF_USB << 8;
diff --git a/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c b/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c
index 20ce1571fc26..77b25885c63b 100644
--- a/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c
+++ b/drivers/staging/r8188eu/hal/HalHWImg8188E_MAC.c
@@ -132,7 +132,7 @@ enum HAL_STATUS ODM_ReadAndConfig_MAC_REG_8188E(struct odm_dm_struct *dm_odm)
 
 	u32     hex         = 0;
 	u32     i;
-	u32     array_len    = sizeof(array_MAC_REG_8188E) / sizeof(u32);
+	u32     array_len    = ARRAY_SIZE(array_MAC_REG_8188E);
 	u32    *array       = array_MAC_REG_8188E;
 	bool	biol = false;
 
diff --git a/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c b/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c
index 9dc888a66d09..08cbfce3808d 100644
--- a/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c
+++ b/drivers/staging/r8188eu/hal/HalHWImg8188E_RF.c
@@ -138,7 +138,7 @@ enum HAL_STATUS ODM_ReadAndConfig_RadioA_1T_8188E(struct odm_dm_struct *pDM_Odm)
 
 	u32     hex         = 0;
 	u32     i           = 0;
-	u32     ArrayLen    = sizeof(Array_RadioA_1T_8188E) / sizeof(u32);
+	u32     ArrayLen    = ARRAY_SIZE(Array_RadioA_1T_8188E);
 	u32    *Array       = Array_RadioA_1T_8188E;
 	bool		biol = false;
 	struct adapter *Adapter =  pDM_Odm->Adapter;
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index eb9375b0c660..dd2f9ae59c3f 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3958,10 +3958,10 @@ static struct iw_statistics *rtw_get_wireless_stats(struct net_device *dev)
 
 struct iw_handler_def rtw_handlers_def = {
 	.standard = rtw_handlers,
-	.num_standard = sizeof(rtw_handlers) / sizeof(iw_handler),
+	.num_standard = ARRAY_SIZE(rtw_handlers),
 	.private = rtw_private_handler,
 	.private_args = (struct iw_priv_args *)rtw_private_args,
-	.num_private = sizeof(rtw_private_handler) / sizeof(iw_handler),
-	.num_private_args = sizeof(rtw_private_args) / sizeof(struct iw_priv_args),
+	.num_private = ARRAY_SIZE(rtw_private_handler),
+	.num_private_args = ARRAY_SIZE(rtw_private_args),
 	.get_wireless_stats = rtw_get_wireless_stats,
 };
-- 
2.34.1

