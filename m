Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0A5762FF
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 03:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162568; cv=none; b=ho/KPcWqpaz62mRR02TIjG6NraogSQ6T6LcLfsCcOiKUR261YNhV3f0dh/aaFaKQNzs+1qdahXjc+muhC2zOGLfHuP/12/i2NWdx03waIpg/7cgCju+/GYG66/0Xg524tbuCluUwertG7/ItCpyT+Rg41QQsvaz5oSi2r6o4OVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162568; c=relaxed/simple;
	bh=xqYhFHFq3mDjhjbf+ydGJnOq96SvYxfTi4zxwowpm20=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DPB5O1yZuv87JhvCVraX0R8idpdsIhyj2df5+1xLW0e35ZLs6iIzGHFrO+zSLkfhWemg3sjZCTBBZHcHddBdFlDkCFa0qwMUsi0uLToJ6IaPiaqwOmDjMMg0tqMjtlRDda4EQRkBcMPtMte4N/KTYLpZOVy2r1Kwd2DfQqGMDYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=iGAP+nnY; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="iGAP+nnY"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-6e5fd488d9fso1478159a12.3
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 20:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718162567; x=1718767367; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+OGqMxIyTYTRN2LvPValmPFKV1Pwn8huMgM/8/nKaY=;
        b=iGAP+nnYLGf3SpI/D0IDMIFAsPseHNzJkb5TFrN+MXOEKNNmpkri1sDOnJ/o9081Tg
         ESO2mzZwdRnvoqEOz1iaMPfs8ESiA92RebK1wZc9cFhem5Tz1cq/3P9GfMmKsy4d/wNg
         Sck3MGetBQ7U+DLs89ZsCkCcMJiZYX0yhIMs8qwiUOft6dKvcSwmOfSbeSNd9UrdZT3b
         zNpzxgFigbORuSeZYHUTii6x4j2RDWkXDvJv/vhcgzAG1lhkE0CGXl8zeZ/OrqrII/9g
         LetDbTtrkfF0z/sVx10PWia517ucid8RUyzouTWimCXTzdjNrq+dNH5ajGg7g7hoOVC+
         oiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162567; x=1718767367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+OGqMxIyTYTRN2LvPValmPFKV1Pwn8huMgM/8/nKaY=;
        b=rZnpBnKQZnP6PiHpYkKYpKRlUNaP/kx8x81kFBbSQLzuv3ixbHU4ZobsxK9cPkmefQ
         ikCYTCZKoqsYGrfJM33itYYhO6bKuKZSGjURmQZgr8h4K+X2xFsGz4dYgybYdhqtIP00
         IKttATbD8xcAFZalduxK9NIs0WBiiJUI8UWOQ2FXFEorL1JFNP115WjBbkaDhBr0Zksn
         KTcgltmA24GXTLulbAeJgMkUPlKT6u6ts7r/yzz5Q/n8BuFt2J6yGLZt/woYzewXCPmI
         BQy+bVV7PdHqBnxUALVyr2rSNc0gL86llz07eT74JCLRGmTxWZ+LoqWtVlaqlVtANzI2
         tClg==
X-Gm-Message-State: AOJu0YzW3UkzwgztXHA4eyoVqpJexkosfGLtQlyLrCP+/BCfFmBOMEv/
	Xthlc8IUnx3egeKEmaKVmKF3hKy/5fE15rqhCaT+Lh5ctROhf9J+C+QuBRazplo=
X-Google-Smtp-Source: AGHT+IEZP/8LQIrVJ6fkZMgUyIwe3/bpxWI3Eq9BKhb8OVPt/JCV+CHgIa+UVL4HfOivalNdMRFykQ==
X-Received: by 2002:a05:6a20:3caa:b0:1b7:f59d:fd12 with SMTP id adf61e73a8af0-1b8a9e7f04amr1064259637.55.1718162566665;
        Tue, 11 Jun 2024 20:22:46 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e8e8a84949sm5635411a12.32.2024.06.11.20.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 20:22:46 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 16/24] Staging: rtl8192e: Rename function rtllib_query_BandwidthMode
Date: Tue, 11 Jun 2024 20:22:22 -0700
Message-Id: <20240612032230.9738-17-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240612032230.9738-1-tdavies@darkphysics.net>
References: <20240612032230.9738-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_query_BandwidthMode to
rtllib_query_bandwidth_mode to fix checkpatch warning Avoid
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No Change
 drivers/staging/rtl8192e/rtllib_tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 24ae90915b10..06c3166a5b47 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -346,7 +346,7 @@ static void rtllib_query_HTCapShortGI(struct rtllib_device *ieee,
 		tcb_desc->use_short_gi = true;
 }
 
-static void rtllib_query_BandwidthMode(struct rtllib_device *ieee,
+static void rtllib_query_bandwidth_mode(struct rtllib_device *ieee,
 				       struct cb_desc *tcb_desc)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
@@ -872,7 +872,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 			rtllib_tx_query_agg_cap(ieee, txb->fragments[0],
 						tcb_desc);
 			rtllib_query_HTCapShortGI(ieee, tcb_desc);
-			rtllib_query_BandwidthMode(ieee, tcb_desc);
+			rtllib_query_bandwidth_mode(ieee, tcb_desc);
 			rtllib_query_protectionmode(ieee, tcb_desc,
 						    txb->fragments[0]);
 		}
-- 
2.30.2

