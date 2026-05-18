Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F3036C598
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 15:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116844; cv=none; b=K1p+v3N2HEs9JGiOgEyk7TcmSliTklDCxT5A5GXIx76R4Bao1je8nG/KLMoSor8H45D33b73B5aixjMgVJI0ih7SLRBH4ytm4BLNi0ZDALetArhzNKAhHfoAtiinL7mkoW6/G9Qp9XnZWtO13S/kcN5CIE1l0aMUkgFqa5chJgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116844; c=relaxed/simple;
	bh=5tEa5aWW0uR4fcsyIscF6khoBrPM1H5rU6PlRm/ujV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uJ7lGy06KoNeMQw6l/dVo8TSb4PHqTbTgXCuQDn10HE62q4ro3Js6YwEBMpRXN/kgjBO7qkq1d2SKa8djTwq/NAke80fWFKMNQVxOUq9nBSQFSdD50MHBLLeY0TfWYjB1zNK9W8rJvtxxSjiexWm+DA0id67IouJnotvfN9jm+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=jWewYiML; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="jWewYiML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779116834; x=1779721634; i=artur.ugnivenko@gmx.de;
	bh=hZ6pXVEaos/HARoxCl67wHBpA4XS83NRYBH0w+y11CQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=jWewYiMLDgGTrDYF/PIaKBvhf6sBvgRuVFz6lkAEVt66ke0/cEP4UxjUXUKQEG3m
	 +2fYqG2GjIeKQW/dAie/xSekZB+t+UupQjJoOHrchaQ9Syi/GfrxhMK+gga4HEmim
	 WgcSuSUPGBpZXMaZ41wspLnENheg02Hcsvve7kqtTFIZ3RzwKkA7ITNCDQ9mnBU+Y
	 Y3pCC+D07zWsIWbSyPXlNwGOP6QXGh9kA59kXXESquuS9t+0W6Emjl1u0i8YV5XO+
	 n5U2gob3Q7BpJrZiMgNZTlZLunYdeF3jk/3ukXDqiL02ahRO3z5cIZLlkwBv7j692
	 VmsgL7zZNzcdo0iIIA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMobU-1whlQr3Xr2-00RGFy; Mon, 18
 May 2026 17:07:13 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: error27@gmail.com
Cc: ahmet@sezginduran.net,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 4/4] staging: rtl8723bs: fix lines ending in parentheses in hal/sdio_halinit.c
Date: Mon, 18 May 2026 17:07:07 +0200
Message-ID: <20260518150707.18868-2-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518150707.18868-1-artur.ugnivenko@gmx.de>
References: <20260518122543.15266-1-artur.ugnivenko@gmx.de>
 <20260518150707.18868-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:y4iyJ05ADNB5lIQgrvfc2xCgMYoDDIupLEJr+PGsHhGG9HTf++4
 Q7r/eX6kCCs3Mva/+R6hMKWEYpH05bPXjnw0KcPw8bZD8pMlsOYAAWlMUwqs39oU6Uy3zDz
 So9Ozc8O061zRM/5vUc1kpCsTB6ozj3F8XRTJVesRqDnqilBAYivYsU1EKvsb11Ds7Gjj4x
 VlV4JT3XgUCFDU4W+CtNw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xNK5nOsnKF0=;yZNkEAWwC4zXZgZCpynIlOdpB3U
 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
 X9t+h/M1e2qVxmuratv0HSyQMUg=

Fix checkpatch warnings on lines that end in patentheses in
hal/sdio_halinit.c.

Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
=2D--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 49 ++++++++++----------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/stagin=
g/rtl8723bs/hal/sdio_halinit.c
index e6570fa2e8fd..494fb74ad44f 100644
=2D-- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -74,7 +74,7 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 	rtw_write8(padapter, REG_CR, 0x00);
 	/*  Enable MAC DMA/WMAC/SCHEDULE/SEC block */
 	value16 =3D rtw_read16(padapter, REG_CR);
-	value16 |=3D (
+	value16 |=3D
 		HCI_TXDMA_EN |
 		HCI_RXDMA_EN |
 		TXDMA_EN |
@@ -82,8 +82,7 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
 		PROTOCOL_EN |
 		SCHEDULE_EN |
 		ENSEC |
-		CALTMR_EN
-	);
+		CALTMR_EN;
 	rtw_write16(padapter, REG_CR, value16);
=20
 	hal_btcoex_PowerOnSetting(padapter);
@@ -188,15 +187,13 @@ static void _InitTxBufferBoundary(struct adapter *pa=
dapter)
 	rtw_write8(padapter, REG_TDECTRL + 1, txpktbuf_bndy);
 }
=20
-static void _InitNormalChipRegPriority(
-	struct adapter *Adapter,
-	u16 beQ,
-	u16 bkQ,
-	u16 viQ,
-	u16 voQ,
-	u16 mgtQ,
-	u16 hiQ
-)
+static void _InitNormalChipRegPriority(struct adapter *Adapter,
+				       u16 beQ,
+				       u16 bkQ,
+				       u16 viQ,
+				       u16 voQ,
+				       u16 mgtQ,
+				       u16 hiQ)
 {
 	u16 value16 =3D (rtw_read16(Adapter, REG_TRXDMA_CTRL) & 0x7);
=20
@@ -231,9 +228,13 @@ static void _InitNormalChipOneOutEpPriority(struct ad=
apter *Adapter)
 		break;
 	}
=20
-	_InitNormalChipRegPriority(
-		Adapter, value, value, value, value, value, value
-	);
+	_InitNormalChipRegPriority(Adapter,
+				   value,
+				   value,
+				   value,
+				   value,
+				   value,
+				   value);
 }
=20
 static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
@@ -988,9 +989,9 @@ static void _ReadRFType(struct adapter *Adapter)
 	pHalData->rf_chip =3D RF_6052;
 }
=20
-static void Hal_EfuseParseMACAddr_8723BS(
-	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
-)
+static void Hal_EfuseParseMACAddr_8723BS(struct adapter *padapter,
+					 u8 *hwinfo,
+					 bool AutoLoadFail)
 {
 	struct eeprom_priv *pEEPROM =3D GET_EEPROM_EFUSE_PRIV(padapter);
=20
@@ -1002,9 +1003,9 @@ static void Hal_EfuseParseMACAddr_8723BS(
 	}
 }
=20
-static void Hal_EfuseParseBoardType_8723BS(
-	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
-)
+static void Hal_EfuseParseBoardType_8723BS(struct adapter *padapter,
+					   u8 *hwinfo,
+					   bool AutoLoadFail)
 {
 	struct hal_com_data *pHalData =3D GET_HAL_DATA(padapter);
=20
@@ -1192,9 +1193,9 @@ void SetHwRegWithBuf8723B(struct adapter *padapter, =
u8 variable, u8 *pbuf, int l
 /*	Description: */
 /*		Query setting of specified variable. */
 /*  */
-u8 GetHalDefVar8723BSDIO(
-	struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue
-)
+u8 GetHalDefVar8723BSDIO(struct adapter *Adapter,
+			 enum hal_def_variable eVariable,
+			 void *pValue)
 {
 	u8 bResult =3D _SUCCESS;
=20
=2D-=20
2.54.0

