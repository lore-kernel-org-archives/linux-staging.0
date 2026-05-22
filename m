Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADDC423A72
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 14:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460032; cv=none; b=ptXkW4z3INTRz+xWx0YCDfEBZDQJfZcPS/cjvct7HdGo2RQ3s2Snd4vYG9MxhDzoNj29F+0fRP20KilIAhDGGBH9GCA+CS3xcUGVrWx3qdTxtPzU0Aq2zqdhfFS2EPLQdzoQzwGZkBHac0EjZqURD1KCgWbuHX7hW0/8SGGtpX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460032; c=relaxed/simple;
	bh=At2/m4XViOWSITsrd6B+HJiyKlKBW8qprY1TsbB+EUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dFuH81RboIG7yK4TUfU+qxQ8C7VwVyMvxmtpsOBA4NLoDmIMnwnDq4si+2g5cJ2InnuidaPoRSuaL0vErWo7mvaVBjOToyK8wVMDQ3eKvEoOzuZUoDEU65eLjfgVkKvLvDhZoqKIS+F14WoB7vC7OdpV0+Y4QLGUbSwT+QcevkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=UOala/tH; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="UOala/tH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779460021; x=1780064821; i=artur.ugnivenko@gmx.de;
	bh=ZeVY8XVN6r+kFr/bInaL4GY64BoymZ1wcYapgZhVQaY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=UOala/tHivcqQhppVMzl0RJom18TVo9zzExgJRcp8uMkIDBWg7ubhfsoX54RcMbn
	 +X6qJ7Ru9OsbnLbIaZtilqL4qjvc8PhS8NMYmqmUwuwGIbI1NpDPb+aYzE1wemIRD
	 m55+1s2CeQLQh3fcsseZNJxhECzEi7yzF/SDfRWRLNixw28xc+lGwi5CGaktfpqsk
	 ZbtkPlVFhWa0ieov3ByVU0ezRH5ymmt79VFzJ1TREYamJVH1jgRtLVdTCuSnpEEOx
	 BlwoWydz3yh+OFyiZkghtljTISiuggLucFyHfapfTV6nL2iTxGIXSWXNV/vNgcoOa
	 sXNDevtKNfVsWxViqw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGyxN-1wVdUV3tYp-003KR7; Fri, 22
 May 2026 16:27:01 +0200
From: artur.ugnivenko@gmx.de
To: gregkh@linuxfoundation.org
Cc: ahmet@sezginduran.net,
	error27@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Artur Ugnivenko <artur.ugnivenko@gmx.de>
Subject: [PATCH v7 3/3] staging: rtl8723bs: fix lines ending in parentheses in hal/sdio_halinit.c
Date: Fri, 22 May 2026 16:27:00 +0200
Message-ID: <20260522142700.23335-1-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522132001.4771-1-artur.ugnivenko@gmx.de>
References: <20260522132001.4771-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KcdtVM9cu29B/0JTvNwDiBLs1luIe8mZLhU5cfu6fgymk382D9S
 XWoJfGur0fsC4hjk7J7I3No1nUA17MJaK11P+/r6HC1RJi9UMOF+8SQOd4WF9XZT6YiwVtJ
 QJwxVVCX7Yf92HGIzadJhSYtKu+xLGmowVtBpPiOGaum3Wt41K9HT1C1bSwj3/onK1qf2hz
 2/KBzJWPTRPCFMYvmWV7A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0gp0IoTeXfU=;KqJFFODb/8pyzW4yKhf/N7IUH/t
 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

From: Artur Ugnivenko <artur.ugnivenko@gmx.de>

Fix checkpatch warnings on lines that end in patentheses in
hal/sdio_halinit.c.

In _InitNormalChipRegPriority specifically pack all of the
queues into a struct, to pass that as one argument instead of
six individual values, so that those lines can be shortened and
not end in parentheses.

Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
=2D--
Changes in v7:
- Add changelog.
- Add transmit_queues struct in include/drv_types.h to improve
  style of _InitNormalChipRegPriority
Changes in v6: Make the patch apply to gregkh/staging-testing.
Changes in v5: No changes in this patch.
Changes in v4: No changes in this patch.
Changes in v3: Split the patch into multiple patches.
Changes in v2: Make patch apply to gregkh/staging-testing.

 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 110 +++++++++---------
 drivers/staging/rtl8723bs/include/drv_types.h |   9 ++
 2 files changed, 63 insertions(+), 56 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/stagin=
g/rtl8723bs/hal/sdio_halinit.c
index 6f2aea984b30..81cd5b315bb7 100644
=2D-- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -188,25 +188,18 @@ static void _InitTxBufferBoundary(struct adapter *pa=
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
+				       struct transmit_queues queues)
 {
 	u16 value16 =3D (rtw_read16(Adapter, REG_TRXDMA_CTRL) & 0x7);
=20
 	value16 |=3D
-		_TXDMA_BEQ_MAP(beQ)  |
-		_TXDMA_BKQ_MAP(bkQ)  |
-		_TXDMA_VIQ_MAP(viQ)  |
-		_TXDMA_VOQ_MAP(voQ)  |
-		_TXDMA_MGQ_MAP(mgtQ) |
-		_TXDMA_HIQ_MAP(hiQ);
+		_TXDMA_BEQ_MAP(queues.beQ)  |
+		_TXDMA_BKQ_MAP(queues.bkQ)  |
+		_TXDMA_VIQ_MAP(queues.viQ)  |
+		_TXDMA_VOQ_MAP(queues.voQ)  |
+		_TXDMA_MGQ_MAP(queues.mgtQ) |
+		_TXDMA_HIQ_MAP(queues.hiQ);
=20
 	rtw_write16(Adapter, REG_TRXDMA_CTRL, value16);
 }
@@ -231,17 +224,23 @@ static void _InitNormalChipOneOutEpPriority(struct a=
dapter *Adapter)
 		break;
 	}
=20
-	_InitNormalChipRegPriority(
-		Adapter, value, value, value, value, value, value
-	);
+	struct transmit_queues queues =3D {
+		.beQ =3D value,
+		.bkQ =3D value,
+		.viQ =3D value,
+		.voQ =3D value,
+		.mgtQ =3D value,
+		.hiQ =3D value,
+	};
=20
+	_InitNormalChipRegPriority(Adapter, queues);
 }
=20
 static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
 {
 	struct hal_com_data *pHalData =3D GET_HAL_DATA(Adapter);
 	struct registry_priv *pregistrypriv =3D &Adapter->registrypriv;
-	u16 beQ, bkQ, viQ, voQ, mgtQ, hiQ;
+	struct transmit_queues queues;
=20
 	u16 valueHi =3D 0;
 	u16 valueLow =3D 0;
@@ -264,49 +263,48 @@ static void _InitNormalChipTwoOutEpPriority(struct a=
dapter *Adapter)
 	}
=20
 	if (!pregistrypriv->wifi_spec) {
-		beQ =3D valueLow;
-		bkQ =3D valueLow;
-		viQ =3D valueHi;
-		voQ =3D valueHi;
-		mgtQ =3D valueHi;
-		hiQ =3D valueHi;
+		queues.beQ =3D valueLow;
+		queues.bkQ =3D valueLow;
+		queues.viQ =3D valueHi;
+		queues.voQ =3D valueHi;
+		queues.mgtQ =3D valueHi;
+		queues.hiQ =3D valueHi;
 	} else {
 		/* for WMM , CONFIG_OUT_EP_WIFI_MODE */
-		beQ =3D valueLow;
-		bkQ =3D valueHi;
-		viQ =3D valueHi;
-		voQ =3D valueLow;
-		mgtQ =3D valueHi;
-		hiQ =3D valueHi;
+		queues.beQ =3D valueLow;
+		queues.bkQ =3D valueHi;
+		queues.viQ =3D valueHi;
+		queues.voQ =3D valueLow;
+		queues.mgtQ =3D valueHi;
+		queues.hiQ =3D valueHi;
 	}
=20
-	_InitNormalChipRegPriority(Adapter, beQ, bkQ, viQ, voQ, mgtQ, hiQ);
-
+	_InitNormalChipRegPriority(Adapter, queues);
 }
=20
 static void _InitNormalChipThreeOutEpPriority(struct adapter *padapter)
 {
 	struct registry_priv *pregistrypriv =3D &padapter->registrypriv;
-	u16 beQ, bkQ, viQ, voQ, mgtQ, hiQ;
+	struct transmit_queues queues;
=20
 	if (!pregistrypriv->wifi_spec) {
 		/*  typical setting */
-		beQ =3D QUEUE_LOW;
-		bkQ =3D QUEUE_LOW;
-		viQ =3D QUEUE_NORMAL;
-		voQ =3D QUEUE_HIGH;
-		mgtQ =3D QUEUE_HIGH;
-		hiQ =3D QUEUE_HIGH;
+		queues.beQ =3D QUEUE_LOW;
+		queues.bkQ =3D QUEUE_LOW;
+		queues.viQ =3D QUEUE_NORMAL;
+		queues.voQ =3D QUEUE_HIGH;
+		queues.mgtQ =3D QUEUE_HIGH;
+		queues.hiQ =3D QUEUE_HIGH;
 	} else {
 		/*  for WMM */
-		beQ =3D QUEUE_LOW;
-		bkQ =3D QUEUE_NORMAL;
-		viQ =3D QUEUE_NORMAL;
-		voQ =3D QUEUE_HIGH;
-		mgtQ =3D QUEUE_HIGH;
-		hiQ =3D QUEUE_HIGH;
+		queues.beQ =3D QUEUE_LOW;
+		queues.bkQ =3D QUEUE_NORMAL;
+		queues.viQ =3D QUEUE_NORMAL;
+		queues.voQ =3D QUEUE_HIGH;
+		queues.mgtQ =3D QUEUE_HIGH;
+		queues.hiQ =3D QUEUE_HIGH;
 	}
-	_InitNormalChipRegPriority(padapter, beQ, bkQ, viQ, voQ, mgtQ, hiQ);
+	_InitNormalChipRegPriority(padapter, queues);
 }
=20
 static void _InitQueuePriority(struct adapter *Adapter)
@@ -988,9 +986,9 @@ static void _ReadRFType(struct adapter *Adapter)
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
@@ -1002,9 +1000,9 @@ static void Hal_EfuseParseMACAddr_8723BS(
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
@@ -1192,9 +1190,9 @@ void SetHwRegWithBuf8723B(struct adapter *padapter, =
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
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/stagi=
ng/rtl8723bs/include/drv_types.h
index 552d0c5fa47f..82dbe5553811 100644
=2D-- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -373,6 +373,15 @@ struct adapter {
 	unsigned char     in_cta_test;
 };
=20
+struct transmit_queues {
+	u16 beQ;
+	u16 bkQ;
+	u16 viQ;
+	u16 voQ;
+	u16 mgtQ;
+	u16 hiQ;
+};
+
 #define adapter_to_dvobj(adapter) (adapter->dvobj)
 #define adapter_to_pwrctl(adapter) (dvobj_to_pwrctl(adapter->dvobj))
 #define adapter_wdev_data(adapter) (&((adapter)->wdev_data))
=2D-=20
2.54.0

