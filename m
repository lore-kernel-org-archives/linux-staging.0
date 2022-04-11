Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD011FA0
	for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 20:49:37 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id z99so11369714ede.5
        for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 13:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H2scwZEssf4kDEsnRwZq/AbY5fk4ixKF47JMY7rSlEQ=;
        b=Ku/4xZFqcNw89GUMyDE8v8NmN83fUs9JW226tYL05IxaN2gv6Oix0IkmZlqK2Ob79g
         90Mc7obM9F4F+Krxr/61hf129sKWBfNDd7zmLyCQRsCUUbPql61VUQoYtUO3ikyod9ip
         ncUDKmwAO0Rft1ycbQwkUbm3keAVhUZmsGgr1KOYlTt4qVkkfAO0bAQ7NIP7VT49LuhV
         3Ox2VPZS3fTll9jYT91ka1X5/I5V7TQw79rjaQCO8hTNvwGqs+h0wopEOe5LHKDMceTb
         qJ6MRAXte7wa57dvQ/tyOkbeWQugR6+2Lq1FjDb3YQrB4rRFi9C6LqnmBxc0Wz5HgR9l
         6I7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H2scwZEssf4kDEsnRwZq/AbY5fk4ixKF47JMY7rSlEQ=;
        b=mfzSFbHlDOgEC1Th5qGRBL9TE9SkwnnxkxOnMfZJga35oau6hQ7lGiPrnNgAOUBMHy
         owlGRonnmssG1xMg0Dw7afIkzKX6uKTnWcTK2b3ePX3bM1VRXOnUzBoS3Eswa2GE3wip
         UQghrSKcLdJhvObqt75x3WFHfkRqHobtRG6dGw92wawxi8r3sH4q5Y4Vdd7EzrZERWZS
         W2vZk/nbx1p1gBbyZIS1W4v6Af5G/JxC3OXzhDocZRfn/reEOTcfUcEFGW3b7c1vo7nP
         9iKChu3IFFaax3xCSZ5eM68X7OiHXl5d7GWqaHJFCQr4J5m+F3/D2YV5YnE1CXGy6j14
         Adww==
X-Gm-Message-State: AOAM532whreVTIASdCAGUWiFeU81AiC0d9ce4TnuNKvxIQ/iithc1rlz
	XKNjtApsB/OEuo2mg/4Lzcqjc5RcLAs=
X-Google-Smtp-Source: ABdhPJyDDNL7ByIuDzNKiseRxpD8CT2H5Qt4meWcgxmNnwoJxaGuBmbyiN8+HOdDk1juM6R+lvI4Rw==
X-Received: by 2002:a05:6402:3287:b0:41d:924e:5072 with SMTP id f7-20020a056402328700b0041d924e5072mr29525eda.43.1649710176091;
        Mon, 11 Apr 2022 13:49:36 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id o5-20020a170906974500b006dfc781498dsm12424639ejy.37.2022.04.11.13.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 13:49:35 -0700 (PDT)
Date: Mon, 11 Apr 2022 22:49:33 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/7] staging: vt6655: Replace VNSvInPortD with ioread32
Message-ID: <9af181854cd385897db8f4f25e2f011e79d73406.1649706687.git.philipp.g.hortmann@gmail.com>
References: <cover.1649706687.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1649706687.git.philipp.g.hortmann@gmail.com>

Replace macro VNSvInPortD with ioread32.
The name of macro and the arguments use CamelCase which
is not accepted by checkpatch.pl

Since there are more than one checkpatch issue per line,
more steps are rquired to fix.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: This patch was 5/7 and is now 4/6
V2 -> V3: Inserted patch that was before in a different way in
          "Rename macros VNSvInPortB,W,D with CamelCase ..."
          This patch was part of 4/6 and is now 3/7
---
 drivers/staging/vt6655/card.c |  4 ++--
 drivers/staging/vt6655/mac.h  | 22 +++++++++++-----------
 drivers/staging/vt6655/rf.c   |  2 +-
 drivers/staging/vt6655/upc.h  |  3 ---
 4 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 1ccf08b1fd5c..f6d2a7fadc18 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -754,8 +754,8 @@ bool CARDbGetCurrentTSF(struct vnt_private *priv, u64 *pqwCurrTSF)
 	}
 	if (ww == W_MAX_TIMEOUT)
 		return false;
-	VNSvInPortD(iobase + MAC_REG_TSFCNTR, (u32 *)pqwCurrTSF);
-	VNSvInPortD(iobase + MAC_REG_TSFCNTR + 4, (u32 *)pqwCurrTSF + 1);
+	*((u32 *)pqwCurrTSF) = ioread32(iobase + MAC_REG_TSFCNTR);
+	*((u32 *)pqwCurrTSF + 1) = ioread32(iobase + MAC_REG_TSFCNTR + 4);
 
 	return true;
 }
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 4e7875ff9ff3..114d1f9c2a1a 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -619,7 +619,7 @@ do {								\
 #define MACvReceive0(iobase)						\
 do {									\
 	unsigned long dwData;						\
-	VNSvInPortD(iobase + MAC_REG_RXDMACTL0, &dwData);		\
+	dwData = ioread32(iobase + MAC_REG_RXDMACTL0);		\
 	if (dwData & DMACTL_RUN)					\
 		VNSvOutPortD(iobase + MAC_REG_RXDMACTL0, DMACTL_WAKE); \
 	else								\
@@ -629,7 +629,7 @@ do {									\
 #define MACvReceive1(iobase)						\
 do {									\
 	unsigned long dwData;						\
-	VNSvInPortD(iobase + MAC_REG_RXDMACTL1, &dwData);		\
+	dwData = ioread32(iobase + MAC_REG_RXDMACTL1);		\
 	if (dwData & DMACTL_RUN)					\
 		VNSvOutPortD(iobase + MAC_REG_RXDMACTL1, DMACTL_WAKE); \
 	else								\
@@ -639,7 +639,7 @@ do {									\
 #define MACvTransmit0(iobase)						\
 do {									\
 	unsigned long dwData;						\
-	VNSvInPortD(iobase + MAC_REG_TXDMACTL0, &dwData);		\
+	dwData = ioread32(iobase + MAC_REG_TXDMACTL0);		\
 	if (dwData & DMACTL_RUN)					\
 		VNSvOutPortD(iobase + MAC_REG_TXDMACTL0, DMACTL_WAKE); \
 	else								\
@@ -649,7 +649,7 @@ do {									\
 #define MACvTransmitAC0(iobase)					\
 do {									\
 	unsigned long dwData;						\
-	VNSvInPortD(iobase + MAC_REG_AC0DMACTL, &dwData);		\
+	dwData = ioread32(iobase + MAC_REG_AC0DMACTL);		\
 	if (dwData & DMACTL_RUN)					\
 		VNSvOutPortD(iobase + MAC_REG_AC0DMACTL, DMACTL_WAKE); \
 	else								\
@@ -668,7 +668,7 @@ do {									\
 } while (0)
 
 #define MACvReadISR(iobase, pdwValue)				\
-	VNSvInPortD(iobase + MAC_REG_ISR, pdwValue)
+	*(pdwValue) = ioread32(iobase + MAC_REG_ISR)
 
 #define MACvWriteISR(iobase, dwValue)				\
 	VNSvOutPortD(iobase + MAC_REG_ISR, dwValue)
@@ -686,12 +686,12 @@ do {									\
 	VNSvOutPortB(iobase + MAC_REG_PAGE1SEL, 1)
 
 #define MACvReadMIBCounter(iobase, pdwCounter)			\
-	VNSvInPortD(iobase + MAC_REG_MIBCNTR, pdwCounter)
+	*(pdwCounter) = ioread32(iobase + MAC_REG_MIBCNTR)
 
 #define MACvEnableProtectMD(iobase)					\
 do {									\
 	unsigned long dwOrgValue;					\
-	VNSvInPortD(iobase + MAC_REG_ENCFG, &dwOrgValue);		\
+	dwOrgValue = ioread32(iobase + MAC_REG_ENCFG);		\
 	dwOrgValue = dwOrgValue | ENCFG_PROTECTMD;			\
 	VNSvOutPortD(iobase + MAC_REG_ENCFG, dwOrgValue);		\
 } while (0)
@@ -699,7 +699,7 @@ do {									\
 #define MACvDisableProtectMD(iobase)					\
 do {									\
 	unsigned long dwOrgValue;					\
-	VNSvInPortD(iobase + MAC_REG_ENCFG, &dwOrgValue);		\
+	dwOrgValue = ioread32(iobase + MAC_REG_ENCFG);		\
 	dwOrgValue = dwOrgValue & ~ENCFG_PROTECTMD;			\
 	VNSvOutPortD(iobase + MAC_REG_ENCFG, dwOrgValue);		\
 } while (0)
@@ -707,7 +707,7 @@ do {									\
 #define MACvEnableBarkerPreambleMd(iobase)				\
 do {									\
 	unsigned long dwOrgValue;					\
-	VNSvInPortD(iobase + MAC_REG_ENCFG, &dwOrgValue);		\
+	dwOrgValue = ioread32(iobase + MAC_REG_ENCFG);		\
 	dwOrgValue = dwOrgValue | ENCFG_BARKERPREAM;			\
 	VNSvOutPortD(iobase + MAC_REG_ENCFG, dwOrgValue);		\
 } while (0)
@@ -715,7 +715,7 @@ do {									\
 #define MACvDisableBarkerPreambleMd(iobase)				\
 do {									\
 	unsigned long dwOrgValue;					\
-	VNSvInPortD(iobase + MAC_REG_ENCFG, &dwOrgValue);		\
+	dwOrgValue = ioread32(iobase + MAC_REG_ENCFG);		\
 	dwOrgValue = dwOrgValue & ~ENCFG_BARKERPREAM;			\
 	VNSvOutPortD(iobase + MAC_REG_ENCFG, dwOrgValue);		\
 } while (0)
@@ -723,7 +723,7 @@ do {									\
 #define MACvSetBBType(iobase, byTyp)					\
 do {									\
 	unsigned long dwOrgValue;					\
-	VNSvInPortD(iobase + MAC_REG_ENCFG, &dwOrgValue);		\
+	dwOrgValue = ioread32(iobase + MAC_REG_ENCFG);		\
 	dwOrgValue = dwOrgValue & ~ENCFG_BBTYPE_MASK;			\
 	dwOrgValue = dwOrgValue | (unsigned long)byTyp;			\
 	VNSvOutPortD(iobase + MAC_REG_ENCFG, dwOrgValue);		\
diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index 4498c9d400f2..036f48572334 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -175,7 +175,7 @@ bool IFRFbWriteEmbedded(struct vnt_private *priv, unsigned long dwData)
 
 	/* W_MAX_TIMEOUT is the timeout period */
 	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
-		VNSvInPortD(iobase + MAC_REG_IFREGCTL, &dwValue);
+		dwValue = ioread32(iobase + MAC_REG_IFREGCTL);
 		if (dwValue & IFREGCTL_DONE)
 			break;
 	}
diff --git a/drivers/staging/vt6655/upc.h b/drivers/staging/vt6655/upc.h
index 99bf7aeb56f7..9617667f1a69 100644
--- a/drivers/staging/vt6655/upc.h
+++ b/drivers/staging/vt6655/upc.h
@@ -20,9 +20,6 @@
 
 /* For memory mapped IO */
 
-#define VNSvInPortD(dwIOAddress, pdwData) \
-	(*(pdwData) = ioread32(dwIOAddress))
-
 #define VNSvOutPortB(dwIOAddress, byData) \
 	iowrite8((u8)(byData), dwIOAddress)
 
-- 
2.25.1

