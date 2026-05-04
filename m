Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9593DFC74
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 14:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777904910; cv=none; b=RXYo6jWGEJPUqicQCNlr0Nbb7+Ma6JZj65xshn9dgQrotkc4BMwsr5TyUOGNUXR3XmxPqIkRLr/d/J1C0sXFbfTngyv66OWgpCZIUPTLwWaq/IHmj5+kogfWm1YUzJBuQ4A2XXkWCudFRFqPWDAUn5tmskauOLvJZrbK5lupf6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777904910; c=relaxed/simple;
	bh=4tp08kfDVQ+3K+wSu1yjL3wSMxoDHkO1aBCfpWfttho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R8iAb+ZmfVU5Wef+UyWxFUGzg0OEUQ6VzGMKleZQ5NHGI0sTsluuLUR05G21aP/EQTN/63gWiHuQ5KmfVLI/F4xZeH86wGcXnlYnS99ljlUqMoIwZjsfSvp2+N1JMRukuT5r+CZSxi7+bx1uOgKLQNpUC/uwJ1EzYCiclHObvuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/hco24h; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/hco24h"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c8021c8c42fso385097a12.3
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 07:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777904909; x=1778509709; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gj5cL4GOP7X0w5zchDmkvEzapil652QWg+KEvJeeG64=;
        b=G/hco24hYl6jSilJdjtBuCl+8Pvfd7/MFt9jUyKjHQPJN3qlaj2vTIRBzm0uKv28IX
         0u/NGcL3jCn2iI4O9sr3EJbzKrpDZ1SVqqTOhL6Oihdb3LYi+ruzAQT+dzupCiNLSQJw
         ztZohH/7KKNT84zHf76Vuis5haDhDgX5iEcGRPhJGBd41YpDE74HDqBNX+eNEdrN1fih
         ReV1xZeYEBWQe+UveJ058DVQCaetoB1gJTlIYLaHxeiuY/Z1fwpzAGTkB1lKRQsEI1Qj
         TRFHbTNl9Iv8xdrj9Gu/BwRPJTykb072xpvgpEWEzCCQ9lxXTj9RlZqn3k/MPABEvBfH
         UmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777904909; x=1778509709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gj5cL4GOP7X0w5zchDmkvEzapil652QWg+KEvJeeG64=;
        b=d19yg1J95hPf7kZbpEuZBzSIYxeGlGtCdtUhclBULw8/gCnEHT6IXOin3pF3FwaKHO
         r93/POfWrBCwM6fWa8CJCNY+0tzUjGZqh4m1OJXWPCMggeFtqSqlrdIp0d72jCUL3iDZ
         aMW/AyOcAnRRYjWFT9GekQuyp9fuoMOj3xTI7ThelihDFAk4sDyoa6a+v4PRwxa1z8OW
         ZMPKSxGS92Q4W4+qub+tSoG1ayWhUaKZrAgtvMhP7oC7zwi5KIpDGGlv2RgwOaQwkRcA
         73aMwbkErlBJW85q9Ny+YZ4ERBCtFMZBvaDRHlQvY+/AIFPcBrLN8ZDpW0MdC2K6lgfN
         Ygmg==
X-Gm-Message-State: AOJu0YyNL6RGwCtZ7WMts3ZSRPb6b0IA4fRxPoGJu7YB5LxMv1jEYJsg
	tc7Y5fcpfGEXFp/8jm2e273Ua29FLO6q1doud7ZQ9WoC/Bujoq2PQCU6
X-Gm-Gg: AeBDievCEY/eM9n5y4sKPY4fLeIcWVvl7Z4M7vGpVCo20NEsCCOayLO+ihbPBVQGDXW
	Ct6DqP/fSHsBEyNRfrz1UVH/0RInWmUEes6jtNQPxzM5p3sUjUbi/yD2U0zIEjlgFHRBG2o4ecK
	u+yzb8rDxhPo7LHtQhAW1fxR1oOHnfX4GJbRQw1RrTEsoe0irPk2nsFMwurZZvHTK+j5ZoFV8T+
	AKjwnnYDoHiYOoA9qiOHm24ClYN9eovog5hbaueqXy8r5kdSXr6tXfGdcsWcw8vTIWtVky88+om
	7U0zcboshOM7ymbGs2fKoXWe7b5aad9Q7Y0gH4n05Zrb4e0V6QX2wz6uhh2SOI93xIMeytdSIJH
	2Ff28iPTCn61nFjpjdu5l/ToJ68JHRNZLe8YZZkbmFfYpESlX50My9zOTYj7DPoYfgfKOm0Z89o
	iG/0MuACspvNHQXNYshfbsfv5FGd6dmVjnDsIYTyeSo7MEb7SzskkfNrqI1O0PhnZp
X-Received: by 2002:a17:902:ca0f:b0:2b4:5e0f:c239 with SMTP id d9443c01a7336-2b9f2591f7fmr67676585ad.10.1777904908485;
        Mon, 04 May 2026 07:28:28 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([202.148.63.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae59f57sm105468605ad.77.2026.05.04.07.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:28:28 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH v1 1/3] staging: rtl8723bs: Remove unnecessary braces in rtl8723bs_xmit.c
Date: Mon,  4 May 2026 14:28:10 +0000
Message-Id: <20260504142812.21964-2-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504142812.21964-1-mokshpanicker.7@gmail.com>
References: <20260504142812.21964-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Braces are not necessary for single statement blocks.
This fixes the following checkpatch.pl warning:

WARNING: braces {} are not necessary for single statement blocks

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index ff39077deb69..d30c5e70625a 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -395,9 +395,9 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 	spin_lock_bh(&pxmitpriv->lock);
 	ret = rtw_txframes_pending(padapter);
 	spin_unlock_bh(&pxmitpriv->lock);
-	if (ret == 1) {
+	if (ret == 1)
 		goto next;
-	}
+
 
 	return _SUCCESS;
 }
-- 
2.34.1

