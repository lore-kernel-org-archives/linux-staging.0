Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F20E2356D9
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 01:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773106415; cv=none; b=SQ2rdEaRE6WQ5IaCb98jUGKjEPmVcRgUabf/DHDdg4sZq1bIoul/6EJTZHDoMBVYWoCYK4OyQkrig9by9Ha/y6C68dsOC+pUGuVhD06e7SQk8TEQ27VCymmjN/RLt9xP5IYiAgtAQJ0Dname09dXVgSivMDGllp6LuYi9Lro1zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773106415; c=relaxed/simple;
	bh=SOBW56UKgGwsovYYsrbzT9nRDR9R41mB6VvbtvdG3FY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oAsgN7LI/MEev2Jhhw78jF/cvYCkx7IDOn2GPeKzKBtVrRw8EP0gGKsNOFCOgEEmpS0Uu4FI3fR0/sDipn+3u4OrLFqd++5acUg2tlBkZC8X3bAlJeVhSyrmpZ4WbbF9ncJJQ5fHgj4xkJd7wXc/UtIUI6rAe0nFwxucam1iFV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkVWeN9R; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkVWeN9R"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2aae4816912so81047545ad.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 18:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773106413; x=1773711213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XN19Fj8kTtTfEGaQbV98LN4KgTzseZY5nBnPQ8wB9iQ=;
        b=LkVWeN9RmVLLIUQmwey8B5YtLHdfhzBwCnfWBrnccSRYww46gV7DlD/xI/eld1Xjnl
         9jWNJ1QdQG1G7KgQvDg4chYMWZ8sk12iBPc0Hji2CTu92OA0Up0+5L6uXrmHUGcXuLX8
         ZYOXdqvpBicyIHSTcbjOz4J+OE7UoWS+qfmg7emxvBEE7O2x0UlgFOa4meZh6Qldp0QY
         qUgVikP9YlHsUthNSgbd+9t0aWTWK1S+0LPJmgRuaeZSPlnp9zSy2vLxX21JAxA9itiR
         5L680Hsj98MFCV2xuyxAG3I9stMzFxDkXlpUIq1T04y+q2lZ6DGEna1/eyCnFnvrs4qi
         ky6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773106413; x=1773711213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XN19Fj8kTtTfEGaQbV98LN4KgTzseZY5nBnPQ8wB9iQ=;
        b=pg+TNJGUqCFkY7OaCylN1L1KYIBB5B4n/hQD47JR4FCj+bOLqSq2C4WaHnu1XKgCnw
         ld2hiB9yPlqdUj0nkePxfFb7YtXoYDjkYOsBcNfDUL3Fl25VPUFaRMFZ7HKKBLStWeOJ
         5liXBpbyFuw/8SgLh2Rp4zA0hRWg/hFE98buE3tMtmhSXP3RTY1QWX/Sel+5Bpamx6se
         5WCx9xfrGW+MxWVNrAc5c3+oi0Z6Yac9As/+WYanJapKFv/0tl7p4LdeVKfyvznhzrmO
         nkloTaQAW2KcTX6qq4UWDouiC+t3Os8lxBPZLYjx/4knCjYK8i3fK1kM1Y0+FTspnMDx
         kj4g==
X-Gm-Message-State: AOJu0YwMmlBA/1M+xea/yiszW7qVoMZM/5Rr6YukUk+xsOgsoPljjft4
	BelWv8pFvSNN5Gt1Lp9YEGuGVk/mJnOas+0VDwLtlUk2gbHyfw96c6sXl+xDJThD9rY=
X-Gm-Gg: ATEYQzzwIap2MCi3OqEMJSYT8BnZcGixUy9y7eF3XmtmfthiLCoPiZVYjsmFzgHh3fw
	z/nTsqegHf5HHy10cwDonYA+fh8BVgq1XR0vWsgxIhMBtOXa9y4OGTFF5JYGtDp9J+Qt7lwhnFG
	CVr3/vJfzudY3SZioAPaFboDCV3I6Y1w7o6yPeAV3E/uWxMNcLHpGESdTFGN1hbZMarkMntIYCq
	RA7IUIYytWu+cyFlG9H/EtkUW/kH/Emw7lklxhKrhyjUfjv5fi6snEK/yXQMSEHQpMJdDtcrCSP
	RKrQUFPn49JTaWy0GaRqX6Eio30lKLm1ADxhx3tD1HCx5IS3BmAx8yZon4sVojhkJsi7nA/MJW+
	S7f3bkSBnjwEgHp+G1UnYq+sT/udUH1pPpndRT1VMKzKJrP68VEKwRr+FI82Y9wlgAClclELfZ3
	HU2fUWAFBXBeCNP86GF90JvZmKW0TgNeJ2pZPIoRkxKXPRuPnUE/0A1y+D/bbsTQDtjJCgG1LjV
	agMgBjf5nNE0nZ8
X-Received: by 2002:a17:902:f78f:b0:2a0:e5cd:80a1 with SMTP id d9443c01a7336-2ae8247b89bmr117452575ad.41.1773106413227;
        Mon, 09 Mar 2026 18:33:33 -0700 (PDT)
Received: from tower (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f9678fsm132483875ad.68.2026.03.09.18.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 18:33:32 -0700 (PDT)
From: Mark Adamenko <marusik.adamenko@gmail.com>
To: linux-staging@lists.linux.dev
Cc: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: [PATCH] staging: most: dim2: remove BUG_ON() calls
Date: Mon,  9 Mar 2026 18:33:04 -0700
Message-ID: <20260310013304.39169-1-marusik.adamenko@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All BUG_ON() calls in this file are redundant either because of
impossible conditions or prior error handling. Remove all BUG_ON()
calls.

Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 66617e89e028..c8fdc6a52467 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -165,9 +165,6 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
 	unsigned long flags;
 	struct dim_ch_state st;
 
-	BUG_ON(!hdm_ch);
-	BUG_ON(!hdm_ch->is_initialized);
-
 	spin_lock_irqsave(&dim_lock, flags);
 	if (list_empty(head)) {
 		spin_unlock_irqrestore(&dim_lock, flags);
@@ -187,7 +184,6 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
 		return -EAGAIN;
 	}
 
-	BUG_ON(mbo->bus_address == 0);
 	if (!dim_enqueue_buffer(&hdm_ch->ch, mbo->bus_address, buf_size)) {
 		list_del(head->next);
 		spin_unlock_irqrestore(&dim_lock, flags);
@@ -268,9 +264,6 @@ static void service_done_flag(struct dim2_hdm *dev, int ch_idx)
 	unsigned long flags;
 	u8 *data;
 
-	BUG_ON(!hdm_ch);
-	BUG_ON(!hdm_ch->is_initialized);
-
 	spin_lock_irqsave(&dim_lock, flags);
 
 	done_buffers = dim_get_channel_state(&hdm_ch->ch, &st)->done_buffers;
@@ -454,8 +447,6 @@ static int configure_channel(struct most_interface *most_iface, int ch_idx,
 	int const ch_addr = ch_idx * 2 + 2;
 	struct hdm_channel *const hdm_ch = dev->hch + ch_idx;
 
-	BUG_ON(ch_idx < 0 || ch_idx >= DMA_CHANNELS);
-
 	if (hdm_ch->is_initialized)
 		return -EPERM;
 
@@ -566,8 +557,6 @@ static int enqueue(struct most_interface *most_iface, int ch_idx,
 	struct hdm_channel *hdm_ch = dev->hch + ch_idx;
 	unsigned long flags;
 
-	BUG_ON(ch_idx < 0 || ch_idx >= DMA_CHANNELS);
-
 	if (!hdm_ch->is_initialized)
 		return -EPERM;
 
@@ -642,8 +631,6 @@ static int poison_channel(struct most_interface *most_iface, int ch_idx)
 	u8 hal_ret;
 	int ret = 0;
 
-	BUG_ON(ch_idx < 0 || ch_idx >= DMA_CHANNELS);
-
 	if (!hdm_ch->is_initialized)
 		return -EPERM;
 
-- 
2.53.0

