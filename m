Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943D93290A1
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 21:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774906974; cv=none; b=J+DugeWXugeEpMRpJoT9h854jdPwaQAWr4RLxBwrU7ALfVOru3M6h5DXTz2pDXjpnN+bvOu0eKXJ+RcdM6S7HQdt5Y+MFpn3FC9Zx+rvOTa2SPcNv1HbjuyxrOicCyzBJqiuSXbCeIinrWTw4Q84WF8xjKc83uOCpdgfvnCN8tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774906974; c=relaxed/simple;
	bh=GtwyJ/XXvQ3HSX2qcyXzYmLFJo56tzDpcID5UnZYk9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bcfbNceXMdKjGT8kluAzheRe+/2QAvizrV8Qm9gYhE1gNO/yJgDiXEBuq045sPSBcw20+JrirQrI+7zAJ7n8zesdhv4tkZqw4SiLKjyR5GTwM6BbP1Rl+Nzcxa3Fgrc8og9ySdZCZS1x7/UDjgiDNv00Qh/k0mmgjySYZZ6GOLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caKuhOd5; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caKuhOd5"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d55b97f358so3090356a34.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 14:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774906972; x=1775511772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G+FRF1EzWtLl8K2hjsx4c0WE53WbVfOyE/cTgQHdfUg=;
        b=caKuhOd5Wsfoth1zF1K/w3U6ZZxP7bxIb6gT46T+NMfbDcTd5W9Qw0Je01gviQvvj1
         hZGXFoWIrK2+lV7sakkGO5z3O7vbbyZclG4uE4VgZDiF8IsaI3Hm9yEq/QUhSJrvSTi0
         dCoI25/VdYYJWhJ0NSQURAVv+nnE0pHzC46oFJwDfVKSJjDfHx9i0cK2eTyD3H48Qugk
         LDCUkLNvpWBRBJMLzcBXRumLn9ndsxav/Ln347Je516v3xO6C+5N/mzlYrp9eHBSPReF
         6Q5somvYx75dN1t9vug2eE6O/86nQriLte/fA4eXewtQlajoK7zMTyXyAXs1MmYOr8BM
         XsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774906972; x=1775511772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+FRF1EzWtLl8K2hjsx4c0WE53WbVfOyE/cTgQHdfUg=;
        b=QgV/ne3/GFa66OvkcC19Fz4e4uKm+KchPJeFrrwNfVp02kihbzX81tpOAvT8JB4Z0K
         P+eZ0CrDhxiA+zYFaIKvVS1Q514KJ97N+0fsKkjP80P88g4KQaWK+sh9nuJWKg1hAPGG
         i9vtfkD/aCPNKYsbTwShWu/gIJfPAX7qdYThZc5Gq8JNDODHEhu7Kc8t9H/gMB23aWLI
         gIzS80siF27Qb/jiVdVLam/B4zu1eIG+ZM4vAAJzPpd0nhuSmWROT3hCduLHIALLuiKe
         iwMXDeBl/EdedaFt/lfHndj/XLOierqnOn2JxsDTEBOUUnEiZgDbaz0FKb6xwHCmVfa5
         qEzg==
X-Forwarded-Encrypted: i=1; AJvYcCVs+AjvT4CCXQLaFrk3v1t1cl4NXKkQPNXktwr5UovxxVP2sGP3RtyabpimZKKYAzLWF3pJEjClc27Sc4Zf@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu8jWRMB/LJVZcdsgkYCczvou+QWCDqbLOUfQYhxmbD9RS+HTF
	1JAqoi+qJ21V2lUetgE126d5ggAulfQrrUF0to7f1vUfh8nfW1/EKPuK
X-Gm-Gg: ATEYQzzHrthKvW24vt9XrfdCP88TTgzFd69zedBYmD+tm5vauYGdWxdTWP+roauD9li
	V3VJVI5Ot1BeLjnoR2ryIYdYBUutT9FIXutcAUi9DZ87T4/MKFQ8DmkJixeaUgiN9NHinXZcsRm
	xYsZbmJUTyMMPFKMrOr+RWwprZEyrb3ckAwOU591c41mOJ7FxrH0l3S35anay4dQLtP9eJvsLbs
	lIlcAU0J48El/0N29/fa7ubhQI7gtxCSYT2eD+FdmI2c8+yWEAseQJvPP3bczniLtxYs+IuVl2N
	SPD0zKQxdwwDJEqyzf68wd/R/gDJsfop5SkHoRTLhg3YeF8l6nemxd97gLC3RXKENLrEOE49Hct
	jOD6kYj8LZnenqbw/S7yxu8gYoYEksSqBfQLSXSp2vvkPSju6DldTZJpRAuK0c/dd3x6RItPpUT
	1UN8f9NywzeLKrTWI9qlBd19VR93XZLxCp4W8oC9AlUeSNprVaT9+JLfWp
X-Received: by 2002:a05:6830:67cc:b0:7d7:ddb9:5061 with SMTP id 46e09a7af769-7d9fadff840mr8478554a34.13.1774906972511;
        Mon, 30 Mar 2026 14:42:52 -0700 (PDT)
Received: from angel-Standard-PC-Q35-ICH9-2009.. ([189.128.244.14])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7da0a819880sm6712202a34.22.2026.03.30.14.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:42:52 -0700 (PDT)
From: Juan Angel Hernandez <hernandez0101@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Juan Angel Hernandez <hernandez0101@gmail.com>
Subject: [PATCH] staging: media: ipu3: remove blank line before closing brace
Date: Mon, 30 Mar 2026 15:42:41 -0600
Message-ID: <20260330214241.33514-1-hernandez0101@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank line before closing brace of for loop,
as reported by checkpatch.pl.

No functional change.

Signed-off-by: Juan Angel Hernandez <hernandez0101@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 2f6041d342f4..1f642e643967 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -750,7 +750,6 @@ static int imgu_fmt(struct imgu_device *imgu, unsigned int pipe, int node,
 		} else {
 			fmts[i] = &imgu_pipe->nodes[inode].vdev_fmt.fmt.pix_mp;
 		}
-
 	}
 
 	if (!try) {
-- 
2.43.0

