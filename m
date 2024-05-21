Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9641871B5C
	for <linux-staging@lists.linux.dev>; Tue, 21 May 2024 03:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716261459; cv=none; b=GDmdP352u2qvuQBvLgP18EqyE9uXrMLB+QqvuWDyLZPgMUUSkdc9BRrOWOEh8li4Ad/B+WDtVaGupDwBzqnjV5XH3AvpmgDoGMtHkRjcVxF/cYWcQnjld8pECQAOYlYKTUypvLVcWvufN6oA9aIP1UNSqt9U3WjoKTPLYbpaxaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716261459; c=relaxed/simple;
	bh=hPJRM/f0cWl7W+m4SCd0UK0MHAt/7KX6y+yPnva3ddY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fMp/4SBGf5vbOmizt0N4JUbVvmCgSOHVEwfBWtOBUdNLdne2WtV4AAexEZDMHLg/cL8o6mfcwD/+4OC30KO/TLWf4U1EMsn77iNCuU1dzldy+/Kz/Dx2bcA20fPPIr6dmUyzriiiOmUqx9lRqOhkQpTShx0fVjg43P4yycYd93E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=eVteqcAT; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="eVteqcAT"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1ed41eb3382so94958855ad.0
        for <linux-staging@lists.linux.dev>; Mon, 20 May 2024 20:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1716261457; x=1716866257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzmRGVhra0vqV7ClBDZ8LpQ88upOg0kiLsBQjRBVvpA=;
        b=eVteqcATsv/cmG6Kk/wWKRx5rRgMdhWEgfD87mLSAuf5SUOuMtnKDvfqBJF1lPDTto
         wLGLWyjIrJlVnoMq10HF4MpRmHm6lcZHIt6s6A8xOk+iuwzP5fDxkPJNpqS6Gh3TAWvz
         zRh+2LAPvk6sWssU0fW9dYEl8RE46NoKuVCj6jS/w7Ke3IRtTnbSZNwcZ46D/XsN4CST
         qnDeqCur56s1NIp1EejXAQpPLbPSsvRTczPPS6vawEgVLLeDt1rBZYabqM3w6AEGxzXh
         /A4o21Kqbh2jsRmqe8jCx2/Y63vOoNJ/pzNUNHfm/RyIux90iuk2ndVrk7VJCVfI3zxB
         q2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716261457; x=1716866257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzmRGVhra0vqV7ClBDZ8LpQ88upOg0kiLsBQjRBVvpA=;
        b=A3xdH14DOTXs32aLhvfySw5YLcHH4y4htBrqpjORB7owDCYiyMcB/Ei8S3Qpiw/i1v
         lz+npuuI297oYaiDXenZVycIia031JUyzx5q9EgU6iH0akMaozsMcmVrlgmb1Iv4tscY
         eKQDT9yRHnUTkcXwN/wB6tQJ6uaFtFw6ZfUpUebgUY150oDycNhmi78FgdUZlOngYjrd
         FVgKyNhUrw5eWmTw5HuocfnQiNZXu960ZRp5kp9owHtK5vk1akvBDC1Mt8QMcwmVDaBb
         5ipNKRyp6YPh6UGYQpfQAfAKUEQkhD78uf7zMuKd91rgaBW8mWmCo9LBh64RzCturHWT
         HvCw==
X-Forwarded-Encrypted: i=1; AJvYcCW1juDM35pDkttnl3BXJuQsCyY3MHruMGcCshipLsFDG8A4TvTQwgWOcJaln6iLJU/fkDPxo2QrEPVl1lQPkK9eBq4QTQuX89oh8iVuTw==
X-Gm-Message-State: AOJu0Yw1Yo41SAIT+irqqQQ1+PxeH+1VT5Y28YuXWtDk7SI/CYMnGMxo
	kdrGrlQp2DMeiDCwTu2dNVOaLQ81RFC2NNzY5U6u/e0Aj36xpIgewcTZEnypz9Q=
X-Google-Smtp-Source: AGHT+IG3xZPcwhNaTmcektbIQRrzEBZS1fMMUdZ5TEtlnDulIxt5qmDUML9L7SII1MpSR5noRKJh/Q==
X-Received: by 2002:a17:902:6b44:b0:1e2:81c1:b35e with SMTP id d9443c01a7336-1ef43f4e417mr364559355ad.54.1716261456986;
        Mon, 20 May 2024 20:17:36 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf31a93sm214885415ad.134.2024.05.20.20.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 20:17:36 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 20/31] Staging: rtl8192e: Rename variable WinEnd
Date: Mon, 20 May 2024 20:17:07 -0700
Message-Id: <20240521031718.17852-21-tdavies@darkphysics.net>
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

Rename variable WinEnd to win_end
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No change.
 drivers/staging/rtl8192e/rtllib_rx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 3a637731506c..ab2aa1a86c51 100644
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

