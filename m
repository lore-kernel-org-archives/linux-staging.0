Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E90428472
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 16:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194960; cv=none; b=puQvQCSjRBqLNTGYlT3zAwPmvR83ID0xg7rvhkuiGVyBe6zQB1uqnggDSauor+Q9OQ1Yusou6Yy5I2mPCduUquG8TrWI2Y6U82nH+bKT5XipXIvoxodRXWEqw11UEopZv+JD61BpgAHSI5o8tMr+D5USgAxisoWggOXet0KP1ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194960; c=relaxed/simple;
	bh=KIVXucql+VggYP0mr4CdQY5mWD67kXF1YjFQkoBSXTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXCEqtQgyk+jrmT4nnI2xb52a9qTFZIX6+pVNNjkhJluY5Prt/A6IOCj0efG//MHj7ZRGb2zWSHZ/c7eeD7tcYgKrglyvo9X71WcT8aS1dv3Lwl8dVkJYDBtKs2iIu61q850ittjMQ1+NhBnpbZTNi5xKa2debge4SaL7xmVIko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/J4Fl8a; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/J4Fl8a"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso503275e9.0
        for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 09:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781194957; x=1781799757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueLyexN4XeIGzATe8E71iQUW/9Td6fNmqx3x2PN/sB0=;
        b=R/J4Fl8aXxYUm6i0OnawuvO2N47fPSIF2PmvnGcvX4JBPcu+J4UcyaZYLdFltAytVC
         L/HjwOSfiswc3TlBYiEoPS3qVLOHBSRjntVLwVJry79PwVZjtTevXcLNjVuDSz5Jiv/v
         7OZ2YYYiRMdenEZH521JqnpSiXAwr+xOMU3ATpWQrdavcKDXWQ6ypzo1nC1acXdWWmI7
         +E5wjxFzE6NlTZaeTHOZuapZtsG13P1bwSlb5826loRbplRMblQDI6Iy8bt2uK8iN7Xj
         zgwMI1h3Q1Je4maUJQzlWp0W2ZIYxEkEk6oLyXWl5D8j22keuSPymd4Vw/32kYHadinG
         YC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194957; x=1781799757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ueLyexN4XeIGzATe8E71iQUW/9Td6fNmqx3x2PN/sB0=;
        b=ewNHWntLeKEFNwhIU5LUai9XT/J/mL8A6HF/LlIsI7fMgks5EffBqF9hjxryaRVrjU
         Sdeau+tFzqGMDbeSWGd0HkmgfF47yzogMDHiTEeAbpnv6KHa/G6UJxsTt1ddo3lLiSew
         0G5iHfe2G+IAA9/oKW4bedFeZ9phDXg2hv65yUEAqN4ZT8cKmRoE9CeuEX/zGj6+Ax7q
         RO41h3zHS24MwF2FjfyZikRVnX6ATrCM/XU35tP5buh74Wt7nUJdZdVYNMDuvUjfGdDW
         bq4DwgSH/lllb04FGip3dTPrtcvoUXxyuT9zIlaBfKVL6M0sytZ3OqMl1cN+GMLvWwKR
         4oIA==
X-Gm-Message-State: AOJu0YxSTE70a5CFDDns8mYcvoKON+ehWoJCoexilFnHaaP0Jfnxl+ew
	YwXa0QIyUUBBq3WGsAwOJ8aw36ffYGtG+lI2hqXv16xwF1IJfwdlFsXUfOgIgCpb
X-Gm-Gg: Acq92OH+YYtD3ygOdGFfBARGvD3S0T7X5PzTloUlZG4hQh6m3hJL43dfTetN2cTpoCA
	4SZT3leHoI3Kwh8P+kYI7M+q21Tr5nBVms3jUD8labGlbItTAxB4sKc3ouBILZ2B0TKVIcL8Pcp
	hG0KVLSUVA3htfrS/HFH06fVHn/9PIGmGVodOjA7PRqLMSWvX1GWuiNZrjpUxD1Hsk6TbFNm07l
	98+Zek+k9lKEOC8pDp5LjLqU4aHpWFLfMW6UdQpK88dEojNENjhg8w/8kxub6m4zKVHE67HY74A
	ODoAs6LIXYVdfX8GaVYYOzmKtYRYjLAeWmKs6m0gMuE7m8Wc8D2ZxgxqqNjnVnsmVSvEdkERO6M
	O6sfU9VZq80oQeOPapJp9nguiW0l39t1+1viOy/93rkCqiOJnjU7Dqh8c4j2P6lpzHVj/80cWyI
	d2JnaYi37BgzwT9TC+ZIe6eGJCJg==
X-Received: by 2002:a05:600d:8444:20b0:490:7df7:9190 with SMTP id 5b1f17b1804b1-490e52dfc5emr30808705e9.8.1781194957248;
        Thu, 11 Jun 2026 09:22:37 -0700 (PDT)
Received: from home.powerhub ([2a0a:ef40:30:7801:ac27:e02b:2f26:8695])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e46a75c8sm70344585e9.2.2026.06.11.09.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 09:22:36 -0700 (PDT)
From: Quentin Strydom <qstrydom0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	qstrydom0@gmail.com
Subject: [PATCH 4/9] staging: rtl8723bs: hal: fix whitespace in hal_com.c
Date: Thu, 11 Jun 2026 17:21:23 +0100
Message-ID: <20260611162128.57870-4-qstrydom0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611162128.57870-1-qstrydom0@gmail.com>
References: <20260611162128.57870-1-qstrydom0@gmail.com>
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
 drivers/staging/rtl8723bs/hal/hal_com.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 728a2171fbcb..1997e0489d8d 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -362,7 +362,7 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 
 	if (bWIFICfg) { /* WMM */
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   0,		1,	0,	1,	0,	0,	0,	0,		0	}; */
 		/* 0:ep_0 num, 1:ep_1 num */
 
@@ -403,7 +403,7 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 
 	if (bWIFICfg) { /* for WMM */
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   1,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
 
@@ -420,7 +420,7 @@ static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
 	} else { /* typical setting */
 
 
-		/* 	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
+		/*	BK,	BE,	VI,	VO,	BCN,	CMD, MGT, HIGH, HCCA */
 		/*   2,		2,	1,	0,	0,	0,	0,	0,		0	}; */
 		/* 0:H, 1:N, 2:L */
 
-- 
2.43.0

