Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF06E25B0AA
	for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 03:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779592489; cv=none; b=NHA1q6Dsv32kLjzV2GsGx8oDkKjxFRb/xvadUhH4j0agOndd5X86p9CTipiKCf+yC4bFe2pQs5tm6W93Ly6r7aGTlfwoSXYu/nsNk6XuL6wXv1SDLG+HtgHsBKuNRQLKPmF52gLwbXF4BEhJlZ1xbHowBYWB5GLwM2VYFD4fIZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779592489; c=relaxed/simple;
	bh=7qyGZpGEcHMCyKW1dXUbPrxpkIvHAQBQ9y2i5PFtn6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uVvoAYMWbTtwp0hdqizldJe9MmsuRmjZQzXI4HqFXdilRsILDsXj7xY3ajB8dAT2q0HdsqaezpTR0Hezyh9XbUzcQ/Hg+upDvtRjU0HGBKs532hAAUyQ3Z8fh76W112wJp1wqPKdlra5jplMG0uzBzf1Iz7jVLLQKychlN0+U0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rFRigjr1; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rFRigjr1"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-516cc5471bdso45022531cf.2
        for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 20:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779592487; x=1780197287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5aW4LjhMJt+0Sv0W1NxqXO6LaVf8kdyF60umamMPIE=;
        b=rFRigjr1mPH1bMtqxnm2ufJDcFXoX9Nq9TykxvrtluZSh3He55NdNjjtRJJk0Xxi0f
         CeEJPdLNXuPUl5iyUJ6Kbl5cRc2Clx8DzZLpHy0hZw/bByeKYw4jKo321BSwepr3vzLL
         NGbwh3JnK/If0DB9JzjF+OJsDvFvQdt6+UZnXao/oO0Hb+QxDGltq1uUQkPO/DAVHl7W
         QuKCNrIuuS/gulDbxMTHR+3W6w4wlBRPXu1C7ZjqLLuG9aMpwfXWhRxjpTKF1GmiRpcZ
         dHWZJ5Qd28uZVFWnpF6E+Im/VIwD6IQOXblDM8gxJYXWyJGEoM1HvNbLHn/NGVfyvHAU
         qlpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779592487; x=1780197287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5aW4LjhMJt+0Sv0W1NxqXO6LaVf8kdyF60umamMPIE=;
        b=e0Sztjxvu8u6TyGt7uCCt32FeoB1MGrJWB2xduIcvEOu8OVQAtm5dUnD/Ar3AgOM/F
         EusAszecAOYtTvQL4JAnkXxX4cGwTQ0YWS+0btfamS1rguCt81eQyCXtLpA8yHl4Orlq
         r71c8VQX/Ei8WVmKdmnJ/QJIOWTodRozULvxzKmqsQ72F3YQUGk0usX4bTNwQgowhG/i
         C8EPAq7Uu4tPy2DL4wqqUoo62zJ5icj6znT5f2EF4sVJyVrhATzmX95tIqBqVimTYtCs
         wu8EZkRQDl65RpNBOP0/xECwGwgvgAHZq49CNTv1Tue0corFtfBsFWSUxhUDW8sojKqm
         Yndg==
X-Gm-Message-State: AOJu0Yycx52UxFzZ+/G/355J8DvZlUt+EAbN7tQqAKrAAXnAvWQoH8wf
	hdcaLaiNs1LeYh7ckmZ/Oli75aK/8HE60EwsE27XpMSvwu2VkYYGM4Gt
X-Gm-Gg: Acq92OFxwXrNzRGHzsIb4qZUzEZ9xbkgcYTwj9S1XhED6WcFfRY4OXNwafI9+iE1Pro
	iG55NLLGWCvLGY1m14ZLJLAgaoNOXBNBNGoPO47nRHiv3hHB71abbwKPOkWURLyqUiFnNuQbcu6
	xzqiFzOb9rF3NktV8zvNjzXsJ0aY76vBkCb48vnpA4WJFTnajzpw4Df28iNLbqexan7vX2C25h2
	Or1glijtEPQHqCGfvauYBxWvpxiu6T1TTCt9uB8pKpDBTGl0ghSl5JvqL5jp21RO/12D9Mqq56x
	YTp+9UvI57v2d9xoElyp53Iz0CbEb4HdY9D+LttTDkorePXO7t0kfEx3LkQ4fxQNHdwQcLS6zlg
	NXiLwYotz64by9YFCqnFhgS4hloC9nkLrpmMBEoUTtFbatoLiTN9H+iJmSFEjdO7mjNuKzNc2mQ
	4k/9t7i9avjMF+mvrnxYy/xJygFyWRvpcSoaLOechiNgYfc1idfujP
X-Received: by 2002:ac8:7d83:0:b0:516:dcfc:ebc3 with SMTP id d75a77b69052e-516dcfcefe3mr96964311cf.30.1779592486790;
        Sat, 23 May 2026 20:14:46 -0700 (PDT)
Received: from lima-default ([68.161.19.190])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516d8b00120sm63569891cf.6.2026.05.23.20.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 20:14:46 -0700 (PDT)
From: Gianmaria Biselli <gianmariabiselli@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gianmaria Biselli <gianmariabiselli@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename CamelCase variable RxMgmtFrameSeqNum
Date: Sat, 23 May 2026 23:12:12 -0400
Message-ID: <20260524031212.26208-1-gianmariabiselli@gmail.com>
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

Found by checkpatch.pl strict.

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

