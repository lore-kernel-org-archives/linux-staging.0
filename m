Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B39C13C9D9
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 04:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725941064; cv=none; b=b4KUGAee+wbnOjNGbfrbj77At0VX+w4lWFCPoe5aHx9+KIFuQ6oSWdaGclkppDFgVTqvqA9LTQZvJnyjaWDdbEeyIt9ZJghFnOdf35eHfc3ACoo2j6F6Bi6QrMcOCo4Dl+CW0haPf2DZgQ6Z4Ajod1l8ez0CwS14ZPMN6dIb6Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725941064; c=relaxed/simple;
	bh=OJGgjae4i2NI37TZdwennJqCG02aTYJg/qyFEdtAYIU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HCwsGU3FGqIgUCgacGys9S6IqVG0qbpo/xdo9GfAGC7nqdcmY7HpVHTm/e8FRByVumtuDqS8QnhfaAb8CGiBAYNYSkikBar3B3sqAxXeEb3uoItovgx05HQZxP0a1O6LHXl9yv0BkkUR28W3T15N0ASym565yI9TFvASXAi5/2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKXSsr+P; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKXSsr+P"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2d87182874fso361064a91.3
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 21:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725941063; x=1726545863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5nzOGnXyk+q+cUZVUm2V+/bvqTXupwNNQKYLxllMLI=;
        b=UKXSsr+PDGTYP7JUIgC3bj8d/YiimsHBQydSd9WNNdwxWhoDCkAKjgL0jyjviYwPf7
         maUflVmMmAYtLbiToZ6YFX9+cxaE1w2Z207g2vEczllOEKNXJpSmk5x5dKZtHGJ9VNDK
         Q9+0BYZDJtXWi8gTGm6uLWfZjbiHUenbVOc5VDYx/ajmbqxy5L1PAb1L4wyehUjTDu67
         HuMaXV7Pp0MvBKsA/g9MPEuv1VtYmaTegx1QOtfpOwcI1tyaG1MeeaRiDsZ5hWD11b49
         iCw1ZJxbv+Fy3v4Zb/991SjZg9LrCRBY3kR2VmQJ4bTZ4WzfBwRtLvYex3kdNAMxavqr
         5Bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725941063; x=1726545863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5nzOGnXyk+q+cUZVUm2V+/bvqTXupwNNQKYLxllMLI=;
        b=PjLhTYOVBsbn64skxALTI8PsKGowkeSex5WK/WLgHIf475CeJScOu9/wxsRc8yQn8S
         WxVHARRR5OrhBCHL93Tx7fGjHdJ5TAkl6T8q6jF4QqDNsPe23bKd8tXeHsbU250akR6f
         m1mqNRsYR/wKaeKFW75e+oLNNuJ1RSIi4uYe3m19tBoRNJMRa1lJNBgjsmEQrt+i5iSo
         L9PcCAnD1wG+LWMQbUc//WuoWKd3zj+YmfE4aZvIklhq0SrW0MddOk2EB/vwHKG3Zmx+
         OrIo/0E+NzEIGLwfnKCM80/xUBBLasBds1oSKZfzMBFR/Sa4X43Fx6d4frYH02aHGaqS
         bB4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9dr4JsLYu0rnZ8suX0LTa18dYB7rZ2FXMTeG44B5T5oXBWFmzRNUVUNBB8l8Rv+2OPNYjIqC5Dq9rDC2+@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl5mPP3TjVvhj1w0YgB8oDvStSuM6h6piFcfw3aUGGvoP8Ss5f
	Sj/Aqvp+uaJd6Hk+ujy83JgWffwMpDm0yU1DDpbHZoxm64ahK42F
X-Google-Smtp-Source: AGHT+IGUuNnN1C12bsHnZBL4w0NXhQOMtv/wUCpSD2FO8MFDlHP/KTluDkaBbymh4N88LQNYHy61Kw==
X-Received: by 2002:a17:90a:fe97:b0:2db:60b:eee with SMTP id 98e67ed59e1d1-2db060b0f27mr4050263a91.9.1725941062832;
        Mon, 09 Sep 2024 21:04:22 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db04136902sm5316950a91.6.2024.09.09.21.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 21:04:22 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] staging: rtl8723bs: include: Fix spelling mistake in rtw_xmit.h
Date: Tue, 10 Sep 2024 09:49:15 +0545
Message-Id: <93a1b568ec96dea13dfc75232a08bbf42e270599.1725933169.git.topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725933169.git.topofeverest8848@gmail.com>
References: <cover.1725933169.git.topofeverest8848@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes spelling mistake to increase code readability
and searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
v3: Created patch series with cover letter as suggested in the feedback
v2: 
 - Created patch series as suggested in the feedback
 - https://lore.kernel.org/all/20240909041352.2392-1-topofeverest8848@gmail.com/
v1: https://lore.kernel.org/all/20240906141024.10021-1-topofeverest8848@gmail.com/

 drivers/staging/rtl8723bs/include/rtw_xmit.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index a3b4310caddf..544468f57692 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -15,7 +15,7 @@
 
 #define XMITBUF_ALIGN_SZ 512
 
-/*  xmit extension buff defination */
+/*  xmit extension buff definition */
 #define MAX_XMIT_EXTBUF_SZ	(1536)
 #define NR_XMIT_EXTBUFF	(32)
 
-- 
2.34.1

