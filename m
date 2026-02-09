Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFF52DEA89
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 03:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770607378; cv=none; b=XzwyQQuX8NgMcSuLK4s8IehGvwt8DgsfgB8wzwOGVfldPkhexc/zkvp2qzKtEDn0WJWDsVF2dweTI876kfd+XvyWVwXUgnFVHrJaUlcnV9hfmx8pQu7ncimiGPCX3R+H7isLOQrxPJr6CkeIgqRNlHwTVq/Ppevf6jNE8FyNx8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770607378; c=relaxed/simple;
	bh=knwkHILLdiDF+oSxkyVzhTGJDp8/kKNG3HRU3uq+dEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ncGI7Lo3ATldrxW8m8sbj3JxYMmGpjd9kq/Egz3+qNwyRrEVTgbptTeSn2KdK2fr4W9lbw8/I20a0ebP67blBP1odUoVus63VUzelyyCpIEdVDEf2iWpW4VJoaIwqDII1DC5lo71p1paeh6RvWztM7HwVZzHKF7/YnIxP2Cn8mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jjxaY3JP; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jjxaY3JP"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-81f4e36512aso2370004b3a.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Feb 2026 19:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770607377; x=1771212177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OG+rDtTYoQhu7SIaP8Q2PAn6Be8zbLT4pMlyVE/KJjc=;
        b=jjxaY3JPSgocn/W5S06BZwVQB9fom5K7Z4mG7xhl4j68rQ3nHPsVhWS8Gt68Bda0OH
         buKrNu3QWV+iNE3G7XcQzZpH/FmidmaL6310Xvit88ANGdvthurirFAlwSCievCU9Ta6
         DrOgA8xGqHvZLSYdj1zM1t2dfXWONcLbpzZt3nCUnFdYOc4kr8uo2ynYPQ8DgG1Y/QIS
         xB3P4e+Qt1buTEyGT0TAPnpZVp60gNBZR1DcWsvYOm5ApeFzEikTN0uzF3y4eLcXoNru
         saF6Hk7p5fU/HJcqhMnhhD5aARmH2R4R8UJOCua2z82CKZnh2vm5LaQCLfaa2nCzrL+W
         AL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770607377; x=1771212177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OG+rDtTYoQhu7SIaP8Q2PAn6Be8zbLT4pMlyVE/KJjc=;
        b=Tv1EXq+9bJn/IqW0nfFDPlK7tWuSrQ6sWMOPrDIq4xneUTpQo8gm2P5TTjltwKNxR9
         gZRoPavOVRgmN2a4jB+kBegDHt/9sdMIxtVLwbcGWiGhY9KX+ZNz66fH+Dg6HXQZhFji
         7ouyoWBsmc6ghhswoZjzLB2BdE2q8lVNiNcnDfEIWNOtDXHCQm9dT9FYtnWHawcWkJqF
         ondahChktRhV1vJPQiorBT9nRsvCkf21mLOlJvAkdZiK9WK2bVjkyDPjlpWCTmu2Zq2u
         yyTZpQoOdwLrxTmq661t0+cFtdivoIiLHbZ+wBwbt882XTOosH1IKxbuQ51kR3kIQSkz
         Z/8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHcowtEiU4AA3eDmxq3AfMmT913/kZa75Kcw8YosuGQIa1RDlN76eNjTSLhkGSXqkr6PDgqC1EIOfJXRE1@lists.linux.dev
X-Gm-Message-State: AOJu0YwWz40l/9jwXh1dCoMWufp2Tte9E+TgK59bdQBrqbkULzjAVxMm
	vcj7VZQlQreNqQfIHM789mNfY0P2EmB0w5RtO+tWsxkzr7XdrTAHgmCg
X-Gm-Gg: AZuq6aKZgbdOqUpAg4oC//qj7+JX00GYTkqk5R2HhtPlKicD2iRx8bx1/3xXkxaTQoq
	l6McW149b1LFStmg3Noyiz7mWN/qvzWk/tVRRbIkmWvEbALnFyAxvsc5wXk9ozCFLSrOcqdtruV
	yNMjhCvYXidjsyaxNLjPkJ87MuMU/vHgAU2EhiZ9xezWee41+hftKL4QlagUPZULZG/VI7p0POk
	JIyfBQG96kgVhd556C6XbWKwwJj2iU21VoN8Sxv7q9S6IBKWroZdcWdQ5EiA/N9YZjuQ3Erpeo6
	Iu6wcxV6QU6rmISrMtWFOVG4DCbXpBFM0paQ6V5hxkhZE731hBPHxWbb3iEX3sEgCgFSuVSS0OL
	GQURpjVjwqSRJupvJVKOKPD79CvOSGwHXB3kY4Wc7gWkkZvT+hKGrRDbMZmf/+6EFt1fKrXgO7p
	Z9hGPh7v3ufiKciAU8ZQ==
X-Received: by 2002:a05:6a00:3312:b0:81f:38f4:d774 with SMTP id d2e1a72fcca58-82441635020mr8807910b3a.27.1770607377492;
        Sun, 08 Feb 2026 19:22:57 -0800 (PST)
Received: from Horstaufmental ([1.47.25.105])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82441677169sm9283077b3a.6.2026.02.08.19.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 19:22:57 -0800 (PST)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arthur.stupa@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH] staging: rtl8723bs: wrap long comments to 100 columns
Date: Mon,  9 Feb 2026 10:22:30 +0700
Message-ID: <20260209032230.190259-1-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap long comments to comply with kernel coding
style and avoid checkpatch warnings.

Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 27e1a5565227..5dc0a63799f3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -135,7 +135,8 @@ int rtw_init_io_priv(struct adapter *padapter,
 }
 
 /*
- * Increase and check if the continual_io_error of this @param dvobjprive is larger than MAX_CONTINUAL_IO_ERR
+ * Increase and check if the continual_io_error of this @param dvobjprive
+ * is larger than MAX_CONTINUAL_IO_ERR
  * @return true:
  * @return false:
  */
-- 
2.52.0

