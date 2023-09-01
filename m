Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C6EAD3F;
	Fri,  1 Sep 2023 12:57:19 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68c3b9f8333so1283779b3a.1;
        Fri, 01 Sep 2023 05:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693573039; x=1694177839; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uZU+0v8TpPPD8apUqaqvxmv+rGi7InAfFKqVlhqDeOs=;
        b=NcCJYbK97lChMr4XZvCZVEyivpVfSfQkE2aJ5LBwdJfEKed2JJNFFT7tL8oX7EckQq
         X8ob3EpbHO1T8bFl+9webQq6+W1slY9F6/asQKPVV8Ck0YoCHsZPLSLHlB8g56w872O/
         D6ZoN2QlZyTCwHQzkvTplhUI/H1QsUzeHCUrFx7I8+B9mmKSJp3vGg2E/qZ4eTObB8vL
         J+MigJCLmohXW9bG6Ng/TGBrZZ2Iv4RR+dISh4mVhCze3OkqcL1chQE7E1p4to78tfQw
         BV7AJ5U4wy7Y3IodZU3w9Q4+AhlWxlFVSMLQNKhGw72ZT5lZXORD9Q9FQxlTKTe3yhYq
         KHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693573039; x=1694177839;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uZU+0v8TpPPD8apUqaqvxmv+rGi7InAfFKqVlhqDeOs=;
        b=dSGG9+kN4NnXlWZrDytMVoHgvPbTFoQQtTNYXFiGnzpUW6iCMIMqLF45CrqmCq3Uvo
         RHt7GD/N5W7t3YDBhS4pKy2VGtRw4GfYEKWZzlttaw9RfEYL0TMphZg9M0ucqhBCFsYb
         UJO8OtGtkcrqIo1usFpQbY22eZMDNctq/kB8HABiaA7HIIs6zmLZveK3RcyMc0t2FDok
         fTNMl9hps+d5kvSG92UhHSUoKsW0zl5BE40YU/Eo0xC/644KQqJRyEBis6qGO0hivqeB
         kb5BDZyfkB7zy0ecDm9RnYC6ORodcIEV2KV2ETY/xqLfzJmmeB7UVNwaIEF3ivFm7DCL
         PEAA==
X-Gm-Message-State: AOJu0YxY95LU0pDtFnlP6VzDceEKk1UoBaRXq/6Dx+FYegBFRWRdFtmx
	4ObENtGs/22bPsNbxNumnwU=
X-Google-Smtp-Source: AGHT+IFFIkmByAnfNzrDAHw5vpxHbJbLugnjFKfKC4d9GrmS9dKUkeCJTPyPQ6iXbFepIw1KZNFdaA==
X-Received: by 2002:a05:6a00:328b:b0:68a:2c6e:c2cc with SMTP id ck11-20020a056a00328b00b0068a2c6ec2ccmr3237101pfb.0.1693573039247;
        Fri, 01 Sep 2023 05:57:19 -0700 (PDT)
Received: from ubuntu.myguest.virtualbox.org ([223.178.38.226])
        by smtp.gmail.com with ESMTPSA id h16-20020aa786d0000000b0068bc10a23a0sm2927063pfo.47.2023.09.01.05.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 05:57:18 -0700 (PDT)
Date: Fri, 1 Sep 2023 18:27:14 +0530
From: Pavan Bobba <opensource206@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Michael Straube <straube.linux@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vt6655: Type encoding info dropped from names
Message-ID: <ZPHfqlTmHWGnLrMr@ubuntu.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

1.conversion of formal argument names from camel case to snake case
  for below functions:

      a.SROMvReadAllContents
      b.SROMvReadEtherAddress

2.conversion of local variable names from camel case to snake case
  in function SROMvReadEtherAddress

3.all instances of W_MAX_TIMEOUT replaced with MAX_TIMEOUT

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/staging/vt6655/baseband.c | 12 ++++----
 drivers/staging/vt6655/card.c     |  4 +--
 drivers/staging/vt6655/mac.c      | 46 ++++++++++++++---------------
 drivers/staging/vt6655/mac.h      |  2 +-
 drivers/staging/vt6655/rf.c       |  6 ++--
 drivers/staging/vt6655/srom.c     | 48 +++++++++++++++----------------
 6 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index 696d4dd03aa2..2721698086df 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -1913,8 +1913,8 @@ bool bb_read_embedded(struct vnt_private *priv, unsigned char by_bb_addr,
 
 	/* turn on REGR */
 	vt6655_mac_reg_bits_on(iobase, MAC_REG_BBREGCTL, BBREGCTL_REGR);
-	/* W_MAX_TIMEOUT is the timeout period */
-	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
+	/* MAX_TIMEOUT is the timeout period */
+	for (ww = 0; ww < MAX_TIMEOUT; ww++) {
 		by_value = ioread8(iobase + MAC_REG_BBREGCTL);
 		if (by_value & BBREGCTL_DONE)
 			break;
@@ -1923,7 +1923,7 @@ bool bb_read_embedded(struct vnt_private *priv, unsigned char by_bb_addr,
 	/* get BB data */
 	*pby_data = ioread8(iobase + MAC_REG_BBREGDATA);
 
-	if (ww == W_MAX_TIMEOUT) {
+	if (ww == MAX_TIMEOUT) {
 		pr_debug(" DBG_PORT80(0x30)\n");
 		return false;
 	}
@@ -1958,14 +1958,14 @@ bool bb_write_embedded(struct vnt_private *priv, unsigned char by_bb_addr,
 
 	/* turn on BBREGCTL_REGW */
 	vt6655_mac_reg_bits_on(iobase, MAC_REG_BBREGCTL, BBREGCTL_REGW);
-	/* W_MAX_TIMEOUT is the timeout period */
-	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
+	/* MAX_TIMEOUT is the timeout period */
+	for (ww = 0; ww < MAX_TIMEOUT; ww++) {
 		by_value = ioread8(iobase + MAC_REG_BBREGCTL);
 		if (by_value & BBREGCTL_DONE)
 			break;
 	}
 
-	if (ww == W_MAX_TIMEOUT) {
+	if (ww == MAX_TIMEOUT) {
 		pr_debug(" DBG_PORT80(0x31)\n");
 		return false;
 	}
diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index c680925b9c92..4830cc8e91bc 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -739,12 +739,12 @@ u64 vt6655_get_current_tsf(struct vnt_private *priv)
 	u32 low, high;
 
 	vt6655_mac_reg_bits_on(iobase, MAC_REG_TFTCTL, TFTCTL_TSFCNTRRD);
-	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
+	for (ww = 0; ww < MAX_TIMEOUT; ww++) {
 		data = ioread8(iobase + MAC_REG_TFTCTL);
 		if (!(data & TFTCTL_TSFCNTRRD))
 			break;
 	}
-	if (ww == W_MAX_TIMEOUT)
+	if (ww == MAX_TIMEOUT)
 		return 0;
 	low = ioread32(iobase + MAC_REG_TSFCNTR);
 	high = ioread32(iobase + MAC_REG_TSFCNTR + 4);
diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index b4ebc7d31961..65843f36f5be 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -270,11 +270,11 @@ bool MACbSoftwareReset(struct vnt_private *priv)
 	/* turn on HOSTCR_SOFTRST, just write 0x01 to reset */
 	iowrite8(0x01, io_base + MAC_REG_HOSTCR);
 
-	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
+	for (ww = 0; ww < MAX_TIMEOUT; ww++) {
 		if (!(ioread8(io_base + MAC_REG_HOSTCR) & HOSTCR_SOFTRST))
 			break;
 	}
-	if (ww == W_MAX_TIMEOUT)
+	if (ww == MAX_TIMEOUT)
 		return false;
 	return true;
 }
@@ -332,31 +332,31 @@ static bool vt6655_mac_safe_rx_off(struct vnt_private *priv)
 	/* Clear RX DMA0,1 */
 	iowrite32(DMACTL_CLRRUN, io_base + MAC_REG_RXDMACTL0);
 	iowrite32(DMACTL_CLRRUN, io_base + MAC_REG_RXDMACTL1);
-	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
+	for (ww = 0; ww < MAX_TIMEOUT; ww++) {
 		if (!(ioread32(io_base + MAC_REG_RXDMACTL0) & DMACTL_RUN))
 			break;
 	}
-	if (ww == W_MAX_TIMEOUT) {
+	if (ww == MAX_TIMEOUT) {
 		pr_debug(" DBG_PORT80(0x10)\n");
 		return false;
 	}
-	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
+	for (ww = 0; ww < MAX_TIMEOUT; ww++) {
 		if (!(ioread32(io_base + MAC_REG_RXDMACTL1) & DMACTL_RUN))
 			break;
 	}
-	if (ww == W_MAX_TIMEOUT) {
+	if (ww == MAX_TIMEOUT) {
 		pr_debug(" DBG_PORT80(0x11)\n");
 		return false;
 	}
 
 	/* try to safe shutdown RX */
 	vt6655_mac_reg_bits_off(io_base, MAC_REG_HOSTCR, HOSTCR_RXON);
-	/* W_MAX_TIMEOUT is the timeout period */
-	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
+	/* MAX_TIMEOUT is the timeout period */
+	for (ww = 0; ww < MAX_TIMEOUT; ww++) {
 		if (!(ioread8(io_base + MAC_REG_HOSTCR) & HOSTCR_RXONST))
 			break;
 	}
-	if (ww == W_MAX_TIMEOUT) {
+	if (ww == MAX_TIMEOUT) {
 		pr_debug(" DBG_PORT80(0x12)\n");
 		return false;
 	}
@@ -387,19 +387,19 @@ static bool vt6655_mac_safe_tx_off(struct vnt_private *priv)
 	/* AC0 */
 	iowrite32(DMACTL_CLRRUN, io_base + MAC_REG_AC0DMACTL);
 
-	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
+	for (ww = 0; ww < MAX_TIMEOUT; ww++) {
 		if (!(ioread32(io_base + MAC_REG_TXDMACTL0) & DMACTL_RUN))
 			break;
 	}
-	if (ww == W_MAX_TIMEOUT) {
+	if (ww == MAX_TIMEOUT) {
 		pr_debug(" DBG_PORT80(0x20)\n");
 		return false;
 	}
-	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
+	for (ww = 0; ww < MAX_TIMEOUT; ww++) {
 		if (!(ioread32(io_base + MAC_REG_AC0DMACTL) & DMACTL_RUN))
 			break;
 	}
-	if (ww == W_MAX_TIMEOUT) {
+	if (ww == MAX_TIMEOUT) {
 		pr_debug(" DBG_PORT80(0x21)\n");
 		return false;
 	}
@@ -407,12 +407,12 @@ static bool vt6655_mac_safe_tx_off(struct vnt_private *priv)
 	/* try to safe shutdown TX */
 	vt6655_mac_reg_bits_off(io_base, MAC_REG_HOSTCR, HOSTCR_TXON);
 
-	/* W_MAX_TIMEOUT is the timeout period */
-	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
+	/* MAX_TIMEOUT is the timeout period */
+	for (ww = 0; ww < MAX_TIMEOUT; ww++) {
 		if (!(ioread8(io_base + MAC_REG_HOSTCR) & HOSTCR_TXONST))
 			break;
 	}
-	if (ww == W_MAX_TIMEOUT) {
+	if (ww == MAX_TIMEOUT) {
 		pr_debug(" DBG_PORT80(0x24)\n");
 		return false;
 	}
@@ -537,7 +537,7 @@ void vt6655_mac_set_curr_rx_0_desc_addr(struct vnt_private *priv, u32 curr_desc_
 	if (org_dma_ctl & DMACTL_RUN)
 		iowrite8(DMACTL_RUN, io_base + MAC_REG_RXDMACTL0 + 2);
 
-	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
+	for (ww = 0; ww < MAX_TIMEOUT; ww++) {
 		if (!(ioread8(io_base + MAC_REG_RXDMACTL0) & DMACTL_RUN))
 			break;
 	}
@@ -571,7 +571,7 @@ void vt6655_mac_set_curr_rx_1_desc_addr(struct vnt_private *priv, u32 curr_desc_
 	if (org_dma_ctl & DMACTL_RUN)
 		iowrite8(DMACTL_RUN, io_base + MAC_REG_RXDMACTL1 + 2);
 
-	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
+	for (ww = 0; ww < MAX_TIMEOUT; ww++) {
 		if (!(ioread8(io_base + MAC_REG_RXDMACTL1) & DMACTL_RUN))
 			break;
 	}
@@ -605,7 +605,7 @@ static void vt6655_mac_set_curr_tx_0_desc_addr_ex(struct vnt_private *priv, u32
 	if (org_dma_ctl & DMACTL_RUN)
 		iowrite8(DMACTL_RUN, io_base + MAC_REG_TXDMACTL0 + 2);
 
-	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
+	for (ww = 0; ww < MAX_TIMEOUT; ww++) {
 		if (!(ioread8(io_base + MAC_REG_TXDMACTL0) & DMACTL_RUN))
 			break;
 	}
@@ -640,11 +640,11 @@ static void vt6655_mac_set_curr_ac_0_desc_addr_ex(struct vnt_private *priv, u32
 	if (org_dma_ctl & DMACTL_RUN)
 		iowrite8(DMACTL_RUN, io_base + MAC_REG_AC0DMACTL + 2);
 
-	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
+	for (ww = 0; ww < MAX_TIMEOUT; ww++) {
 		if (!(ioread8(io_base + MAC_REG_AC0DMACTL) & DMACTL_RUN))
 			break;
 	}
-	if (ww == W_MAX_TIMEOUT)
+	if (ww == MAX_TIMEOUT)
 		pr_debug(" DBG_PORT80(0x26)\n");
 	iowrite32(curr_desc_addr, io_base + MAC_REG_AC0DMAPTR);
 	if (org_dma_ctl & DMACTL_RUN)
@@ -743,11 +743,11 @@ bool MACbPSWakeup(struct vnt_private *priv)
 	vt6655_mac_reg_bits_off(io_base, MAC_REG_PSCTL, PSCTL_PSEN);
 
 	/* Check if SyncFlushOK */
-	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
+	for (ww = 0; ww < MAX_TIMEOUT; ww++) {
 		if (ioread8(io_base + MAC_REG_PSCTL) & PSCTL_WAKEDONE)
 			break;
 	}
-	if (ww == W_MAX_TIMEOUT) {
+	if (ww == MAX_TIMEOUT) {
 		pr_debug(" DBG_PORT80(0x33)\n");
 		return false;
 	}
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index acf931c3f5fd..dccd11a71e04 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -522,7 +522,7 @@
 			    IMR_TXDMA0)
 
 /* max time out delay time */
-#define W_MAX_TIMEOUT       0xFFF0U
+#define MAX_TIMEOUT       0xFFF0U
 
 /* wait time within loop */
 #define CB_DELAY_LOOP_WAIT  10 /* 10ms */
diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index 1fadc2fc4412..5a47ea3cabcd 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -173,14 +173,14 @@ bool IFRFbWriteEmbedded(struct vnt_private *priv, unsigned long dwData)
 
 	iowrite32((u32)dwData, iobase + MAC_REG_IFREGCTL);
 
-	/* W_MAX_TIMEOUT is the timeout period */
-	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
+	/* MAX_TIMEOUT is the timeout period */
+	for (ww = 0; ww < MAX_TIMEOUT; ww++) {
 		dwValue = ioread32(iobase + MAC_REG_IFREGCTL);
 		if (dwValue & IFREGCTL_DONE)
 			break;
 	}
 
-	if (ww == W_MAX_TIMEOUT)
+	if (ww == MAX_TIMEOUT)
 		return false;
 
 	return true;
diff --git a/drivers/staging/vt6655/srom.c b/drivers/staging/vt6655/srom.c
index ee5ca4db74dc..53acd918752e 100644
--- a/drivers/staging/vt6655/srom.c
+++ b/drivers/staging/vt6655/srom.c
@@ -59,36 +59,36 @@
 unsigned char SROMbyReadEmbedded(void __iomem *iobase,
 				 unsigned char byContntOffset)
 {
-	unsigned short wDelay, wNoACK;
-	unsigned char byWait;
-	unsigned char byData;
-	unsigned char byOrg;
+	unsigned short delay, noack;
+	unsigned char wait;
+	unsigned char data;
+	unsigned char org;
 
-	byData = 0xFF;
-	byOrg = ioread8(iobase + MAC_REG_I2MCFG);
+	data = 0xFF;
+	org = ioread8(iobase + MAC_REG_I2MCFG);
 	/* turn off hardware retry for getting NACK */
-	iowrite8(byOrg & (~I2MCFG_NORETRY), iobase + MAC_REG_I2MCFG);
-	for (wNoACK = 0; wNoACK < W_MAX_I2CRETRY; wNoACK++) {
+	iowrite8(org & (~I2MCFG_NORETRY), iobase + MAC_REG_I2MCFG);
+	for (noack = 0; noack < W_MAX_I2CRETRY; noack++) {
 		iowrite8(EEP_I2C_DEV_ID, iobase + MAC_REG_I2MTGID);
 		iowrite8(byContntOffset, iobase + MAC_REG_I2MTGAD);
 
 		/* issue read command */
 		iowrite8(I2MCSR_EEMR, iobase + MAC_REG_I2MCSR);
 		/* wait DONE be set */
-		for (wDelay = 0; wDelay < W_MAX_TIMEOUT; wDelay++) {
-			byWait = ioread8(iobase + MAC_REG_I2MCSR);
-			if (byWait & (I2MCSR_DONE | I2MCSR_NACK))
+		for (delay = 0; delay < MAX_TIMEOUT; delay++) {
+			wait = ioread8(iobase + MAC_REG_I2MCSR);
+			if (wait & (I2MCSR_DONE | I2MCSR_NACK))
 				break;
 			udelay(CB_DELAY_LOOP_WAIT);
 		}
-		if ((wDelay < W_MAX_TIMEOUT) &&
-		    (!(byWait & I2MCSR_NACK))) {
+		if ((delay < MAX_TIMEOUT) &&
+		    (!(wait & I2MCSR_NACK))) {
 			break;
 		}
 	}
-	byData = ioread8(iobase + MAC_REG_I2MDIPT);
-	iowrite8(byOrg, iobase + MAC_REG_I2MCFG);
-	return byData;
+	data = ioread8(iobase + MAC_REG_I2MDIPT);
+	iowrite8(org, iobase + MAC_REG_I2MCFG);
+	return data;
 }
 
 /*
@@ -98,20 +98,20 @@ unsigned char SROMbyReadEmbedded(void __iomem *iobase,
  *  In:
  *      iobase          - I/O base address
  *  Out:
- *      pbyEepromRegs   - EEPROM content Buffer
+ *      eepromregs      - EEPROM content Buffer
  *
  * Return Value: none
  *
  */
-void SROMvReadAllContents(void __iomem *iobase, unsigned char *pbyEepromRegs)
+void SROMvReadAllContents(void __iomem *iobase, unsigned char *eepromregs)
 {
 	int     ii;
 
 	/* ii = Rom Address */
 	for (ii = 0; ii < EEP_MAX_CONTEXT_SIZE; ii++) {
-		*pbyEepromRegs = SROMbyReadEmbedded(iobase,
+		*eepromregs = SROMbyReadEmbedded(iobase,
 						    (unsigned char)ii);
-		pbyEepromRegs++;
+		eepromregs++;
 	}
 }
 
@@ -122,19 +122,19 @@ void SROMvReadAllContents(void __iomem *iobase, unsigned char *pbyEepromRegs)
  *  In:
  *      iobase          - I/O base address
  *  Out:
- *      pbyEtherAddress - Ethernet Address buffer
+ *      etheraddress    - Ethernet Address buffer
  *
  * Return Value: none
  *
  */
 void SROMvReadEtherAddress(void __iomem *iobase,
-			   unsigned char *pbyEtherAddress)
+			   unsigned char *etheraddress)
 {
 	unsigned char ii;
 
 	/* ii = Rom Address */
 	for (ii = 0; ii < ETH_ALEN; ii++) {
-		*pbyEtherAddress = SROMbyReadEmbedded(iobase, ii);
-		pbyEtherAddress++;
+		*etheraddress = SROMbyReadEmbedded(iobase, ii);
+		etheraddress++;
 	}
 }
-- 
2.34.1

