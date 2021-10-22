Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690FC72
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 09:37:53 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id r7so1254664wrc.10
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 02:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l4Vf8zU6lM4dAIRlmzW2kKVym7mK5P5jeMxIM0GYiAU=;
        b=aswhWG6qqkOneHofy3tcYGkagM26dASqaxYw2EqCbTG/dqnk6On9oKM9gLXpK2SeBT
         4Xci9k1Nxv+P9Nuu2+Nn1y7kfCrSOabeukPNDc1IrrIRtENls8EI0ioqWzKUjDp8Q8pt
         wKJlGnHXXEMg4qPWcvcthF8h0et+hWbf4UzJTuvbX3sMBnWnuZjsUwtvmn+D7io9AvRL
         HzI2n7kg78TzvuRfQLaZX/FoS1XZX76qT9CSjJ4aksOctrqhmrrXtVsLGs671mweyN9t
         fz3ZtmW07muWBKeSiXkg+wTBQLY1NrAY/fZt3Xi/N6V+yKf5EsSLmOVUxfSTdenIUH/n
         lzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l4Vf8zU6lM4dAIRlmzW2kKVym7mK5P5jeMxIM0GYiAU=;
        b=5iMb/hyjYlhlAZWVnX6J6w7aKzESh3KAveEoC+S8GOxVFUBIh7oefdVOKpWWCBYhwg
         JR3nqypMEgceDDySUPs+ZniF3yKogSQVMdbNHg+tudvMsfRN4gfFNC+Cadx9KJletf4f
         zv2ccqErRII5ms+bvPPKmlKb9ZmtHtSzuHZJ+ZEf7rxgdEZoJ1o9PDY6534B2i+0SpqM
         TigjpnZG3Ho12INuHOb8oe2O35ZTYiFidvuqyARqG7ItdI26sOTqMpVwpL3CmGD9G2cD
         rDmhKDvKE/p4f83meqrK0Mxgr/Bkx8InGYlWOhGs40MEULsKOBqGtrIPC9mmnLwRtqzO
         WhYQ==
X-Gm-Message-State: AOAM530P+MIqlyBj/ZXjp4NkFLJ7RYuT7hY3TsA5mGwg9D4+gWiVrJYg
	GE9OzdZ8467ydYRsLD2yx20=
X-Google-Smtp-Source: ABdhPJzU79r4omGoWAzUWWlL+gdBhidW1dkzSfbXngnlxoM7Lef+MNdS7vhvB9d4LxZglfh26QP4kw==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr14712574wrd.63.1634895471865;
        Fri, 22 Oct 2021 02:37:51 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id r15sm1643602wru.9.2021.10.22.02.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 02:37:51 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 3/5] staging: vt6655: Rename `bySleepCount` variable
Date: Fri, 22 Oct 2021 10:37:16 +0100
Message-Id: <70ee3b7d9797d546bab311840da5f8709397ce08.1634826774.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1634826774.git.karolinadrobnik@gmail.com>
References: <cover.1634826774.git.karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop Hungarian notation in `bySleepCount` variable in
`RFvWriteWakeProgSyn` function. Change it to use snake case.

Fix issue detected by checkpatch.pl:
  CHECK: Avoid CamelCase: <bySleepCount>

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index 36708af7d612..a30ffacf720a 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -682,7 +682,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 	void __iomem *iobase = priv->port_offset;
 	int i;
 	unsigned char init_count = 0;
-	unsigned char bySleepCount = 0;
+	unsigned char sleep_count = 0;
 
 	VNSvOutPortW(iobase + MAC_REG_MISCFFNDEX, 0);
 	switch (byRFType) {
@@ -694,8 +694,8 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 
 		 /* Init Reg + Channel Reg (2) */
 		init_count = CB_AL2230_INIT_SEQ + 2;
-		bySleepCount = 0;
-		if (init_count > (MISCFIFO_SYNDATASIZE - bySleepCount))
+		sleep_count = 0;
+		if (init_count > (MISCFIFO_SYNDATASIZE - sleep_count))
 			return false;
 
 		for (i = 0; i < CB_AL2230_INIT_SEQ; i++)
@@ -710,8 +710,8 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 	case RF_AIROHA7230:
 		 /* Init Reg + Channel Reg (3) */
 		init_count = CB_AL7230_INIT_SEQ + 3;
-		bySleepCount = 0;
-		if (init_count > (MISCFIFO_SYNDATASIZE - bySleepCount))
+		sleep_count = 0;
+		if (init_count > (MISCFIFO_SYNDATASIZE - sleep_count))
 			return false;
 
 		if (uChannel <= CB_MAX_CHANNEL_24G) {
@@ -736,7 +736,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 		return false;
 	}
 
-	MACvSetMISCFifo(priv, MISCFIFO_SYNINFO_IDX, (unsigned long)MAKEWORD(bySleepCount, init_count));
+	MACvSetMISCFifo(priv, MISCFIFO_SYNINFO_IDX, (unsigned long)MAKEWORD(sleep_count, init_count));
 
 	return true;
 }
-- 
2.30.2

