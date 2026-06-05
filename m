Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD7F212566
	for <linux-staging@lists.linux.dev>; Fri,  5 Jun 2026 05:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780635701; cv=none; b=CjBS/q/gVUBXOe3gnCslT0+S/MMTcoCCBNZVBCMFxrlL6GSTztKEGmu6kDAoLYtkQTLMkK+0V3pK5dZc5Kuf7MyDpeemWplIG/4fVJHrqsO4xtdZ5oTcpuC7NEMfOHPUZM17q4oCeSFOcaE6tyEu2dB0zE+IHdeZSCMpr8rVf0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780635701; c=relaxed/simple;
	bh=TOcYJsZ9z7nggyznWK43an7PmvDyenaU0YwWxDOiyXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nlH48eOn1bau7cppiY6nezhnVB+FrxnF8QAkD6NkgDjotOu9mb3sSoqNjQyQcnzXhl135RFGaCn01OQGZrEptcfsv1zaXHUREvUMCTSwEIUR4SyfzspshcfiWm9ltNnKmZo6GlzdUreBihx4xKeA5VFm/frs9WV/cHfjAVCdU0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eq1A6euq; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eq1A6euq"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6ca94e539f9so933316137.2
        for <linux-staging@lists.linux.dev>; Thu, 04 Jun 2026 22:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780635699; x=1781240499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nyNvgJ7AS1Nx5uFvyHondK1m5ATUnIkZ7/G9QdgL73U=;
        b=eq1A6euqp9DUqXOubX4bezAFzjlt91T2NJ+i4xytHAJkKH0wuxvMX1DvuAl6HdU7vR
         zyPcuFZzMGr5G5r2ryXBkZ1Q38Uqlb9Yb0toGAdUT1pHNTINV1L825bRJmUhj2T6168U
         kJeHKUR/mz+uNEQtmGBBx8jyAOXNThpiRGSqMe9Y9J+sbVb7pFIyfBhgNw0N5h2AgWwG
         LHsLbTTwE+8c0Su3X7jKqcyeYh3OnvP2HNkKh2FWv8M+RYWTXsF70yp3IyMw3CAKZFpH
         oYms2o54JHl+JfvvRDN5xnBTFz4YFUi60MgiW+onFNjuNMqu3mkHFMyFEt2t2dWB53Xh
         GkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780635699; x=1781240499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyNvgJ7AS1Nx5uFvyHondK1m5ATUnIkZ7/G9QdgL73U=;
        b=IXDl3kVMmSMDA5Lu7WtBsg14xpXc61pEpcAG3ipdh9JgU+tsiQYq1NCM0kF89/Q0TX
         M2LwRqbjiMyDDlT9asYvBJeV9F8KbUqA3ChheNtJaovl961G88wOG68VDhg1UQC3Je1c
         +eN8n00qQWHYURmgfpttNvHERS8WVLSaIk+wZ8fhr+kuZ+o2XmMBisfpE6bqwsMGWwA9
         fy3tBPy0G0leZnuwNJlULAPay9KmD7VkMb7dDLWPDlfJkaTFQRdjKSmdxRev/3w5U4uG
         04S6l42PSl/yx5MhMEjiS1/5sA/I7hhiQ23rqq6+q7WMP5AS5Kd+X4lM3OHEJfalgscJ
         Oe6A==
X-Gm-Message-State: AOJu0YzNkKg8gUwb/4btWa/Vrt7J6NroAY7VNb8/iBpHd8KRJvB1Dp1e
	STb6F0xHfi4+8hXLrJbBl3yC2BdOaQMOUq5nfMfjCenUyOMf7PB0PubJ
X-Gm-Gg: Acq92OE7mqQ/ppAzVx3VXruzFGQrtWchIVZ6JLvrSfnMYXCYB+7VydpyAOgMtvfU0Yx
	yT4mkdDOiVNIxC7Y15r130TfIpUV2aK1HuUijg1j3qscsbFfbWmOjWrfFu2feHQ5cKIlseKknsw
	J9hG5bVwgQnvPy6y7GtnY7tdCIux4zoumxnrnRMJpXMGxQ8WrmSYnnKiyKZXgQdw9kZqz0p0GRa
	8VxC6WZ4tQmmrwBIeJabpKsO4QN5GRGL3MdWzVqB23i/ac0F+bSFk9zgRJPoY+8CRAdQw6HsP7e
	HgqtB1bwULP/BRPeAQPs9aFHG5+bT/Yd9sVjZoSlpxWJIUkdzxoJXp70Xlibqcwbb2B5ZZriXFS
	otirK0ABpC9SZqD3dFWMVT7FmGMfYlstTjXoA76CRyfFf4NLggSYXKfE0dBmZ3kzBHKx+URY5CZ
	Aib1RDWO6zxAATTI29Oe/B4+xdh/8ch73pUKs4wnQkzFYGp9kOPZkY
X-Received: by 2002:a05:6102:c91:b0:6cc:16d2:3100 with SMTP id ada2fe7eead31-6fef1098102mr934772137.13.1780635699381;
        Thu, 04 Jun 2026 22:01:39 -0700 (PDT)
Received: from lima-default ([68.161.19.190])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecc8222bcsm73206076d6.0.2026.06.04.22.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 22:01:38 -0700 (PDT)
From: Gianmaria Biselli <gianmariabiselli@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] staging: rtl8723bs: rename CamelCase variable RxMgmtFrameSeqNum
Date: Fri,  5 Jun 2026 01:01:37 -0400
Message-ID: <20260605050137.168605-1-gianmariabiselli@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename RxMgmtFrameSeqNum to rx_mgmt_frame_seq_num to comply with
kernel coding style.

Found by checkpatch.pl

Signed-off-by: Gianmaria Biselli <gianmariabiselli@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  | 2 +-
 drivers/staging/rtl8723bs/include/sta_info.h  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a86d6f97cf02..89f253cc1da6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -454,12 +454,12 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 
 	if (psta) {
 		if (GetRetry(pframe)) {
-			if (precv_frame->u.hdr.attrib.seq_num == psta->RxMgmtFrameSeqNum) {
+			if (precv_frame->u.hdr.attrib.seq_num == psta->rx_mgmt_frame_seq_num) {
 				/* drop the duplicate management frame */
 				return;
 			}
 		}
-		psta->RxMgmtFrameSeqNum = precv_frame->u.hdr.attrib.seq_num;
+		psta->rx_mgmt_frame_seq_num = precv_frame->u.hdr.attrib.seq_num;
 	}
 
 	switch (GetFrameSubType(pframe)) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index a1b7fe843979..ce878c49e2e1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -256,7 +256,7 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 	psta->rssi_stat.UndecoratedSmoothedCCK = (-1);
 
 	/* init for the sequence number of received management frame */
-	psta->RxMgmtFrameSeqNum = 0xffff;
+	psta->rx_mgmt_frame_seq_num = 0xffff;
 	spin_unlock_bh(&pstapriv->sta_hash_lock);
 	/* alloc mac id for non-bc/mc station, */
 	rtw_alloc_macid(pstapriv->padapter, psta);
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index 63343998266a..0f53e77c110c 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -214,7 +214,7 @@ struct sta_info {
 	/*  */
 
 	/* To store the sequence number of received management frame */
-	u16 RxMgmtFrameSeqNum;
+	u16 rx_mgmt_frame_seq_num;
 };
 
 #define sta_rx_pkts(sta) \
-- 
2.51.0

