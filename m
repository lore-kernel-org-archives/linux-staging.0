Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689E5A956
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 12:08:43 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c43b4b02c1so6433025ad.3
        for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 05:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695298122; x=1695902922; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/2v/I6FDfxwDewdHfLw9/C7Dy7lwZoTd7fAGsGtJI1Q=;
        b=BM6dkRPkeMqgVwih1VNS4GVFHm/GOqwrVh+6tul3wUKVQQPlbwh77tZpYlUn+0do7Q
         V1bN5ruQ+sH07w0Xgke9D26+GfB6goZCXDqZyux6pf7/mSFPY2NLcC9f8H0Vvda7w3im
         Msktb711ej7iw6DJWb1whDyhfXsE8lMLy/mbatZ1VmtjOvF0aEOzXJPkaWoAbN7kO8Lu
         L79Fv23PsHgW81GHXpfj6M+8F8yFrR4dIgnIhodT7qnbuGaxww+J/oVLMDL/xKemxiJn
         V9TSCkqhsGTya49eRt3jsmHB9s5AqZG65MWrNaZVKYItDsOAEx4qR1TWG3lAQOdPK0Co
         R/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695298122; x=1695902922;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2v/I6FDfxwDewdHfLw9/C7Dy7lwZoTd7fAGsGtJI1Q=;
        b=bvYFZnIROxENvZyvBztO1nxqX4jBQ1Ytt1iWoY6tzhBqqIDr5NuXheF2buL6cJP0mT
         2uCMB6157k3KbMF8wGpHQR0NCpHNk92AqKFJUYXJh46Iagurx7DBPXAxw8nbuSJssPvX
         hhF1GAnBT+FqDtb4jf3KY9KLvVtdLG90DZv1YVTW/FQx7uGdbCZgLEPOWI6QN/wGIP95
         2wZtklKayd1XeGRo9vcZmXd3N8SYUqM+f3bDlFsdhFaKjoJeEBzewIct1RTnqHxlTKoa
         mhvWAGf6QxxGJAycRyFVH4KrudukyjLdSBJaWgH4kQebNBRH7Mgvjuk+qb7V81uKYE+4
         XBdw==
X-Gm-Message-State: AOJu0YwhE/y+16TqlyYamToycwtVyV3LLImHxKV85pDGWVz+vZ70kVbL
	kgb7gFjn0XzirZac8J3TUo4=
X-Google-Smtp-Source: AGHT+IHzNJ+MR2WYl99AUt8jzIB78HYqXd8OJrcNXJ/4aiHdcHf6sg9cBICT6v7sIgOvlzIVVG7O1A==
X-Received: by 2002:a17:902:e541:b0:1bd:f7d7:3bcd with SMTP id n1-20020a170902e54100b001bdf7d73bcdmr5602780plf.50.1695298122441;
        Thu, 21 Sep 2023 05:08:42 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([122.162.88.67])
        by smtp.gmail.com with ESMTPSA id e2-20020a170902d38200b001ab2b4105ddsm1322951pld.60.2023.09.21.05.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 05:08:41 -0700 (PDT)
Date: Thu, 21 Sep 2023 17:38:37 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vt6655: Type encoding info dropped from variable
 "byRFType"
Message-ID: <ZQwyRXFHA9hTLcyv@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

variable name "byRFType" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/baseband.c    | 12 ++++++------
 drivers/staging/vt6655/card.c        |  4 ++--
 drivers/staging/vt6655/channel.c     |  4 ++--
 drivers/staging/vt6655/device.h      |  2 +-
 drivers/staging/vt6655/device_main.c |  6 +++---
 drivers/staging/vt6655/rf.c          | 14 +++++++-------
 drivers/staging/vt6655/rf.h          |  2 +-
 7 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index 55224918794b..0ae2ab3987c6 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -1979,7 +1979,7 @@ bool bb_write_embedded(struct vnt_private *priv, unsigned char by_bb_addr,
  *  In:
  *      iobase      - I/O base address
  *      byRevId     - Revision ID
- *      byRFType    - RF type
+ *      rf_type     - RF type
  *  Out:
  *      none
  *
@@ -1992,10 +1992,10 @@ bool bb_vt3253_init(struct vnt_private *priv)
 	bool result = true;
 	int        ii;
 	void __iomem *iobase = priv->port_offset;
-	unsigned char by_rf_type = priv->byRFType;
+	unsigned char rf_type = priv->rf_type;
 	unsigned char by_local_id = priv->local_id;
 
-	if (by_rf_type == RF_RFMD2959) {
+	if (rf_type == RF_RFMD2959) {
 		if (by_local_id <= REV_ID_VT3253_A1) {
 			for (ii = 0; ii < CB_VT3253_INIT_FOR_RFMD; ii++)
 				result &= bb_write_embedded(priv,
@@ -2024,7 +2024,7 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		priv->dbm_threshold[1] = -50;
 		priv->dbm_threshold[2] = 0;
 		priv->dbm_threshold[3] = 0;
-	} else if ((by_rf_type == RF_AIROHA) || (by_rf_type == RF_AL2230S)) {
+	} else if ((rf_type == RF_AIROHA) || (rf_type == RF_AL2230S)) {
 		for (ii = 0; ii < CB_VT3253B0_INIT_FOR_AIROHA2230; ii++)
 			result &= bb_write_embedded(priv,
 				vt3253b0_airoha2230[ii][0],
@@ -2042,7 +2042,7 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		priv->dbm_threshold[1] = -48;
 		priv->dbm_threshold[2] = 0;
 		priv->dbm_threshold[3] = 0;
-	} else if (by_rf_type == RF_UW2451) {
+	} else if (rf_type == RF_UW2451) {
 		for (ii = 0; ii < CB_VT3253B0_INIT_FOR_UW2451; ii++)
 			result &= bb_write_embedded(priv,
 				vt3253b0_uw2451[ii][0],
@@ -2064,7 +2064,7 @@ bool bb_vt3253_init(struct vnt_private *priv)
 		priv->dbm_threshold[1] = -50;
 		priv->dbm_threshold[2] = 0;
 		priv->dbm_threshold[3] = 0;
-	} else if (by_rf_type == RF_VT3226) {
+	} else if (rf_type == RF_VT3226) {
 		for (ii = 0; ii < CB_VT3253B0_INIT_FOR_AIROHA2230; ii++)
 			result &= bb_write_embedded(priv,
 				vt3253b0_airoha2230[ii][0],
diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index c680925b9c92..bec39c72d540 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -228,7 +228,7 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 		}
 	}
 
-	if (priv->byRFType == RF_RFMD2959) {
+	if (priv->rf_type == RF_RFMD2959) {
 		/*
 		 * bcs TX_PE will reserve 3 us hardware's processing
 		 * time here is 2 us.
@@ -356,7 +356,7 @@ void CARDbRadioPowerOff(struct vnt_private *priv)
 	if (priv->radio_off)
 		return;
 
-	switch (priv->byRFType) {
+	switch (priv->rf_type) {
 	case RF_RFMD2959:
 		vt6655_mac_word_reg_bits_off(priv->port_offset, MAC_REG_SOFTPWRCTL,
 					     SOFTPWRCTL_TXPEINV);
diff --git a/drivers/staging/vt6655/channel.c b/drivers/staging/vt6655/channel.c
index 4122875ebcaa..e90e0b43505d 100644
--- a/drivers/staging/vt6655/channel.c
+++ b/drivers/staging/vt6655/channel.c
@@ -101,12 +101,12 @@ bool set_channel(struct vnt_private *priv, struct ieee80211_channel *ch)
 	 */
 
 	priv->byCurrentCh = ch->hw_value;
-	ret &= RFbSelectChannel(priv, priv->byRFType,
+	ret &= RFbSelectChannel(priv, priv->rf_type,
 				ch->hw_value);
 
 	/* Init Synthesizer Table */
 	if (priv->bEnablePSMode)
-		rf_write_wake_prog_syn(priv, priv->byRFType, ch->hw_value);
+		rf_write_wake_prog_syn(priv, priv->rf_type, ch->hw_value);
 
 	bb_software_reset(priv);
 
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index c272a4ab2fa0..8c90539cc3d7 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -153,7 +153,7 @@ struct vnt_private {
 
 	/* Version control */
 	unsigned char local_id;
-	unsigned char byRFType;
+	unsigned char rf_type;
 
 	unsigned char max_pwr_level;
 	unsigned char byZoneType;
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 45e5eccadb44..f76f482f4c06 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1792,10 +1792,10 @@ vt6655_probe(struct pci_dev *pcid, const struct pci_device_id *ent)
 	vt6655_mac_read_ether_addr(priv->port_offset, priv->abyCurrentNetAddr);
 
 	/* Get RFType */
-	priv->byRFType = SROMbyReadEmbedded(priv->port_offset, EEP_OFS_RFTYPE);
-	priv->byRFType &= RF_MASK;
+	priv->rf_type = SROMbyReadEmbedded(priv->port_offset, EEP_OFS_RFTYPE);
+	priv->rf_type &= RF_MASK;
 
-	dev_dbg(&pcid->dev, "RF Type = %x\n", priv->byRFType);
+	dev_dbg(&pcid->dev, "RF Type = %x\n", priv->rf_type);
 
 	device_get_options(priv);
 	device_set_options(priv);
diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index 1fadc2fc4412..bf9a10563b12 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -268,7 +268,7 @@ static bool RFbAL2230SelectChannel(struct vnt_private *priv, unsigned char byCha
  * Parameters:
  *  In:
  *      byBBType
- *      byRFType
+ *      rf_type
  *  Out:
  *      none
  *
@@ -279,7 +279,7 @@ bool RFbInit(struct vnt_private *priv)
 {
 	bool ret = true;
 
-	switch (priv->byRFType) {
+	switch (priv->rf_type) {
 	case RF_AIROHA:
 	case RF_AL2230S:
 		priv->max_pwr_level = AL2230_PWR_IDX_LEN;
@@ -300,7 +300,7 @@ bool RFbInit(struct vnt_private *priv)
  *
  * Parameters:
  *  In:
- *      byRFType
+ *      rf_type
  *      byChannel    - Channel number
  *  Out:
  *      none
@@ -308,12 +308,12 @@ bool RFbInit(struct vnt_private *priv)
  * Return Value: true if succeeded; false if failed.
  *
  */
-bool RFbSelectChannel(struct vnt_private *priv, unsigned char byRFType,
+bool RFbSelectChannel(struct vnt_private *priv, unsigned char rf_type,
 		      u16 byChannel)
 {
 	bool ret = true;
 
-	switch (byRFType) {
+	switch (rf_type) {
 	case RF_AIROHA:
 	case RF_AL2230S:
 		ret = RFbAL2230SelectChannel(priv, byChannel);
@@ -470,7 +470,7 @@ bool RFbRawSetPower(struct vnt_private *priv, unsigned char byPwr,
 	if (byPwr >= priv->max_pwr_level)
 		return false;
 
-	switch (priv->byRFType) {
+	switch (priv->rf_type) {
 	case RF_AIROHA:
 		ret &= IFRFbWriteEmbedded(priv, al2230_power_table[byPwr]);
 		if (rate <= RATE_11M)
@@ -521,7 +521,7 @@ RFvRSSITodBm(struct vnt_private *priv, unsigned char byCurrRSSI, long *pldBm)
 	long a = 0;
 	unsigned char abyAIROHARF[4] = {0, 18, 0, 40};
 
-	switch (priv->byRFType) {
+	switch (priv->rf_type) {
 	case RF_AIROHA:
 	case RF_AL2230S:
 		a = abyAIROHARF[byIdx];
diff --git a/drivers/staging/vt6655/rf.h b/drivers/staging/vt6655/rf.h
index 9fef81846a9f..6f842ac00526 100644
--- a/drivers/staging/vt6655/rf.h
+++ b/drivers/staging/vt6655/rf.h
@@ -58,7 +58,7 @@
 /*---------------------  Export Functions  --------------------------*/
 
 bool IFRFbWriteEmbedded(struct vnt_private *priv, unsigned long dwData);
-bool RFbSelectChannel(struct vnt_private *priv, unsigned char byRFType, u16 byChannel);
+bool RFbSelectChannel(struct vnt_private *priv, unsigned char rf_type, u16 byChannel);
 bool RFbInit(struct vnt_private *priv);
 bool rf_write_wake_prog_syn(struct vnt_private *priv, unsigned char rf_type, u16 channel);
 bool RFbSetPower(struct vnt_private *priv, unsigned int rate, u16 uCH);
-- 
2.34.1

