Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33115214A95;
	Mon, 31 Mar 2025 15:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435526; cv=none; b=imqv+9tjMnhruSXvmPaovB7PAIDAGCzS8hWJ77JCvDvcJ0TWIrNIV0kRCHiXBrm6ClUVf3pkJbe2wAE4qQjeNQdBU/ehjXTcr7hYrvD5Y/G/TfY61BlOQrVNYKg6iE3xCjDSPd445X0rlYdeFUnld4E/gEbsjiCWl7DwUSR27NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435526; c=relaxed/simple;
	bh=Guph8mmJMFaOo8pXCV+W6NFtzTx7511oxA6uyLVHGwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NW+wp0ZJGfAXx41qW1lYQPiwgKKX4Q8DAoA0L+6abX3hctH8aHKMs7uWBw/GkgWFGSUMVaxBfAqVhSo/2ySgQSENkAuNGjMHcJFME4GPxhm4QmQHnzZ8YnhiSviwvmhfSaSsK+er/2z5OZ0uKQXEsFHiGt4N2cw5dXd7pmOTlYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KipaQ87P; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KipaQ87P"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso31561275e9.0;
        Mon, 31 Mar 2025 08:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743435523; x=1744040323; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiknAnsvqiFiA162ylc28HTvEwOzNiA9v+qetgqgE9g=;
        b=KipaQ87PjT8iEtRqcWlcl0i0lf8TpHtIbbkcX/Yi+06PfVeYuy4VMvGbLDcl3h1JGL
         2KNAz1+MILEkZKniI63jZQOoFwV7YNh9beWfVFJ33FaQvhZsLa3rE25mH01QLH83xxVg
         hIX2U6Y1r0NnZx/OmJAbOnaJrl/m4bFdAoUGwJmH7KxU0Hq5Efcg3AFqWD6BSp3w5DvS
         kf0kzadg9O1RfH4jGPuCYM8T2FFCNgRvWokKAlDymgIb8J0oXHZ5sLTGr2TCtvY1dAxY
         g1lOOZyomOhCJLsutWIZq0oJXZw3/EimZfsltRugZcpz1HG9fcM/vzrRKf4OPdplp9F8
         Jo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743435523; x=1744040323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DiknAnsvqiFiA162ylc28HTvEwOzNiA9v+qetgqgE9g=;
        b=AIvYUUDBdoPLmEBiDpCgWE3BTSgdubXUsAOzXdvEkCa8DrvEBC6LbSoVJzxTe1RHbT
         AOgoHKtPzp8gtHXf57mIx85V667Wc398cRs2xYwpzxgrR9UBNrV9yqgoeJ2DBE/FqWBF
         50U7h/+1JBW29Me60S+6Hi0Njaxn/t0MXPI5qcIR7ztxIy8hPVw+VDZY6UXgQjQyPPws
         66OAgvTJTpqrKWOoaVOsRv179O3CKsc8L6z0Vvqf32jxeAszUqjn5YZiPH82Un/Ym4tO
         rRhrgJjAmdqr+Mn/JNUbQJUbokphQaN1Y3YxHre7y2ySWJQGxm1gBRULpxM5s8JPXBWC
         RNmA==
X-Forwarded-Encrypted: i=1; AJvYcCUPb/2DTUR3xYG2S7IeN/T/MEWWox2tggpZHwgAyQf1Fjgugh/6R/emZ24i/q3myidgKLtn+MhH2fgu@lists.linux.dev, AJvYcCVRXUGCseZybDPrpyieHfds7mHpOxPEgL2L6E8bPo6lyQGIWciJlDZIBMxiSARbjKhnBTqqxsEIOd0dCbQS@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+1Kh4tRqii+9d9M5Ds7HXS6us9aFi4AZVZ+PmfV/Iq6b7E2KN
	9V/s8V98jGa0vBDAGGLjoeFHDavk1KKy2fEXmSDm7+e4pAPAgRqe
X-Gm-Gg: ASbGncsnmIX6rGoW0Pm/ipPH6rxRPFT5VQ0d6o1HNlnoMbtj6nLw087S3J1PSHv9Lg3
	MPgC2tb5uR2oOLBWIC1I0h6IdbdgoWh5NvLz5c+s/6VDRS5PrIJE9FoSIh5Nj7hpRWKooW6cugW
	7niGcNHgFphCbvHvi1eIlUK6ZRiJCOzNhPEpAvMPqs/+1KGzkNYrrLgY4kUcH30tHm4L4p7Nk1P
	/XadP6ENjeS10HG6TWpPXzHatVZ6gYq49EVofq31OlBbj1CPrs3EGqenR5CA39MG7rMbJJkdIQp
	yELYDsYB1rFoqcKK2GeGHrvMjWX7k1M4qMIw/DM=
X-Google-Smtp-Source: AGHT+IFDBbS4zcIHxRzCALn8qONtDseBPQoMluJoXsrEbjFpJCnuyrjeuSwnf4sM7gw+nFvV1KXLXQ==
X-Received: by 2002:a05:600c:4eca:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-43db6249689mr92193435e9.18.1743435523485;
        Mon, 31 Mar 2025 08:38:43 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6588d0sm11419167f8f.7.2025.03.31.08.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:38:43 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH 2/5] staging: rtl8723bs: replace kmalloc + memset with kzalloc
Date: Mon, 31 Mar 2025 18:37:55 +0300
Message-ID: <d68a05a05966167f8e54f2fc779af2f1cfe32e07.1743434232.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743434232.git.karanja99erick@gmail.com>
References: <cover.1743434232.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace a call to kmalloc followed by memset with a single call to
kzalloc, which both allocates memory and zeroes it in one step.

This change improves readability and reduces redundant code.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index a00f9f0c85c5..be46132a533a 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -24,12 +24,7 @@ void *_rtw_malloc(u32 sz)
 
 void *_rtw_zmalloc(u32 sz)
 {
-	void *pbuf = _rtw_malloc(sz);
-
-	if (pbuf)
-		memset(pbuf, 0, sz);
-
-	return pbuf;
+	return kzalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
 }
 
 inline struct sk_buff *_rtw_skb_alloc(u32 sz)
-- 
2.43.0

