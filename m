Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD2A3FE344
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 12:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106444; cv=none; b=pTufjRNzPabn8k2SgCSkl5jtzoAJJWpxrEwq6Sj8Y0nifuZfW0jUeJsYo426yPBWiaVJqto2h3Tyqfd4wV25ka2MxwNvxYfWc+9FElCXY7kEINcH9ejJoBILUzRFVJZhHEKjYjCnesxro8COyPeZ7waCNVz7SGZtSlzXIxVZ/mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106444; c=relaxed/simple;
	bh=5tEa5aWW0uR4fcsyIscF6khoBrPM1H5rU6PlRm/ujV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=egMIaeCiVgRT6ZlQQqcfCdiUgHec/kM8d1pR2smeYMDHZLIvF4NVSLvHAA/f1OTH1pxgNghr86tczIdzI6kgRNe+Dk9sLlTQwGC6zKeArHVUYuygAfXUS0+r38WhCrqHL27LeIfLz18OEgwuaUX8teOo6LhlMEQ80KgqAnTiNM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=ZRfff8Vb; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="ZRfff8Vb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779106436; x=1779711236; i=artur.ugnivenko@gmx.de;
	bh=hZ6pXVEaos/HARoxCl67wHBpA4XS83NRYBH0w+y11CQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZRfff8VbTWamw4yVJ3PP8G1F5TJK0Ti1JixgWdD0mV5W9h+JJ/5+RFrwCvPc+Efj
	 DL4kgW2SRP6i6igTIlM0QGoBhkRoNFRGWjw6q1AZyLYrFDcBMOOeapofrcOqsYsbq
	 +uNFZgQTfqYAkIuvqwHSRrQtRV4D5WMoQK2f2jQsE+Et8inWhDc7AdNCGz4C1eUZ0
	 z/shty2nyPsjQnXqj+Jw0nIFQiHR5my6q0h37jKYMhouS3JXURTKeIxzlcNo4Wfvg
	 GUETvZmmabFihJ529pdbh+6kCvxW4Jf17sxW33lb7g2W/lnniprTZcRWJ+K4Krapd
	 jrEGLURMNP/6N/7S9Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mo6ux-1x8W5v11BL-00h88O; Mon, 18
 May 2026 14:13:56 +0200
From: Artur Ugnivenko <artur.ugnivenko@gmx.de>
To: error27@gmail.com
Cc: ahmet@sezginduran.net,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 4/4] staging: rtl8723bs: fix lines ending in parentheses in hal/sdio_halinit.c
Date: Mon, 18 May 2026 14:13:55 +0200
Message-ID: <20260518121355.8934-1-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518111207.23143-1-artur.ugnivenko@gmx.de>
References: <20260518111207.23143-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8ywahBqMHSOCLcdYCTgTwlr1gNX6F2fasdEKZbiXpzZgdQoLS7e
 0T0xHM61zKq+pUVmd6at9OcaS5Wgdw2tUfhU9/DyiO0VKTPpu/rGve1G3GiPVWPztbblS8Y
 ok0Olw9GNQ35z0KS3S/ATD4UFBO88vLalXxbbQtN9XSM3gp6v9xOhq6O2qvszxpmbmtNiu3
 WHhBoUQ+T+jAQk0U2AYZw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0VL1Q1+RbeA=;IYz0AGPI2Nn1+j2Bgz1o15yIiIh
 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
 LgRDqg==

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

