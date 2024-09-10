Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39D61459EA
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 04:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725941136; cv=none; b=uelaaH0047RWtawFbiTzanUdjYuYq6CDnsOpOwLrqWbLpUMyUXFoyyC9wiyRmtgXJtgZGkLOTks/70VcYngIxOUs16aa/dPVZQsZlxtjmnRo02JqDt/KuDP6d2M/XbM1fKMbgwICLkJeOKTlA2GaUGGNHEbmAH+8aU8c2/OlP9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725941136; c=relaxed/simple;
	bh=1ziOisrsaKx9mcLmEMAB+eShXK3KN3vwItbdAjnlqNA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=levP0VkQVFR8Q46HfOVsPX0ityo+Mf/ntNvsKdX9edH/xYmmzN4b4jFjiOEWEemftCqBAquOczcBfPM3O5o6XuGXONgdgKy1b738uHLhWbf+kBg3TJ/hLTv0UvhT7sCiTPQoPSEIjfuzjdj52KJ3bWiTjH4J7FoR3g2E5fPV+Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2103YDV; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2103YDV"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-718ef6a26dbso369934b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Sep 2024 21:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725941134; x=1726545934; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57j6dC4h677FMz51Re5oWsR6lG/2ScumpzqstrCEmAI=;
        b=X2103YDVGteHWSp6yjtzryKf7nOagd/iGn/6JkXGryo/oohLaYneVu+ZuUSCiC7DWd
         NHS3lWuRENo3pZBHV1dsWyyy+udGzfyOig+4/PeEF6/BvVmU2cU2y8YLxJn5fLi+fP9j
         6OvBS4BD2wAXJK0wBVWY9bybHNyKboeVePhJeMMhCNPBLvzCQ7uKTomaFQJV9S3z0v1s
         yS6VtBE7lbcpGVdfmvRCx7YP3oxutsRVK/01BG6dFgX6tVgFGHeLM1PT8V09eoMthG5C
         s7WMuE/Y0J/n+55AwNE7f+lkVk6CiDce/wO+8WKJTC2cQNO2GFaCrC3upfQ+HFUWG9KB
         308w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725941134; x=1726545934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57j6dC4h677FMz51Re5oWsR6lG/2ScumpzqstrCEmAI=;
        b=L47f/gQj2UAwnMvdBvU1dPZu0Q+OQQ44XiAkaLoKNKYTp/FjDR9Fc6QtZIN1jFW4FZ
         +wRLZxsxS7/rmS/qCtyeaQ7RGcoS002M77lT8SdCp4W39lAMYGVtwmE07itRw9naOoM/
         7mrfNQqf0DcINAORzppG61YGjeXAahRPALhCrS90X1P8TXQWaWHbH9d4FAne4USikz38
         JZJPOzeq/jQYYR48GYXF1r7XWhdzzLYIXXkJpP/mZKCpGtZVqetkKpKLx3+twtGm0Hki
         Xb534bWwy1E/M1kqUku/rCgHqapCO6DOSawP96GAZ5oyoTymzxH3sPXT5r2Tw1yKXLQb
         649g==
X-Forwarded-Encrypted: i=1; AJvYcCU+6v4SkZYqPawV+cuxF9Xz8jaPyA+lGr4m7iyhWVhEpO4eJreXfTSXdpXTn1PirhzwlnRwL+rqFyxc8hPq@lists.linux.dev
X-Gm-Message-State: AOJu0YwpbLhfP7+t5D6TEM1+4E4ouRN32FbVCjqyIlLGuvkKCREXKetr
	XKZTYp7lyoNxmItCFA6nL8u4d0VBTrxm0bAddBdTcy2EP2m6RB5g0S0z3hGm
X-Google-Smtp-Source: AGHT+IFuCKt+97i4M+2mrhF3+ODNKOXG9EUEen87AEDnk1K9pGTHYhWqhp++DOhd92pCS/rNrpFuew==
X-Received: by 2002:a17:903:1d1:b0:202:2af7:b50b with SMTP id d9443c01a7336-206f054055cmr69842275ad.5.1725941134116;
        Mon, 09 Sep 2024 21:05:34 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f5245bsm40610785ad.303.2024.09.09.21.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 21:05:33 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] staging: rtl8723bs: core: Fix spelling mistake in rtw_xmit.c
Date: Tue, 10 Sep 2024 09:50:24 +0545
Message-Id: <90f26f7bce03d80848e3c0fc166c5ab584b83446.1725933169.git.topofeverest8848@gmail.com>
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
v3: Created patch series with cover letter as suggested in the feeback
v2:
 - Created patch series as suggested in the feedback
 - https://lore.kernel.org/all/20240909041549.2449-1-topofeverest8848@gmail.com/
v1: https://lore.kernel.org/all/20240906141157.10167-1-topofeverest8848@gmail.com/

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

