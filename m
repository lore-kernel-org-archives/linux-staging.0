Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C688C3D7A0F
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 12:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368176; cv=none; b=m6fn7ZIX+/iyTkZ9sFROfyih09K7SOTgg84czDiZVYZjytyUAupg4Drt7Sga1itXOTzWQgXGrm27B0Efmrj7oTV18RJLFli252eHGKJJzQOTsnC9eJyOA3SjF693cMv5ck6SNn6+Ak6S/nbnJ6hTcntZ3kwt4+rYNtU3RXuYHD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368176; c=relaxed/simple;
	bh=5tEa5aWW0uR4fcsyIscF6khoBrPM1H5rU6PlRm/ujV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hyOaN27FOjG3iDAHUiUdbqnqja4/LYo85W4j/hn+qm3b6Jl+jKuR9OvAluQCLLCjZzW8gO1iPiU0Ug8cRhlEv5z9xPkFAS/bX+SeNDNzx3r01YXtPQKDFBDVegvpVtj3dQF7VC+kbHiPnMd74zQfjc31bXsyWjOw+QVeisl9uFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=MBrjAFKS; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="MBrjAFKS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779368165; x=1779972965; i=artur.ugnivenko@gmx.de;
	bh=hZ6pXVEaos/HARoxCl67wHBpA4XS83NRYBH0w+y11CQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MBrjAFKSmAttnIzR0uJ8Q26BUHj7VZCSyBT4nls5MxiRsI8pA99zThYRymaiTOlV
	 Ycn1AM7AgLL9cbKCnPuy75pGFhg2RfEOCvnvBqNvWO7kNKRVsVvNeY+0ayG8y7CUz
	 /kpEcxYJOzmSgYGLhFkerdgaDsPpOpsYHcBmNB++dJ77djSepU7Wgd5UJz1Kucim6
	 JiZ0yHUfTO2GTYXSAx9Zyu7DcPy9eeBTiIdjwOnxqWHMOuH5rpq5A0OnUFMKjc7x2
	 KvnPkjV2ACQP52wuR1atBOeNdAbiDQqEMrDS89KiQ0huTiSVNWOjEUKkLSY2346yh
	 MrBwEUZyTssN6PW2Yg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mzyyk-1xJp1n08uc-00v2Yp; Thu, 21
 May 2026 14:56:05 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ahmet@sezginduran.net,
	error27@gmail.com
Subject: [PATCH v5 4/4] staging: rtl8723bs: fix lines ending in parentheses in hal/sdio_halinit.c
Date: Thu, 21 May 2026 14:56:04 +0200
Message-ID: <20260521125604.4688-1-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521112345.16604-1-artur.ugnivenko@gmx.de>
References: <20260521112345.16604-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BREAr00v07loKS9J87XqdcQc9kZ8A6wa45GWQ17Mw92rTp5uVzU
 mdV3n+fWMOzUTtxe9K2zI5OybjkBe7R7GPSbiu8WS9ix1eFjNfa0DlakOtUfD+FF4qM0e2G
 Qu0Rw3Z5GGX1yyvytMeO219JvDAewxBA/AYYkrJXLt/WGsQg0XayO9K5N2qGy7FIwbUWMs5
 ZcLcWtnATU3uVUBOkPjAQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:l505ypk80yw=;xrZriw/Ed65c06abh0SilO0XMYn
 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
 w8JLEhyyOuDZqiKDR4ugxzIY9T+rlTD3ukhaU7Y

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

