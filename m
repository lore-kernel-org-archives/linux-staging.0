Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D401D0DD4
	for <linux-staging@lists.linux.dev>; Fri,  6 Sep 2024 14:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725631926; cv=none; b=oVuQJu8P7iLIYofAojZ0A47j+qsNVWB+TAHtZ+bkQZEzO+RGHTC6vDU2qsyKKrimuXKxKyqYFQ8mxHrn3dklLiXf7+YDHwyzq2IBGLkjBUyiZvOr79sWMd7Jp9uVX6LS8jNpCgC9ylVzv72fVQsCbEF5w5nFpbb92JjladnawoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725631926; c=relaxed/simple;
	bh=tr0k3udyYHTsb6noIMnXKzGBGum8kb+Pq7RA90sKRMo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fp0wfAXJTSVpaOhApZwsXiKkql3SnzT9aqNltxClCvLBBInKeSeLTBDHUhN9U589FblFPotyegGM4jxpyJOGsvquKxm6Y1oCECczepvf8HWYkjRFhml2w+nciWLfaww5SogRRMEIILw664LypLb0JTnk1FoVO7WT39ZKfqWxVPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aq02fXj/; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aq02fXj/"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2055a524017so1960255ad.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Sep 2024 07:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725631924; x=1726236724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cB0+7HUocPV6rVpUr8k3hJ2pVw2G7BEadEUj4KIQ8CA=;
        b=Aq02fXj/7b6YEcMBEc5G0BPGCV/OyU8uf2I5p+hiDwkkMESNBOcEmYDoQqBr4jy0rK
         38t9VwkjZSMZgAn962tmicYLI3AA2th8DvJJxyDTaLoSm+aJunjuL7jBYnPnKpMZJhSQ
         AQpYHJFuR0xZjkUg2Z86R4I34/Hv+zjNvH7e0PeMfaH2URskaoj1r8ZPoEf0yUJw4bAN
         oX6d8+FGC6L6fSK6gfAXQGQ6+tggSKDKocfWZsH7m+z4bP96280J4xt1MfHfAmwU95t7
         skJbuDEudtfkc+Ryv5YEc3c9TH3W33mKBrG/46Qy+Ti941Iqzco1EPxAyWz4PTxPPSux
         BcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725631924; x=1726236724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cB0+7HUocPV6rVpUr8k3hJ2pVw2G7BEadEUj4KIQ8CA=;
        b=K2LpHDOZ0Lzbf3a2XMCCGsCNYiJfi1HoVh+k/rV13MBWq4MSwoyibUSmGAgma2iOMH
         c7Qu5KXwf2p/Xuo+jZftaYS1W8+Xw6hKHrnlw9ltBms+J+0rQCG6sTjfi4fKpWt4CeTY
         Ow51s1mTO0NBKceZpD+o6hSUcSFnJQ3ljS6xTIHPFENnuZIVqcd2FGtLjn9iXKTcb7m/
         km/QOT7UvdLxbdKcwY5eZNeZNnr9cqqRonhaB9BGRKaEHGnLGcIjw9lMLpWDuXwkZpWW
         wM9yjjdR2YLSK0y71dFoFAW2RLNwd5QsJ7byEGSQdoZwTZCLv13WcFHkQ15FcmTOpVwo
         QfXA==
X-Forwarded-Encrypted: i=1; AJvYcCXWXi+9lYj+jBzsodADcw3UkDuY56G1ftmgoqJiCfox1zoNjYR7JDS5cTWifk/Gr+Lj4KZWKhXeP9HxJ1D0@lists.linux.dev
X-Gm-Message-State: AOJu0YyOSSFzdlxtN9cDTocOiblpkCkG0YQfKFhfAICmSy1cuSHOXGXW
	Gevv5p0rfvrlqv5RRApdKZRwedlvC1/AjBG3pUchFtxOeEBU/G1M5CBGWyYr
X-Google-Smtp-Source: AGHT+IE3LHZzIOKXhe+IEWE83z84niJa0kAefJucb9M9xlSY0zVtDuSMLl8ZMO/10JXAKJkERlz4Pg==
X-Received: by 2002:a17:902:e550:b0:205:40f5:d1a with SMTP id d9443c01a7336-206f060b887mr14174945ad.6.1725631923989;
        Fri, 06 Sep 2024 07:12:03 -0700 (PDT)
Received: from ubuntukernelserver.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea5554dsm43493095ad.235.2024.09.06.07.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 07:12:03 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: core: Fix spelling mistake in rtw_xmit.c
Date: Fri,  6 Sep 2024 19:56:57 +0545
Message-Id: <20240906141157.10167-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
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
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index b1965ec0181f..755c1bc86a74 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -45,7 +45,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	init_completion(&pxmitpriv->terminate_xmitthread_comp);
 
 	/*
-	 * Please insert all the queue initializaiton using _rtw_init_queue below
+	 * Please insert all the queue initialization using _rtw_init_queue below
 	 */
 
 	pxmitpriv->adapter = padapter;
-- 
2.34.1

