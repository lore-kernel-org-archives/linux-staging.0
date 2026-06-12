Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84915377ED4
	for <linux-staging@lists.linux.dev>; Fri, 12 Jun 2026 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260134; cv=none; b=Y6zoL7n5mOtMDkbOgTC/m0vJQbE4LoL1vPVCyK3Qq5r1OrFbOrJr8DG0eZTRw3HKiPl/4wE3RLlqcyKg4aftdwvJW/ri1Ksq433cx3oaovhf5iyeB9kBN9TAoMgNqsSSqbGJazhi1JPCOptlqC5lfXqM66YZTBNt5/PzOMGrULw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260134; c=relaxed/simple;
	bh=z9Jut3m/rYtCUjaUNxYmg9lKQg4PYgr8eraRy0BoJo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SxYGmAflpi1bO2ktuMJvEFSB7Q2JIT7MhRPJ65PeDldTICHLW5O6J6l0qeIx/fR3TnfQlxMjfEHFvCgnW+NxjcGxRTNwtY1QTGSdgV1ZtvRldUUcknrq7l4wetNB75hTXyLUOEH2HjyINX+/r/o6kcYSVvVd1xknM0ufTjDydv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6SKpM7g; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6SKpM7g"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-460662fcb4eso530096f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 12 Jun 2026 03:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781260132; x=1781864932; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=paFRyFcna5nwug9Jw0CJHTQ8tqucSs8QXW3t1V1ZnIg=;
        b=O6SKpM7gOVB9jvWdxLq7fP1YED+K3VjagLZSKjn/n+26fDT9/EINZwNYqsTmC6prv7
         j2cTcl+wFwKsnxEWcm9PpVadmRiWkIUn3FTgU8EkVfyn2ljXFRXF0xPuoJF1q0pTrDOa
         RlTPIAKGxB2y4hTRDfZQ6iHpOhDA+SYoe3sRbLaCq1nJ3XooiCjKiiuYp9qmpkgiJe7G
         GnX6qbIYDzvi7YfWnWJRB9CmVsL4LhKSHn9cQbVr24P21mblMm1ZqV7xDfIYcwL4OTDE
         i982sEOKJsC2DseUnxPV9+Ei+jFaVfOSQnkyIpNazMBHNrSsTBCcrfupQ5rBX9gqUH/f
         HBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781260132; x=1781864932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=paFRyFcna5nwug9Jw0CJHTQ8tqucSs8QXW3t1V1ZnIg=;
        b=IShavWarUqJ1LlCFvpqa2wJzf7psQSTgekLJECTOydHL0YfrBb++TclXbbiBu9AnyA
         3yh3AY7MsN48epqm5j61LVdGeRmU72H3ewg3HM4xNvweHOjBNZSNISfEu+3g3G4qUeWK
         DIEBwHYQH2z+9CrHcvNuRXxTHVtjAbThrxf+YQehp/ZRX9jD1Pr2Cxkf7x5SCtHtBoST
         43auL6keLV9PYZ0auf6HB7/kHy1yM3pyvQvaye18A2QPIZm7oEw+fFz8198oLu65BWdf
         S9wrgQohFJAHuTWuG2n269rkdkiuHC4uRsABmLN5EoC0bgWBHne+yquChdJNBDkNyI/r
         mrWg==
X-Gm-Message-State: AOJu0YyUQNNdAVKgeVmKIOYkue9reBU8dNkJVxyQcry+xaqqFo81M/zw
	MO8rwZEbZrpNnwc6Dym5t7Z0kATK1Ljq8GfdFJUu49WhdXl/Fya6mwkq
X-Gm-Gg: Acq92OGDbgY7v36OI9wzxP0+63Gt7y/OIMMdzfse9ye0QRq2osAZxmUFAeFMnYMdKxi
	v5zW7W+Ya3j801wDgeWX//XEYmF/h5YwQP8Rg7LVqnBh4ohWuB+D9c8IRwWdMr3bLmoKgqzvO5A
	FSW4YP8WNoCqfqH/VQlRKCU9egcuhxC4KSYlWe8FD1M6bHcqlqKluyt2Stisop4w9X0s95j2RJW
	afcF5idtGx8n7JVRNUBlJ+v8rw1wNJ8fJ3A37XMpdhSXxF4uUH4J0SuHKDDtOoKHfWp7hDJlddd
	vl+CmnLwelhrEpbZdZujiGiq6W612rhbwifQlL0o63LmiMvqIUNO8YjRHB7NNBTOH3ukw9v/I+w
	Xhjdrr2B+IsNd3/8YN1k7LQgQxUpJWQKxjwqyL/9vYWiKWIxzWW1ZjyTujS1PWOHZ239PsAEr4S
	IV/uttx+OCf4BJYrdkSj/HhPZXVQ==
X-Received: by 2002:a05:6000:2087:b0:45f:f142:d569 with SMTP id ffacd0b85a97d-4606db8dd7fmr2991148f8f.15.1781260131863;
        Fri, 12 Jun 2026 03:28:51 -0700 (PDT)
Received: from home.powerhub ([2a0a:ef40:30:7801:2655:7809:9974:b326])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2637ccsm4358881f8f.6.2026.06.12.03.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:28:51 -0700 (PDT)
From: Quentin Strydom <qstrydom0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	qstrydom0@gmail.com
Subject: [PATCH v2 7/7] staging: rtl8723bs: hal: fix space-before-tab warnings in rtl8723bs_recv.c
Date: Fri, 12 Jun 2026 11:28:34 +0100
Message-ID: <20260612102834.39935-7-qstrydom0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612102834.39935-1-qstrydom0@gmail.com>
References: <20260611162128.57870-1-qstrydom0@gmail.com>
 <20260612102834.39935-1-qstrydom0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove spaces before tabs in comments to match kernel coding style.

Signed-off-by: Quentin Strydom <qstrydom0@gmail.com>
---
v2:
 - Rebased onto staging-next as requested

 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 97dce28fd0a3..e943c304950e 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -267,9 +267,9 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 				rtw_free_recvframe(precvframe,
 						   &precvpriv->free_recv_queue);
 			} else {
-				/* 	Modified by Albert 20101213 */
-				/* 	For 8 bytes IP header alignment. */
-				if (pattrib->qos)	/* 	Qos data, wireless lan header length is 26 */
+				/*	Modified by Albert 20101213 */
+				/*	For 8 bytes IP header alignment. */
+				if (pattrib->qos)	/*	Qos data, wireless lan header length is 26 */
 					shift_sz = 6;
 				else
 					shift_sz = 0;
@@ -285,8 +285,8 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 						alloc_sz = skb_len + 14;
 				} else {
 					alloc_sz = skb_len;
-					/* 	6 is for IP header 8 bytes alignment in QoS packet case. */
-					/* 	8 is for skb->data 4 bytes alignment. */
+					/*	6 is for IP header 8 bytes alignment in QoS packet case. */
+					/*	8 is for skb->data 4 bytes alignment. */
 					alloc_sz += 14;
 				}
 
-- 
2.43.0

