Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7488312815
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 17:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779730589; cv=none; b=Z/E91v1yHMHcP+xwftZw0tuYcPotfjdvcJYLpJDaDO0YBtQOULC4y6Vup5pR+GptO6nMG9jwqZ3PyQHw9CAlRPVhyXZaLhwveZ2sCSU/rSHsVmun58H481xfQ9uasYhZIJaCpWd7A47p2pjq/pVFDaxd6gsf2+xcOduMwEE+iWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779730589; c=relaxed/simple;
	bh=QWzWJM8B1ow+zKf6LHvTRzu4lOXvT4vELeHRJrindYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jqgi4PC7YRVvCM7lITK3v+a/m8U9fpmmABDSJzK/FrcRDsTX0DFM/J52VgPdmkI/4o1bba2faiE1fOMhtmnnURi94WBjPcDpN3L3qVZMim+v8ktcvE0MPQdVg0X+MWhZD7WWHg3kbBwTivJ2b0cOc09kIYuN9r1+TbeUUo/UZDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b=FVw8Mi6k; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=artur.ugnivenko@gmx.de header.b="FVw8Mi6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779730580; x=1780335380; i=artur.ugnivenko@gmx.de;
	bh=W81HFblId8216k3Sg7DLrgKrN6PEh34yZ4GSWqdAXiY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FVw8Mi6keXytDossOm5VoAW1Xraz75qA5fG2KVCqbgJzEtGAxhp1R7kCoL2F7RRo
	 2wMnqzOd/U6teG5oBRgcv/yVhZHlDX51rEzF+rZzdJbJHNmVj9cyt1Dw772rLaDWY
	 1g3inaMMztudjNNrGjj1onvgGtTnICHLDcFZKNyHWh1aAGOJjsBj3V37L8uZyWzGu
	 FwhDri7J6S6zcoEcEdr4nmx/cqGuayY8S+c9RW7WZk1t7hvp9Jf9YyM4WFLo4c/tE
	 /wcu5WZbEvj7tCl9CRdS8Zs5W4NH+/eZ3voEl9SEs1FiBFGHpnt/SqqJiolR3zHcT
	 b7157+28ovSqE1hw/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPokN-1wfgG72pIx-00Vx2v; Mon, 25
 May 2026 19:36:20 +0200
From: artur.ugnivenko@gmx.de
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	ahmet@sezginduran.net,
	error27@gmail.com,
	Artur Ugnivenko <artur.ugnivenko@gmx.de>
Subject: [PATCH v8 3/3] staging: rtl8723bs: refactor queue priority initialization
Date: Mon, 25 May 2026 19:36:19 +0200
Message-ID: <20260525173619.5012-1-artur.ugnivenko@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525163532.20317-3-artur.ugnivenko@gmx.de>
References: <20260525163532.20317-3-artur.ugnivenko@gmx.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:y9dxUDIRgBCl7s5whRXyPRPruaEZ5SGsK3LgS23bbRA9Ii7ScYY
 lerabVLap+veprD4CssKO3l4bcpEHARyrg6DSFHrShk3UKN7T7RbU2Yg/jxRSh1y2HfcgbI
 ihFQ820jWEGR3A23nsL4ZI3Iq4MawpuZpgwS30chrvyHmliggZvFdFont/SjZSGAC7eYaKJ
 gjhd2g4W5JFS0fyDjk2Lw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cTse6AVc194=;srOvdlHOq/YwPyNGxCuQRs9sLAp
 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
 fnnMpD/bFf6SlWMMyY=

From: Artur Ugnivenko <artur.ugnivenko@gmx.de>

Pack individual priority values into an enum-indexed array
to simplify the initialization code and prevent passing around
six loose values as function parameters.

Signed-off-by: Artur Ugnivenko <artur.ugnivenko@gmx.de>
=2D--
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

 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 108 +++++++++---------
 drivers/staging/rtl8723bs/include/drv_types.h |  10 ++
 2 files changed, 65 insertions(+), 53 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/stagin=
g/rtl8723bs/hal/sdio_halinit.c
index 6f2aea984b30..01911188fd44 100644
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
@@ -231,17 +224,18 @@ static void _InitNormalChipOneOutEpPriority(struct a=
dapter *Adapter)
 		break;
 	}
=20
-	_InitNormalChipRegPriority(
-		Adapter, value, value, value, value, value, value
-	);
+	u16 queues[TX_Q_MAX];
+
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
=20
 	u16 valueHi =3D 0;
 	u16 valueLow =3D 0;
@@ -263,50 +257,58 @@ static void _InitNormalChipTwoOutEpPriority(struct a=
dapter *Adapter)
 		break;
 	}
=20
+	u16 typical_queues[TX_Q_MAX] =3D {
+		[TX_Q_BE] =3D valueLow,
+		[TX_Q_BK] =3D valueLow,
+		[TX_Q_VI] =3D valueHi,
+		[TX_Q_VO] =3D valueHi,
+		[TX_Q_MGT] =3D valueHi,
+		[TX_Q_HI] =3D valueHi,
+	};
+
+	u16 wmm_queues[TX_Q_MAX] =3D {
+		[TX_Q_BE] =3D valueLow,
+		[TX_Q_BK] =3D valueHi,
+		[TX_Q_VI] =3D valueHi,
+		[TX_Q_VO] =3D valueLow,
+		[TX_Q_MGT] =3D valueHi,
+		[TX_Q_HI] =3D valueHi,
+	};
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
+
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

