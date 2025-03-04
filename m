Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580D0255244
	for <linux-staging@lists.linux.dev>; Tue,  4 Mar 2025 19:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741116498; cv=none; b=tt78bXMmzJKV0qvxZa/yZO9SkhFimmASwoyJ/42wYaF3llsJMLg2gV8/1pKu9tSQiacAjQaLfmwpBPE48MmfgWQ9sMbjnX1bR/SU/XBdQVE+x7j8Q9ueh06mo9a7GtISgRfsC3Z0xEskVrEsnxqKs3UkEC5Ku5+Bn/gTVTUt7u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741116498; c=relaxed/simple;
	bh=LORQsVwLTnGVfVFh5m2kwdKQtDUywERLd2dudQi76wM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lW1LlIKoxqPtZvIrCj/FqH8GDvsc04uASorTxEFAITzEW8O1EOoo755opJLEziKMuwHHuFRUghUjs/Ou7dcqQTwnFkCVwLgOaE2COrfytt0Px8Ei9DrFwt8We5KnZcZO9PXJhtVywcV3jnFwRNj32Uab2FUG73grhw2OF6ZgtE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZyZUt1y; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZyZUt1y"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2235025322fso11888165ad.2
        for <linux-staging@lists.linux.dev>; Tue, 04 Mar 2025 11:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741116496; x=1741721296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfwpAjfF81ZoEEByv81hbUTcL55kAuRlyaiSfIzemn4=;
        b=mZyZUt1ytTtj0atgD6AZCvsCH1iAExM6iJdh9hi+casv7+4buOENc6FJxOPEVK6uUH
         MeYMSGeUJveEA7iI5GL1/sfItPQnSb+QRD0hnWDJQyoKfqTm53I5tKs6nFP2njV67O3P
         GvydMj7/AvApoT+b7ztecLCEV8OXGvRDsqfcnkg/44QhI5ixhRQ/jrOan57RJBxksind
         dFF+vFssNyBkZFvUiurvgJvbLkk3nt44AL9uNOSLEMjEh9qUGWxuezQFUPYE/Qc4j5Q4
         pJpx7ouuZv1WNomd5YYFKrB01J24gJ06ea5o+E800n3L6dEthG+kldI6r68D1/Q0hZo2
         Ab1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741116496; x=1741721296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nfwpAjfF81ZoEEByv81hbUTcL55kAuRlyaiSfIzemn4=;
        b=la9t4MOXk1cNkvC3m+Nzs9yeAPooQ09JnrgfAq+uBtR1YpGbyuOIH7MQaHjyDkyl3S
         HQ/XZyLDN0SGA8W6wID0i1CNFo7ms6PbhCwGk1DnrWv5s17aJKwJEf1ZG62Es4gZdRdR
         L93fm7TPgj5FotLOq1W5pTTRcWsSk+yw8LnxtFYReNbBY2JpROonce8RCpgyoCwA9twd
         Lqc+iXvjhw1wDL1QuZZf/gNmN9PRamqdbr6cGqqjp9BmETXeIzi6AWVy3Dn8pjiO+84R
         ijSvXOsOu0DZY4jDpJpG6RWxjrwvByhJ8fbUdh8d5sFLY64YK5TRcgxXkdMqd71TyKNF
         mi4w==
X-Gm-Message-State: AOJu0Yzi6pVutL4QXKYRV1geQcxjqp6UVuHHv4R2IOqv/STQBDIauQR0
	LAqITqV8mW7SzvPcYuL7lBECgwfVylHkDZpDuoE+WY07M7aXjBA3NMcGBg==
X-Gm-Gg: ASbGncvpf9cW07Pmbcy4F1bVy5158/gBLlPtzEiTr/I/BwRSbU4f3hvj4W15kPJk4np
	QN9+V5HKbUy6sdSYrFNI9AUHKBlaT7e2kK2wVCgGgSlPtizrJ24RTpw77F9r2LLRELhs5/3jJ4E
	ZGdKDsKcAlUJub4vQfmKyx8SbvPBAFRMtFywQEKfeuaE2/4DAFd546BL4+nOhl6eP4epjXAjvec
	ncTDBGaQ2b4Hu7c7yCcUGGntGavoiIY+UZuMd974x4PLpeK+Es32D/YOLkQmAzqQH7P/22GwoKk
	xNXs1ZwEvHD+MPYFOSmp6Vg0J8caGTfKvFG8pHDV39hmFFViY/ApZnsTYg==
X-Google-Smtp-Source: AGHT+IFC/HtEpOI88jDvCz6XWpDsB1WUEG9zN3cdBySAyd4AF5z+1Dg8su7AkiLyDrWInkTaZatviQ==
X-Received: by 2002:a05:6a00:cd1:b0:730:9467:b4b8 with SMTP id d2e1a72fcca58-73682c9afe5mr41447b3a.4.1741116496118;
        Tue, 04 Mar 2025 11:28:16 -0800 (PST)
Received: from localhost.localdomain ([2802:8012:1f:3200:f1d1:c186:ba5b:8f06])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734d444a9fasm9341920b3a.60.2025.03.04.11.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 11:28:15 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	arnd@arndb.de,
	niharchaithanya@gmail.com,
	jiapeng.chong@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	Gaston Gonzalez <gascoar@gmail.com>
Subject: [PATCH 4/4] staging: gpib: remove commented-out lines
Date: Tue,  4 Mar 2025 16:25:43 -0300
Message-ID: <20250304192603.40565-9-gascoar@gmail.com>
X-Mailer: git-send-email 2.49.0.rc0
In-Reply-To: <20250304192603.40565-1-gascoar@gmail.com>
References: <20250304192603.40565-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented-out code in function write_loop().

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index f7dd0809b06c..bb22ee2cc5e1 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -218,18 +218,7 @@ static inline int usec_diff(struct timespec64 *a, struct timespec64 *b)
 
 static int write_loop(void *dev, char *msg, int leng)
 {
-//	  int nchar = 0, val;
-
-//	  do {
-
 	return skel_do_write(dev, msg, leng);
-
-//		  if (val < 1) {
-//			  return -EIO;
-//		  }
-//		  nchar +=val;
-//	  } while (nchar < leng);
-//	  return leng;
 }
 
 /**
-- 
2.49.0.rc0

