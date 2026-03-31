Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AA83C9ED6
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 11:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774955918; cv=none; b=uz92rrMo8mqdl++M9sA7XsdGVUFqGVOCPhMqG/xJBirWEskocBPj8GkO3/kyAkJ9O5n1DEuIFxQC7dxAaZQfOl2zaGjEAbLm9NY6+IOyXZlRGq15FREpsMpOBfx0AoOHwLslKkN8u7gZTLXm9GGI5B5OEQzG0KWHTE5PU+LU0L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774955918; c=relaxed/simple;
	bh=Z2YR+tZdX3Dcaybg8rMXhSIMzylnB/xkHjP3i8NFxBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6YsG/LtIa6HOy6eOrIHs6z+zebIBrIjRACpW8nGmz6kcl1dk4YgNHlNAMzChMNfGLbPBpVhu5qFZYsEoz0xlrbUwgIpTrWuJAUbjuzBJup+f0VoQ779HO9CYsUx6syd+ULocNH/HQfN8Yl+++di/shpsah8Ig1J9kNsKTB5X9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEwmGM9q; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEwmGM9q"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2aae4d2d215so4823685ad.2
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 04:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774955916; x=1775560716; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1LnjjT0zj6RitOJEhyCSuLJgKMaIyJC1rDVJFN9rQk=;
        b=SEwmGM9qFMaHrObo3r3XCLrVR1kAYdMrbSjA4DeSP8ixDLqsb5iXfgh0pOpEpHxUai
         XihmakV7puA0kMn/NEvOZ1Lg8XuAza/FPKiGG/gUhYCYfuDRO+hNo9Bb+VZiIqeQbVSJ
         hmbO9LZ0lfSwtyBoQSLxVHD+iro8jGHkfi9bEqHAcCdQRQQMQab2nAGrGzHWklN2UhhJ
         3MT2X5lgohwj85lX1gp1w3dTEP86m4ASiHptXHLiIJ66XcK8C5unQwtGuBXzVindOhvO
         s/XW9DFAlLsJkY5aHojcm0vkLlcDo/Cc5xtVzYEQ2gj4nJCNkkTv/mJak75t7O5vt4wJ
         k0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774955916; x=1775560716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h1LnjjT0zj6RitOJEhyCSuLJgKMaIyJC1rDVJFN9rQk=;
        b=kivjQ+rqqQlRFGgDR+p9XKpugqNJSCc5S1sBwL6x5WiNz6CnYndjisWiBE7bXzAYd1
         gRhvoA96HLhACef//HjS8InYbMJ3D6uKyXXRJPSZks5yEOEzRCzG96A/Ee3xCXIryZW+
         Zh7aKJ8Y8aumzkIShWCFIYwagt2jAx+HybBrualoarilELIAbC0Y1d1PuPkBuEkGEb/i
         dlWVKIzP6aMbBxJD2crtphs3yEXsPOP7tBQsNKKewggdZkCJRKHI1WRBBhThnJJhaFRq
         iiwvo4eD+nDNs5lGmi2wdGG2wgYldAXi9MuONVbRt+OwFMJqmmTIt5fMfOhnWm7ZEWE3
         h9ZQ==
X-Gm-Message-State: AOJu0YyidmLNUkhDss87Pp+7FiclmhQyoD0yXDIC8w88Mj+65CN4whL/
	/q4MtEFgdLOXLGaQ+Zjy28wwGCRQV8s1QUAeofLwcHMoCasxivVYfeTf
X-Gm-Gg: ATEYQzwJGoGOZ+rxX4yyBxvJZMsYhQzaIbD3dm/L2ewWB1C8Drpi8w09oMXmdWaNIcI
	FScf8qhNCVJ5FmDHglmOT7j5g9HPWW4/2AuTyyDku1h3zTAw6ghmferpFPhOfDntu2Uhx3+yxCd
	gyb6zrFtBwiNhZoVEIa1Iz6RwnoROUlqElGPxHEUDjl/oGEApPVLKVTjO6OPXXtRE2XUjZBJ2G5
	6GxAx18rN9C1cbY1F/3zo0xFC1bXxTOPUyhSjF8unX2M/ZeKRn8lMKXzkPivIL+f3J+P8ri60Uv
	DnV+RigY9CTG5KIuGuyXiLjDC68gTMT7aayMYN29oNtx6VVGJm8uZGvBVqLe05TNsfVAU7GvuKA
	s9r8KsBioRxFluNER1KHSrv3WF9PlX+pj2h8ztxhSN/WSZkcEj0kQongfw2zA/5O+4Bh0TAgyfW
	Zw1/qC+Gk7+w63nP0hGIKFCqykwds=
X-Received: by 2002:a17:902:fb0d:b0:2b2:4194:952a with SMTP id d9443c01a7336-2b2419496f0mr55383125ad.6.1774955916369;
        Tue, 31 Mar 2026 04:18:36 -0700 (PDT)
Received: from fedora ([2401:4900:86e0:ee11:14b4:e5e5:9799:983f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242766203sm128901145ad.40.2026.03.31.04.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 04:18:36 -0700 (PDT)
From: AyushMukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	AyushMukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH v2 1/2] staging: octeon: ethernet-spi: replace pr_err with dev_err
Date: Tue, 31 Mar 2026 16:47:56 +0530
Message-ID: <20260331111757.110703-2-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331111757.110703-1-ayushmukkanwar@gmail.com>
References: <2026033119-endpoint-jimmy-6b83@gregkh>
 <20260331111757.110703-1-ayushmukkanwar@gmail.com>
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
dev->dev.parent in request_irq and free_irq.

Signed-off-by: AyushMukkanwar <ayushmukkanwar@gmail.com>
---
 drivers/staging/octeon/ethernet-spi.c | 59 ++++++++++++++-------------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-spi.c b/drivers/staging/octeon/ethernet-spi.c
index 699c98c5ec13..8c02920c3cdc 100644
--- a/drivers/staging/octeon/ethernet-spi.c
+++ b/drivers/staging/octeon/ethernet-spi.c
@@ -17,67 +17,67 @@
 static int number_spi_ports;
 static int need_retrain[2] = { 0, 0 };
 
-static void cvm_oct_spxx_int_pr(union cvmx_spxx_int_reg spx_int_reg, int index)
+static void cvm_oct_spxx_int_pr(union cvmx_spxx_int_reg spx_int_reg, int index, struct device *dev)
 {
 	if (spx_int_reg.s.spf)
-		pr_err("SPI%d: SRX Spi4 interface down\n", index);
+		dev_err(dev, "SPI%d: SRX Spi4 interface down\n", index);
 	if (spx_int_reg.s.calerr)
-		pr_err("SPI%d: SRX Spi4 Calendar table parity error\n", index);
+		dev_err(dev, "SPI%d: SRX Spi4 Calendar table parity error\n", index);
 	if (spx_int_reg.s.syncerr)
-		pr_err("SPI%d: SRX Consecutive Spi4 DIP4 errors have exceeded SPX_ERR_CTL[ERRCNT]\n",
+		dev_err(dev, "SPI%d: SRX Consecutive Spi4 DIP4 errors have exceeded SPX_ERR_CTL[ERRCNT]\n",
 		       index);
 	if (spx_int_reg.s.diperr)
-		pr_err("SPI%d: SRX Spi4 DIP4 error\n", index);
+		dev_err(dev, "SPI%d: SRX Spi4 DIP4 error\n", index);
 	if (spx_int_reg.s.tpaovr)
-		pr_err("SPI%d: SRX Selected port has hit TPA overflow\n",
+		dev_err(dev, "SPI%d: SRX Selected port has hit TPA overflow\n",
 		       index);
 	if (spx_int_reg.s.rsverr)
-		pr_err("SPI%d: SRX Spi4 reserved control word detected\n",
+		dev_err(dev, "SPI%d: SRX Spi4 reserved control word detected\n",
 		       index);
 	if (spx_int_reg.s.drwnng)
-		pr_err("SPI%d: SRX Spi4 receive FIFO drowning/overflow\n",
+		dev_err(dev, "SPI%d: SRX Spi4 receive FIFO drowning/overflow\n",
 		       index);
 	if (spx_int_reg.s.clserr)
-		pr_err("SPI%d: SRX Spi4 packet closed on non-16B alignment without EOP\n",
+		dev_err(dev, "SPI%d: SRX Spi4 packet closed on non-16B alignment without EOP\n",
 		       index);
 	if (spx_int_reg.s.spiovr)
-		pr_err("SPI%d: SRX Spi4 async FIFO overflow\n", index);
+		dev_err(dev, "SPI%d: SRX Spi4 async FIFO overflow\n", index);
 	if (spx_int_reg.s.abnorm)
-		pr_err("SPI%d: SRX Abnormal packet termination (ERR bit)\n",
+		dev_err(dev, "SPI%d: SRX Abnormal packet termination (ERR bit)\n",
 		       index);
 	if (spx_int_reg.s.prtnxa)
-		pr_err("SPI%d: SRX Port out of range\n", index);
+		dev_err(dev, "SPI%d: SRX Port out of range\n", index);
 }
 
-static void cvm_oct_stxx_int_pr(union cvmx_stxx_int_reg stx_int_reg, int index)
+static void cvm_oct_stxx_int_pr(union cvmx_stxx_int_reg stx_int_reg, int index, struct device *dev)
 {
 	if (stx_int_reg.s.syncerr)
-		pr_err("SPI%d: STX Interface encountered a fatal error\n",
+		dev_err(dev, "SPI%d: STX Interface encountered a fatal error\n",
 		       index);
 	if (stx_int_reg.s.frmerr)
-		pr_err("SPI%d: STX FRMCNT has exceeded STX_DIP_CNT[MAXFRM]\n",
+		dev_err(dev, "SPI%d: STX FRMCNT has exceeded STX_DIP_CNT[MAXFRM]\n",
 		       index);
 	if (stx_int_reg.s.unxfrm)
-		pr_err("SPI%d: STX Unexpected framing sequence\n", index);
+		dev_err(dev, "SPI%d: STX Unexpected framing sequence\n", index);
 	if (stx_int_reg.s.nosync)
-		pr_err("SPI%d: STX ERRCNT has exceeded STX_DIP_CNT[MAXDIP]\n",
+		dev_err(dev, "SPI%d: STX ERRCNT has exceeded STX_DIP_CNT[MAXDIP]\n",
 		       index);
 	if (stx_int_reg.s.diperr)
-		pr_err("SPI%d: STX DIP2 error on the Spi4 Status channel\n",
+		dev_err(dev, "SPI%d: STX DIP2 error on the Spi4 Status channel\n",
 		       index);
 	if (stx_int_reg.s.datovr)
-		pr_err("SPI%d: STX Spi4 FIFO overflow error\n", index);
+		dev_err(dev, "SPI%d: STX Spi4 FIFO overflow error\n", index);
 	if (stx_int_reg.s.ovrbst)
-		pr_err("SPI%d: STX Transmit packet burst too big\n", index);
+		dev_err(dev, "SPI%d: STX Transmit packet burst too big\n", index);
 	if (stx_int_reg.s.calpar1)
-		pr_err("SPI%d: STX Calendar Table Parity Error Bank%d\n",
+		dev_err(dev, "SPI%d: STX Calendar Table Parity Error Bank%d\n",
 		       index, 1);
 	if (stx_int_reg.s.calpar0)
-		pr_err("SPI%d: STX Calendar Table Parity Error Bank%d\n",
+		dev_err(dev, "SPI%d: STX Calendar Table Parity Error Bank%d\n",
 		       index, 0);
 }
 
-static irqreturn_t cvm_oct_spi_spx_int(int index)
+static irqreturn_t cvm_oct_spi_spx_int(int index, struct device *dev)
 {
 	union cvmx_spxx_int_reg spx_int_reg;
 	union cvmx_stxx_int_reg stx_int_reg;
@@ -86,14 +86,14 @@ static irqreturn_t cvm_oct_spi_spx_int(int index)
 	cvmx_write_csr(CVMX_SPXX_INT_REG(index), spx_int_reg.u64);
 	if (!need_retrain[index]) {
 		spx_int_reg.u64 &= cvmx_read_csr(CVMX_SPXX_INT_MSK(index));
-		cvm_oct_spxx_int_pr(spx_int_reg, index);
+		cvm_oct_spxx_int_pr(spx_int_reg, index, dev);
 	}
 
 	stx_int_reg.u64 = cvmx_read_csr(CVMX_STXX_INT_REG(index));
 	cvmx_write_csr(CVMX_STXX_INT_REG(index), stx_int_reg.u64);
 	if (!need_retrain[index]) {
 		stx_int_reg.u64 &= cvmx_read_csr(CVMX_STXX_INT_MSK(index));
-		cvm_oct_stxx_int_pr(stx_int_reg, index);
+		cvm_oct_stxx_int_pr(stx_int_reg, index, dev);
 	}
 
 	cvmx_write_csr(CVMX_SPXX_INT_MSK(index), 0);
@@ -107,14 +107,15 @@ static irqreturn_t cvm_oct_spi_rml_interrupt(int cpl, void *dev_id)
 {
 	irqreturn_t return_status = IRQ_NONE;
 	union cvmx_npi_rsl_int_blocks rsl_int_blocks;
+	struct device *dev = dev_id;
 
 	/* Check and see if this interrupt was caused by the GMX block */
 	rsl_int_blocks.u64 = cvmx_read_csr(CVMX_NPI_RSL_INT_BLOCKS);
 	if (rsl_int_blocks.s.spx1) /* 19 - SPX1_INT_REG & STX1_INT_REG */
-		return_status = cvm_oct_spi_spx_int(1);
+		return_status = cvm_oct_spi_spx_int(1, dev);
 
 	if (rsl_int_blocks.s.spx0) /* 18 - SPX0_INT_REG & STX0_INT_REG */
-		return_status = cvm_oct_spi_spx_int(0);
+		return_status = cvm_oct_spi_spx_int(0, dev);
 
 	return return_status;
 }
@@ -196,7 +197,7 @@ int cvm_oct_spi_init(struct net_device *dev)
 
 	if (number_spi_ports == 0) {
 		r = request_irq(OCTEON_IRQ_RML, cvm_oct_spi_rml_interrupt,
-				IRQF_SHARED, "SPI", &number_spi_ports);
+				IRQF_SHARED, "SPI", dev->dev.parent);
 		if (r)
 			return r;
 	}
@@ -221,6 +222,6 @@ void cvm_oct_spi_uninit(struct net_device *dev)
 			cvmx_write_csr(CVMX_SPXX_INT_MSK(interface), 0);
 			cvmx_write_csr(CVMX_STXX_INT_MSK(interface), 0);
 		}
-		free_irq(OCTEON_IRQ_RML, &number_spi_ports);
+		free_irq(OCTEON_IRQ_RML, dev->dev.parent);
 	}
 }
-- 
2.53.0

