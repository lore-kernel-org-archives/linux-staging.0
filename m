Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66C52C81
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 13:28:43 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id u8-20020a05600c440800b0030d90076dabso5052441wmn.1
        for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 06:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Bd0wj+p+9TRlN1ZXP/TSahnjo8YS2SPX8pyBePDyCc=;
        b=F0ZS43EWDOllEFrcmG5QFNCOD6Xo2np6Nh2MDNP76gKqkXmn/cjijdlZAhmtSXOzHd
         07ev4RT9ZJgGD7KhM2zVgUwrZvJSQLBXwv1qvOwErvRr3bSlXlrylvZtKSB4CaFL0MTs
         UNxyHYTpwLS/AxALC//Kz6+G6u93fvqVmSi2eljeOhhyJUpsjIFjuOiFehxQnkd7ZYlj
         tk1wAq3JVnUpPVyqMbHYmoT96BwsdQ2oFnIY0tXcvE92vDjSsmrGlT10bBMrTLuwiyDA
         M2Bt8/Nu8j9UlrY/b9fGFzXHnEJizPAhCWoV9B2sLz6kK1V+t0+DrD0YGHZyC4YXc6wg
         chuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Bd0wj+p+9TRlN1ZXP/TSahnjo8YS2SPX8pyBePDyCc=;
        b=KZTAvfE4bBTrqSoxOxHcsYdnzszkuhe1+HFWw9F39qjuWfopEc8NEMn9eHlg4D10zc
         h0XONBqIPGVux4DdydrGmkzxFDqoJOL0hqScSzPjdkdRkRWCNi9jOLfpMjIyYGfu040P
         erMbchTuA7KeSCxjo084nMDWB/m7bMF7gG7XhH9gki/KqjfXYGJJPOg2bLmfDRf1azMD
         KGEhbR4754kfvzBWx1irsjiy/cIkiJUBfR9klT9X5nqiCjc0tDx+Rz1M8ny8/p8WKRzE
         U/I5BAs18hszZZlSgKFDf4/G1yNREExC0jKYYbz5xwC0fLBQXkZVAfIF1K9JNk+lZXgu
         PC1w==
X-Gm-Message-State: AOAM531x50Ntgd79DNrIRk/N2DMqOUUdcW6izKryytijZDA9lWTKyXtv
	p6GhEun1pwnt+dmuW6+7z4U=
X-Google-Smtp-Source: ABdhPJwBIundAVhXSa2XBj9FIMgfaHwj18HTzkFmuT+0+SI3LetT79OI4bq2J7OEBJpmhhd2pf1yGg==
X-Received: by 2002:a7b:c007:: with SMTP id c7mr13816618wmb.101.1634736522212;
        Wed, 20 Oct 2021 06:28:42 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id n26sm3323115wmi.16.2021.10.20.06.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 06:28:41 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH] staging: vt6655: Rename `dwAL2230InitTable` array
Date: Wed, 20 Oct 2021 14:28:11 +0100
Message-Id: <20211020132811.417341-1-karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop Hungarian notation prefix in `dwAL2230InitTable` array.
Change it to use snake case.

Fix issue detected by checkpatch.pl:
  CHECK: Avoid CamelCase: <dwAL2230InitTable>

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index a6f17162d017..6bdacf8fbc27 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -33,7 +33,7 @@
 #define SWITCH_CHANNEL_DELAY_AL7230 200 /* us */
 #define AL7230_PWR_IDX_LEN    64
 
-static const unsigned long dwAL2230InitTable[CB_AL2230_INIT_SEQ] = {
+static const unsigned long al2230_init_table[CB_AL2230_INIT_SEQ] = {
 	0x03F79000 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW,
 	0x03333100 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW,
 	0x01A00200 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW,
@@ -545,7 +545,7 @@ static bool RFbAL2230Init(struct vnt_private *priv)
 	IFRFbWriteEmbedded(priv, (0x07168700 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW));
 
 	for (ii = 0; ii < CB_AL2230_INIT_SEQ; ii++)
-		ret &= IFRFbWriteEmbedded(priv, dwAL2230InitTable[ii]);
+		ret &= IFRFbWriteEmbedded(priv, al2230_init_table[ii]);
 	MACvTimer0MicroSDelay(priv, 30); /* delay 30 us */
 
 	/* PLL On */
@@ -557,7 +557,7 @@ static bool RFbAL2230Init(struct vnt_private *priv)
 	ret &= IFRFbWriteEmbedded(priv, (0x00780f00 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW));
 	MACvTimer0MicroSDelay(priv, 30);/* 30us */
 	ret &= IFRFbWriteEmbedded(priv,
-				  dwAL2230InitTable[CB_AL2230_INIT_SEQ - 1]);
+				  al2230_init_table[CB_AL2230_INIT_SEQ - 1]);
 
 	MACvWordRegBitsOn(iobase, MAC_REG_SOFTPWRCTL, (SOFTPWRCTL_SWPE3    |
 							 SOFTPWRCTL_SWPE2    |
@@ -699,7 +699,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 			return false;
 
 		for (ii = 0; ii < CB_AL2230_INIT_SEQ; ii++)
-			MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL2230InitTable[ii]);
+			MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), al2230_init_table[ii]);
 
 		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL2230ChannelTable0[uChannel - 1]);
 		ii++;
-- 
2.30.2

