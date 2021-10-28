Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4257129CA
	for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 10:35:55 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id d13so9278866wrf.11
        for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 03:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AVb5GC93bP5+2in7SXHaVRcFzvFScW/Z0MhMVVxwoss=;
        b=UBeWVGZjUohQkuLKp9B+34RO1/T07RvSf3ohLXqfSxP5X8++zY037fpNoSiErYR0Nt
         0uFiBOyT318fafXT1HJPh49qgSOgzuO0l0IiVc2Ln6GHGo4TcSh3ZM0ed3PtbizorHc8
         /9N1cWxqkqVCkrl/eUV35behsErEToo+Tj8acJ/XLfB+Rflp0QmZr3IoQ2/fALLgLa80
         puAeL+DtrzIcfpyRnu28cLgcM3tfisoVJyGBBzJbCsBgCwr1mfVKKg/n3to4nhoSw0p1
         Q+nUblPinH81PdK5rZUJbA0H5Ew6VGjgO5n3d29bSJsx0Cf1YMhcYtp0QhFvLKsV1v2S
         LMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AVb5GC93bP5+2in7SXHaVRcFzvFScW/Z0MhMVVxwoss=;
        b=6LP2oPpTbZ+2HBbPnOJUiBZj+tMXcQWouPrk4O/BbZIJVaq283Jzy2eZhYJfQVgeeT
         qaQUzrSH9U2Jkxte5TQjPhAI43AhEXoxFdUL/tXgy0EGUVn/ty6zm76NbKLKGI5cdAd1
         T6oaVwEkUkkofqLzN21kWuFvlCFv/tm2OE6CU5p5yEkWPJLa27qrh0cSX9jRnCW3v90T
         yOnsiSEZfQDQGEsAZoyIJcO89j5n4uLknaWmxL2gSewYP3LEiyh5h0pSnyQR1gBN0D36
         aprd/B8j6FBtLP8d16KZ4OcV6yF63iKl1iNENVsAGTAI2pCrCzzBdqmySmw8QkWKtXZr
         MHCg==
X-Gm-Message-State: AOAM532e2JO9+JOaa4k12ipr0jTSyirYiM2+n2IPR4awDDWepPHqLC+z
	HkD/adkbg1o+3fj1l5saOfiJrKkVgn6IufFa
X-Google-Smtp-Source: ABdhPJwiXEHBUCpyKrHw/X3PhlHP/nFSJvqYQBgj4YRA51NuRP3X7B+7tyydB+mAxH5jYHTXVT0SnA==
X-Received: by 2002:adf:dd07:: with SMTP id a7mr4552817wrm.395.1635417353741;
        Thu, 28 Oct 2021 03:35:53 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id 13sm3768083wrz.38.2021.10.28.03.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 03:35:53 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 1/7] staging: vt6655: Introduce `idx` temporary variable
Date: Thu, 28 Oct 2021 11:35:31 +0100
Message-Id: <34bd0e8f42597edf006a950d420345befc4e0bc2.1635415820.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1635415820.git.karolinadrobnik@gmail.com>
References: <cover.1635415820.git.karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a local variable to store `MISCFIFO_SYNDATA_IDX` offset.
This change helps in shortening the lines in `rf.c` that
are deemed too long by checkpatch.pl.

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index bc4abe77db7b..f195dafb6e63 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -681,6 +681,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 {
 	void __iomem *iobase = priv->port_offset;
 	int i;
+	unsigned short idx = MISCFIFO_SYNDATA_IDX;
 	unsigned char init_count = 0;
 	unsigned char sleep_count = 0;
 
@@ -699,11 +700,11 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 			return false;
 
 		for (i = 0; i < CB_AL2230_INIT_SEQ; i++)
-			MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al2230_init_table[i]);
+			MACvSetMISCFifo(priv, (unsigned short)(idx + i), al2230_init_table[i]);
 
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al2230_channel_table0[channel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al2230_channel_table0[channel - 1]);
 		i++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al2230_channel_table1[channel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al2230_channel_table1[channel - 1]);
 		break;
 
 		/* Need to check, PLLON need to be low for channel setting */
@@ -716,17 +717,17 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 
 		if (channel <= CB_MAX_CHANNEL_24G) {
 			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
-				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_init_table[i]);
+				MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_init_table[i]);
 		} else {
 			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
-				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_init_table_a_mode[i]);
+				MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_init_table_a_mode[i]);
 		}
 
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_channel_table0[channel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_channel_table0[channel - 1]);
 		i++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_channel_table1[channel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_channel_table1[channel - 1]);
 		i++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_channel_table2[channel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_channel_table2[channel - 1]);
 		break;
 
 	case RF_NOTHING:
-- 
2.30.2

