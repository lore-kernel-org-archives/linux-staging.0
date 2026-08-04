Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A86D30566A
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 07:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785829731; cv=none; b=ElYXtWNsqqiSv96P0956vPIN4TZTL6Je+5RQHdUzAAXf3BK991C9yO5C92Lrzg647Te8CrDPFEX/2Xmvb1qEP+3FCPi1xKVe5pSDnNNoak/l7J0uFlxft55+mONQriK7nPnAxmSIp6B7wEgyuVZCgXiRH80FWwZhKJY01TT98ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785829731; c=relaxed/simple;
	bh=OaCp2FIV1VLbVSPD4BNzRsQgg9NSTVxguWdHrrwFals=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xt2SfN9yueP3ZS6Zc2Jp1WX6lvfjwIcpIK1u+wN62MCyRwMUlNwSz9HSRAkPRk1GoQLWkTd6WjABLQ4FzCEPJSKC6p8f68LFHb40NLwhl2KPd2KSxX04DRPSooGVlhtIvTKz9eVlyWKNeVyj67KTX8OwdUrVeS16ERpifG5zecE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXT3GN6T; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXT3GN6T"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c999f162c9aso2814435a12.3
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 00:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785829729; x=1786434529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KRXmalQ8P97kX0ml5AFZ7oaKGWJiCG8li/37ijvQib4=;
        b=CXT3GN6TyjshBwlF71O34nHNVcUGfU1rJkuQti3i9BBcxEIYsGxeMWzezrscKH+S4e
         +FShyv5LLPjH9B6xeDiOtu/ZShddi7Yu+xs9yIpjlPlGY4KRE27rHIIwmWBoLCBSF9eJ
         Ok3db3AVuoawyuUw6ak36H2XSwKwJJxROcO+OR2ir56pwLFPd+nfL24xb3g3NqmYmgbv
         rG2Qvf5cYpXucyPZuMTYuXc3QMrdO9WWMm4ZeTAKuOryCyJqjMw+wQ3nMxHT38dZkMoQ
         gsh+fVdF9t5lwJTEAKDcc5KxLQ7rOP2BOZQ3ajNe49UAXGZmE5HwKxcRlECqIVvGnSgs
         eV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785829729; x=1786434529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KRXmalQ8P97kX0ml5AFZ7oaKGWJiCG8li/37ijvQib4=;
        b=GuDsDo0FAk3kYIZcOwwCzEmnpFcGdN8ZfpsPjWHbR9LpFiqPPENEXWoOriwdoukdjq
         KqkdYHXKNzh7xf7KIga/qLLhis6c6m1q4aOTfYsDCWtqP3wR625G39NBhOSxGLkf8+//
         CjCP0LpuQPRG/z8KomAH4nN4z+rD8YHBVxJHiI9D1HORvXC/6EyLtZjRcb1quUs8lEUF
         2oTSeju8gA/3leTDLiCkTrZlvaitkcWcG9Jzl1RHINUSuY3npmTaC5MOm6b3WoK1HudX
         8MH38dHhPeH0hkkdLxRamXlKo5Cf25pgLwOgHafb4vCO5ChreamWgqlPxDGWde30gwuV
         sMkA==
X-Gm-Message-State: AOJu0YwokKpufzWJ6SxJr//DktBdRcZZD/ceg+IDe+5dP8uzFEp9l6PI
	8jL4vvkqVkVVV4MNacr9ONvzYX6CqMtZsH4LN/p/Ebwr7wXsuT/+FrEG
X-Gm-Gg: AR+sD12qQAZySY4/gLbw8QRrAt5tqRMOvVfH/vPAWo+VBhZ/URU6Fm0gWuJP/anFOw5
	oTL6D2QRqveNbm9Hjd0AJ0enGvC5iCOz/9I9LIdLErxTA0MVsugSSYqqQaGeUIvMIS2XHSAwiTY
	62anr7vczGpXyRmUSi4bZgzFeWGGfSvLdBM7p+R/SACLv/NmkUzmLZRkfITmaB0Zff7MISJDx1m
	Pc3n7Dw2hN59AGJQlWVuIetwwBJrRUCK0oIKrhrlUS/w+lKeIIUohjOQbUTFRSCCyq1KnKJGCVg
	JPU1cRXXaI0F2lQvdAba2t3uScM2FHd6nG8QcZd8AXkHBT2B/h66VGN7dMD07kqABF3PWVfPRyy
	3Crz+QyB3YIzKjKT6EmC/pP6o7mELphbYkQm6SrX69cIsfJ0rtz/8AtdFUs+TJjaenaLrnuoa6R
	Ie2eHsoNff769qMLmKQDk01SRl9iuomVVdpZ7bsYgqC+mD9RotvmoqSPGQRDzStUtKNAc6MFRrC
	AgeKEo=
X-Received: by 2002:a05:6a20:9f46:b0:3b4:5c70:ca3e with SMTP id adf61e73a8af0-3c92a74cfa9mr13881610637.25.1785829729452;
        Tue, 04 Aug 2026 00:48:49 -0700 (PDT)
Received: from Vicious.localdomain ([103.37.82.147])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca8df89asm1181576c88.9.2026.08.04.00.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:48:49 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: remove unnecessary parentheses from return
Date: Tue,  4 Aug 2026 07:48:31 +0000
Message-ID: <20260804074831.14143-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style specifies that return is not a function
and therefore parentheses are not required.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54b3..40793aa58d6 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -843,7 +843,7 @@ static int _netdev_open(struct net_device *pnetdev)
 	netif_carrier_off(pnetdev);
 	rtw_netif_stop_queue(pnetdev);
 
-	return (-1);
+	return -1;
 }
 
 int netdev_open(struct net_device *pnetdev)
-- 
2.51.0.windows.1

