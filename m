Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30832CA4
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 14:32:29 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 71-20020a1c014a000000b0032cafd23b1dso168349wmb.4
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 07:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RAj0aiWl+Hji1MErAOm7QfqsGTlwZNUkSUsTTflQ6nc=;
        b=czlC5k1WkXToJ+m2VHFI27g7tQ3OxyiA3rL2Yq4a+KMUhEOAgXei30wU1sGBisPT+z
         vh0cIZnHRn2JCE23Zs3Azd2GrEqWdb2NVeLV9UZGIKdykjJRYXXnkjKq6lm5qe9FzIhf
         Rr2nlL/Lg74QzynpN+ffYQ+MKRZA6vqWTIJ4B/Bvvics4eSusk9iEAlReengHJl3GV18
         QwwV7o/a9z/sxk9vw33VRn4cEQqF9J8reBi1W42T3LRB6bDh74K5fqBiVo1YfKX9z0WL
         o02tWsvG+p5f++FAbVfpxJV/P/dD2HPvu+GSPvReGWdrY8vhrvB2VrXfEAidzO0kex+Q
         ezsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RAj0aiWl+Hji1MErAOm7QfqsGTlwZNUkSUsTTflQ6nc=;
        b=g4y5pwl2v1xmNI8E71uWplUUKJG44HTUCS/OAWn63bh/+5gMQIVj4Ll4LTLANTrWLi
         uddsNIlBLNJhWw9ktd5jOC15XDMycvaaatHs9BgadP9tZpFVjP9MIF9wAr4Qx+C1nY7S
         lhUvxt4PZiDRbDsM33wnzNyQbjmAr4+EcZ3kc/FabJA4PXHU1KOxj+vTM91D41xbItUy
         yWXR8cV932yOpJM/YaM3KLJjVCrHHQDMt5xeqBtC+UI4VudRsbhKmDTVBcAeyoWUCtM+
         mirNBlKBjZZuboa1lkexOP4ReAtcjzJQCo/EHhOCsuZGNffsvFMFW41DOIrBafdQ8SR9
         NQPw==
X-Gm-Message-State: AOAM531R/ESkOcprhuQ62oRXv0jvI0GyOstdLzHcoMg7Vo+Sc6ZUifFw
	goWzIXowZarLCgUO7QAnFtI=
X-Google-Smtp-Source: ABdhPJxr9ESgn+40Y9hxhGj5zHGF83DSmBOBVIvzFIlnBzxa7DWjGPRdRU3n0+UmcmKC0uejYFmLYA==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr49988880wmi.131.1635172348279;
        Mon, 25 Oct 2021 07:32:28 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id x8sm13011500wrr.53.2021.10.25.07.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 07:32:27 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 8/8] staging: vt6655: Rename `dwAL7230InitTable` array
Date: Mon, 25 Oct 2021 15:31:34 +0100
Message-Id: <4e78c4628ba75d9793bd8a60d69a1b0cc4d2a073.1635171519.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1635171518.git.karolinadrobnik@gmail.com>
References: <cover.1635171518.git.karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To align with the kernel coding style, remove the type from
the variable name and do not use CamelCase.

Fix issue detected by checkpatch.pl:
  CHECK: Avoid CamelCase: <dwAL7230InitTable>

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index 1c81c44f086c..bc4abe77db7b 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -155,7 +155,7 @@ static unsigned long al2230_power_table[AL2230_PWR_IDX_LEN] = {
 /* 40MHz reference frequency
  * Need to Pull PLLON(PE3) low when writing channel registers through 3-wire.
  */
-static const unsigned long dwAL7230InitTable[CB_AL7230_INIT_SEQ] = {
+static const unsigned long al7230_init_table[CB_AL7230_INIT_SEQ] = {
 	0x00379000 + (BY_AL7230_REG_LEN << 3) + IFREGCTL_REGW, /* Channel1 // Need modify for 11a */
 	0x13333100 + (BY_AL7230_REG_LEN << 3) + IFREGCTL_REGW, /* Channel1 // Need modify for 11a */
 	0x841FF200 + (BY_AL7230_REG_LEN << 3) + IFREGCTL_REGW, /* Need modify for 11a: 451FE2 */
@@ -420,7 +420,7 @@ static bool s_bAL7230Init(struct vnt_private *priv)
 	bb_power_save_mode_off(priv); /* RobertYu:20050106, have DC value for Calibration */
 
 	for (ii = 0; ii < CB_AL7230_INIT_SEQ; ii++)
-		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTable[ii]);
+		ret &= IFRFbWriteEmbedded(priv, al7230_init_table[ii]);
 
 	/* PLL On */
 	MACvWordRegBitsOn(iobase, MAC_REG_SOFTPWRCTL, SOFTPWRCTL_SWPE3);
@@ -434,7 +434,7 @@ static bool s_bAL7230Init(struct vnt_private *priv)
 	ret &= IFRFbWriteEmbedded(priv, (0x3ABA8F00 + (BY_AL7230_REG_LEN << 3) + IFREGCTL_REGW));
 	MACvTimer0MicroSDelay(priv, 30);/* 30us */
 	/* TXDCOC:disable, RCK:disable */
-	ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTable[CB_AL7230_INIT_SEQ - 1]);
+	ret &= IFRFbWriteEmbedded(priv, al7230_init_table[CB_AL7230_INIT_SEQ - 1]);
 
 	MACvWordRegBitsOn(iobase, MAC_REG_SOFTPWRCTL, (SOFTPWRCTL_SWPE3    |
 							 SOFTPWRCTL_SWPE2    |
@@ -716,7 +716,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 
 		if (channel <= CB_MAX_CHANNEL_24G) {
 			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
-				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230InitTable[i]);
+				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_init_table[i]);
 		} else {
 			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
 				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_init_table_a_mode[i]);
@@ -932,13 +932,13 @@ bool RFbAL7230SelectChannelPostProcess(struct vnt_private *priv,
 		ret &= IFRFbWriteEmbedded(priv, al7230_init_table_a_mode[15]);
 	} else if ((byOldChannel > CB_MAX_CHANNEL_24G) && (byNewChannel <= CB_MAX_CHANNEL_24G)) {
 		/* Change from 5G to 2.4G [Reg] */
-		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTable[2]);
-		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTable[3]);
-		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTable[5]);
-		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTable[7]);
-		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTable[10]);
-		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTable[12]);
-		ret &= IFRFbWriteEmbedded(priv, dwAL7230InitTable[15]);
+		ret &= IFRFbWriteEmbedded(priv, al7230_init_table[2]);
+		ret &= IFRFbWriteEmbedded(priv, al7230_init_table[3]);
+		ret &= IFRFbWriteEmbedded(priv, al7230_init_table[5]);
+		ret &= IFRFbWriteEmbedded(priv, al7230_init_table[7]);
+		ret &= IFRFbWriteEmbedded(priv, al7230_init_table[10]);
+		ret &= IFRFbWriteEmbedded(priv, al7230_init_table[12]);
+		ret &= IFRFbWriteEmbedded(priv, al7230_init_table[15]);
 	}
 
 	return ret;
-- 
2.30.2

