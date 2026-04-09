Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C0422D781
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 05:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775711108; cv=none; b=m19StW7pEoGKzsHWSy/3QG5m0+Jk1QW3/ijB0/+932UdfsXbVG+8rrWw3Rv6TgVRVOI+YUcluOE3EuKGO0vhCbK2xrJqpdC8wUUJfVwRrxsE/FeLwVDCMxRqMbZfSD/cCf0VEs4B6gqyv4lzKv90UWIDs2EInRBVPfcvCqYfV1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775711108; c=relaxed/simple;
	bh=XWjPDTurlilNrw2XfAYgXsGsKIto7kFmaDCVrc+qjhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rcqHVHhVpZ6A9E58WR+tZ90kh9syefdcJ6Eli1rBXGhpe4FLQAhqOLwC+SHZY7Xers6LR7zb2ul3Q8ThC+Cvay3KJo16mYj2wyg9kFoGDhWYyz6Xq/UHC6ehiQRzyK1R8q6cd8Pmm8X2gG7Ozdr18ZRFbItDgFJF0V33Eut2dGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBhR8Y6h; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBhR8Y6h"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so561452a91.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 22:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775711106; x=1776315906; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16bGWKMKr2xPT0xophpJ4YNa094trd/4O3HW1FIquVU=;
        b=UBhR8Y6hC7CVbz1PUeoNTlwJb6cFdKoi0Y4EH4v5BOs07eLawVL/wW8YPb+oVXXQRv
         yk7PdpG8OJ4VLy9qyXwUV5NHGiSoQBxmjIXjP2ZTyIIKbiKlNIkwVNnh8pm+J9ZclyLR
         0AuIHnf18105wIsuon21LYJOKndY1gwTajWnZplCaev0ildbZghqF+8Nag0Uce3y4hvb
         zOcRpZDt0mZzBhsL+/cBwQlwFq4+M4A6d88m4c8cJpHxS9F9svlyeuLChlZH5/2mqkzz
         tpjh+1CiWYeUlqlz7eRNivOoveWDN5x0DVxK05fyUdyZlgw96yhRV6gZ3QdvLKAbA3+2
         bppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775711106; x=1776315906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=16bGWKMKr2xPT0xophpJ4YNa094trd/4O3HW1FIquVU=;
        b=WFlqnJQd8I7kRjkJ21xtm8RgbO6i4YZgI1l4QSOri7aiKRZzlKV8fZfVLJeWgvAbZw
         01hbp0tCuyfqaIJOXtjrSXBCS6wBhmumOB+0zNvO1kI7pOwQ3o3lHMO2e4LKA3DMouPN
         lkS0/0YMOJdjLtlBM9mB0Kb074wo1OqQkFwAZoJ/y9j4Fc2H6R8R4OhhKy4mKpoUsEF5
         zs400bMy4QF9u56ghF+051dF8Ql2e1GhW6/VgeNPci9SsWOKpB7ADDMwoXJ6+wQOeMAp
         pYVThJIDM/2/ciNRIeAX4R9e6Rd/1sCJK0mLHUpOgct1F9fOK69F+Eju6e6sgonNRkEz
         cr1g==
X-Gm-Message-State: AOJu0YwrKJPbPYgkMAxm0pmyJBulPURDO0q7Gw1ziLVNbf1/tD3xlSPe
	7SZgUT+hfeZe9LJQIZ26mmPXxytbqOCMQL6ZUMb3MzsrD4v8GEcXgRrm
X-Gm-Gg: AeBDieviLB5rOkg0ksRgR0a/hirHZvl2QlIdoKusKvPD5q848J8+7pg9w1938hrLQ4R
	MzmUcXO/4RYXfmlfBaIcGFi6RNZendtRkSpl37qyBobi6qJKgjo8hJIz6G8JYkpyETjGEcnXri4
	uIXNLpzPFigFriT8uoACoIeLVR6g7YaN2iBQPDkgzD26hXQHNKFskwUBmATm+/V+AjSPqZga64X
	A8Mx2xsdaBPBAtDj7OVgezt4NOWSlXmVfm9gXra4DR9fa52ZneD9DXmk//Ae6PyYcDYhZk0XLDb
	k5leO83Ew2ftXmgizVFLduFBxmbfPK5C+8hL94c5qtZ7+U3VITVgmd4cplc0YppIdK2Y/4NZARL
	+PNUwiq+iZWU6VyDP1/5oJL4SR1dRreA0Xti9bN37eArMd+wT7NpuzYSz1KHjNIc/HbkQ7mi5Z/
	74KTPPPO/mqpo8dhuF4BoMoSJUUbDK7GpcXfSMwzyuWZOJ7Q5S9Lrmbw==
X-Received: by 2002:a17:90b:1c0d:b0:35d:95eb:879a with SMTP id 98e67ed59e1d1-35e35969f38mr2277060a91.13.1775711106339;
        Wed, 08 Apr 2026 22:05:06 -0700 (PDT)
Received: from localhost (as040201.dynamic.ppp.asahi-net.or.jp. [150.9.40.201])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-35e34fd30bbsm1428540a91.5.2026.04.08.22.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 22:05:06 -0700 (PDT)
From: osjin83@gmail.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	osjin83@gmail.com
Subject: [PATCH v2 3/4] staging: rtl8723bs: wrap long lines in rtl8723b_phycfg.c
Date: Thu,  9 Apr 2026 14:04:51 +0900
Message-ID: <20260409050452.97774-4-osjin83@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260409050452.97774-1-osjin83@gmail.com>
References: <20260409050452.97774-1-osjin83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinemon Tama <osjin83@gmail.com>

Wrap lines that exceed the 100-column limit in rtl8723b_phycfg.c to
resolve checkpatch.pl warnings. Arguments are aligned with the open
parenthesis where appropriate to maintain readability.

Signed-off-by: Jinemon Tama <osjin83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 01e1595fb46f..498f7b25a2b5 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -395,7 +395,8 @@ int PHY_BBConfig8723B(struct adapter *Adapter)
 
 	PHY_SetRFReg(Adapter, RF_PATH_A, 0x1, 0xfffff, 0x780);
 
-	rtw_write8(Adapter, REG_SYS_FUNC_EN, FEN_PPLL|FEN_PCIEA|FEN_DIO_PCIE|FEN_BB_GLB_RSTn|FEN_BBRSTB);
+	rtw_write8(Adapter, REG_SYS_FUNC_EN,
+		   FEN_PPLL | FEN_PCIEA | FEN_DIO_PCIE | FEN_BB_GLB_RSTn | FEN_BBRSTB);
 
 	rtw_write8(Adapter, REG_AFE_XTAL_CTRL + 1, 0x80);
 
-- 
2.53.0

