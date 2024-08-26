Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19657E6
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 00:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724631452; cv=none; b=B4BRLAR7A3E/rdc/WcasAxUsx56EQojN2yCYxKJevKPgoT8BLaBTIVDYqgm66ZmVByP9cLL+GRSEhetLJs/71BzCPnLdF7ACETs7dxqP51DXEMFV6I/6YjAokMWBGe/CZQteGU0HiaesDMGcDikW8vCq4/CtUjNSuhbU1ybympA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724631452; c=relaxed/simple;
	bh=S+Z6PJyaSmQhlIQp5Y6utZhqCwrSWc6kUiM3bwJoleU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KS1qB4jXV+JgA3mQ73eumej4Z8tX8vplISspPhuK/xh50hDQGTMoprdNPD5A2R7VMB6InmdBTx/KlJFejWXQFW4S2cIIx/wO6y59knOF+pRsxorTeYUIMTr/mAw1C5D0WhIEaSos3uShsi84qHXKATtNch/BjyJtfNO7JDcu4og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=Rb/GESbn; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Rb/GESbn"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2020e83eca1so33308855ad.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 17:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1724631449; x=1725236249; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ocJqzZ8bzJemFKKS0cPSkwvik8OFTuPmEhYsMphrCg=;
        b=Rb/GESbnNAlqOuo3V7CC6RbYQb9Eb6L40AUCZSWJVUL5d4y2Pd9PaBWh79Lj75rcoU
         FQljAbaoqCmPvxCzB4humDLGEgwn/xMHwZLZbsy98w5jNRNNZcQFYWSnQGVCzMZJ1OgF
         A6459B+A8fsJHjQ5vrStBfHC5gqLu1O57eLRGcqKnHhPZuUhBCUCe2Znh8GXWup4rMw1
         HKG/Hzq4JrgWrMk13UuZdMSEQdf8a+cHbhHEWjGj95B5TOM+5ketfG0Sm0Nzf2h+y9wz
         +SVAXcnB7piVQy4QnNMxV49uaCr3ZB/g6XpD7XRLa032VVYs7kmNZD9CBJTCtrNHY1N8
         gopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724631449; x=1725236249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ocJqzZ8bzJemFKKS0cPSkwvik8OFTuPmEhYsMphrCg=;
        b=Cbzu03Oktc/QfQM/kijbVite6/98J5gpPk5PwMGnKZTpDeqdWmRLRVyoC04DOCVCWu
         ScFIr+yYiBJn83+qRUSwwdwugm1hLaUVfQL9kJna5UVuqR71ekBZ6ZsfP6CJcaeWMgvY
         S46jpMze8pLSVGU+rM+BKyiM1R+01NUAQFNpk0gZljdwic/CLbVEJdsQFPsTJq44tEjo
         8mA0Ygy8iEitS22XYI3dk90rKII4LdI7bk0YkL7hYbBL3IihhKad/0+f8MhhdKyL0yIN
         7Tc++JKmc/hRwaf1larfSDwuMZQcC3hvMxuobbPIs05sZiGen50oueRQ5xfFulCPoS3e
         ZqeA==
X-Gm-Message-State: AOJu0Yyozwe+wDc0643SNBYmrulHVx6tNOWlFxZcrcfcmLLNH5iGjmwx
	KNK4xhzVLTyJdXmigr82FBt8nkhFQ/n8d6tcqyC+xBEgii4gJio8y94H8n3wroA=
X-Google-Smtp-Source: AGHT+IFfy8YIndXr+rHv9Dou4P7+V1+essF3+qWDSxzOqg6z1+wYN4SrGOKZf/Dq1C5vAeRVAY/WMA==
X-Received: by 2002:a17:902:d4ce:b0:201:f853:3e69 with SMTP id d9443c01a7336-2039e4fbb83mr82215805ad.57.1724631449213;
        Sun, 25 Aug 2024 17:17:29 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203857051b9sm58695955ad.234.2024.08.25.17.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 17:17:28 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 2/6] Staging: rtl8192e: Rename variable bLastIniPkt
Date: Sun, 25 Aug 2024 17:17:20 -0700
Message-Id: <20240826001724.274811-3-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240826001724.274811-1-tdavies@darkphysics.net>
References: <20240826001724.274811-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bLastIniPkt to last_ini_pkt
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c | 8 ++++----
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c    | 2 +-
 drivers/staging/rtl8192e/rtllib.h                 | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
index e470b49b0ff7..8247f22454cd 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
@@ -16,18 +16,18 @@ bool rtl92e_send_cmd_pkt(struct net_device *dev, u32 type, const void *data,
 	struct sk_buff		*skb;
 	unsigned char		*seg_ptr;
 	struct cb_desc *tcb_desc;
-	u8				bLastIniPkt;
+	u8				last_ini_pkt;
 
 	struct tx_fwinfo_8190pci *pTxFwInfo = NULL;
 
 	do {
 		if ((len - frag_offset) > CMDPACKET_FRAG_SIZE) {
 			frag_length = CMDPACKET_FRAG_SIZE;
-			bLastIniPkt = 0;
+			last_ini_pkt = 0;
 
 		} else {
 			frag_length = (u16)(len - frag_offset);
-			bLastIniPkt = 1;
+			last_ini_pkt = 1;
 		}
 
 		if (type == DESC_PACKET_TYPE_NORMAL)
@@ -43,7 +43,7 @@ bool rtl92e_send_cmd_pkt(struct net_device *dev, u32 type, const void *data,
 		tcb_desc = (struct cb_desc *)(skb->cb + MAX_DEV_ADDR_SIZE);
 		tcb_desc->queue_index = TXCMD_QUEUE;
 		tcb_desc->bCmdOrInit = type;
-		tcb_desc->bLastIniPkt = bLastIniPkt;
+		tcb_desc->last_ini_pkt = last_ini_pkt;
 
 		if (type == DESC_PACKET_TYPE_NORMAL) {
 			tcb_desc->pkt_size = frag_length;
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index b25e83743956..8ca7eb6b8e75 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -987,7 +987,7 @@ void  rtl92e_fill_tx_cmd_desc(struct net_device *dev, struct tx_desc_cmd *entry,
 	if (dma_mapping_error(&priv->pdev->dev, mapping))
 		netdev_err(dev, "%s(): DMA Mapping error\n", __func__);
 	memset(entry, 0, 12);
-	entry->LINIP = cb_desc->bLastIniPkt;
+	entry->LINIP = cb_desc->last_ini_pkt;
 	entry->FirstSeg = 1;
 	entry->LastSeg = 1;
 	if (cb_desc->bCmdOrInit == DESC_PACKET_TYPE_INIT) {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 4e72fa65a559..8ca36d1c7fb1 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -101,7 +101,7 @@ static inline void *netdev_priv_rsl(struct net_device *dev)
 /* At most 28 byte */
 struct cb_desc {
 	/* Tx Desc Related flags (8-9) */
-	u8 bLastIniPkt:1;
+	u8 last_ini_pkt:1;
 	u8 bCmdOrInit:1;
 	u8 tx_dis_rate_fallback:1;
 	u8 tx_use_drv_assinged_rate:1;
-- 
2.30.2

