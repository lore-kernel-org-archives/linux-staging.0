Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1FA5A4FD
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748770; cv=none; b=jX3bXhp9KY2YwvHbUxKmvCgYW85Rc0ta4ExPwT+qbeSMQcvoxD9I4pzbI9ZVcx3HpE/hvWitjY414S86ksGxf4hHKjGMDfSfwDAoeggmDJH/I/xClE6/yc5spM3d0tiPd22Z+nakGTq+MPtF1Jk0SAKxqfvdPXEbit+d15DujgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748770; c=relaxed/simple;
	bh=aEaBp/mQ0gwcVexIJ7BuhP3t1ukG82pKvrXnoWrveIc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lEpUQrYH3cTmkTQsnI9F+om/DmCE/kayLsWb7DNfhC1IJXO3KYkw4Qhtu0YTCdyDpVJcEHBLIHIYVIeIId5BsLPr/idQajNSv12T3pR1xKFJGbhzz4/kwPhUjAVwayt5pfdcKEgCZPKQP7yZKdb9pyTfosSuuwysgtCPAD3xgyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=UuRUqx6o; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="UuRUqx6o"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6f472d550cbso5186708b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748768; x=1716353568; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvfIK48YP43wqCqKvrzT+mX/UTiFLxkkrmO0jBglQA8=;
        b=UuRUqx6ohuJ3udhJNhz9w22vH16NUHwu362ur2n319VqiZz7f94Uj8ggTEv/dR5VEp
         OTYgcFMEbnUS+pm1zoccsj+dhONlhCMBt3FlzS9oqoqgYB/WzWhqhXPny1j1cZdbQQJQ
         mW873Iv0+f/4g1YQePEEvTI7mvddFomvAr1MRFHTQlfDF9924sfvyc8nNDpirzMjYgia
         slrqhb9cRo10A3CX4PFDxXwHKDv2ld5msHiZcQexZaJaY4t48/LKCbDCCOYjEYcIEXfl
         PwBKD8iSZohE+CrtMrWR8LOZmxGa5WpkDKqdWnWK2fvEfJ8Eh7IipsKaRDHYvX0nMqei
         dMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748768; x=1716353568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rvfIK48YP43wqCqKvrzT+mX/UTiFLxkkrmO0jBglQA8=;
        b=gO59vB3GRiFkZJlCLTgz1DGYNr0/q8U1rdEp0ifsU0ZYhmYir9EC32sLuRMkZvYmTp
         oP7Y1o/NsFXIiFEFaKlrQvbdO4PZEzuGdhDoggXjZlpHPQi0T7WrB2BsmjzlRyD4Yj/t
         nWQmf/aPsR0WoSwbRZv2idXTPCCCzGTI13kXHeE59UnZJeEdv+UMPfNeL+AF5G8uBMOh
         5lxttjZjeYzph4ymO1UJsb3oOiHxYYQqEjSXCwQZ/C/eN0evWOnn+9NTgprHimMMEbRG
         u9GnLFw0S+zVlbjGbf19AA2GZFBmbYGPrhnxAh7j+GowsMuD3W4ZmTNtIBUEWrwKUb80
         x5Tw==
X-Gm-Message-State: AOJu0Yx4gvGUVlXchr4cxnmT9uPhsmqZLQZLIC+zMt6knAV7clnIY9uV
	oGsyd4rD5tphIM7QKvO4LomnvpcG/6+mjLbmmVUdUBQ8WoZWtesYHWjNwPo5+w0=
X-Google-Smtp-Source: AGHT+IEV19/6hamLklDvRLWJF3yvGui5BeA+UH1BOMX/YAfh8NQPDTuI4iYqOmWyfb9UOWuI3DDXMQ==
X-Received: by 2002:a05:6a00:1916:b0:6ea:9252:435 with SMTP id d2e1a72fcca58-6f4e038539cmr23344033b3a.30.1715748768489;
        Tue, 14 May 2024 21:52:48 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:48 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 20/31] Staging: rtl8192e: Rename variable WinEnd
Date: Tue, 14 May 2024 21:52:17 -0700
Message-Id: <20240515045228.35928-21-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable WinEnd to win_end
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index ca1c748ac40c..72e4af81b1de 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -527,7 +527,7 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 	struct rx_reorder_entry *pReorderEntry = NULL;
 	u8 WinSize = ht_info->rx_reorder_win_size;
-	u16 WinEnd = 0;
+	u16 win_end = 0;
 	u8 index = 0;
 	bool bMatchWinStart = false, bPktInBuf = false;
 	unsigned long flags;
@@ -538,7 +538,7 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 
 	spin_lock_irqsave(&(ieee->reorder_spinlock), flags);
 
-	WinEnd = (ts->rx_indicate_seq + WinSize - 1) % 4096;
+	win_end = (ts->rx_indicate_seq + WinSize - 1) % 4096;
 	/* Rx Reorder initialize condition.*/
 	if (ts->rx_indicate_seq == 0xffff)
 		ts->rx_indicate_seq = SeqNum;
@@ -563,12 +563,12 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 
 	/* Sliding window manipulation. Conditions includes:
 	 * 1. Incoming SeqNum is equal to WinStart =>Window shift 1
-	 * 2. Incoming SeqNum is larger than the WinEnd => Window shift N
+	 * 2. Incoming SeqNum is larger than the win_end => Window shift N
 	 */
 	if (SN_EQUAL(SeqNum, ts->rx_indicate_seq)) {
 		ts->rx_indicate_seq = (ts->rx_indicate_seq + 1) % 4096;
 		bMatchWinStart = true;
-	} else if (SN_LESS(WinEnd, SeqNum)) {
+	} else if (SN_LESS(win_end, SeqNum)) {
 		if (SeqNum >= (WinSize - 1))
 			ts->rx_indicate_seq = SeqNum + 1 - WinSize;
 		else
-- 
2.30.2

