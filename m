Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5752C81
	for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 10:56:21 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id r8so29706808wra.7
        for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 02:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pfoIbbQyeoaiMVTbbswbVOIqx8arnjzrsrDHWc/2QRA=;
        b=fICl6o6qvgnNDUrRxFFC9A7JfHMK5wooQfuCLafAMEgZz7pzOnKPBk0Iaj1KTmZZ5h
         1pM+6bl8YW4SQrRBzPRVlONWXQc4biLjsT0zbeoZSqNxFZTStOO/BoAXIUPUzSnV7L1p
         gxPagntPe0GpltGbtwJZkV4c7d3kZli7tpB+X6Kiq0rJ0491cKidV4B+ajSDH+uKNkiU
         8CC7SLwsupagjstanh5jQlx4Lfp0lssQI4J57Q8GFSBB27smKbbLHS+68ZWk1Tm7aR/l
         8/6e9Pcyax1I0LuogQuPfRkZDjTHjt8S0wFjuElJioJD1Cac0JYf9ppzEO6ulvNOuMGx
         ipXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pfoIbbQyeoaiMVTbbswbVOIqx8arnjzrsrDHWc/2QRA=;
        b=eNtIKUOBRSi60ryK7WIZR9fDEEN0W3EaENvqZGnEtB/yQ6UQZRbcVvnKmBLIqheh7O
         fesbIcLjbyzYjzHw8H+MZrhV6zDsfvrayHi9kly+T4aioPDKuvpQI9xcatIutotmLtVO
         BbDYG9nv0vYC3u53YEX8MiLTYF0iqsTgD/xom73B5uuc2pg6hQ0NNyxgX1cAfJfywICN
         AfyE03EgLPYTn4+XU61vAPkKtWfDyx7kH7JoZMsape0jrBHDuk9qlIhmTCa1jz5MeDXk
         gtIOWyLCmJ4KcNOWrZkf70qaxHmZsp4mBJP+3ej1ejFmzTRy1bYRaaKnJUnaJPFZ+l5L
         4FOA==
X-Gm-Message-State: AOAM532qawhLU+9Mv9Uta6XNyepmIAKstyD+Og85S/uPMNoYJIFpsXlV
	EvuRPETtMcJst9BKOh4RQAE=
X-Google-Smtp-Source: ABdhPJxhMlkdpUZZ0QEODXx8CLC3/MXNHzt2/8DVaZ+wgH7FYZuLT+Nqib9MBZpofR9ZuTUMffD7iw==
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr45812392wrj.144.1636973779927;
        Mon, 15 Nov 2021 02:56:19 -0800 (PST)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id d1sm13516532wrz.92.2021.11.15.02.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 02:56:19 -0800 (PST)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH v3 1/8] staging: vt6655: Remove unnecessary type casts
Date: Mon, 15 Nov 2021 10:55:42 +0000
Message-Id: <c9a5718479deda078b582cbc42a4e7b2f3a6cb39.1636729147.git.karolinadrobnik@gmail.com>
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

Remove casts to unsigned short in `RFvWriteWakeProgSyn` function as they are
not needed.

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index bc4abe77db7b..aa90890c5c7a 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -699,11 +699,11 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 			return false;
 
 		for (i = 0; i < CB_AL2230_INIT_SEQ; i++)
-			MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al2230_init_table[i]);
+			MACvSetMISCFifo(priv, MISCFIFO_SYNDATA_IDX + i, al2230_init_table[i]);
 
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al2230_channel_table0[channel - 1]);
+		MACvSetMISCFifo(priv, MISCFIFO_SYNDATA_IDX + i, al2230_channel_table0[channel - 1]);
 		i++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al2230_channel_table1[channel - 1]);
+		MACvSetMISCFifo(priv, MISCFIFO_SYNDATA_IDX + i, al2230_channel_table1[channel - 1]);
 		break;
 
 		/* Need to check, PLLON need to be low for channel setting */
@@ -716,17 +716,17 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 
 		if (channel <= CB_MAX_CHANNEL_24G) {
 			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
-				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_init_table[i]);
+				MACvSetMISCFifo(priv, MISCFIFO_SYNDATA_IDX + i, al7230_init_table[i]);
 		} else {
 			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
-				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_init_table_a_mode[i]);
+				MACvSetMISCFifo(priv, MISCFIFO_SYNDATA_IDX + i, al7230_init_table_a_mode[i]);
 		}
 
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_channel_table0[channel - 1]);
+		MACvSetMISCFifo(priv, MISCFIFO_SYNDATA_IDX + i, al7230_channel_table0[channel - 1]);
 		i++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_channel_table1[channel - 1]);
+		MACvSetMISCFifo(priv, MISCFIFO_SYNDATA_IDX + i, al7230_channel_table1[channel - 1]);
 		i++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_channel_table2[channel - 1]);
+		MACvSetMISCFifo(priv, MISCFIFO_SYNDATA_IDX + i, al7230_channel_table2[channel - 1]);
 		break;
 
 	case RF_NOTHING:
-- 
2.30.2

