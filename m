Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6946257836
	for <linux-staging@lists.linux.dev>; Sun, 26 Oct 2025 10:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761472950; cv=none; b=ha52cfnVs9D+19VEwBP9m0grJBKSJd4zWkEJqMQzByyLoNOK3tfvqiROIJYEKE//0pz1RtPDqftwZTLXOJytlrgyYUaJJubUCUNd7Vv9+XK3PJTdI2VvILbFXmzK5euFsELTaYdnDxoixNTbvEh4xMV9w9JK+kCc+yK0fbdDgfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761472950; c=relaxed/simple;
	bh=MftONmJNq2Qm0gj0lw1SgdDG124m5AvTI5HqfnYth/o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M+lDUcze4yK6WCxlAJFe9Fn//M+uQjGL/fbJMdOb8SvdnJMF/3JZNHOVfsOyBj4G6p3A6TsbGcdodx7xEPJ64PfiIhFVUQffdilJSzc5io9N3gptAhU6ftLQJ5IEyItbxZSAk8u1uzjzFi3I96KIk2nE453lm4B9RoVfjF+1xSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHA7kB7s; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHA7kB7s"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b6d83bf1077so296409666b.3
        for <linux-staging@lists.linux.dev>; Sun, 26 Oct 2025 03:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761472946; x=1762077746; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yNWwOioQJ4HfROqT2DGTLxNFFHA6/jQTDSOXEt4fiQA=;
        b=IHA7kB7sAAS6ADmhtERON7RgnEA6DQWwLEmmn9vzCBqZrgnchruXn/DglChB1K39h2
         Krd9nLaNmXRurywhyaOYtzaPDM/tiq4lE7RiJ9PvUHcokspbuUwXEO9nqeDuH7m4Let2
         /ya60feZO3lxyM9tCnPaPy4WzNzQ1I7z5yNRv5eOsWpa+kxJagWJUuKeoObN70GlWVy8
         ybeiA1UFIMKR+cFPwXrkQXKXZw32Y1h+as2mvlk3FlWJcfdFSaTWPZZ8Isg3bZzkza/h
         I1RJnrslVqcrAF8+QUwKjfQaCQnz42qhZaOK4wEZNtuAHMuNlP7xdswzdWYuZjyiORXN
         orMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761472946; x=1762077746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNWwOioQJ4HfROqT2DGTLxNFFHA6/jQTDSOXEt4fiQA=;
        b=vYkAAxsLYiuzFvjdK2td89x69qlvIcxM0MvE6WwQT2R4/aEWrvcgaq+R9O/xR1vabb
         icV+V+jGD+CWeUWoSJ93p28tLTrWML8IE0ctJxnyGueTc0yatULkmNEJ/IugNAD7PjCY
         bvLMOwhReydF/mR6i49WFruya8bQyAGm8sWug2IbxYbbvQjyYdMGGdjr1IUWW/pmWEj9
         9MHxERSxl6KH8wgtDyslbv2KNWAAdeoHBkk1nV8F7r6gr/hMiv/szRKoytVZOZKKFvN1
         ag8c1gZgf0PxtmMrI/5ZaLdtdv9LjjmcWjaadfIKpfklRUru6AKsYEzJQo9keSo7Q3DQ
         QoIg==
X-Gm-Message-State: AOJu0YyD+0wG/Yqdg/+FP9OHf2iLi3139XomK9oxGPo4q2IW1Q3f2CB+
	S1NXziKvGNPUdobOmcgTQU4v3/ZCalAANbM02w3NsUWe1/y9niMZlPu8GNNYqw==
X-Gm-Gg: ASbGncudA0W1jvHoIgQNOLsfnDTtVlhM/vJG2aJU/QLrf7zwqe37VpbXPB+QuaGUCcI
	CNRS9y3xJ0ebNrx7xfVBcElZyOLm6q0+3D/aj9bLdUrL03nDg5jEKJtjqTAQ1fn+aXGnMf5Bzad
	lM5OeP7pirtojQ7RKXX0N0r1An3zxbd6wFrtOrz5pWU5gkxUGS3CXf1Yt+y9WgQbMuw39G0wspn
	ALOCWalibx6F/psQjY0M3g1pVQ7Mn78+qdGFMRK4cDzeXzcw4e9XHGA+ge943X8uUHIRoSj/ud9
	ZeTtVdwrkwPPsjB9xKQ6koNv+dtzur63gldConCuRjGFO27swg5ebflGIu3Ibil1kCasvagb2xb
	LXmEy2m1mqKKTZkoX/ltz7TFP69rE+p73frEvOFyyTNW9BM2gPAdY0StGVhIqeeRGeNtdrwM9UL
	zU16E9Tt4BY2xLeSO/UztOqdpvJi6MIRx3kiTRVxz3wMf1cU5Bs2nzO88=
X-Google-Smtp-Source: AGHT+IFg0wWtlX6kYVri+i5FXRUs4H5zxKkpcdMGvg8xrZqlnPJlCLVyZ42Ijkpq7fSFtvQppYmxfw==
X-Received: by 2002:a17:907:7f0e:b0:b24:7806:b59 with SMTP id a640c23a62f3a-b6473f43c96mr4362295566b.55.1761472946505;
        Sun, 26 Oct 2025 03:02:26 -0700 (PDT)
Received: from localhost ([2a02:810d:bb0b:f200:7726:b432:b66f:d982])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85359687sm428351766b.23.2025.10.26.03.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 03:02:26 -0700 (PDT)
From: rafiqul713 <rafiqul713@gmail.com>
To: linux-staging@lists.linux.dev
Cc: rafiqul713@gmail.com
Subject: [PATCH] [PATCH v2] staging: rtl8723bs: remove unused rtw_sprintf macro
Date: Sun, 26 Oct 2025 11:02:22 +0100
Message-Id: <20251026100222.188072-1-rafiqul713@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rafiqul Islam <rafiqul713@gmail.com>

This patch removes the rtw_sprintf macro from drivers/staging/rtl8723bs/include/osdep_service.h.
It was defined but never used anywhere in the driver.

Changes since v1:
- Instead of replacing rtw_sprintf with scnprintf, we realized the macro is unused.
- Removed it entirely to clean up the code.

Signed-off-by: Rafiqul Islam <rafiqul713@gmail.com>
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 8b1634f4091e..12369ee2ce1d 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -115,10 +115,4 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf);
 void *rtw_cbuf_pop(struct rtw_cbuf *cbuf);
 struct rtw_cbuf *rtw_cbuf_alloc(u32 size);
 
-/*  String handler */
-/*
- * Write formatted output to sized buffer
- */
-#define rtw_sprintf(buf, size, format, arg...)	snprintf(buf, size, format, ##arg)
-
 #endif
-- 
2.34.1

