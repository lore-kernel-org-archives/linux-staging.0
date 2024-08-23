Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CF1566A
	for <linux-staging@lists.linux.dev>; Fri, 23 Aug 2024 00:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724371768; cv=none; b=fcyiXDIlU0LojhFnloHtV2iCc/X1ZRvXg0DvTKXG4ckPyVIN07Q/YCL1aP3Qu5np3K/WvccVuBIcfUtOKooYRSLFM+k9ripkzf6G7mySwty9u53o9BWIHVvBW2eXOIs3AUHemEBviaaKyjm7NYDtPjmYBQAIvuaGt8Q0hiYub9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724371768; c=relaxed/simple;
	bh=dN3nffBm/hBLpyVwnZSRJcqVI+KkswlXdU5KaorlImA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sQnkkKOR/8kID1dKT/vOzXiwg1hjcJgl/u/J9pmViYQV7uzCbaduyzFBFUBgmtxm0YW2jJba0ghIGlhU/ucWWDVYKtcb4+X3+uwQp2yolgfnAh9kDxk5VC1HYLIxSEuZ6dTUp+l+7N7uf6Oo0PL5DUwHTF7GBvDkWq3VGeFVSKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkmZZDbj; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkmZZDbj"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-71431524f33so1268362b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 17:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724371765; x=1724976565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mNja2/ozWCmydptxs77W9+XMG2tb/ebDVa2ly4AGNiY=;
        b=WkmZZDbjiiZPmETbGcFHojNNjDZQ1sBvwQvQ/dTTrgwDr+1xp0eWbxh36KSbMKm1OG
         v82D9TAsrSYgeSZiDnr5Hzjn6bQBYkUjqhOpgGSYkk25YImsM9SXkr4gslmDh0b1F3dv
         LzpynLugS88KfQTTRL0WHTB2nsuJKrHGuYldhmwCc+bBCtqWNSakMqGdb7flA4ACAzh9
         sqKeN/ge1Eb9+KzjQ5l2X5uvVh0WauQ1ZCrwaP6DyZ60U6Q6bhshY98Fyd3a/AsMqgS5
         ADcWeLKncXSul+mtRwluTeHsK7SHM/EwqXywRO9CU4P2TWpxUHTa4ajw1xZvLf8q7CjW
         kb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724371765; x=1724976565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNja2/ozWCmydptxs77W9+XMG2tb/ebDVa2ly4AGNiY=;
        b=EpMjRjbYY4q4laDc9hcN3Mn7F6VylVf0JX3Wgzyh6FmmMyGibz+o88DRfvOTpvloWe
         DPoCBNV6TV0y1Z6iylIjV7o6BCrV4sxuI7pRXZ7bkE5ooI56c8U5oETALB7eH7PdhGr0
         PFYdOCR1XFqFRN79z07Z91p9wPH5TExO59AL2n8WfHJMPjbkiuM+R82N9bhk5oY58cn9
         Cqw9VkjVPrdS3QvOSe6OgvI9F6t9h5UVSYKXgFwlDr50Vnn5+NMSLr3xSIo7ZsgoJyII
         d7izqWSnKJmjY5pz2kXohcizwIa0r/zph7yGhGuRfAGgOyu7eLg/PFohpYGQ2XoqNGPn
         U5Gg==
X-Forwarded-Encrypted: i=1; AJvYcCV4iYhF/9/XU1ofXfCkLxQ0wwKvfADIm+6YcMIy3dgnD+Zmj3XgScZd4C/BiCC5eqxyoiOHtsMOCN8nN1ho@lists.linux.dev
X-Gm-Message-State: AOJu0YxgvKZrksOLCmWdFwa3WExsDd8fdwTjx6JYgtnx6HEpX32VFFyE
	8HIoN2pZadleWBmSK/YiJweOyJr4djiFmHBmzdGKVkum+kpzqOhozec0ywBQ
X-Google-Smtp-Source: AGHT+IGKWKjSWYgDm6yIXSf6/K0YSgfrE5p8+Ncc86a1SVKlp2BKaq8MC1YyKcz5qitvJmBQmaVbVw==
X-Received: by 2002:a05:6300:4c:b0:1c4:c160:2859 with SMTP id adf61e73a8af0-1cc89dcf828mr849786637.31.1724371764849;
        Thu, 22 Aug 2024 17:09:24 -0700 (PDT)
Received: from localhost.localdomain (dhcp11819.ime.unicamp.br. [143.106.118.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385608eb5sm17929185ad.188.2024.08.22.17.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 17:09:24 -0700 (PDT)
From: Gabriel Maciel Raad <ffunctor@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v2 2/2] Staging: rtl8192e: Remove unnecessary blank line
Date: Thu, 22 Aug 2024 21:08:38 -0300
Message-ID: <20240823000838.8207-3-ffunctor@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240823000838.8207-1-ffunctor@gmail.com>
References: <20240823000838.8207-1-ffunctor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unneeded blank line in rtl92e_leisure_ps_enter to silence the
folowing checkpatch.pl warning:

CHECK: Blank lines aren't necessary after an open brace '{'

Signed-off-by: Gabriel Maciel Raad <ffunctor@gmail.com>
---
Changes in v2:
- Split the changes in two patches
---
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
index 1f881c27d4b4..7b6247acf6f4 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
@@ -209,7 +209,6 @@ void rtl92e_leisure_ps_enter(struct net_device *dev)
 
 	if (psc->bLeisurePs) {
 		if (psc->lps_idle_count >= RT_CHECK_FOR_HANG_PERIOD) {
-
 			if (priv->rtllib->ps == RTLLIB_PS_DISABLED)
 				_rtl92e_ps_set_mode(dev, RTLLIB_PS_MBCAST | RTLLIB_PS_UNICAST);
 		} else {
-- 
2.46.0

