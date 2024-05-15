Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5955D477
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748771; cv=none; b=hGKmIGB5ETMMrbTh9ZFQx9sbLmfgLu0DGxPrz1rpbIJE4Ss+2azzYembzWeAdzJYM80C73LX/so4g/1uf2QKCrU2Rr1MLGS90WawdxC+CM6QvOefmzo320uzIC7859gkg7vxpfOnvLVymAfBRdO5416jvoEKk91yUFZzxZvnkMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748771; c=relaxed/simple;
	bh=4XTLJvgMh1WinVEq0Id8ZcIV9UdiDPoQ+WA50lQ7L1w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SdURFXrjRq4NDB8QXwKfoDPGrjCPTJDYzA2+grNprsi2021GS6qXbz6aNn2XFuO/bpkn7itNJB5ociLz/LNYHBPWtforYMEU/qExXUvH+3TksC6HKwAuZ988X3dEbf0zFg4ulSmVt8sMEL5LXVQzbm+ohxnpx/0jYLcjmQeMmrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=c18EEk+L; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="c18EEk+L"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-244d692e9b9so1557698fac.3
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748769; x=1716353569; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrMvq8qC3hHMkYwnyvuzzsX4WuQrrRB+cSvIUWL+7wU=;
        b=c18EEk+LANW7sZa3GUgVL40DpwKcr/iULTQ16AZThSdiWN4Em58156RcKscViu9LS8
         1c2TaL/KzHq8rZJ+8d8+ZyOzycvA6dngFMcytfqItqQyr1HTH3ytLiYexLzWAPflhozD
         xjn2etZreAwrFc99lvmLNvu0BZCMOoQAC0CgsQmTa5M0IqPOgM+pSBOOPejs9azXoxjs
         34a8eiTnyoUFEEzVQVvd9bSnElMfPcpU0eTnAelUF7UJf6RPFTkHHHd/P+vFiN4j++ro
         Oo8Ls2SeNeWe2m0ymV0qdd2L19xVW9U14uXCmdl3l5R1MQHZO33C1hAZp1CMYwKcZwDF
         uwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748769; x=1716353569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrMvq8qC3hHMkYwnyvuzzsX4WuQrrRB+cSvIUWL+7wU=;
        b=Jrwv8Mb4tHEL1nbjrlVDkUQcBHhRN2ZU6Xf7aZ5rmt24crZ2VlWEltGS9d3Hs8fwjP
         dBJSrgkgbmk3I+wu523Jat2NeBmwxhRFOOewgnWqA/gXXHTMZgPC0piVVCKIo1Zeaf0r
         iTQNiYBQx0I8Z7FFAAOlc0Zg2Bb3GrSPl2bns9IwfS/HEuP27B/00UGpLr20/Z7WDnqz
         8h37npNWt9/d7DjFIVBCkD9ubSu6xkgAnM0DAu4i6rPT2nyXz9v08yiLLArDNpkxve76
         fI6r3SYF/nhYkUPRQ1MELXdUqdtRqiYKiOT9ftymemnGHBRnZ4LPr2+hWLfAmrBIwHtY
         ZsPg==
X-Gm-Message-State: AOJu0YyrqYilXsCnTDNZ7+fOMiJ7i+LnFW0gebRgg4Ps5iAkZAzSIWMj
	ZT6oOR6hbOcoAmcbeB2R9kzy9W5S5XAdvoxBFlqazmD6p3+QqwHLCGbdKjjJ9vk=
X-Google-Smtp-Source: AGHT+IFmmz7iQdKFayBIXMY4XXVZ6NE4nA/h8O/y0t9uVFWS3hw0S6ov8zh6piTpQxthknH1VPxpAQ==
X-Received: by 2002:a05:6871:1c1:b0:23c:f645:944f with SMTP id 586e51a60fabf-24172a420c5mr15089318fac.11.1715748769146;
        Tue, 14 May 2024 21:52:49 -0700 (PDT)
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
Subject: [PATCH 21/31] Staging: rtl8192e: Rename variable WinSize
Date: Tue, 14 May 2024 21:52:18 -0700
Message-Id: <20240515045228.35928-22-tdavies@darkphysics.net>
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

Rename variable WinSize to win_size
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 72e4af81b1de..f276e52aab08 100644
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

