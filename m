Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C5A60253
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261455; cv=none; b=dyrLbgyysR6Ig/WZfIRSz/ovYAq/ldRIVB/qNNE+m6yTcjJm5FASuDv35VOUOgHo0AK9sxTr3YH8OC3y/vuKTUiqZLZrcBiZcm8hllIm+MLFXVJPWM3v0fz06U/RKCksgjhDNeooePLyx3g4TplqsoPJ/VUHlNla7f86ZPBhntE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261455; c=relaxed/simple;
	bh=Wr81TQ45G30xNhmOkpy6VqywIleSpREFvah2+9mPb8E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=By0DD9b0MO9+4zD6PTnQCnqS+m/TpG9J1FIax1B2bOHywhEJoMjYzp3uRGlEChDIdIsA65EBhntz4N1iwaskX8v+jhUoasrLXVyFUO4mRR0s04LUN3qSp1WhiYybfmks7COwRKeZxUoNBg/cLPjv7OyHvRR6edRBrVAkf5dqe5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=X6CUEKaz; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="X6CUEKaz"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f0937479f8so91996825ad.3
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261453; x=1716866253; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/beP8h/MyXUke5aaej1RngCGo0SmcFT4Mq28a4Aie08=;
        b=X6CUEKaz+7dg9CbJtQlgCLaYaiGPDrUf7wNh/pgEutkYu8ShX00b4QwpTGnQzL42hy
         MdUmYyUF8UWi86Mo7CzhVMrk7KCVxs/X5vUJql0lsiEGIj+O0OvK1jDsm/owVf570Hfw
         xuThsTiKw3nAT/06IGBf5akmYASTh1vMeiBVcF92vmhso9c8H54uQc/1c9bPeA5P/Jqe
         PPX8q16YuDURVRRDbwP7JE0/5ai/IS4fHi8PqNKfT/h5mkRCC9xuCJ6NeLn9MQDcmadR
         suejOKaEyhjFgt2L/TtXCeN/oygmKxPaEoykBDwrIPhRrucUbEr8GYU0JDftX1twhRc7
         +DbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261453; x=1716866253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/beP8h/MyXUke5aaej1RngCGo0SmcFT4Mq28a4Aie08=;
        b=foM+PL1h9TggasD60A56SnW91SH8hILiCWhNGSjT1OLMV1Aa4pJR+XMM6Gr9hxxr0N
         jpkAi1UQvsEJp479+Lampnl/QcdvsPSIPJkritov1pw6aP/xl5IScciAXLK97wUNbkDZ
         LsY9hzZRTl+dnzV3aNYFteejL1VqeWDTI6qgH6g7pbBfJ156MZdydVxhIuLAlNXYOzUr
         mpliT328wOHBeB0ZyRVpoeOU+dErupnzv50faC89iU1Bi7/XC9v3UStDWbi/jvfp8IBM
         fYyhigx64aI2LQo5FVxll+QBgl5kclaI0K6XaC/RFUSkNsoncR/fK6fbY/GMt9CEvOGh
         Uepg==
X-Forwarded-Encrypted: i=1; AJvYcCUJyFhL9JCLOOQQyjAs6R+NQbRC0jyPbBfixLO71E2DnUuXWgxkTHIc3CribN3ccOIuOuofprifRnRA7U3QZfb/XqYiy6m3eEs1R6GnFQ==
X-Gm-Message-State: AOJu0YwgTQMXqiC60vn2+KIJeNF8Dbl9FJFyIbFQFcDxSLId3yJrYnHG
	hoRr5e8P6jrk7nQwR5+KO/19p/rzp/TursZPDVGoycqPOmeCnwIrUIBP9OwMdW0=
X-Google-Smtp-Source: AGHT+IFwsw9QskOPJMvjYDG8sYTnJv2LmRuTuJ7Nq9SpLDSqhIpvhdsb74byEyxWd/ZN+JYE69wbyA==
X-Received: by 2002:a17:902:7618:b0:1e3:e0a2:4fb8 with SMTP id d9443c01a7336-1ef43d2e1dbmr289158535ad.30.1716261453300;
        Mon, 20 May 2024 20:17:33 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:32 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 15/31] Staging: rtl8192e: Rename variable AddReorderEntry
Date: Mon, 20 May 2024 20:17:02 -0700
Message-Id: <20240521031718.17852-16-tdavies@darkphysics.net>
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

Rename variable AddReorderEntry to add_reorder_entry
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 3afce436a5d8..30bd6f49e915 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -403,7 +403,7 @@ static int is_duplicate_packet(struct rtllib_device *ieee,
 	return 1;
 }
 
-static bool AddReorderEntry(struct rx_ts_record *ts,
+static bool add_reorder_entry(struct rx_ts_record *ts,
 			    struct rx_reorder_entry *pReorderEntry)
 {
 	struct list_head *pList = &ts->rx_pending_pkt_list;
@@ -610,7 +610,7 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 			pReorderEntry->SeqNum = SeqNum;
 			pReorderEntry->prxb = prxb;
 
-			if (!AddReorderEntry(ts, pReorderEntry)) {
+			if (!add_reorder_entry(ts, pReorderEntry)) {
 				int i;
 
 				netdev_dbg(ieee->dev,
-- 
2.30.2

