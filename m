Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A4578C86
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261467; cv=none; b=FYhP/GmFBvaApVnItcyPQaugG/aKNJ6L4V9JeioN9ZG2hECh7NrfIQ5ztTzz1cT1neu7eG+VFZU7WkB+LKzTUue21Q8LZAnAZOlxW9gVxPci0qJevFrmBcP9YaIWiP8eTre3Y1o/yw21/v3hNhyYkXWyxAh7xzBuPeBI9TE+imE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261467; c=relaxed/simple;
	bh=E214j+oVI9amVqkKz9xdNTWnTsNw6nE9EpWfpQfQ0fs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WhOgTcXo4TbDwg01NELNb68bU+HrwS1dDqCGp7KGhmmIX6JszziaKP5KDXLJOVfbat+cHtAWb1f26Ir/yF9xRBpzej1KPxz1ZmvBCxzL92d5Jjgt6WR/8f9+GpHuJJT7ZyEgOpfMcb+80XeOIuDVYARe+42mKYvfG25rgH0nK6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=I+QDflyN; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="I+QDflyN"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f304533064so9682455ad.0
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261464; x=1716866264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITc+3AXVWxBKyxU7U+mxRvRUw4cedaMFQ7sA0ad4TOc=;
        b=I+QDflyNpiAzC0NzPBR31Yqp1zVW8STqaPB9k3MK25OsiQ/gCTJw6iUC9n/ekSGr39
         8poa9Bn3h46oup0t24iHP5ZGHRk2qoBFj37qSYoELB3HYMmzIwgPr0nZ7bt0lgMRb5Yl
         5+Q7Tg1LTDuKKhPqcOEFwYFiN8eqCV8Vpc32BNpLCfIPfJqOzEwPwYHm16/5YeiqLfM3
         nQUFb3AJDkNcombtboApUPK+FIxGpGj77EL+977QxeAhfmm8pHu/DEoD70CMEHplsjCN
         d+pGqOymbcZ/u+R0XVvYVIjmhNdld9t3GOd0GfW+o1yEgxvh6RuMBZWnbD4GNheo5uYY
         RqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261464; x=1716866264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITc+3AXVWxBKyxU7U+mxRvRUw4cedaMFQ7sA0ad4TOc=;
        b=fdwbvJ1l202y9kGmq67N6KcD+3y1wPOncJpyTPe0lr4jKg9knwI3O427fI2Dh/Nhas
         uh2LPFeeIDaW7S0IaF7V/V24bF7qPNQY68xLag4gUHkRqTNWJw37GiPn8odTVJPTOj8G
         zW8xLofil8zccdHFddjrgWrtT/8TaFW+I2r0bXmUvDhMCDgYI9+1ubbxDmrCi9WbnJLB
         bxJGjfXtTJcI+yhJx/gvRbxScevgSF2pKayAKTOVrfenlEwu3NdE+CQx8ruYN4RUqOYX
         e088Y+Lx7DpkwVgtoq+3GW32dqt6gBi4y8O5oev4VrIlKx62hehHxI8KgOjirpxSGFgK
         LaoA==
X-Forwarded-Encrypted: i=1; AJvYcCX+IcXb1HMc4DM1EVc89qJn32ocMVKOu0W5qfw1SEbvuyeAY9ZhoVsuLN32wh/L8IhqpONFdS5SEqJfzwgTD0vGaErAlLVDf7slFl4bAA==
X-Gm-Message-State: AOJu0Yyi1Oe4s11cS0bvT/rIFzsiwVsCifXAg70EUwfxdV01iDVNaJJB
	RUn7sj5A9kyYeH+xbFLTy1mPXdXp85hTWz1toGHw3ZbofA2iIu+M/FqiKCqhq6uKDGmp4O8jqrK
	y
X-Google-Smtp-Source: AGHT+IEw5VAAC3r728AHxOxol/YQXn/otGSty/ujAWGLz26xdnFg57Vk8vhuV29f9hFWduZtSB+EdA==
X-Received: by 2002:a17:902:d509:b0:1f2:fbe5:7d62 with SMTP id d9443c01a7336-1f2fbe5822dmr68844905ad.33.1716261464079;
        Mon, 20 May 2024 20:17:44 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:43 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 29/31] Staging: rtl8192e: Rename variable RfdCnt
Date: Mon, 20 May 2024 20:17:16 -0700
Message-Id: <20240521031718.17852-30-tdavies@darkphysics.net>
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

Rename variable RfdCnt to rfd_cnt
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib_rx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 4d4a4a830470..124fa5d54a23 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -491,13 +491,13 @@ void rtllib_flush_rx_ts_pending_pkts(struct rtllib_device *ieee,
 				     struct rx_ts_record *ts)
 {
 	struct rx_reorder_entry *pRxReorderEntry;
-	u8 RfdCnt = 0;
+	u8 rfd_cnt = 0;
 
 	del_timer_sync(&ts->rx_pkt_pending_timer);
 	while (!list_empty(&ts->rx_pending_pkt_list)) {
-		if (RfdCnt >= REORDER_WIN_SIZE) {
+		if (rfd_cnt >= REORDER_WIN_SIZE) {
 			netdev_info(ieee->dev,
-				    "-------------->%s() error! RfdCnt >= REORDER_WIN_SIZE\n",
+				    "-------------->%s() error! rfd_cnt >= REORDER_WIN_SIZE\n",
 				    __func__);
 			break;
 		}
@@ -509,13 +509,13 @@ void rtllib_flush_rx_ts_pending_pkts(struct rtllib_device *ieee,
 			   pRxReorderEntry->SeqNum);
 		list_del_init(&pRxReorderEntry->list);
 
-		ieee->rfd_array[RfdCnt] = pRxReorderEntry->prxb;
+		ieee->rfd_array[rfd_cnt] = pRxReorderEntry->prxb;
 
-		RfdCnt = RfdCnt + 1;
+		rfd_cnt = rfd_cnt + 1;
 		list_add_tail(&pRxReorderEntry->list,
 			      &ieee->RxReorder_Unused_List);
 	}
-	rtllib_indicate_packets(ieee, ieee->rfd_array, RfdCnt);
+	rtllib_indicate_packets(ieee, ieee->rfd_array, rfd_cnt);
 
 	ts->rx_indicate_seq = 0xffff;
 }
-- 
2.30.2

