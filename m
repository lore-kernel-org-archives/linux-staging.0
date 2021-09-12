Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207173FC3
	for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 10:08:57 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id t18so9818507wrb.0
        for <linux-staging@lists.linux.dev>; Sun, 12 Sep 2021 03:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8QHcM8ypCvCuFTilnzg+Tu9JW8e3hCoZSCoHDwtODaU=;
        b=kso5OHeaBYG8XBxVZ84dx+7Y+CdFrDdIrd4IhC9evWUT8k+3QlAv+fqGHP7gwfx7G2
         hMROFhmWnRwmE6RCybA8egxBf0YLOTst1Y+Yu9lWxEqDH/eSo3xKdr4d7p+jZuyb0T4A
         OlcaVWQihJfjn2XFvJZliFQmCDj7iLiN2wO2OeAPLvA2NswxQRuXMYTVNR+kJ5gg9zOI
         6EMSbWPkiNLYcj7Rh0rE090lM2m+r2N1P6kaWXQ5xPJUgnWtiecAtNi48Km17nWTSDvg
         bsej/E1FpDfutDL7/Crlcf9Uz+2XzS9wrjIhIzyf+FDLmFhtDrCwLVUgiWrOcb2ICsaa
         yC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8QHcM8ypCvCuFTilnzg+Tu9JW8e3hCoZSCoHDwtODaU=;
        b=nVkSYq+gIypPogUop2ASsUPXuWwzQUo756b/6yPuTDi3zkzouz6zkGgSedaGXdoqob
         BPR7/Vl3MyoOB9onY3okC0vMpLoyd593FNa/sqjLweCSq6sjsZqM27gxzCCjGKjnKffb
         SqPdPJAe1azBQI/Cq+rCRLfOQIvrGq1BJWF2qZ6yQapGYtpQYaFrReOlOc580AL1YOWS
         TDakjVveJeNH5Q1kTSGcmhRM2LxUhE9mCwjHZEOVYTKJ+k4d0TredYBEmhGs/hsf2SBP
         omsuwRRHsZSx5IpX1l2c3RDkNeJAKFsI46aIQvAtWNX08VSNhF0hjxDKHyFfVZiVpTJO
         RN5Q==
X-Gm-Message-State: AOAM532VyiAQhP18wRLs41Zu7U6np3VyfEpzmWLHeiJMKPk9V5uTegha
	oyC7hbY3JQwv06ALZQms5Z8=
X-Google-Smtp-Source: ABdhPJx+/kV96wVG0ZJcV+O5fvhL5mnqbo1wa033HIKqvDfjL85suFnbaukSpjRZCq+4+F8cI9iqfw==
X-Received: by 2002:adf:fac7:: with SMTP id a7mr6814972wrs.341.1631441335501;
        Sun, 12 Sep 2021 03:08:55 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id k18sm3716299wmi.25.2021.09.12.03.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 03:08:55 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove macro GET_EEPROM_EFUSE_PRIV
Date: Sun, 12 Sep 2021 12:08:36 +0200
Message-Id: <20210912100836.4655-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace and remove the macro GET_EEPROM_EFUSE_PRIV to get one step
closer to remove hal_intf.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
Tested on x86_64 with Inter-Tech DMG-02.

 drivers/staging/r8188eu/core/rtw_efuse.c        | 8 ++++----
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 4 ++--
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c   | 2 +-
 drivers/staging/r8188eu/hal/usb_halinit.c       | 6 +++---
 drivers/staging/r8188eu/include/hal_intf.h      | 2 --
 drivers/staging/r8188eu/os_dep/ioctl_linux.c    | 4 ++--
 6 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
index 47c4d8bf5daf..0c4ea1e45842 100644
--- a/drivers/staging/r8188eu/core/rtw_efuse.c
+++ b/drivers/staging/r8188eu/core/rtw_efuse.c
@@ -598,7 +598,7 @@ efuse_ShadowRead1Byte(
 		u16 Offset,
 		u8 *Value)
 {
-	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(pAdapter);
+	struct eeprom_priv *pEEPROM = &pAdapter->eeprompriv;
 
 	*Value = pEEPROM->efuse_eeprom_data[Offset];
 
@@ -611,7 +611,7 @@ efuse_ShadowRead2Byte(
 		u16 Offset,
 		u16 *Value)
 {
-	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(pAdapter);
+	struct eeprom_priv *pEEPROM = &pAdapter->eeprompriv;
 
 	*Value = pEEPROM->efuse_eeprom_data[Offset];
 	*Value |= pEEPROM->efuse_eeprom_data[Offset + 1] << 8;
@@ -625,7 +625,7 @@ efuse_ShadowRead4Byte(
 		u16 Offset,
 		u32 *Value)
 {
-	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(pAdapter);
+	struct eeprom_priv *pEEPROM = &pAdapter->eeprompriv;
 
 	*Value = pEEPROM->efuse_eeprom_data[Offset];
 	*Value |= pEEPROM->efuse_eeprom_data[Offset + 1] << 8;
@@ -684,7 +684,7 @@ void EFUSE_ShadowMapUpdate(
 	u8 efuseType,
 	bool pseudo)
 {
-	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(pAdapter);
+	struct eeprom_priv *pEEPROM = &pAdapter->eeprompriv;
 	u16 mapLen = 0;
 
 	rtl8188e_EFUSE_GetEfuseDefinition(pAdapter, efuseType, TYPE_EFUSE_MAP_LEN, (void *)&mapLen, pseudo);
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 5ea96a5ac630..493a7bf3c894 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1841,7 +1841,7 @@ s32 InitLLTTable(struct adapter *padapter, u8 txpktbuf_bndy)
 void
 Hal_InitPGData88E(struct adapter *padapter)
 {
-	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
+	struct eeprom_priv *pEEPROM = &padapter->eeprompriv;
 
 	if (!pEEPROM->bautoload_fail_flag) { /*  autoload OK. */
 		if (!is_boot_from_eeprom(padapter)) {
@@ -1861,7 +1861,7 @@ Hal_EfuseParseIDCode88E(
 		u8 *hwinfo
 	)
 {
-	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
+	struct eeprom_priv *pEEPROM = &padapter->eeprompriv;
 	u16			EEPROMId;
 
 	/*  Check 0x8129 again for making sure autoload status!! */
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 94febe0edd35..521ecdbe5520 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -532,7 +532,7 @@ void storePwrIndexDiffRateOffset(struct adapter *Adapter, u32 RegAddr, u32 BitMa
 
 static	int phy_BB8188E_Config_ParaFile(struct adapter *Adapter)
 {
-	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(Adapter);
+	struct eeprom_priv *pEEPROM = &Adapter->eeprompriv;
 	struct hal_data_8188e		*pHalData = GET_HAL_DATA(Adapter);
 	int			rtStatus = _SUCCESS;
 
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index c5347c5459d6..96db24c33603 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1124,7 +1124,7 @@ static void Hal_EfuseParseMACAddr_8188EU(struct adapter *adapt, u8 *hwinfo, bool
 {
 	u16 i;
 	u8 sMacAddr[6] = {0x00, 0xE0, 0x4C, 0x81, 0x88, 0x02};
-	struct eeprom_priv *eeprom = GET_EEPROM_EFUSE_PRIV(adapt);
+	struct eeprom_priv *eeprom = &adapt->eeprompriv;
 
 	if (AutoLoadFail) {
 		for (i = 0; i < 6; i++)
@@ -1140,7 +1140,7 @@ readAdapterInfo_8188EU(
 		struct adapter *adapt
 	)
 {
-	struct eeprom_priv *eeprom = GET_EEPROM_EFUSE_PRIV(adapt);
+	struct eeprom_priv *eeprom = &adapt->eeprompriv;
 
 	/* parse the eeprom/efuse content */
 	Hal_EfuseParseIDCode88E(adapt, eeprom->efuse_eeprom_data);
@@ -1164,7 +1164,7 @@ static void _ReadPROMContent(
 	struct adapter *Adapter
 	)
 {
-	struct eeprom_priv *eeprom = GET_EEPROM_EFUSE_PRIV(Adapter);
+	struct eeprom_priv *eeprom = &Adapter->eeprompriv;
 	u8 eeValue;
 
 	/* check system boot selection */
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index c1e120593574..18e5d0c366fc 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -172,8 +172,6 @@ struct hal_ops {
 
 #define HARDWARE_TYPE_RTL8188EU 17
 
-#define GET_EEPROM_EFUSE_PRIV(adapter) (&adapter->eeprompriv)
-
 #define is_boot_from_eeprom(adapter) (adapter->eeprompriv.EepromOrEfuse)
 
 void rtl8188eu_set_hal_ops(struct adapter *padapter);
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 911bcb69d008..a990bbf3116c 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -4501,7 +4501,7 @@ static int rtw_mp_efuse_get(struct net_device *dev,
 			union iwreq_data *wdata, char *extra)
 {
 	struct adapter *padapter = rtw_netdev_priv(dev);
-	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
+	struct eeprom_priv *pEEPROM = &padapter->eeprompriv;
 	struct hal_data_8188e *haldata = GET_HAL_DATA(padapter);
 	struct efuse_hal *pEfuseHal;
 	struct iw_point *wrqu;
@@ -6138,7 +6138,7 @@ static int rtw_mp_QueryDrv(struct net_device *dev,
 	struct adapter *padapter = rtw_netdev_priv(dev);
 	char	*input = kmalloc(wrqu->data.length, GFP_KERNEL);
 	u8 qAutoLoad = 1;
-	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
+	struct eeprom_priv *pEEPROM = &padapter->eeprompriv;
 
 	if (!input)
 		return -ENOMEM;
-- 
2.33.0

