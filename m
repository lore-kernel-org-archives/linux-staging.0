Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7761B1E531
	for <linux-staging@lists.linux.dev>; Thu,  5 Mar 2026 00:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772672011; cv=none; b=krwsopOgbZ7bf72TBRmuLBvGtRLTb/C621mk+xcsG6D1JHWo4kqfxcIyao6OOpC6LQOcrg5KzAg9W29pPo30PQ24ChTMAvsgGTcKQE+U3w41duxx2YL5bbemPrOjK2AgKKqetrIFztamZjvuYlHfwwvW9nQ/VkshHPHu9oGPTOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772672011; c=relaxed/simple;
	bh=jN88VmEDlttHb4+DITLZtI2C/M2wdjeYxHI31c6A2i8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RVS/X+XIMomAOaLr4cORuUlhZ2LDvR8mm36JxgZ2f6rR8j+usrSAeNCzmxkS470vcx6zcvcCXpzPPsbfO0A1PuCsHEN5IvGlyI36YU1Nt1jcn6TqsAHLv/UfoLFX+z0iZ3x99oSLJAbDuLwne4ykIMCX9GHdz9x/A4ZlVzTflRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8AeFwNO; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8AeFwNO"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ab39b111b9so35300015ad.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 16:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772672009; x=1773276809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SSOKHIFPQ+P5imsKR6ZXPsYad7Dy1LiqEdqDca11KTs=;
        b=K8AeFwNOsVTv3OOAw8Q4w/cco2/kam6VWQSqlL0go9VHDY3RUNexbkF6/p3o9iqN7o
         ip/RYBm1RqZPXHdovTarUhnCv1156SOVyg9guq2WkdWCFadpiDqzs4ddESm4MN+IN84i
         QMrNr5Gh4LLr3w6iVS0T4qFI9MaXnjMJsAxgGXAeouksAQgQqmC0bnpQs8B/eAxeqvUo
         FNuhKckX7Aqi5gP2UijtEpztQYwvOpPOPveYMAkZOIzybo8DF5MoYh9vLOfwabsQJY/e
         crOpDypXhy3NY0Xr3hYwuE3Rfq4Dc8XZbjxZo4ulsqJJ37HnMTBGEn3ZxTvIUYwzv3SL
         Fj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772672009; x=1773276809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSOKHIFPQ+P5imsKR6ZXPsYad7Dy1LiqEdqDca11KTs=;
        b=MsFW6PSxMJkpA0LzmrTsg2fmMbEIwYTBs8TIbPnmO0abNE28wSoATO+z3Sb1Xov0GB
         K+oMZqiuBvgAhwKmN+KKxrnXD0B7eZaZh27qFdiRzlY/HsasqdS6IFJosPsmWwI8BlYu
         k4iQ7MZodqgpYk6w3exobb5Vv+5i0LeYmLxJXmtayLxVwMuWXWzVPyr8fK8NGCRqhpUj
         ZwjfaS+Umzs2MdJTgDPbCYA1p4anEzH35cpBrr23iVqZg+W84kBhtCvz9aOr6JZefiVQ
         NOLZhokv6ESrxvsiFrHHQ9MIg75igdqBzud9LZSpTCM9DY6OzYNE9PFLhI2mRWMe/z+b
         SumQ==
X-Gm-Message-State: AOJu0YxoBTB37JUyXWtGfUT8iuRIxeZdXkAOxB0hVklUEZnSNe1xDb9R
	e25f1rjU9uASYbLCPSXCL9lsnNp43trLri7p6sycfNKaUtK0ZzKCHmSQCDjPSAOGp4Y=
X-Gm-Gg: ATEYQzwTgDvITUVYlGGFPP5EYJ3vDZ9Ub49xhpxzNKiKLIC1M3NoO9afJpQu/NxdT9o
	A43boCzFtv6iSM6JBBqweGS7drJArLAWNHfFxLs6aHqnptFrnsegYk14zEAxrJJ079+lDwVlWQe
	vl/WrBw/iCRRp/vNgBDHKYsbI8ILddRRxTx6ng6pqITtkIzUSIBm3sEC7YXt3B/bmxvhvHpuCBR
	le55JMX33XFiQufogJFhVv2EQUicqaxnHdEfofjfKADz3/IzgYmzHEYhLllpko3SY8C6hNIMrAG
	sADHMcsSLuoBBIJMsrHiIgNKzeT2Wf4zrBcy1v26Bpa8tDK2yN9QkVjtSIWHwDmqeizSLDxKsMR
	AYeG22QRF2YFle+NvRQXynbAKaORNNJuzFBnvAsR+bbI0lLQYpP1cHOIaQ0uFGg98XUI+Bbhu+A
	IzCEk0KtxbLBG+DF+avCJEoiJwSkJNRc0MQJzvUbP4Rzz2ojtTpSqbyex6lye0sLsGTKB4EejoO
	KA4PruJYL/pDDyQ
X-Received: by 2002:a17:902:da4d:b0:2ae:47f9:de12 with SMTP id d9443c01a7336-2ae6ab729bemr33397885ad.46.1772672009431;
        Wed, 04 Mar 2026 16:53:29 -0800 (PST)
Received: from tower (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae49bf44dfsm107888485ad.16.2026.03.04.16.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:53:28 -0800 (PST)
From: Mark Adamenko <marusik.adamenko@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: [PATCH] staging: octeon: replace BUG() with WARN_ON_ONCE() in cvn_oct_xmit()
Date: Wed,  4 Mar 2026 16:53:16 -0800
Message-ID: <20260305005316.49848-1-marusik.adamenko@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All three values of queue_type are handled in the switch case, making
the default case unreachable. Replace BUG() with WARN_ON_ONCE() to avoid
an unnecessary kernel crash if reached.

Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
---
 drivers/staging/octeon/ethernet-tx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index f5bbedac6a65..f34d82a433e3 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -450,7 +450,8 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 		__skb_queue_tail(&priv->tx_free_list[qos], skb);
 		break;
 	default:
-		BUG();
+		WARN_ON_ONCE(1);
+		break;
 	}
 
 	while (skb_to_free > 0) {
-- 
2.53.0

