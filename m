Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD7B524C9
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261453; cv=none; b=bwO5gfVXreXyY1ta9T8N3YGhJO/BGdaEYTqSf6Z/xOTlMgM7QbFWWm94t8fsbtZ2Z+HIXYSiI7U5U2vZ7yNuGpyvlFPN14r5azxvC6It2UQqqqDMpjmBaqQyhkYau6sj07zFiptu4Za1eLfZB7KTRut13lA5joMrifyxg/YPlRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261453; c=relaxed/simple;
	bh=zfJSmyU2EaunM1LXwvAIWF2URUqaOE8rSUmMagLurcI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tjOCHOhj479w62xJZfH3Vw9cxDFzOMR981UqH6S9M2ngSZP1/EomLeNPhsNaTI2MlKhAsvPXdefbKcyPrCZuOMO5AYQRbtKAPQZ1DYnjKCVkV7OGXoR5CGFYtiWTRPVtBwSgh3DiyClQt7BArekvuorFUj4U34T2T9ywl0lAXdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=jn7Rgwf0; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="jn7Rgwf0"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1eecc71311eso95630345ad.3
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261451; x=1716866251; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEABkOW4VKvCqiq5IqHnapExkz50KHLin5f7EBQIzfk=;
        b=jn7Rgwf0TzpTUze6tsNOw7VdltI7DkC45gRcFmqSj/Pbk48T7VDqxW6sP63Dndlpni
         LYlQG/wEUlrY4FLekopRCgzpmaiM5hQ033nG5hWGmt8PexjUBeoRX2dyOl9qV2AkapYh
         0j5QBpKDb+qVjuH2ABxE8IcI3QEtWBpZjmNt3sp3+omFiaUkSy1G26HwmRPj41prx3dL
         laD2QImNM+Qls8/jGZ5eNovaltb4GKHkQn9GVHAnzu5nvbkTIn3C8Ah/ZLTzam3KnSNH
         kcCYzur4Ls2b3rjBX83P4bvW3h3v2iRen6sbGVWL3pQWIAzFbr5omglt9uCt3PAnr8K+
         yP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261451; x=1716866251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEABkOW4VKvCqiq5IqHnapExkz50KHLin5f7EBQIzfk=;
        b=J6LyQQiLyVtA846rnLURCnXVYHX2jjinna6aqP7nOXtV/PszDVH6Fb9zI5ENG93tnY
         Zg4hii7RMOZo4APJlP0ysHuyxXfTxQgTFR38hJzWEXNTzzVuybUUniyr3N/X+uOs4ZeH
         828JqVO4vA8DFRgu2ViP0iLBgzYLtw1/2TEFlcRjfhdxx5ouZKWGeaVyzu43xi2iyFKr
         AK+WuCN61OvTeLI8reVtAFFPI9TrI1czedmYFqsNXS1hTuAVnuTfzrSxGtDl9bhZrnEA
         ep41OO/FTN1gqr77NbQ2T/FUudYYXDa9N2MGL9mijP5MRuPHV9XHPGHTtmdb6Q66oBoQ
         HcDg==
X-Forwarded-Encrypted: i=1; AJvYcCX18JmsbwEvKpUnVsabDLJmkt32QLgUh9gy+nUfj8ethaJrtK3XvckAuoUmWxF13aXbt8bLUH0pMXA/FabpsxZ1m+p5W8LhDfywSzd/Bw==
X-Gm-Message-State: AOJu0YzNVvR6+BiQOMr7Q0cH5M2wm24OFn6BKrWOOikBePVO6OwcWrE6
	4L0dN8Q1kS/z8toIwbVhqEz6Sb0vOfhRFRg1QMaI/m4jJJOWq7fZZ8TNnFnOVZ8FnF3YkECgTtH
	U
X-Google-Smtp-Source: AGHT+IEh9d/TIcGUMSlsJ3sIHqq7naGrzIK8Q/3NUyeOT627ZX75Eg0Fa3k4rVRatRXfjf7q0IiRow==
X-Received: by 2002:a17:903:32c5:b0:1f2:f7c6:7554 with SMTP id d9443c01a7336-1f2f7c67a42mr107221565ad.9.1716261450817;
        Mon, 20 May 2024 20:17:30 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:30 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 12/31] Staging: rtl8192e: Rename variable RxReorderIndicatePacket
Date: Mon, 20 May 2024 20:16:59 -0700
Message-Id: <20240521031718.17852-13-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240521031718.17852-1-tdavies@darkphysics.net>
References: <20240521031718.17852-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable RxReorderIndicatePacket to
rx_reorder_indicate_packet to fix checkpatch warning
Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 24136bba64b6..a30945f30e14 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -520,7 +520,7 @@ void rtllib_flush_rx_ts_pending_pkts(struct rtllib_device *ieee,
 	ts->rx_indicate_seq = 0xffff;
 }
 
-static void RxReorderIndicatePacket(struct rtllib_device *ieee,
+static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 				    struct rtllib_rxb *prxb,
 				    struct rx_ts_record *ts, u16 SeqNum)
 {
@@ -1366,7 +1366,7 @@ static int rtllib_rx_infra_adhoc(struct rtllib_device *ieee, struct sk_buff *skb
 	if (!ieee->ht_info->cur_rx_reorder_enable || !ts)
 		rtllib_rx_indicate_pkt_legacy(ieee, rx_stats, rxb, dst, src);
 	else
-		RxReorderIndicatePacket(ieee, rxb, ts, SeqNum);
+		rx_reorder_indicate_packet(ieee, rxb, ts, SeqNum);
 
 	dev_kfree_skb(skb);
 
-- 
2.30.2

