Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02877347510
	for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 19:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773428844; cv=none; b=gYbFzKY54G5loznMCCvr5ClDIFHYC17l6mTtj/lYrLxU0XbqwANCt0SakXTchIC3lzeIFg4qmtc1bWBKzipUe4CJbpFO4fduDt5Alxcdbdn8RtT7+cFElbYwd2Hrs1JZIako+XQX/GiNqmi873eZ3Vdytp9Pl/eZ9M64BadfGEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773428844; c=relaxed/simple;
	bh=xSE4QmnPKMRXcqhmek+g+OubfLAC5+SiGpm2n2zSdpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lL9RAiq1vwFLzshViP37sLcWCDdiN9O0WP7jwDB7J19a6/Zwq58TTpKM/bTf8+0BUYtSVRBNnipxuDRsRnSbGyKaPV9EaaE+aCwNopBQmrGY9tYZO4Im3aDTGjamBPsQ3ZRs8/1+PgwSipvOAj1lXzcWup5Gvk7kkLXzBXADVa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9b+4Buk; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9b+4Buk"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4853f2826f7so25225155e9.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 12:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773428841; x=1774033641; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1oGbHRvQEaKk/H4LZnQ5diCWLa4hNp4OLceF8fWEnDA=;
        b=l9b+4BukFkybQYW5n61QA6KL2HZap1TQX0xXtEhhAJXowQrKCHnFxujQSZZXwPdQMg
         K79n7fuVbanj01c5tAr3Yb+E7J8ugYPL33pTS/BObntkabFnpOV4+Tib35UNmp3Q0tud
         Y2LnhE3jWMUrqphZmuOirGLOhEN6a7Ipegd/dStcF9i7IKAbAO+NBZYZyzvzLf/3PzXI
         UfiX7/dlcUuzKrbd7j/6sR3AIU2qtqocU+A+iHwq2UFOoYqlhQfNd04RNFyQTtnJMgCr
         xwhPsJaRL/Ya8wj/BTifVuXLVPpUxfJetLScBzhW8lEkEj1MjC0UrIuyxsvzW2/xMRjg
         9aAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773428841; x=1774033641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1oGbHRvQEaKk/H4LZnQ5diCWLa4hNp4OLceF8fWEnDA=;
        b=aVspRkiMSl2xuxcogNir8/oAlZdNnv2u2G0RSYM0Nxl1ACgU3THfN2R4/Pjw5lF058
         CwgzYXqFoHEVAHY8490j0WDFMWdyiymV3Yh6Esfb273CSSSPfh1bK92bBUAzKgWG2MRU
         f7M3p7uLmZNcuiyBvGnBCY28s6l3CttxXOj+5HOymCa5y5jbzcnL4RlFUJgAUq9MmrVa
         Xee0+EVCXpNF5NxF2NQMOTbP3XWqPV7K0WwYUJdLltDCWtxpn8mmp6L//GkrDot6Smwn
         bLd/JFy09teIrkBA/K92dOe1Dyah4MezUYvu+dth+sMC0VhO4COLkWv5PwZTq0n5373/
         BvLQ==
X-Gm-Message-State: AOJu0Yxy9cFrt6K9aQ8d1dc5hgyvhGNyVx25DA/zrKDkwRzKszn8zDjH
	rfeIS7qeikX+5tupmFbeg5IWMxumzkV/zC8lymwW4fvjmm5JKOnm7YPo
X-Gm-Gg: ATEYQzy4bWLhN5TqVYx3FsfUbI4MkhNjkQJkvGQIWMiLZkn++wsnriQA+s/CUa08HXL
	bfU1dKWzuhuwbt8SOBiRWDXq5VxbkgEKbj3EvjVrUjFW4w3zmaLTH4vXvwIw+uHn2EIQOO8qjn4
	2aJKBWEksf71iERGm37UFER71S489mc4MC49RUMyEPhHvuMmJIEpPhFHB88q5MPSlzEw3YKHqP1
	0q7PSkHDmlX0Dyh06ITBLYViJxQcYBXik3EHKIGNjZpuq/+dSH4y7UPU4Khst/N/MAgufShCQUm
	YGOeGSp0AkyfSgvXKWIIzaJIMDZPdQsKRnbt0oykRBQx/riO1Cd1/A2w3S5gdbU9SftWPZ9wsS9
	/X4D9A70GnqPw0yYZzRvAwqeZ9k8W0zgSnXNW72TSoDod/LRJy/2dZvJ2YcfI4XU6SghCZpl3lZ
	pWisQKU9lwvTxnWJlC87HReojGfmtiGUwCRuKpdmz/BWW3+b6elWAKK/wOSKvDVhnqdrdLp2iQ8
	w==
X-Received: by 2002:a05:600c:3550:b0:485:54cc:2e7c with SMTP id 5b1f17b1804b1-4855670bf2bmr66126915e9.24.1773428841116;
        Fri, 13 Mar 2026 12:07:21 -0700 (PDT)
Received: from localhost.localdomain (95.59.121.114.dynamic.telecom.kz. [95.59.121.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48558fd09d8sm66656585e9.7.2026.03.13.12.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 12:07:20 -0700 (PDT)
From: Azamat Rakhim <azamatrakhim8@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Azamat Rakhim <azamatrakhim8@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: remove unused rtl8192c_query_rx_desc_status declaration
Date: Sat, 14 Mar 2026 00:06:57 +0500
Message-ID: <20260313190658.13525-1-azamatrakhim8@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtl8192c_query_rx_desc_status is declared in rtl8192c_recv.h
but never defined or called anywhere in the driver.

Signed-off-by: Azamat Rakhim <azamatrakhim8@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index 9664758e21be..abc7a7c418af 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -34,8 +34,6 @@ struct phy_stat {
 /*  Rx smooth factor */
 #define	Rx_Smooth_Factor (20)
 
-
-void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
 void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
 
 #endif
-- 
2.43.0

