Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15892E4257
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 18:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779991682; cv=none; b=oO/UP/+YbwpTxHI4E9BnItQzg8xkCI4kIP1Oa3MKEmCIwaU8ZMWCiCNwNtAfDCXPSoVDM4xc5A8XhYJFPGlaKBaSHeyofqPVqa1lQkCnekAVO3Fy2oBtbznoWOg+CMKxy9o3f8Fx7CnRRTUC6X4oS1t4EjedQJI8ds+b4EQEfvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779991682; c=relaxed/simple;
	bh=UxUqxTowi0TawentElZ4uFo/CBXvEW5vxjicuM7J/Ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f7ivKyARaXtCvNIvRtLIzbujJ8Pn9eav5/GFNM9pHtGn5dyESYj+UG3jLaMxWIdKSu7z8Rlm9KLQi0dszlSpMAainNSuADS0SakZ/2thy6RbI+LqmQmvNOnEFp4znXAAaM5ZBfVSrblFICs97GwJLyF/ID0wvpNhwDaVvV4+1tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=Oc4eiPX3; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="Oc4eiPX3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779991678; x=1780596478; i=artur.ugnivenko@gmx.de;
	bh=Q4EriV4fZCAWs6oMDyvCgG/aDKqqfmINuprxk66JJg0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Oc4eiPX317FS5uHdx3C9sljakmG1cWtuRMaosqIXYBBPTdaH5nrcqUFLuEE2acPW
	 XJx73hQeDvVenjmBqfe5pjTjJy9fEYyFqA0Ms2c4HURNszlUlNxo8V8Sb5wiMsNMr
	 kYoMITIHfS7mN3LnwKZZw0cczLrpvI5OkXfoJZK/BPoAuW8fz21aN9hQ+bBJXTFNb
	 rQrtu6xnc0No6THAozZDXOPmx6zw+L4ayPdFYidjg7WmgiAoDp4G/lCnqaufJVhfN
	 y8mqsYK8IBH1k2uPjASHcxw85OjvELtCaD10PoUNyDue8gTUm7EjGOwPP8rHXRf4K
	 fjiyukr89pYS6cJewQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MS3mz-1wrnhF22xf-00Z0cF; Thu, 28
 May 2026 20:07:58 +0200
From: artur.ugnivenko@gmx.de
To: gregkh@linuxfoundation.org
Cc: ahmet@sezginduran.net,
	error27@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Artur Ugnivenko <artur.ugnivenko@gmx.de>
Subject: [PATCH v9 3/3] staging: rtl8723bs: refactor queue priority initialization
Date: Thu, 28 May 2026 20:07:57 +0200
Message-ID: <20260528180757.19082-1-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260528170645.30861-1-artur.ugnivenko@gmx.de>
References: <20260528170645.30861-1-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kypa+bYCwgeJBS6qlgaNLpXacbun9frxnBMlKFD/5YcZPdhM5Ma
 /URoJIVFeqDenFnIeaw+6AfLmaWUIja1a5psNixAg+URF1C9y56xqNs1kv9DbqKqmmV/fF6
 SV9AIlEm87L4FPa6PtPoMTcIu/63saFnqOj2mO7kwldpZ0riXb+4CRsBgom7mcGF7tJu/hX
 vHYyukZf31bma8EceWkcQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3dvuB66WAb4=;sSeFh3s7eJmfF5hKjEsy0S8SSCL
 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

From: Artur Ugnivenko <artur.ugnivenko@gmx.de>

Pack individual priority values into an enum-indexed array
to simplify the initialization code and prevent passing around
six loose values as function parameters.

Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
=2D--
Changes in v9:
- don't declare variables in the middle of functions
- remove unnecessary whitespace
Changes in v8:
- Remove the struct from v7, use an enum-indexed array instead
- Remove other lines ending in parentheses fixes to keep the
  commit small
Changes in v7:
- Add changelog.
- Add transmit_queues struct in include/drv_types.h to improve
  style of _InitNormalChipRegPriority
Changes in v6: Make the patch apply to gregkh/staging-testing.
Changes in v5: No changes in this patch.
Changes in v4: No changes in this patch.
Changes in v3: Split the patch into multiple patches.
Changes in v2: Make patch apply to gregkh/staging-testing.

 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 105 +++++++++---------
 drivers/staging/rtl8723bs/include/drv_types.h |  10 ++
 2 files changed, 62 insertions(+), 53 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/stagin=
g/rtl8723bs/hal/sdio_halinit.c
index 6f2aea984b30..1246c5fdfc32 100644
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
+				       u16 queues[TX_Q_MAX])
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
+		_TXDMA_BEQ_MAP(queues[TX_Q_BE])  |
+		_TXDMA_BKQ_MAP(queues[TX_Q_BK])  |
+		_TXDMA_VIQ_MAP(queues[TX_Q_VI])  |
+		_TXDMA_VOQ_MAP(queues[TX_Q_VO])  |
+		_TXDMA_MGQ_MAP(queues[TX_Q_MGT]) |
+		_TXDMA_HIQ_MAP(queues[TX_Q_HI]);
=20
 	rtw_write16(Adapter, REG_TRXDMA_CTRL, value16);
 }
@@ -214,6 +207,7 @@ static void _InitNormalChipRegPriority(
 static void _InitNormalChipOneOutEpPriority(struct adapter *Adapter)
 {
 	struct hal_com_data *pHalData =3D GET_HAL_DATA(Adapter);
+	u16 queues[TX_Q_MAX];
=20
 	u16 value =3D 0;
=20
@@ -231,17 +225,19 @@ static void _InitNormalChipOneOutEpPriority(struct a=
dapter *Adapter)
 		break;
 	}
=20
-	_InitNormalChipRegPriority(
-		Adapter, value, value, value, value, value, value
-	);
+	for (int i =3D 0; i < TX_Q_MAX; i++)
+		queues[i] =3D value;
=20
+	_InitNormalChipRegPriority(Adapter, queues);
 }
=20
 static void _InitNormalChipTwoOutEpPriority(struct adapter *Adapter)
 {
 	struct hal_com_data *pHalData =3D GET_HAL_DATA(Adapter);
 	struct registry_priv *pregistrypriv =3D &Adapter->registrypriv;
-	u16 beQ, bkQ, viQ, voQ, mgtQ, hiQ;
+
+	u16 typical_queues[TX_Q_MAX];
+	u16 wmm_queues[TX_Q_MAX];
=20
 	u16 valueHi =3D 0;
 	u16 valueLow =3D 0;
@@ -263,50 +259,53 @@ static void _InitNormalChipTwoOutEpPriority(struct a=
dapter *Adapter)
 		break;
 	}
=20
+	typical_queues[TX_Q_BE] =3D valueLow;
+	typical_queues[TX_Q_BK] =3D valueLow;
+	typical_queues[TX_Q_VI] =3D valueHi;
+	typical_queues[TX_Q_VO] =3D valueHi;
+	typical_queues[TX_Q_MGT] =3D valueHi;
+	typical_queues[TX_Q_HI] =3D valueHi;
+
+	wmm_queues[TX_Q_BE] =3D valueLow;
+	wmm_queues[TX_Q_BK] =3D valueHi;
+	wmm_queues[TX_Q_VI] =3D valueHi;
+	wmm_queues[TX_Q_VO] =3D valueLow;
+	wmm_queues[TX_Q_MGT] =3D valueHi;
+	wmm_queues[TX_Q_HI] =3D valueHi;
+
 	if (!pregistrypriv->wifi_spec) {
-		beQ =3D valueLow;
-		bkQ =3D valueLow;
-		viQ =3D valueHi;
-		voQ =3D valueHi;
-		mgtQ =3D valueHi;
-		hiQ =3D valueHi;
+		_InitNormalChipRegPriority(Adapter, typical_queues);
 	} else {
 		/* for WMM , CONFIG_OUT_EP_WIFI_MODE */
-		beQ =3D valueLow;
-		bkQ =3D valueHi;
-		viQ =3D valueHi;
-		voQ =3D valueLow;
-		mgtQ =3D valueHi;
-		hiQ =3D valueHi;
+		_InitNormalChipRegPriority(Adapter, wmm_queues);
 	}
-
-	_InitNormalChipRegPriority(Adapter, beQ, bkQ, viQ, voQ, mgtQ, hiQ);
-
 }
=20
 static void _InitNormalChipThreeOutEpPriority(struct adapter *padapter)
 {
 	struct registry_priv *pregistrypriv =3D &padapter->registrypriv;
-	u16 beQ, bkQ, viQ, voQ, mgtQ, hiQ;
=20
-	if (!pregistrypriv->wifi_spec) {
-		/*  typical setting */
-		beQ =3D QUEUE_LOW;
-		bkQ =3D QUEUE_LOW;
-		viQ =3D QUEUE_NORMAL;
-		voQ =3D QUEUE_HIGH;
-		mgtQ =3D QUEUE_HIGH;
-		hiQ =3D QUEUE_HIGH;
-	} else {
-		/*  for WMM */
-		beQ =3D QUEUE_LOW;
-		bkQ =3D QUEUE_NORMAL;
-		viQ =3D QUEUE_NORMAL;
-		voQ =3D QUEUE_HIGH;
-		mgtQ =3D QUEUE_HIGH;
-		hiQ =3D QUEUE_HIGH;
-	}
-	_InitNormalChipRegPriority(padapter, beQ, bkQ, viQ, voQ, mgtQ, hiQ);
+	u16 typical_queues[TX_Q_MAX] =3D {
+		[TX_Q_BE] =3D QUEUE_LOW,
+		[TX_Q_BK] =3D QUEUE_LOW,
+		[TX_Q_VI] =3D QUEUE_NORMAL,
+		[TX_Q_VO] =3D QUEUE_HIGH,
+		[TX_Q_MGT] =3D QUEUE_HIGH,
+		[TX_Q_HI] =3D QUEUE_HIGH,
+	};
+	u16 wmm_queues[TX_Q_MAX] =3D {
+		[TX_Q_BE] =3D QUEUE_LOW,
+		[TX_Q_BK] =3D QUEUE_NORMAL,
+		[TX_Q_VI] =3D QUEUE_NORMAL,
+		[TX_Q_VO] =3D QUEUE_HIGH,
+		[TX_Q_MGT] =3D QUEUE_HIGH,
+		[TX_Q_HI] =3D QUEUE_HIGH,
+	};
+
+	if (!pregistrypriv->wifi_spec)
+		_InitNormalChipRegPriority(padapter, typical_queues);
+	else
+		_InitNormalChipRegPriority(padapter, wmm_queues);
 }
=20
 static void _InitQueuePriority(struct adapter *Adapter)
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/stagi=
ng/rtl8723bs/include/drv_types.h
index 552d0c5fa47f..b2c43f53571a 100644
=2D-- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -373,6 +373,16 @@ struct adapter {
 	unsigned char     in_cta_test;
 };
=20
+enum transmit_queues {
+	TX_Q_BE =3D 0,
+	TX_Q_BK,
+	TX_Q_VI,
+	TX_Q_VO,
+	TX_Q_MGT,
+	TX_Q_HI,
+	TX_Q_MAX,
+};
+
 #define adapter_to_dvobj(adapter) (adapter->dvobj)
 #define adapter_to_pwrctl(adapter) (dvobj_to_pwrctl(adapter->dvobj))
 #define adapter_wdev_data(adapter) (&((adapter)->wdev_data))
=2D-=20
2.54.0

