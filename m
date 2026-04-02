Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D363BED4B
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 11:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130213; cv=none; b=rwwnfoWVQI+kcmgTMUjzb04qEP2FytkjJYFPK22r6UF0xRKgh9zl8VBk9IWrRxz4/Hc8EMc0jLawqSss4KnTEAOTU6FIQ1gqAtxCKoJ+Z8wclmnGOsjMpJtapzXfjAxzH75+jgbDbuv3rF4GDKFr8DS8Er5xsnqomVCiGfuHau0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130213; c=relaxed/simple;
	bh=gY7HQ300MO0CkpLIn/GZpMCQ/jOuQ/Egue7d3Mkk4X8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X4PnoGMrh3mf6G1uAHYwlnt/UzbWJTeBiZb78GQ+4GZjvhrFpJpzBhNfZRPjPNpWhdnnhsttj52N0BV20MoUwdeKweFoxuu3rJFX7+/DS+jLt9SHTrmhJeyBgcqIQur6S5xvG6hZuIObHS6rQ2VnmyqFTGPh2h4O5//mBgqRhgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sreiapAP; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sreiapAP"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ae1255a90bso1027785ad.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 04:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775130204; x=1775735004; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWfaZDglV+5Mmp6GJdkcLBtTlrEQHvz96dOIQDefcZo=;
        b=sreiapAPTt0wS13hFXl9bu4TDUzb4RpAOxufZePatP2C+IZKEaLG89ThObAn7CWSu9
         87p7EnK6bdFX0L14W5OY5qpAMSdqIOSLApwi7I5nzuzT3EZYUF4Q7uQj8dif8pwTmwcB
         OgN9uOZMBAS/9coO/GkIvy9TDF7yT0xUO8yQd2xc37av2D3BrKrXpbwLIA+HsY6IeCFE
         O++Fki5wanYb2O+MzDk0UT9J1OdXMXZNMQYcOBr6kn9hJ3I0vX61qGaAPXj6sVsWGgqh
         XJ7bPikKu2pgI3f04vlJNGHczZ0pTFY7jSOf+Gl2fZsfz8ckY0TZd4A8uLP+iD5Ap/dq
         xCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130204; x=1775735004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BWfaZDglV+5Mmp6GJdkcLBtTlrEQHvz96dOIQDefcZo=;
        b=pw9kaqBrVQa+IE5nQWJd0l1Y06AQkh4NRorp9wbOVRgb3F34b8ACgUvTabUivwP1AT
         mzdMQQy51zfpEppaoEHUSoR2lcFab8Yby9eb44qqH850okHqeyivCm/TWwCRxSyqpMHl
         low//AWVWV0Bg9xOh+oGXX+vZPgQ2YgPPzBz5/RwsVu8LU1g8bgHSdQMfIZPHT7saP+h
         lTBjmWwpEzzUmf3t4UKcYfiR4NGDNGKzGIddojTZ+/Tm4PnD2VtYwa2d3HpxAZwm6h4g
         YEWBj0vyqlIthugnUWpPBpdSNAfPYWL7+YmGA7nCuaWkoTeGV1Yaovt/uPfbzRmO121i
         KmLw==
X-Gm-Message-State: AOJu0YyJKpatjfbeS08FYJcNf+go+aEXP1/IDIYzPnNCHRRLu9yETtQo
	bvsqrF0B3gzxFaMV4TRsau7xF8bbrGMe7v7aQFrMeooHqYx85EWggKkh
X-Gm-Gg: AeBDieu5sH3wLcNVpUb74mpcmtIuZ5P90kE3U4OPZbbUc5GffznRTJqWxuV3+ZUR3I8
	fFs9loeXmkvNdZ3z2iaPZMAF9Q7MdRHJd3BV6OeS/WIkYrAwVvg8AHW2E9jSsDjYBa0lqt+qEX0
	qBBO+kBKA6LD6CgSYNh1KnhK7c1KggMOj/oEtmRydeX/0lzgXWovSpIAYsOxEqiJRjBzaOJeKto
	xj3/y5K12PPqTbiH7IkbJDo9UIi6m4fpCt9ueZrn2VWcMXxVERIafQiK5Kqb/J52sHOXGR0XLEX
	eRhl5TUYi43x+W1HyA8QXTGVkHqatj1onbUEBlsSIr/annNt/7cAdxYxoxCzLAlOoKc9F4H0VzR
	7FJilsOhKw3Sa3ldF13wmzprkD4FTTzO/K4SmES766+OCZRWBRszjl+6Mj/pSve2jwuhHf3wtXX
	E/2NHUhilPV1ihEmHRR9NP5kwluA==
X-Received: by 2002:a17:903:1b6c:b0:2ae:63fd:6d6a with SMTP id d9443c01a7336-2b269d66be7mr44945625ad.7.1775130203649;
        Thu, 02 Apr 2026 04:43:23 -0700 (PDT)
Received: from fedora ([2401:4900:85cc:66d7:5e4d:2506:ea1:a781])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274779b48sm37505805ad.25.2026.04.02.04.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:43:23 -0700 (PDT)
From: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH v3 1/2] staging: octeon: ethernet-spi: replace pr_err with dev_err
Date: Thu,  2 Apr 2026 17:12:41 +0530
Message-ID: <20260402114242.57411-2-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402114242.57411-1-ayushmukkanwar@gmail.com>
References: <20260402114242.57411-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace pr_err() calls with dev_err() to include device information
in log messages. The device pointer is passed through the interrupt
handler via dev_id, which is changed from &number_spi_ports to
netdev pointer in request_irq and free_irq.

Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
---
 drivers/staging/octeon/ethernet-spi.c | 78 +++++++++++++--------------
 1 file changed, 37 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-spi.c b/drivers/staging/octeon/ethernet-spi.c
index 699c98c5ec13..1e33544f74b8 100644
--- a/drivers/staging/octeon/ethernet-spi.c
+++ b/drivers/staging/octeon/ethernet-spi.c
@@ -17,67 +17,62 @@
 static int number_spi_ports;
 static int need_retrain[2] = { 0, 0 };
 
-static void cvm_oct_spxx_int_pr(union cvmx_spxx_int_reg spx_int_reg, int index)
+static void cvm_oct_spxx_int_pr(struct net_device *dev, union cvmx_spxx_int_reg spx_int_reg,
+				int index)
 {
 	if (spx_int_reg.s.spf)
-		pr_err("SPI%d: SRX Spi4 interface down\n", index);
+		netdev_err(dev, "SPI%d: SRX Spi4 interface down\n", index);
 	if (spx_int_reg.s.calerr)
-		pr_err("SPI%d: SRX Spi4 Calendar table parity error\n", index);
+		netdev_err(dev, "SPI%d: SRX Spi4 Calendar table parity error\n", index);
 	if (spx_int_reg.s.syncerr)
-		pr_err("SPI%d: SRX Consecutive Spi4 DIP4 errors have exceeded SPX_ERR_CTL[ERRCNT]\n",
-		       index);
+		netdev_err(dev, "SPI%d: SRX Consecutive Spi4 DIP4 errors have exceeded SPX_ERR_CTL[ERRCNT]\n",
+			   index);
 	if (spx_int_reg.s.diperr)
-		pr_err("SPI%d: SRX Spi4 DIP4 error\n", index);
+		netdev_err(dev, "SPI%d: SRX Spi4 DIP4 error\n", index);
 	if (spx_int_reg.s.tpaovr)
-		pr_err("SPI%d: SRX Selected port has hit TPA overflow\n",
-		       index);
+		netdev_err(dev, "SPI%d: SRX Selected port has hit TPA overflow\n", index);
 	if (spx_int_reg.s.rsverr)
-		pr_err("SPI%d: SRX Spi4 reserved control word detected\n",
-		       index);
+		netdev_err(dev, "SPI%d: SRX Spi4 reserved control word detected\n", index);
 	if (spx_int_reg.s.drwnng)
-		pr_err("SPI%d: SRX Spi4 receive FIFO drowning/overflow\n",
-		       index);
+		netdev_err(dev, "SPI%d: SRX Spi4 receive FIFO drowning/overflow\n", index);
 	if (spx_int_reg.s.clserr)
-		pr_err("SPI%d: SRX Spi4 packet closed on non-16B alignment without EOP\n",
-		       index);
+		netdev_err(dev, "SPI%d: SRX Spi4 packet closed on non-16B alignment without EOP\n",
+			   index);
 	if (spx_int_reg.s.spiovr)
-		pr_err("SPI%d: SRX Spi4 async FIFO overflow\n", index);
+		netdev_err(dev, "SPI%d: SRX Spi4 async FIFO overflow\n", index);
 	if (spx_int_reg.s.abnorm)
-		pr_err("SPI%d: SRX Abnormal packet termination (ERR bit)\n",
-		       index);
+		netdev_err(dev, "SPI%d: SRX Abnormal packet termination (ERR bit)\n", index);
 	if (spx_int_reg.s.prtnxa)
-		pr_err("SPI%d: SRX Port out of range\n", index);
+		netdev_err(dev, "SPI%d: SRX Port out of range\n", index);
 }
 
-static void cvm_oct_stxx_int_pr(union cvmx_stxx_int_reg stx_int_reg, int index)
+static void cvm_oct_stxx_int_pr(struct net_device *dev,
+				union cvmx_stxx_int_reg stx_int_reg, int index)
 {
 	if (stx_int_reg.s.syncerr)
-		pr_err("SPI%d: STX Interface encountered a fatal error\n",
-		       index);
+		netdev_err(dev, "SPI%d: STX Interface encountered a fatal error\n", index);
 	if (stx_int_reg.s.frmerr)
-		pr_err("SPI%d: STX FRMCNT has exceeded STX_DIP_CNT[MAXFRM]\n",
-		       index);
+		netdev_err(dev, "SPI%d: STX FRMCNT has exceeded STX_DIP_CNT[MAXFRM]\n",
+			   index);
 	if (stx_int_reg.s.unxfrm)
-		pr_err("SPI%d: STX Unexpected framing sequence\n", index);
+		netdev_err(dev, "SPI%d: STX Unexpected framing sequence\n", index);
 	if (stx_int_reg.s.nosync)
-		pr_err("SPI%d: STX ERRCNT has exceeded STX_DIP_CNT[MAXDIP]\n",
-		       index);
+		netdev_err(dev, "SPI%d: STX ERRCNT has exceeded STX_DIP_CNT[MAXDIP]\n",
+			   index);
 	if (stx_int_reg.s.diperr)
-		pr_err("SPI%d: STX DIP2 error on the Spi4 Status channel\n",
-		       index);
+		netdev_err(dev, "SPI%d: STX DIP2 error on the Spi4 Status channel\n", index);
 	if (stx_int_reg.s.datovr)
-		pr_err("SPI%d: STX Spi4 FIFO overflow error\n", index);
+		netdev_err(dev, "SPI%d: STX Spi4 FIFO overflow error\n", index);
 	if (stx_int_reg.s.ovrbst)
-		pr_err("SPI%d: STX Transmit packet burst too big\n", index);
+		netdev_err(dev, "SPI%d: STX Transmit packet burst too big\n", index);
 	if (stx_int_reg.s.calpar1)
-		pr_err("SPI%d: STX Calendar Table Parity Error Bank%d\n",
-		       index, 1);
+		netdev_err(dev, "SPI%d: STX Calendar Table Parity Error Bank%d\n",
+			   index, 1);
 	if (stx_int_reg.s.calpar0)
-		pr_err("SPI%d: STX Calendar Table Parity Error Bank%d\n",
-		       index, 0);
+		netdev_err(dev, "SPI%d: STX Calendar Table Parity Error Bank%d\n", index, 0);
 }
 
-static irqreturn_t cvm_oct_spi_spx_int(int index)
+static irqreturn_t cvm_oct_spi_spx_int(struct net_device *dev, int index)
 {
 	union cvmx_spxx_int_reg spx_int_reg;
 	union cvmx_stxx_int_reg stx_int_reg;
@@ -86,14 +81,14 @@ static irqreturn_t cvm_oct_spi_spx_int(int index)
 	cvmx_write_csr(CVMX_SPXX_INT_REG(index), spx_int_reg.u64);
 	if (!need_retrain[index]) {
 		spx_int_reg.u64 &= cvmx_read_csr(CVMX_SPXX_INT_MSK(index));
-		cvm_oct_spxx_int_pr(spx_int_reg, index);
+		cvm_oct_spxx_int_pr(dev, spx_int_reg, index);
 	}
 
 	stx_int_reg.u64 = cvmx_read_csr(CVMX_STXX_INT_REG(index));
 	cvmx_write_csr(CVMX_STXX_INT_REG(index), stx_int_reg.u64);
 	if (!need_retrain[index]) {
 		stx_int_reg.u64 &= cvmx_read_csr(CVMX_STXX_INT_MSK(index));
-		cvm_oct_stxx_int_pr(stx_int_reg, index);
+		cvm_oct_stxx_int_pr(dev, stx_int_reg, index);
 	}
 
 	cvmx_write_csr(CVMX_SPXX_INT_MSK(index), 0);
@@ -107,14 +102,15 @@ static irqreturn_t cvm_oct_spi_rml_interrupt(int cpl, void *dev_id)
 {
 	irqreturn_t return_status = IRQ_NONE;
 	union cvmx_npi_rsl_int_blocks rsl_int_blocks;
+	struct net_device *dev = dev_id;
 
 	/* Check and see if this interrupt was caused by the GMX block */
 	rsl_int_blocks.u64 = cvmx_read_csr(CVMX_NPI_RSL_INT_BLOCKS);
 	if (rsl_int_blocks.s.spx1) /* 19 - SPX1_INT_REG & STX1_INT_REG */
-		return_status = cvm_oct_spi_spx_int(1);
+		return_status = cvm_oct_spi_spx_int(dev, 1);
 
 	if (rsl_int_blocks.s.spx0) /* 18 - SPX0_INT_REG & STX0_INT_REG */
-		return_status = cvm_oct_spi_spx_int(0);
+		return_status = cvm_oct_spi_spx_int(dev, 0);
 
 	return return_status;
 }
@@ -196,7 +192,7 @@ int cvm_oct_spi_init(struct net_device *dev)
 
 	if (number_spi_ports == 0) {
 		r = request_irq(OCTEON_IRQ_RML, cvm_oct_spi_rml_interrupt,
-				IRQF_SHARED, "SPI", &number_spi_ports);
+				IRQF_SHARED, "SPI", dev);
 		if (r)
 			return r;
 	}
@@ -221,6 +217,6 @@ void cvm_oct_spi_uninit(struct net_device *dev)
 			cvmx_write_csr(CVMX_SPXX_INT_MSK(interface), 0);
 			cvmx_write_csr(CVMX_STXX_INT_MSK(interface), 0);
 		}
-		free_irq(OCTEON_IRQ_RML, &number_spi_ports);
+		free_irq(OCTEON_IRQ_RML, dev);
 	}
 }
-- 
2.53.0

