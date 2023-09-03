Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E373C1E
	for <linux-staging@lists.linux.dev>; Sun,  3 Sep 2023 20:37:55 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-500cd6261fdso1477347e87.3
        for <linux-staging@lists.linux.dev>; Sun, 03 Sep 2023 13:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693773473; x=1694378273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YRWHlitn1Ups2JbBClPIKgACBM7YPOCJnPb5BobZAug=;
        b=F32vbd9FCr2HpqxIQvU1x/SigFmpH3z4tm+eqDCquRk8DqqpOD//igxEBhv4Rj8Kln
         2GGwEqYxWwjBnkuVqSVKUrxnHiSsVtU1KniomJ2S7ELbH8denXukiiOaC3AdGae7a2J+
         IMc2K94+8w1njD/w1xzI/wYrtCaMiLX5i7wcPYnLBE4u+CAtajQiGPicU9OFTX+wDp83
         OUMNl9nmaWywzWJ/vleMHnqeirnbQzjOuw80phwKPPe1z0BLHBnGjcJytWOxq8jw26r/
         7jmkwtPRYSBfU1cDQ3eEUOGa0SxL8UYdCW8qL6wFUW1JBP5m33kpLOgE3gm7fR+8ITij
         MQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693773473; x=1694378273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YRWHlitn1Ups2JbBClPIKgACBM7YPOCJnPb5BobZAug=;
        b=SUoTKwxs3YBK6lEhJ4aPvsaF1X0AfegbaEEdirUcx+cdYyZ3XiQWCNT/LCxTc2QyAp
         +ZIafJ2cVCnL6bUyOrz24bR4Nh6SCgkSAQ46lur7J8tnQML9ZI6bTj4o8rFw+jco6cy8
         BC//RsmjQ2VB54XP7g/2ccbwOKjon5lNnfyZsEHBa0y+yzzNcluw/oDAA5J4cHQOQh8d
         YyZI2bhra3CrMG3TJXLGCOMIyvOiVeo2EOIQcIZHPpJ9ARo2tlrUGbee8LN3hYNpaZ2a
         VnBc23sX9FZk5rsAUbCuJ7dDf69/NrEiW2EK8I+ReBaIw6KJmfb2q147Ihbxq9z9kRzn
         sh5A==
X-Gm-Message-State: AOJu0YxTC/BHCJbAfldSJ4STI++pclCISH7AIMI9Kg72nnJbJyj10bqv
	B45mSskk9yvx4M7in7zMf/E=
X-Google-Smtp-Source: AGHT+IGD8wEARDJgDNwFxJ6lQ6C0QteLXJSc7MK7mq375SpywDKC20TpkGEDM/0NFoFVsnuhLSo7Eg==
X-Received: by 2002:a05:6512:114d:b0:500:b88c:ea79 with SMTP id m13-20020a056512114d00b00500b88cea79mr6998294lfg.54.1693773472911;
        Sun, 03 Sep 2023 13:37:52 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id b7-20020ac25e87000000b0050096712dc0sm1399342lfq.222.2023.09.03.13.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 13:37:52 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH] staging: vme_user: Fix block comments where '*' on each line should be aligned
Date: Sun,  3 Sep 2023 22:37:32 +0200
Message-Id: <20230903203732.585378-1-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed checkpatch warnings where lines with '*' in block comments should
be aligned and were not as well as incorrect tab spacings at the start of
comment lines. Also removed spurious newlines between define statements
in define blocks

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
 drivers/staging/vme_user/vme_tsi148.h | 144 +++++++++++++-------------
 1 file changed, 70 insertions(+), 74 deletions(-)

diff --git a/drivers/staging/vme_user/vme_tsi148.h b/drivers/staging/vme_user/vme_tsi148.h
index 63f726e1811a..9748b7897527 100644
--- a/drivers/staging/vme_user/vme_tsi148.h
+++ b/drivers/staging/vme_user/vme_tsi148.h
@@ -96,13 +96,9 @@ struct tsi148_dma_entry {
 #define TSI148_PCFS_MISC0		0xC
 #define TSI148_PCFS_MBARL		0x10
 #define TSI148_PCFS_MBARU		0x14
-
 #define TSI148_PCFS_SUBID		0x28
-
 #define TSI148_PCFS_CAPP		0x34
-
 #define TSI148_PCFS_MISC1		0x3C
-
 #define TSI148_PCFS_XCAPP		0x40
 #define TSI148_PCFS_XSTAT		0x44
 
@@ -255,28 +251,28 @@ static const int TSI148_LCSR_VIACK[8] = { 0, TSI148_LCSR_VIACK1,
  */
 #define TSI148_LCSR_VMEFL	0x250
 
-	/*
-	 * VME exception.
-	 * offset  260
+/*
+ * VME exception.
+ * offset  260
  */
 #define TSI148_LCSR_VEAU	0x260
 #define TSI148_LCSR_VEAL	0x264
 #define TSI148_LCSR_VEAT	0x268
 
-	/*
-	 * PCI error
-	 * offset  270
-	 */
+/*
+ * PCI error
+ * offset  270
+ */
 #define TSI148_LCSR_EDPAU	0x270
 #define TSI148_LCSR_EDPAL	0x274
 #define TSI148_LCSR_EDPXA	0x278
 #define TSI148_LCSR_EDPXS	0x27C
 #define TSI148_LCSR_EDPAT	0x280
 
-	/*
-	 * Inbound Translations
-	 * offset  300
-	 */
+/*
+ * Inbound Translations
+ * offset  300
+ */
 #define TSI148_LCSR_IT0_ITSAU		0x300
 #define TSI148_LCSR_IT0_ITSAL		0x304
 #define TSI148_LCSR_IT0_ITEAU		0x308
@@ -363,53 +359,53 @@ static const int TSI148_LCSR_IT[8] = { TSI148_LCSR_IT0, TSI148_LCSR_IT1,
 #define TSI148_LCSR_OFFSET_ITOFL	0x14
 #define TSI148_LCSR_OFFSET_ITAT		0x18
 
-	/*
-	 * Inbound Translation GCSR
-	 * offset  400
-	 */
+/*
+ * Inbound Translation GCSR
+ * offset  400
+ */
 #define TSI148_LCSR_GBAU	0x400
 #define TSI148_LCSR_GBAL	0x404
 #define TSI148_LCSR_GCSRAT	0x408
 
-	/*
-	 * Inbound Translation CRG
-	 * offset  40C
-	 */
+/*
+ * Inbound Translation CRG
+ * offset  40C
+ */
 #define TSI148_LCSR_CBAU	0x40C
 #define TSI148_LCSR_CBAL	0x410
 #define TSI148_LCSR_CSRAT	0x414
 
-	/*
-	 * Inbound Translation CR/CSR
-	 *         CRG
-	 * offset  418
-	 */
+/*
+ * Inbound Translation CR/CSR
+ *         CRG
+ * offset  418
+ */
 #define TSI148_LCSR_CROU	0x418
 #define TSI148_LCSR_CROL	0x41C
 #define TSI148_LCSR_CRAT	0x420
 
-	/*
-	 * Inbound Translation Location Monitor
-	 * offset  424
-	 */
+/*
+ * Inbound Translation Location Monitor
+ * offset  424
+ */
 #define TSI148_LCSR_LMBAU	0x424
 #define TSI148_LCSR_LMBAL	0x428
 #define TSI148_LCSR_LMAT	0x42C
 
-	/*
-	 * VMEbus Interrupt Control.
-	 * offset  430
-	 */
+/*
+ * VMEbus Interrupt Control.
+ * offset  430
+ */
 #define TSI148_LCSR_BCU		0x430
 #define TSI148_LCSR_BCL		0x434
 #define TSI148_LCSR_BPGTR	0x438
 #define TSI148_LCSR_BPCTR	0x43C
 #define TSI148_LCSR_VICR	0x440
 
-	/*
-	 * Local Bus Interrupt Control.
-	 * offset  448
-	 */
+/*
+ * Local Bus Interrupt Control.
+ * offset  448
+ */
 #define TSI148_LCSR_INTEN	0x448
 #define TSI148_LCSR_INTEO	0x44C
 #define TSI148_LCSR_INTS	0x450
@@ -417,10 +413,10 @@ static const int TSI148_LCSR_IT[8] = { TSI148_LCSR_IT0, TSI148_LCSR_IT1,
 #define TSI148_LCSR_INTM1	0x458
 #define TSI148_LCSR_INTM2	0x45C
 
-	/*
-	 * DMA Controllers
-	 * offset 500
-	 */
+/*
+ * DMA Controllers
+ * offset 500
+ */
 #define TSI148_LCSR_DCTL0	0x500
 #define TSI148_LCSR_DSTA0	0x504
 #define TSI148_LCSR_DCSAU0	0x508
@@ -484,27 +480,27 @@ static const int TSI148_LCSR_DMA[TSI148_MAX_DMA] = { TSI148_LCSR_DMA0,
 #define TSI148_LCSR_OFFSET_DCNT		0x40
 #define TSI148_LCSR_OFFSET_DDBS		0x44
 
-	/*
-	 * GCSR Register Group
-	 */
+/*
+ * GCSR Register Group
+ */
 
-	/*
-	 *         GCSR    CRG
-	 * offset   00     600 - DEVI/VENI
-	 * offset   04     604 - CTRL/GA/REVID
-	 * offset   08     608 - Semaphore3/2/1/0
-	 * offset   0C     60C - Seamphore7/6/5/4
-	 */
+/*
+ *         GCSR    CRG
+ * offset   00     600 - DEVI/VENI
+ * offset   04     604 - CTRL/GA/REVID
+ * offset   08     608 - Semaphore3/2/1/0
+ * offset   0C     60C - Seamphore7/6/5/4
+ */
 #define TSI148_GCSR_ID		0x600
 #define TSI148_GCSR_CSR		0x604
 #define TSI148_GCSR_SEMA0	0x608
 #define TSI148_GCSR_SEMA1	0x60C
 
-	/*
-	 * Mail Box
-	 *         GCSR    CRG
-	 * offset   10     610 - Mailbox0
-	 */
+/*
+ * Mail Box
+ *         GCSR    CRG
+ * offset   10     610 - Mailbox0
+ */
 #define TSI148_GCSR_MBOX0	0x610
 #define TSI148_GCSR_MBOX1	0x614
 #define TSI148_GCSR_MBOX2	0x618
@@ -515,27 +511,27 @@ static const int TSI148_GCSR_MBOX[4] = { TSI148_GCSR_MBOX0,
 					TSI148_GCSR_MBOX2,
 					TSI148_GCSR_MBOX3 };
 
-	/*
-	 * CR/CSR
-	 */
+/*
+ * CR/CSR
+ */
 
-	/*
-	 *        CR/CSR   CRG
-	 * offset  7FFF4   FF4 - CSRBCR
-	 * offset  7FFF8   FF8 - CSRBSR
-	 * offset  7FFFC   FFC - CBAR
-	 */
+/*
+ *        CR/CSR   CRG
+ * offset  7FFF4   FF4 - CSRBCR
+ * offset  7FFF8   FF8 - CSRBSR
+ * offset  7FFFC   FFC - CBAR
+ */
 #define TSI148_CSRBCR	0xFF4
 #define TSI148_CSRBSR	0xFF8
 #define TSI148_CBAR	0xFFC
 
-	/*
-	 *  TSI148 Register Bit Definitions
-	 */
+/*
+ *  TSI148 Register Bit Definitions
+ */
 
-	/*
-	 *  PFCS Register Set
-	 */
+/*
+ *  PFCS Register Set
+ */
 #define TSI148_PCFS_CMMD_SERR          BIT(8)	/* SERR_L out pin ssys err */
 #define TSI148_PCFS_CMMD_PERR          BIT(6)	/* PERR_L out pin  parity */
 #define TSI148_PCFS_CMMD_MSTR          BIT(2)	/* PCI bus master */
-- 
2.34.1

