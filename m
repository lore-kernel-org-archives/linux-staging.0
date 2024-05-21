Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0177353F
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261459; cv=none; b=aBvkQPmG8oJg4vVd+FUZf2m+dqK46UrztSQIQ10uhVN3qU7b/UWGK8XSprBENboHs1HWXcnJ9B60JUUaPU14gdcbc4Sj4iYfR8b4edKthb/N4SDmQ0TGYxunhZ59hgAAWoKqQGditYHR6zGfkWuqO25k23yquI1ar6c0n31P2jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261459; c=relaxed/simple;
	bh=O1x9lXALRfV3PEXYjxpd9ysMagtz9IVgfLsMeVEQ/yI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jrg11zzeHpJYIw98wHJBcJbaBAdM1RHuFYPfs2+0Ck3uB0rNlWFRM9IFJzpGfwNC01UltGdxqMVRi2qE+FB8b3ArP9WLaTQIgj3kbc3cZwUCg8/a93rN92w03hYshdlInV//fLZejryh2sJA6EBClFaMbEXvPakW0A956wRU9xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=GKuHYmoD; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="GKuHYmoD"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ecd9a81966so23192835ad.0
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261458; x=1716866258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fdeEpEPtpWbE5Mh9fqJmFvRworqsEQTxGybJaCMPRk=;
        b=GKuHYmoDKgaf0Mmdgc4AJV9w59XaIBzYz6zXLas1J5g6UmwPz4VEHr6i0MHXQrzxGh
         Vhs8BDJcHGi0YkBbeAIDxCMYgBeSVDKQhBVrnrZcJJ5wIwLmbowdTwea9GRngIegBwBX
         TGtPJiD+Us6NqBIkOmaYzciUriZ5DwFUGV3/1XR+hFd0QulKHLocuLZapbxdnawTFwOb
         QkW545pBnFUWe2/oBgoUFO7punN2DAlaYR5cGVnm4HGQ3QRdcC7T7P1inyUyzghhj1ud
         dGZ3wGNyI1nNlAm0beAYi/qyVkrDWjK2uQsTlKw64UR3avrAtAWJXuyH/hkFAKLAeBZ6
         BPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261458; x=1716866258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fdeEpEPtpWbE5Mh9fqJmFvRworqsEQTxGybJaCMPRk=;
        b=xGvJV7NqZ8W1vLDwuxiYJZjP0nnb4M6RKqUQ6OT4tF2HbFWhmZv4ws0JFOHztQoX+v
         65JfnSCKAKdhxLzuQtDQhp1yKR5ao+ioQVQrrslLVQYXYH6VV2bIa8F69+9yXp0mlOdt
         fpEYGSiJMRUdZmWkn28C0GGvXUWcR++P4/r+UD3Z8yPg0lpj6Yah/GFMpEM+p9EepaEw
         1hJgkwO0XnLRvIcCUKoRJldCcdeEnIo4VYQkIK7KplOxQA2yzc1/al6Eum4ADgJXwAk7
         nI8QIkFIXqzxDkIRwdDPPKB0ShDas9UAswQ3ju8ohqa5FgvJSv2yP2heot2xy0S5lJ6m
         UmcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvCKgua6e1+FAXPVNti2TOHA2hREfs5Kmbp5wo6z6Do2yT4IZKxCwj1UV1vr0ZsmTreQpFfEGvk207eQL4zkGQYe1n3RvaEX+EFeMvmQ==
X-Gm-Message-State: AOJu0YzxWzmgzAxKcx+GHxdlGY70bDvRIdXl9mtWyWANumoGlmKLSqhS
	Ips/Mcdg2PGX3HHNXLNauNSes8PZak4Rnc9XaJJjKF5T0yqLj4IZebscaxotFYE=
X-Google-Smtp-Source: AGHT+IHLUgFiZc3Qe3eYozL7kHO2osGBiNgXlRXygRH9TaPBs9Sb/E5DEHR2GAEbHm1R06IhTO9DZA==
X-Received: by 2002:a17:903:2448:b0:1f2:feb4:84f3 with SMTP id d9443c01a7336-1f2feb48734mr60320535ad.1.1716261457837;
        Mon, 20 May 2024 20:17:37 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:37 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 21/31] Staging: rtl8192e: Rename variable WinSize
Date: Mon, 20 May 2024 20:17:08 -0700
Message-Id: <20240521031718.17852-22-tdavies@darkphysics.net>
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

Rename variable WinSize to win_size
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib_rx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index ab2aa1a86c51..50687f3dce47 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -526,19 +526,19 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 	struct rx_reorder_entry *pReorderEntry = NULL;
-	u8 WinSize = ht_info->rx_reorder_win_size;
+	u8 win_size = ht_info->rx_reorder_win_size;
 	u16 win_end = 0;
 	u8 index = 0;
 	bool bMatchWinStart = false, bPktInBuf = false;
 	unsigned long flags;
 
 	netdev_dbg(ieee->dev,
-		   "%s(): Seq is %d, ts->rx_indicate_seq is %d, WinSize is %d\n",
-		   __func__, SeqNum, ts->rx_indicate_seq, WinSize);
+		   "%s(): Seq is %d, ts->rx_indicate_seq is %d, win_size is %d\n",
+		   __func__, SeqNum, ts->rx_indicate_seq, win_size);
 
 	spin_lock_irqsave(&(ieee->reorder_spinlock), flags);
 
-	win_end = (ts->rx_indicate_seq + WinSize - 1) % 4096;
+	win_end = (ts->rx_indicate_seq + win_size - 1) % 4096;
 	/* Rx Reorder initialize condition.*/
 	if (ts->rx_indicate_seq == 0xffff)
 		ts->rx_indicate_seq = SeqNum;
@@ -569,11 +569,11 @@ static void rx_reorder_indicate_packet(struct rtllib_device *ieee,
 		ts->rx_indicate_seq = (ts->rx_indicate_seq + 1) % 4096;
 		bMatchWinStart = true;
 	} else if (SN_LESS(win_end, SeqNum)) {
-		if (SeqNum >= (WinSize - 1))
-			ts->rx_indicate_seq = SeqNum + 1 - WinSize;
+		if (SeqNum >= (win_size - 1))
+			ts->rx_indicate_seq = SeqNum + 1 - win_size;
 		else
 			ts->rx_indicate_seq = 4095 -
-					     (WinSize - (SeqNum + 1)) + 1;
+					     (win_size - (SeqNum + 1)) + 1;
 		netdev_dbg(ieee->dev,
 			   "Window Shift! IndicateSeq: %d, NewSeq: %d\n",
 			   ts->rx_indicate_seq, SeqNum);
-- 
2.30.2

