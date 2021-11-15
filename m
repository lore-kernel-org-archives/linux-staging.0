Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056B82C81
	for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 10:56:23 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id d27so29811112wrb.6
        for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 02:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KdnvnZ7J2/koQu70kgtIUFr3wg0Bu4erMOm8YnDNdUM=;
        b=A5E0hXaT2bWiSVAxf7gesyVmU+UILmQB8ZTYTpV4rdR9GVUzKdlxi6qLnyQ0dAhC2U
         QzaxvNB4Q9Ex3d6xHkcygAWArAhZmGCrYDBt8Kezwrz4NHqBvXIMpj7QlhIhpKsR8Agu
         TQz5RtTgwHrFQccf+Oj0+QbtMIf3CWJuc+fhY45633nS5/6lTvgAVzPcg6a40na99g5N
         cGrsm285fdt+QkhCgmCY4q3Km92sx2sAVg9WVBQmGAhJ+cXU8bLGj4OGLGQXrEb3eypH
         rgpq3aR7tRR10TORWmo/5c8AFG4jWhGF7cJ47PsDVWfkR9nABI6QFU0kvHMpGIwBgWTw
         hS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KdnvnZ7J2/koQu70kgtIUFr3wg0Bu4erMOm8YnDNdUM=;
        b=LV+3lAjDhTucdfSB7rd2iBnJPoXaA11sNyBt9xlGgCa5ZOh+bhp+FG1xCXqtGCvAem
         3rEFQsSkYcNrDCZBMS/fOzD30vdkyfxmEu9mQraxV3ahrn+TPOTF75EZ+WYf3v1wtHYd
         0Kg4xcNRWp4N/n6GF4X2WlemXx4l2Nc7T5FiUrpcQ+ehMEeXQ0Fl3cqlhZ+Wop5euL0R
         cORvlIwclABHG6xDcUKrMBiaqsH9dwu9XhM8TyiQDW35qRE1m+VLSJ7d0E/MGK/I2yj7
         1RCTvdW//eD3mGEvJnCMRm/bdzNHaiw0E8K9QPfqYRROs32ZZtZWvZZamUPgciOVsB6M
         +TqQ==
X-Gm-Message-State: AOAM531lfDWYd56jZ5BPgvItNt1xbHhAf8qTaFu/CcRHVAB2awFwQqUP
	p3KoIEBpoL+oJNoaaNnaYXA=
X-Google-Smtp-Source: ABdhPJxjjTfJSXRn9cYdTi97NN5Mk1IOKlI3DD5T+4fuf/wawGIueN4B1KOHK/a5DFhJV9h2gg62YQ==
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr45732136wrr.152.1636973782467;
        Mon, 15 Nov 2021 02:56:22 -0800 (PST)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id d1sm13516532wrz.92.2021.11.15.02.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 02:56:22 -0800 (PST)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH v3 3/8] staging: vt6655: Use incrementation in `idx`
Date: Mon, 15 Nov 2021 10:55:44 +0000
Message-Id: <9affeaf40ddb31e03b21db9acd099db4d80da179.1636729147.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1636729147.git.karolinadrobnik@gmail.com>
References: <cover.1636729147.git.karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Increment `idx` in a loop instead of adding the loop counter
`i` to do so. Delete increments of `i` that were rendered
unnecessary by this change.

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index d57fab3f10fb..ce91a03eb58f 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -700,11 +700,10 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 			return false;
 
 		for (i = 0; i < CB_AL2230_INIT_SEQ; i++)
-			MACvSetMISCFifo(priv, idx + i, al2230_init_table[i]);
+			MACvSetMISCFifo(priv, idx++, al2230_init_table[i]);
 
-		MACvSetMISCFifo(priv, idx + i, al2230_channel_table0[channel - 1]);
-		i++;
-		MACvSetMISCFifo(priv, idx + i, al2230_channel_table1[channel - 1]);
+		MACvSetMISCFifo(priv, idx++, al2230_channel_table0[channel - 1]);
+		MACvSetMISCFifo(priv, idx++, al2230_channel_table1[channel - 1]);
 		break;
 
 		/* Need to check, PLLON need to be low for channel setting */
@@ -717,17 +716,15 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 
 		if (channel <= CB_MAX_CHANNEL_24G) {
 			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
-				MACvSetMISCFifo(priv, idx + i, al7230_init_table[i]);
+				MACvSetMISCFifo(priv, idx++, al7230_init_table[i]);
 		} else {
 			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
-				MACvSetMISCFifo(priv, idx + i, al7230_init_table_a_mode[i]);
+				MACvSetMISCFifo(priv, idx++, al7230_init_table_a_mode[i]);
 		}
 
-		MACvSetMISCFifo(priv, idx + i, al7230_channel_table0[channel - 1]);
-		i++;
-		MACvSetMISCFifo(priv, idx + i, al7230_channel_table1[channel - 1]);
-		i++;
-		MACvSetMISCFifo(priv, idx + i, al7230_channel_table2[channel - 1]);
+		MACvSetMISCFifo(priv, idx++, al7230_channel_table0[channel - 1]);
+		MACvSetMISCFifo(priv, idx++, al7230_channel_table1[channel - 1]);
+		MACvSetMISCFifo(priv, idx++, al7230_channel_table2[channel - 1]);
 		break;
 
 	case RF_NOTHING:
-- 
2.30.2

