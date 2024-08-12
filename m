Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADC5136A
	for <linux-staging@lists.linux.dev>; Mon, 12 Aug 2024 01:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723426617; cv=none; b=HzQx3kFgeibXE9236GXtGlfCxLxEEloG8BP69A+0VjfAAGQzNzsyW13GITFhANI2gkxZ9HbyKop8pj/RVqi9cv8aAdRUgzEs0TRtxqUjCo9u1BRIZ9M6NajViViYIGvfZ4q6EqDylb+6zvaJvw+gd3YhmyivDfMXKHocH0G/2us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723426617; c=relaxed/simple;
	bh=04yFoPijqrDz9urRG1Ayj+mvRBPdpsRTHeacBiCuaoA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mmW0XGc8IWgqkzUOpThTHNAezXItMaL+nTLo6VN4ip4MvhAVRsB6/9zlgZ+HoLnA1rzDy1klSvYAIMZUzSoavwME0BHxlYHrX5yBnNbw3RgmMYoi+2ThhaxY9MHT1qTDTiEr6gNRfh740eQ284EIg09KwjFooaszwAB7Ab0b9Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=gYBGvYnR; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="gYBGvYnR"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fee6435a34so26331195ad.0
        for <linux-staging@lists.linux.dev>; Sun, 11 Aug 2024 18:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1723426614; x=1724031414; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=64D2428cbRfebktVpMJBEPRgQBO5r6MLybajTnMBw58=;
        b=gYBGvYnRU6THkPZrgAPtCP2XUnkiDwfcEKW1klMWc9nLE26qtZ13C7yyoqCVyThAq6
         VRiTBbrNU/Oqt2hjvLeYQrouKytMIgLf5iyo984YSbKnRsrJXfJzBviarlQyuP2RrHE6
         J8K+CYtDViCa/wfb0MMxDpuRutDTp4rXnnyPJdB8IcFr4pgUdCIiGYCojLwwptukiaBN
         OLw34EGf9vXFNQYf+su7RxNUKL6Wc2MkupyPmAevi2dPnY1KbABTbvWsYkngbjd4tpNc
         9RgzI5txsOvDOzZpYI8ImsW2WcYzqxaqw/81nw3yxHigaqT78mp6r9DTM2phJdIDDjlz
         PYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723426614; x=1724031414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64D2428cbRfebktVpMJBEPRgQBO5r6MLybajTnMBw58=;
        b=mvJYTH0KLgN1jTSvntz60FtNQQn2CC1s5VrDkcRxhKNfpBT5P+23mWOmUDFkchS0Dh
         5r9k6PxB7HjD7jyfZrEX/uUCmGqTNUHyaQKM2n9kO7rpi+tywP4XGjPuvRd1LKOkwKb7
         5R9WB7fP57ta4FPYqkVbkBp2OAyTMcEAgOJ0+QejB42SNml8Wp68hjAMdaLWXqEwRjEI
         zevQQzTAZ+hEyj9BFbSnzpJQcaEWkKzdIMc7QnoyRQXoJ/+6ZPgb9qqXcSPktx4gaUGk
         vUgAO7Pw9/qsuCZO7APskQ0uoGu4chAQoQHn5u3sRBULtJYgTFdGkc2E4+KMJQgWCdvi
         xYUw==
X-Gm-Message-State: AOJu0YyZES8ipAingvsPZQDj/Z1XJKiqeUsec9VBhC/uO4GqRnx4RMFK
	a2eu/+QFaugWR7lsCH/RdlNpBLDOeNHcJTYn4cjsggWJAhE0Ho9weHQGeUJKtgI=
X-Google-Smtp-Source: AGHT+IFp+H1zPnrqeYHUYvBm2T2dzS46WIk2T5VoZVCJ7vauhRRsaiH0dgN+Qv2KDltNXzPByqhgsw==
X-Received: by 2002:a17:903:2288:b0:1fb:67e0:2e0a with SMTP id d9443c01a7336-200ae5d7771mr64457715ad.48.1723426613925;
        Sun, 11 Aug 2024 18:36:53 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bbb442besm27386925ad.290.2024.08.11.18.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 18:36:53 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH] Staging: rtl8192e: Rename variable nSubframe_Length
Date: Sun, 11 Aug 2024 18:36:50 -0700
Message-Id: <20240812013650.199675-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable nSubframe_Length to subframe_len
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 69ad74314260..94dbdaf8da82 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -729,7 +729,7 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 
 	u16		llc_offset = sizeof(struct ieee80211_hdr_3addr);
 	bool		is_aggregate_frame = false;
-	u16		nSubframe_Length;
+	u16		subframe_len;
 	u8		pad_len = 0;
 	u16		seq_num = 0;
 	struct sk_buff *sub_skb;
@@ -781,20 +781,20 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 	memcpy(rxb->dst, dst, ETH_ALEN);
 	while (skb->len > ETHERNET_HEADER_SIZE) {
 		/* Offset 12 denote 2 mac address */
-		nSubframe_Length = *((u16 *)(skb->data + 12));
-		nSubframe_Length = (nSubframe_Length >> 8) +
-				   (nSubframe_Length << 8);
+		subframe_len = *((u16 *)(skb->data + 12));
+		subframe_len = (subframe_len >> 8) +
+				   (subframe_len << 8);
 
-		if (skb->len < (ETHERNET_HEADER_SIZE + nSubframe_Length)) {
+		if (skb->len < (ETHERNET_HEADER_SIZE + subframe_len)) {
 			netdev_info(ieee->dev,
 				    "%s: A-MSDU parse error!! pRfd->nTotalSubframe : %d\n",
 				    __func__, rxb->nr_subframes);
 			netdev_info(ieee->dev,
 				    "%s: A-MSDU parse error!! Subframe Length: %d\n",
-				    __func__, nSubframe_Length);
+				    __func__, subframe_len);
 			netdev_info(ieee->dev,
-				    "nRemain_Length is %d and nSubframe_Length is : %d\n",
-				    skb->len, nSubframe_Length);
+				    "nRemain_Length is %d and subframe_len is : %d\n",
+				    skb->len, subframe_len);
 			netdev_info(ieee->dev,
 				    "The Packet seq_num is %d\n",
 				    seq_num);
@@ -813,11 +813,11 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 		 */
 
 		/* Allocate new skb for releasing to upper layer */
-		sub_skb = dev_alloc_skb(nSubframe_Length + 12);
+		sub_skb = dev_alloc_skb(subframe_len + 12);
 		if (!sub_skb)
 			return 0;
 		skb_reserve(sub_skb, 12);
-		skb_put_data(sub_skb, skb->data, nSubframe_Length);
+		skb_put_data(sub_skb, skb->data, subframe_len);
 
 		sub_skb->dev = ieee->dev;
 		rxb->subframes[rxb->nr_subframes++] = sub_skb;
@@ -826,10 +826,10 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 				   "ParseSubframe(): Too many Subframes! Packets dropped!\n");
 			break;
 		}
-		skb_pull(skb, nSubframe_Length);
+		skb_pull(skb, subframe_len);
 
 		if (skb->len != 0) {
-			pad_len = 4 - ((nSubframe_Length +
+			pad_len = 4 - ((subframe_len +
 					  ETHERNET_HEADER_SIZE) % 4);
 			if (pad_len == 4)
 				pad_len = 0;
-- 
2.30.2

