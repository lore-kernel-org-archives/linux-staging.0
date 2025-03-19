Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592A2211A1E
	for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 21:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742419114; cv=none; b=E6QpGel8m0XGAA6RLoaxQMLOisoZqInwkMmjTlTlLrUxzGigkFyWgpvkVubOPNk5hEfQWPwjbnx9rHdFJVn4cYPsAf77Jd8dZIoMsEmThGIGaCt4ohqrIBBFBlsud37W/GX31zuSPT7vfn3GtSdwMyigyi/1+hTlYLeVGKSqZEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742419114; c=relaxed/simple;
	bh=7map+7Tpk3j/bj3oCa6b0PQPna+rcnIff0ifIXyzCoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IYJPDL4oCLkn/qEeB14p+SDVHfMc8OEf+I2fRIFUU1QwQJ5A/PHHZvKBceFR7S/RvRGFaFO+3YHPccWTwksV2JoZh8UzKSRglwhvlCeEhfzl1zx0gxcGMl2bn96yNRhGSDq7XuG9Bf5keF0ohy2J6CyGnkGjrIHC9ozYDasptSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=giEHBDXL; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="giEHBDXL"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2260c91576aso279875ad.3
        for <linux-staging@lists.linux.dev>; Wed, 19 Mar 2025 14:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1742419111; x=1743023911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zy+GctLsDyQ0oVhOpFAWpkq9XxnqpLm8qDFikh+eFy0=;
        b=giEHBDXLFY04IHIn3GNfWjRRvpqyX0kYtna7IlEaHboX3+mSUW32QFE6A+AC+rinbM
         Pd9nQ2paNQOypTDjwLvKADPG8Uk7zbu1nUz3OltpnQi2XOsWoY2fwRxFoSJYTcPVphlh
         AvFhHbVtK64QuGBYhf49957ZJPKTmovHTPHYtJX3mS6Z7+iaZZE9fvus6hy5I+p4M2jR
         9nzBNSzNkF2ZZYxGYkdM7tpcKmYk0q73U9veIhZ7KTOfQ+pFYeWc8QKcZ/5DztN83YcB
         mneWMW7CPGHw6IxUrVOfbzKdjSJN9sIO4FZXaNOy4cfOoFWlhA68IkQWVPFZH9raNY3u
         q3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742419111; x=1743023911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zy+GctLsDyQ0oVhOpFAWpkq9XxnqpLm8qDFikh+eFy0=;
        b=AVZr5Bhwj77UaH1Kv4j4QlwlgwIEE+QVW++xGY0JWTGL2Z8VnNARttuG9DbSNOX9cV
         oYgjcSVuRlvlohzDQtYEzAopZkEVj70ahUXSxFYZbRAiURtIogX6UG0aYm3TCrDKomSP
         +h9+PgGq3sZoJO3D43xzHgoGLpfA6seMAXYfxiZe6mFKKWNIB04hItKy/JuwL5WbACOj
         RhPWD0Hgd51J0agQ01AZ5ud1Rx8qjBHBrxC911sTk79n4ulHPVD8mqONRAvbXQUhNsmy
         jVeXXW2aNfLFlkvaGNg+XZWYbvl0xyQ6eNQaSPTijaLhSyEq9i0Y5uB/2Scg9dKtPhJG
         Vf7g==
X-Gm-Message-State: AOJu0YybARgXJh4lWnzWm24HeItUnWL+ugShf/oG4xB72pXJD2ZD94p7
	2Ag/U5+dl0725pBiUy0/VOs8h3mSSDErr+exS8YqSTem307rnolccPq9YnM0RA==
X-Gm-Gg: ASbGncszs+95X87ROA9lFwihYhR7l2RR7DzM/q6oalrMy1Nmz++TL+gexzS/dc7jBNZ
	t8vRHPUHt5S3P3NCGC00iMw+oUcMdW/3Sn7MgfAQSSVQ8fHcE7MAH1Iq3fB71VqVFMOuF1XvADi
	1pfbJMzQT8XRSXyMbjrCGnlei58rC/rxeZZk7Fze1oir05lZ3fEZeg126+Jqr78GwzYhjChJ2yC
	MBTmpubWS8xQqx/HCbyBKnkCgWDBt9ZA8JK+gVFJoyYsWaLu/Fyo1rOLD5+115uX3ZF3YRFYs0n
	SWxD57+/A6XxFnM6Ldi8OwxP2Sgeycusbp8e2z66JYakgu5wSdtkY3l0koF6h4KkVGiE9ej07cF
	60qVU6CwIEA==
X-Google-Smtp-Source: AGHT+IEgZACoc9KZbsX8lAIO+v71R7QWG2HIokl9bbScq2qWU/e/MJKCzdIIMaSKrKVr1dlmoCoACA==
X-Received: by 2002:a17:902:f70c:b0:216:53fa:634f with SMTP id d9443c01a7336-22649cb5b29mr79844995ad.48.1742419111487;
        Wed, 19 Mar 2025 14:18:31 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6f2dsm119624345ad.140.2025.03.19.14.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:18:31 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 1/2] staging: gpib: Correct CamelCase for BUS constants
Date: Wed, 19 Mar 2025 21:18:26 +0000
Message-ID: <20250319211827.9854-2-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250319211827.9854-1-matchstick@neverthere.org>
References: <20250319211827.9854-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style and remove duplicate enums.

Reported by checkpatch

CHECK: Avoid CamelCase

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 .../staging/gpib/agilent_82357a/agilent_82357a.c | 16 ++++++++--------
 drivers/staging/gpib/cb7210/cb7210.c             | 16 ++++++++--------
 drivers/staging/gpib/common/iblib.c              |  4 ++--
 drivers/staging/gpib/eastwood/fluke_gpib.c       | 16 ++++++++--------
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c         | 16 ++++++++--------
 drivers/staging/gpib/gpio/gpib_bitbang.c         | 16 ++++++++--------
 drivers/staging/gpib/hp_82341/hp_82341.c         |  2 +-
 drivers/staging/gpib/ines/ines_gpib.c            | 16 ++++++++--------
 .../staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c   | 16 ++++++++--------
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c        | 16 ++++++++--------
 drivers/staging/gpib/tms9914/tms9914.c           | 16 ++++++++--------
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c      | 16 ++++++++--------
 drivers/staging/gpib/uapi/gpib_user.h            | 11 -----------
 13 files changed, 83 insertions(+), 94 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 7ebebe00dc48..7d660e558fbe 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -988,21 +988,21 @@ static int agilent_82357a_line_status(const gpib_board_t *board)
 		return retval;
 	}
 	if (bus_status.value & BSR_REN_BIT)
-		status |= BusREN;
+		status |= BUS_REN;
 	if (bus_status.value & BSR_IFC_BIT)
-		status |= BusIFC;
+		status |= BUS_IFC;
 	if (bus_status.value & BSR_SRQ_BIT)
-		status |= BusSRQ;
+		status |= BUS_SRQ;
 	if (bus_status.value & BSR_EOI_BIT)
-		status |= BusEOI;
+		status |= BUS_EOI;
 	if (bus_status.value & BSR_NRFD_BIT)
-		status |= BusNRFD;
+		status |= BUS_NRFD;
 	if (bus_status.value & BSR_NDAC_BIT)
-		status |= BusNDAC;
+		status |= BUS_NDAC;
 	if (bus_status.value & BSR_DAV_BIT)
-		status |= BusDAV;
+		status |= BUS_DAV;
 	if (bus_status.value & BSR_ATN_BIT)
-		status |= BusATN;
+		status |= BUS_ATN;
 	return status;
 }
 
diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 19dfd8b4a8e7..ba02dce62dd9 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -388,21 +388,21 @@ static int cb7210_line_status(const gpib_board_t *board)
 	bsr_bits = cb7210_paged_read_byte(cb_priv, BUS_STATUS, BUS_STATUS_PAGE);
 
 	if ((bsr_bits & BSR_REN_BIT) == 0)
-		status |= BusREN;
+		status |= BUS_REN;
 	if ((bsr_bits & BSR_IFC_BIT) == 0)
-		status |= BusIFC;
+		status |= BUS_IFC;
 	if ((bsr_bits & BSR_SRQ_BIT) == 0)
-		status |= BusSRQ;
+		status |= BUS_SRQ;
 	if ((bsr_bits & BSR_EOI_BIT) == 0)
-		status |= BusEOI;
+		status |= BUS_EOI;
 	if ((bsr_bits & BSR_NRFD_BIT) == 0)
-		status |= BusNRFD;
+		status |= BUS_NRFD;
 	if ((bsr_bits & BSR_NDAC_BIT) == 0)
-		status |= BusNDAC;
+		status |= BUS_NDAC;
 	if ((bsr_bits & BSR_DAV_BIT) == 0)
-		status |= BusDAV;
+		status |= BUS_DAV;
 	if ((bsr_bits & BSR_ATN_BIT) == 0)
-		status |= BusATN;
+		status |= BUS_ATN;
 
 	return status;
 }
diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
index fd2874c2fff4..1caa57b41596 100644
--- a/drivers/staging/gpib/common/iblib.c
+++ b/drivers/staging/gpib/common/iblib.c
@@ -77,7 +77,7 @@ static int check_for_command_acceptors(gpib_board_t *board)
 		return lines;
 
 	if ((lines & ValidNRFD) && (lines & ValidNDAC))	{
-		if ((lines & BusNRFD) == 0 && (lines & BusNDAC) == 0)
+		if ((lines & BUS_NRFD) == 0 && (lines & BUS_NDAC) == 0)
 			return -ENOTCONN;
 	}
 
@@ -521,7 +521,7 @@ int general_ibstatus(gpib_board_t *board, const gpib_status_queue_t *device,
 		/* get real SRQI status if we can */
 		if (iblines(board, &line_status) == 0) {
 			if ((line_status & ValidSRQ)) {
-				if ((line_status & BusSRQ))
+				if ((line_status & BUS_SRQ))
 					status |= SRQI;
 				else
 					status &= ~SRQI;
diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
index 731732bd8301..4e04acfdb48d 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.c
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
@@ -204,21 +204,21 @@ static int fluke_line_status(const gpib_board_t *board)
 	bsr_bits = fluke_paged_read_byte(e_priv, BUS_STATUS, BUS_STATUS_PAGE);
 
 	if ((bsr_bits & BSR_REN_BIT) == 0)
-		status |= BusREN;
+		status |= BUS_REN;
 	if ((bsr_bits & BSR_IFC_BIT) == 0)
-		status |= BusIFC;
+		status |= BUS_IFC;
 	if ((bsr_bits & BSR_SRQ_BIT) == 0)
-		status |= BusSRQ;
+		status |= BUS_SRQ;
 	if ((bsr_bits & BSR_EOI_BIT) == 0)
-		status |= BusEOI;
+		status |= BUS_EOI;
 	if ((bsr_bits & BSR_NRFD_BIT) == 0)
-		status |= BusNRFD;
+		status |= BUS_NRFD;
 	if ((bsr_bits & BSR_NDAC_BIT) == 0)
-		status |= BusNDAC;
+		status |= BUS_NDAC;
 	if ((bsr_bits & BSR_DAV_BIT) == 0)
-		status |= BusDAV;
+		status |= BUS_DAV;
 	if ((bsr_bits & BSR_ATN_BIT) == 0)
-		status |= BusATN;
+		status |= BUS_ATN;
 
 	return status;
 }
diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index d62c83368518..8fbfa7e285af 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -240,21 +240,21 @@ static int fmh_gpib_line_status(const gpib_board_t *board)
 	bsr_bits = read_byte(nec_priv, BUS_STATUS_REG);
 
 	if ((bsr_bits & BSR_REN_BIT) == 0)
-		status |= BusREN;
+		status |= BUS_REN;
 	if ((bsr_bits & BSR_IFC_BIT) == 0)
-		status |= BusIFC;
+		status |= BUS_IFC;
 	if ((bsr_bits & BSR_SRQ_BIT) == 0)
-		status |= BusSRQ;
+		status |= BUS_SRQ;
 	if ((bsr_bits & BSR_EOI_BIT) == 0)
-		status |= BusEOI;
+		status |= BUS_EOI;
 	if ((bsr_bits & BSR_NRFD_BIT) == 0)
-		status |= BusNRFD;
+		status |= BUS_NRFD;
 	if ((bsr_bits & BSR_NDAC_BIT) == 0)
-		status |= BusNDAC;
+		status |= BUS_NDAC;
 	if ((bsr_bits & BSR_DAV_BIT) == 0)
-		status |= BusDAV;
+		status |= BUS_DAV;
 	if ((bsr_bits & BSR_ATN_BIT) == 0)
-		status |= BusATN;
+		status |= BUS_ATN;
 
 	return status;
 }
diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 2012db188f58..004bf0e9bc88 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1034,21 +1034,21 @@ static int bb_line_status(const gpib_board_t *board)
 	int line_status = ValidALL;
 
 	if (gpiod_get_value(REN) == 0)
-		line_status |= BusREN;
+		line_status |= BUS_REN;
 	if (gpiod_get_value(IFC) == 0)
-		line_status |= BusIFC;
+		line_status |= BUS_IFC;
 	if (gpiod_get_value(NDAC) == 0)
-		line_status |= BusNDAC;
+		line_status |= BUS_NDAC;
 	if (gpiod_get_value(NRFD) == 0)
-		line_status |= BusNRFD;
+		line_status |= BUS_NRFD;
 	if (gpiod_get_value(DAV) == 0)
-		line_status |= BusDAV;
+		line_status |= BUS_DAV;
 	if (gpiod_get_value(EOI) == 0)
-		line_status |= BusEOI;
+		line_status |= BUS_EOI;
 	if (gpiod_get_value(_ATN) == 0)
-		line_status |= BusATN;
+		line_status |= BUS_ATN;
 	if (gpiod_get_value(SRQ) == 0)
-		line_status |= BusSRQ;
+		line_status |= BUS_SRQ;
 
 	dbg_printk(2, "status lines: %4x\n", line_status);
 
diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 91fbaf953bcd..b5d79ae519e7 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -158,7 +158,7 @@ static int restart_write_fifo(gpib_board_t *board, struct hp_82341_priv *hp_priv
 
 		//restart doesn't work if data holdoff is in effect
 		status = tms9914_line_status(board, tms_priv);
-		if ((status & BusNRFD) == 0) {
+		if ((status & BUS_NRFD) == 0) {
 			outb(RESTART_STREAM_BIT, hp_priv->iobase[0] + STREAM_STATUS_REG);
 			return 0;
 		}
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 56da6cd91188..c5c34845fc38 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -36,21 +36,21 @@ int ines_line_status(const gpib_board_t *board)
 	bcm_bits = ines_inb(ines_priv, BUS_CONTROL_MONITOR);
 
 	if (bcm_bits & BCM_REN_BIT)
-		status |= BusREN;
+		status |= BUS_REN;
 	if (bcm_bits & BCM_IFC_BIT)
-		status |= BusIFC;
+		status |= BUS_IFC;
 	if (bcm_bits & BCM_SRQ_BIT)
-		status |= BusSRQ;
+		status |= BUS_SRQ;
 	if (bcm_bits & BCM_EOI_BIT)
-		status |= BusEOI;
+		status |= BUS_EOI;
 	if (bcm_bits & BCM_NRFD_BIT)
-		status |= BusNRFD;
+		status |= BUS_NRFD;
 	if (bcm_bits & BCM_NDAC_BIT)
-		status |= BusNDAC;
+		status |= BUS_NDAC;
 	if (bcm_bits & BCM_DAV_BIT)
-		status |= BusDAV;
+		status |= BUS_DAV;
 	if (bcm_bits & BCM_ATN_BIT)
-		status |= BusATN;
+		status |= BUS_ATN;
 
 	return status;
 }
diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 50faa0c17617..2775dc83305e 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -694,21 +694,21 @@ static int usb_gpib_line_status(const gpib_board_t *board)
 	}
 
 	if ((buffer & 0x01) == 0)
-		line_status |= BusREN;
+		line_status |= BUS_REN;
 	if ((buffer & 0x02) == 0)
-		line_status |= BusIFC;
+		line_status |= BUS_IFC;
 	if ((buffer & 0x04) == 0)
-		line_status |= BusNDAC;
+		line_status |= BUS_NDAC;
 	if ((buffer & 0x08) == 0)
-		line_status |= BusNRFD;
+		line_status |= BUS_NRFD;
 	if ((buffer & 0x10) == 0)
-		line_status |= BusDAV;
+		line_status |= BUS_DAV;
 	if ((buffer & 0x20) == 0)
-		line_status |= BusEOI;
+		line_status |= BUS_EOI;
 	if ((buffer & 0x40) == 0)
-		line_status |= BusATN;
+		line_status |= BUS_ATN;
 	if ((buffer & 0x80) == 0)
-		line_status |= BusSRQ;
+		line_status |= BUS_SRQ;
 
 	DIA_LOG(1, "done with %x %x\n", buffer, line_status);
 
diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 61b15b19e134..7243d361f173 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -1511,21 +1511,21 @@ static int ni_usb_line_status(const gpib_board_t *board)
 	ni_usb_parse_register_read_block(in_data, &bsr_bits, 1);
 	kfree(in_data);
 	if (bsr_bits & BCSR_REN_BIT)
-		line_status |= BusREN;
+		line_status |= BUS_REN;
 	if (bsr_bits & BCSR_IFC_BIT)
-		line_status |= BusIFC;
+		line_status |= BUS_IFC;
 	if (bsr_bits & BCSR_SRQ_BIT)
-		line_status |= BusSRQ;
+		line_status |= BUS_SRQ;
 	if (bsr_bits & BCSR_EOI_BIT)
-		line_status |= BusEOI;
+		line_status |= BUS_EOI;
 	if (bsr_bits & BCSR_NRFD_BIT)
-		line_status |= BusNRFD;
+		line_status |= BUS_NRFD;
 	if (bsr_bits & BCSR_NDAC_BIT)
-		line_status |= BusNDAC;
+		line_status |= BUS_NDAC;
 	if (bsr_bits & BCSR_DAV_BIT)
-		line_status |= BusDAV;
+		line_status |= BUS_DAV;
 	if (bsr_bits & BCSR_ATN_BIT)
-		line_status |= BusATN;
+		line_status |= BUS_ATN;
 	return line_status;
 }
 
diff --git a/drivers/staging/gpib/tms9914/tms9914.c b/drivers/staging/gpib/tms9914/tms9914.c
index 1f2bb163cfb5..17adeccf448b 100644
--- a/drivers/staging/gpib/tms9914/tms9914.c
+++ b/drivers/staging/gpib/tms9914/tms9914.c
@@ -396,21 +396,21 @@ int tms9914_line_status(const gpib_board_t *board, struct tms9914_priv *priv)
 	bsr_bits = read_byte(priv, BSR);
 
 	if (bsr_bits & BSR_REN_BIT)
-		status |= BusREN;
+		status |= BUS_REN;
 	if (bsr_bits & BSR_IFC_BIT)
-		status |= BusIFC;
+		status |= BUS_IFC;
 	if (bsr_bits & BSR_SRQ_BIT)
-		status |= BusSRQ;
+		status |= BUS_SRQ;
 	if (bsr_bits & BSR_EOI_BIT)
-		status |= BusEOI;
+		status |= BUS_EOI;
 	if (bsr_bits & BSR_NRFD_BIT)
-		status |= BusNRFD;
+		status |= BUS_NRFD;
 	if (bsr_bits & BSR_NDAC_BIT)
-		status |= BusNDAC;
+		status |= BUS_NDAC;
 	if (bsr_bits & BSR_DAV_BIT)
-		status |= BusDAV;
+		status |= BUS_DAV;
 	if (bsr_bits & BSR_ATN_BIT)
-		status |= BusATN;
+		status |= BUS_ATN;
 
 	return status;
 }
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index d32420dee5e5..76fd9422809c 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -159,21 +159,21 @@ static int tnt4882_line_status(const gpib_board_t *board)
 	bcsr_bits = tnt_readb(tnt_priv, BSR);
 
 	if (bcsr_bits & BCSR_REN_BIT)
-		status |= BusREN;
+		status |= BUS_REN;
 	if (bcsr_bits & BCSR_IFC_BIT)
-		status |= BusIFC;
+		status |= BUS_IFC;
 	if (bcsr_bits & BCSR_SRQ_BIT)
-		status |= BusSRQ;
+		status |= BUS_SRQ;
 	if (bcsr_bits & BCSR_EOI_BIT)
-		status |= BusEOI;
+		status |= BUS_EOI;
 	if (bcsr_bits & BCSR_NRFD_BIT)
-		status |= BusNRFD;
+		status |= BUS_NRFD;
 	if (bcsr_bits & BCSR_NDAC_BIT)
-		status |= BusNDAC;
+		status |= BUS_NDAC;
 	if (bcsr_bits & BCSR_DAV_BIT)
-		status |= BusDAV;
+		status |= BUS_DAV;
 	if (bcsr_bits & BCSR_ATN_BIT)
-		status |= BusATN;
+		status |= BUS_ATN;
 
 	return status;
 }
diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index 0896a55a758f..2d742540630a 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -115,17 +115,6 @@ enum bus_control_line {
 	ValidATN = 0x40,
 	ValidEOI = 0x80,
 	ValidALL = 0xff,
-	BusDAV = 0x0100,		/* DAV	line status bit */
-	BusNDAC = 0x0200,		/* NDAC line status bit */
-	BusNRFD = 0x0400,		/* NRFD line status bit */
-	BusIFC = 0x0800,		/* IFC	line status bit */
-	BusREN = 0x1000,		/* REN	line status bit */
-	BusSRQ = 0x2000,		/* SRQ	line status bit */
-	BusATN = 0x4000,		/* ATN	line status bit */
-	BusEOI = 0x8000		/* EOI	line status bit */
-};
-
-enum old_bus_control_line {
 	BUS_DAV = 0x0100,		/* DAV	line status bit */
 	BUS_NDAC = 0x0200,		/* NDAC line status bit */
 	BUS_NRFD = 0x0400,		/* NRFD line status bit */
-- 
2.43.0

