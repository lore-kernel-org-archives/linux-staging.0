Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDD11D0E36
	for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 22:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729202942; cv=none; b=b5SqSWy7mpxwyV6o6COLsFN6Tfg37DnT87LqHiWezGjZxLj8r6MgIQy4F9U82wUhJju7MqZW7Hew9CGXCoUaFCaWmTmitHk/oroSitFBscpIpLSLaFtJkVh7fAULGxAWwLD+sFPAXmTAgNPyO5ttuhH/dL8SyF2ZRr2YkJkevzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729202942; c=relaxed/simple;
	bh=C1ettZhXIGpXrwWmjEv8ZGd6Xkvv0nVVh445vJUf5sk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oZ2e8LSeO4ZgZSPhih/srvP7EUM4Nt1IAD3Byj5swqVct808fixE3SaQJVQ++wEpYkU3KdCj+hB8mIalWmI8oLE1aaYcX9yy+ls4eoPHGmUbYwhSYNthtFvARqrmWtWd/sBYa2+pJDmbHCJ7nuXTwNXT/0vO+gPFdASpTqYyECA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=G5X1wS2a; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="G5X1wS2a"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20c805a0753so12876655ad.0
        for <linux-staging@lists.linux.dev>; Thu, 17 Oct 2024 15:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729202936; x=1729807736; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UFsgI9iLkr6zyS/OFRJNfMmcc362Y5tywufpoyBtvb4=;
        b=G5X1wS2a1OgiJlD7ooaDTb9KVA8dpu8IQzyMe0qO3LO0Rs7Bl13EKwJwXF4NVhNp9q
         s7eq4F0/O1GoBvfAxIYe01D7jR3OD4fUk4dQlljvalMuPBd9za24Z21a8j77eehshaZy
         SDA5DlDblaBwFcR6lUHGIfvuXR+KXu24uNfEWH9EP3srfpNwcgZ6LwnEYKNdVy3ClEKd
         Q5roXc8FBd4MrmB3qmIbgRpUnneNSeUarucgLAYp18cBpdLncRgZrhPO8W6SL2SqRjMn
         fSWmqXrPUiBTe602TsqHFGVSjirlCYcau0jG8HLtuS1frbVbmZz+Syh2fRCdM97ZELJR
         cY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729202936; x=1729807736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UFsgI9iLkr6zyS/OFRJNfMmcc362Y5tywufpoyBtvb4=;
        b=aXh9qbehyarMJPx36vI8ccUxGCgbMEx+vZtrOVLMVbRttQDaahgdhxdBN0HZzXsbKb
         HVCrv7qfjWd8CWt677ptAIqYt/xXzI9XTYjl19nuQIEaLMWSI8zyvyIk8NwH73PXRZtE
         3HdInj0LAOkcBVc75ATe+OHUEzz6XQ7F9zmrzMva4UgZEBrd/TLc0Mk7pWl2Z8erHjpy
         T4hh/+TRURKeK4OYF8jFZU/9Ui3Q7U7qzAIicBadkzTSyME1LCqvIzpB/UsEdc/4WbgR
         z6Xsb0AD/OfupHui2UhMgmn9ysxCkss9LgLeOl8Ef4IAH3k5lZyKtDExyoPRxgLv0Z1f
         f5yA==
X-Forwarded-Encrypted: i=1; AJvYcCXkMysXgsW4gI8/2KvtJZTaSiQtCswGj8HQp2dWkLOeU0xOLwjgsEz1zKzZHrmbGZwPtiEJsT0HfGxbdi+T@lists.linux.dev
X-Gm-Message-State: AOJu0YyTzMZZVrwMwlWJ6lkACklq332p2U5EIkopbiHCD1iCJS6RXSI2
	qqTHzoAAm6CL/g3hJQLwonJsw/ur7qBklVDniKxs3Uy4hM/09t8FBLBd0PavWrQPKCIc0yM58hb
	ZzZOG6Dpj
X-Google-Smtp-Source: AGHT+IHCVP3YjOBsb8yQ3gloeSYLh2v91BcMDPYOPuSD9t8hzKslsYpLanvNx3VoPuzhOWozWgRP4Q==
X-Received: by 2002:a17:903:120e:b0:20b:8bf5:cd72 with SMTP id d9443c01a7336-20e5a91ac36mr4702555ad.49.1729202936501;
        Thu, 17 Oct 2024 15:08:56 -0700 (PDT)
Received: from localhost.localdomain ([81.17.122.147])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e5a8f4c20sm1131545ad.221.2024.10.17.15.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 15:08:56 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	nathan@kernel.org
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: gpib: Change return type and error code of fmh_gpib_get_dma_residue()
Date: Thu, 17 Oct 2024 16:07:24 -0600
Message-ID: <20241017220740.30370-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fmh_gpib_get_dma_residue() returns unsigned int with -1 as error code.
This error cannot be caught.
Fix this by changing the return type of the function to int and
returning the error code, that was captured. Also, change the data
type of variable residue to int in the function fmh_gpib_dma_read().

Fixes: 8e4841a0888c ("staging: gpib: Add Frank Mori Hess FPGA PCI GPIB driver")
Reported-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index 0e27b3ef1a1d..802043ffe684 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -547,7 +547,7 @@ static int fmh_gpib_accel_write(gpib_board_t *board, uint8_t *buffer,
 	return 0;
 }
 
-static unsigned int fmh_gpib_get_dma_residue(struct dma_chan *chan, dma_cookie_t cookie)
+static int fmh_gpib_get_dma_residue(struct dma_chan *chan, dma_cookie_t cookie)
 {
 	struct dma_tx_state state;
 	int result;
@@ -555,7 +555,7 @@ static unsigned int fmh_gpib_get_dma_residue(struct dma_chan *chan, dma_cookie_t
 	result = dmaengine_pause(chan);
 	if (result < 0)	{
 		pr_err("fmh_gpib_gpib: dma pause failed?\n");
-		return -1;
+		return result;
 	}
 	dmaengine_tx_status(chan, cookie, &state);
 	// dma330 hardware doesn't support resume, so dont call this
@@ -717,7 +717,7 @@ static int fmh_gpib_dma_read(gpib_board_t *board, uint8_t *buffer,
 	struct nec7210_priv *nec_priv = &e_priv->nec7210_priv;
 	int retval = 0;
 	unsigned long flags;
-	unsigned int residue;
+	int residue;
 	int wait_retval;
 	dma_addr_t bus_address;
 	struct dma_async_tx_descriptor *tx_desc;
-- 
2.43.0

