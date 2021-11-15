Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B1F68
	for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 10:56:25 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id t30so29744312wra.10
        for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 02:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J3m1ZcrPeitMRiq9GZNf+n5I5iliMi+d5wYw/rsR5qI=;
        b=dQ/HBlrMCGEUoTFBJc5ipCvUXuGcDMmzQSKMxSEFphc2QHj/uftOln0BBnusCMUFOc
         nYwgPPQXKsVm0gSDooWD8KCYHmbqDlIxYlnSLv1k2avlPGczvBbncksbaE/vx2rt+UOO
         Ed6Ra+YET9weQHyFeGhzBhC88Se4caYeg0SUWCi29Mp58Z2nhhGwvxYXGBRiZ4+xzhKJ
         63pndRCb/+sTIxnRSD+0ieDbHg9izG4qXnYnf3nh79DqCTlczz6Jycf2Cpn2emG05hsg
         uWkx9AE0R8jhbJdhsY2vd8+lSGormrzuFpIeQk8et7wTof9eOIwrMp0XtLlZD0IpBUI+
         uxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J3m1ZcrPeitMRiq9GZNf+n5I5iliMi+d5wYw/rsR5qI=;
        b=SprwqXxumM98a0wY9qIOSI/ldmQM2gOJWGSZ0dPnsIVVtkAwirLxTdyMgtWJRQYJ89
         38YcaAnor+zrSNAKfWIchDEU0MKIrJCJb85I2O1eZaWhJp6QCKH7IVbk46uQufr0vran
         Zx0KevUw6cqty+ETkJJyCvOyVWNUpjLSYE4q922X4Svn0RRsiUjMz+/vlTotFC2REmt6
         LW0WwAwoTxdGFKg+XJTaf0BvEV9lRz3y0queN7JSrMjmXjsYMKXf+3SC2l1+g6fFTKHE
         5pBYfecIZy5X24ga3t+FUNc0hgVYhqYew/ohoK8CenkjU08yDlNS6PHHCeKsN+sb6oUA
         ohdA==
X-Gm-Message-State: AOAM530cC9x/jVJOL3eNKuMTm9J7R7Z1O/K3Bc9sBnrSn3ZIBFCLMN8I
	NDvU+BxvBiEA6NQpEerTTsQ=
X-Google-Smtp-Source: ABdhPJz8NnSLF+xJKqQBvvaos6lPoNm0OFYF5SqL4alMh2ge+cNsO16slF4Vcan/pXpHE2MHlWnkvA==
X-Received: by 2002:a05:6000:1564:: with SMTP id 4mr46513965wrz.9.1636973783540;
        Mon, 15 Nov 2021 02:56:23 -0800 (PST)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id d1sm13516532wrz.92.2021.11.15.02.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 02:56:23 -0800 (PST)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH v3 4/8] staging: vt6655: Rewrite conditional in AL7320 initialization
Date: Mon, 15 Nov 2021 10:55:45 +0000
Message-Id: <28169210bc26d5fcc1080ed18dc8e043bc3ef30b.1636729147.git.karolinadrobnik@gmail.com>
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

Use conditional operator to determine which table for AL7320
initialization should be used. Introduce `init_table` variable
to store this value.

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index ce91a03eb58f..5246ba211ffb 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -684,6 +684,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 	unsigned char init_count = 0;
 	unsigned char sleep_count = 0;
 	unsigned short idx = MISCFIFO_SYNDATA_IDX;
+	const unsigned long *init_table;
 
 	VNSvOutPortW(iobase + MAC_REG_MISCFFNDEX, 0);
 	switch (rf_type) {
@@ -714,13 +715,10 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 		if (init_count > (MISCFIFO_SYNDATASIZE - sleep_count))
 			return false;
 
-		if (channel <= CB_MAX_CHANNEL_24G) {
-			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
-				MACvSetMISCFifo(priv, idx++, al7230_init_table[i]);
-		} else {
-			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
-				MACvSetMISCFifo(priv, idx++, al7230_init_table_a_mode[i]);
-		}
+		init_table = (channel <= CB_MAX_CHANNEL_24G) ?
+			al7230_init_table : al7230_init_table_a_mode;
+		for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
+			MACvSetMISCFifo(priv, idx++, init_table[i]);
 
 		MACvSetMISCFifo(priv, idx++, al7230_channel_table0[channel - 1]);
 		MACvSetMISCFifo(priv, idx++, al7230_channel_table1[channel - 1]);
-- 
2.30.2

