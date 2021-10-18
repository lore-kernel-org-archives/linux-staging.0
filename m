Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602B02C88
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 15:06:38 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id b189-20020a1c1bc6000000b0030da052dd4fso250320wmb.3
        for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 08:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2lpX8MzHrofB767bBYDr4EpmpygqZoVr7h7+rRjUfhk=;
        b=IasgMAV6elCuzOLnYMKqhANSzWVEPIhSizJDwNbvzrKq1kU1xnURIlII5tsZDotTWu
         mViYQeckGsLA8b+2lieuSLvz/wyUpK9ePCEo3yjNzXLC37+pTSFAMuEhnL6YpJdeCwRE
         h7srdipUdcG4ZUVNV/vHbcKSXq4ZEt1L6ufKNmBubuKwtfraSnD+pzMpFTLu+CENm09X
         fo9/aWJvbaYD7ez9zdGI27DpLcDTjCtvyP7yZAYfEBWKfa0SC91hL6WKIcQEc/ESeZUe
         RD70Omx2GzeWhnhz7n9+uiU51QWf04XFddYw3LL+tNSwIYjwawZr5O5rzjeEOK50r5KD
         NUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2lpX8MzHrofB767bBYDr4EpmpygqZoVr7h7+rRjUfhk=;
        b=I4jUuf2DaH5VhlDwrPl2k3UhBNEABi1PlANllFFbwXPnS4Zen1BQGIoYQomvzuw3BR
         L8W+aLuJBMPDth1XSRtDo7Y+VS2dzTvjfnWZaD/jA0/RIdqUAIi25JW5vVGPLmE7u0Gf
         JCjuJJ/G0Q7JHlXhVcO872lgifGqlTkt2w5oaS6XkcIQt7V9EvtmmKiticpJVkLzP6ll
         nvi8QGEc9E+IQvJpxqibv1OyPsMwIorSnrN4C9GTRQy2aOXnlRvzaNOLquDbBMXZWB+s
         40xidwaPJyzLDu9mCUfJRh/bpUQqLMIg2OdJV3wJPtcThR0Qb/eFPu59rYFq7CEUnv38
         3DGA==
X-Gm-Message-State: AOAM531+2k1Hc/+JLwNAZv6Dgb/i1jgbT1yFPOmTR8VlDfD/3oqc5IZO
	jB0+ZW/9dvoMu18ESQrDTLs=
X-Google-Smtp-Source: ABdhPJy1+lA+Qhlp5oMGMVMjJUVdoRviC1k/IeyjpzGcdZwcvl8Md958DtDadR24K29v7y06hFaJ3Q==
X-Received: by 2002:a1c:2b81:: with SMTP id r123mr22101493wmr.136.1634569596688;
        Mon, 18 Oct 2021 08:06:36 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id u13sm4543646wri.50.2021.10.18.08.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 08:06:36 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH] staging: vt6655: Fix line wrapping in rf.c file
Date: Mon, 18 Oct 2021 16:05:26 +0100
Message-Id: <20211018150526.9718-1-karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix line length warnings raised by checkpatch.pl in
rf.c file for `RFvWriteWakeProgSyn`,`RFbRawSetPower`
and `RFbAL7230SelectChannelPostProcess`functions.

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 66 +++++++++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index a6f17162d017..206d34b555bc 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -699,11 +699,17 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 			return false;
 
 		for (ii = 0; ii < CB_AL2230_INIT_SEQ; ii++)
-			MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL2230InitTable[ii]);
+			MACvSetMISCFifo(priv,
+					(unsigned short)(MISCFIFO_SYNDATA_IDX + ii),
+					dwAL2230InitTable[ii]);
 
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL2230ChannelTable0[uChannel - 1]);
+		MACvSetMISCFifo(priv,
+				(unsigned short)(MISCFIFO_SYNDATA_IDX + ii),
+				dwAL2230ChannelTable0[uChannel - 1]);
 		ii++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL2230ChannelTable1[uChannel - 1]);
+		MACvSetMISCFifo(priv,
+				(unsigned short)(MISCFIFO_SYNDATA_IDX + ii),
+				dwAL2230ChannelTable1[uChannel - 1]);
 		break;
 
 		/* Need to check, PLLON need to be low for channel setting */
@@ -716,17 +722,28 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 
 		if (uChannel <= CB_MAX_CHANNEL_24G) {
 			for (ii = 0; ii < CB_AL7230_INIT_SEQ; ii++)
-				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL7230InitTable[ii]);
+				MACvSetMISCFifo(priv,
+						(unsigned short)(MISCFIFO_SYNDATA_IDX
+						+ ii), dwAL7230InitTable[ii]);
 		} else {
 			for (ii = 0; ii < CB_AL7230_INIT_SEQ; ii++)
-				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL7230InitTableAMode[ii]);
+				MACvSetMISCFifo(priv,
+						(unsigned short)(MISCFIFO_SYNDATA_IDX
+						+ ii),
+					dwAL7230InitTableAMode[ii]);
 		}
 
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL7230ChannelTable0[uChannel - 1]);
+		MACvSetMISCFifo(priv,
+				(unsigned short)(MISCFIFO_SYNDATA_IDX + ii),
+				dwAL7230ChannelTable0[uChannel - 1]);
 		ii++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL7230ChannelTable1[uChannel - 1]);
+		MACvSetMISCFifo(priv,
+				(unsigned short)(MISCFIFO_SYNDATA_IDX + ii),
+				dwAL7230ChannelTable1[uChannel - 1]);
 		ii++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL7230ChannelTable2[uChannel - 1]);
+		MACvSetMISCFifo(priv,
+				(unsigned short)(MISCFIFO_SYNDATA_IDX + ii),
+				dwAL7230ChannelTable2[uChannel - 1]);
 		break;
 
 	case RF_NOTHING:
@@ -736,7 +753,8 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 		return false;
 	}
 
-	MACvSetMISCFifo(priv, MISCFIFO_SYNINFO_IDX, (unsigned long)MAKEWORD(bySleepCount, byInitCount));
+	MACvSetMISCFifo(priv, MISCFIFO_SYNINFO_IDX,
+			(unsigned long)MAKEWORD(bySleepCount, byInitCount));
 
 	return true;
 }
@@ -836,20 +854,32 @@ bool RFbRawSetPower(struct vnt_private *priv, unsigned char byPwr,
 	case RF_AIROHA:
 		ret &= IFRFbWriteEmbedded(priv, dwAL2230PowerTable[byPwr]);
 		if (rate <= RATE_11M)
-			ret &= IFRFbWriteEmbedded(priv, 0x0001B400 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW);
+			ret &= IFRFbWriteEmbedded(priv, 0x0001B400
+					+ (BY_AL2230_REG_LEN << 3)
+					+ IFREGCTL_REGW);
 		else
-			ret &= IFRFbWriteEmbedded(priv, 0x0005A400 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW);
+			ret &= IFRFbWriteEmbedded(priv, 0x0005A400
+					+ (BY_AL2230_REG_LEN << 3)
+					+ IFREGCTL_REGW);
 
 		break;
 
 	case RF_AL2230S:
 		ret &= IFRFbWriteEmbedded(priv, dwAL2230PowerTable[byPwr]);
 		if (rate <= RATE_11M) {
-			ret &= IFRFbWriteEmbedded(priv, 0x040C1400 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW);
-			ret &= IFRFbWriteEmbedded(priv, 0x00299B00 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW);
+			ret &= IFRFbWriteEmbedded(priv, 0x040C1400
+					+ (BY_AL2230_REG_LEN << 3)
+					+ IFREGCTL_REGW);
+			ret &= IFRFbWriteEmbedded(priv, 0x00299B00
+					+ (BY_AL2230_REG_LEN << 3)
+					+ IFREGCTL_REGW);
 		} else {
-			ret &= IFRFbWriteEmbedded(priv, 0x0005A400 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW);
-			ret &= IFRFbWriteEmbedded(priv, 0x00099B00 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW);
+			ret &= IFRFbWriteEmbedded(priv, 0x0005A400
+					+ (BY_AL2230_REG_LEN << 3)
+					+ IFREGCTL_REGW);
+			ret &= IFRFbWriteEmbedded(priv, 0x00099B00
+					+ (BY_AL2230_REG_LEN << 3)
+					+ IFREGCTL_REGW);
 		}
 
 		break;
@@ -921,7 +951,8 @@ bool RFbAL7230SelectChannelPostProcess(struct vnt_private *priv,
 	 * register
 	 * Channel Index 1~14
 	 */
-	if ((byOldChannel <= CB_MAX_CHANNEL_24G) && (byNewChannel > CB_MAX_CHANNEL_24G)) {
+	if ((byOldChannel <= CB_MAX_CHANNEL_24G) &&
+	    (byNewChannel > CB_MAX_CHANNEL_24G)) {
 		/* Change from 2.4G to 5G [Reg] */
 		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTableAMode[2]);
 		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTableAMode[3]);
@@ -930,7 +961,8 @@ bool RFbAL7230SelectChannelPostProcess(struct vnt_private *priv,
 		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTableAMode[10]);
 		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTableAMode[12]);
 		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTableAMode[15]);
-	} else if ((byOldChannel > CB_MAX_CHANNEL_24G) && (byNewChannel <= CB_MAX_CHANNEL_24G)) {
+	} else if ((byOldChannel > CB_MAX_CHANNEL_24G) &&
+		   (byNewChannel <= CB_MAX_CHANNEL_24G)) {
 		/* Change from 5G to 2.4G [Reg] */
 		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTable[2]);
 		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTable[3]);
-- 
2.30.2

