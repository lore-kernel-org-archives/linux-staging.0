Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEB3802
	for <linux-staging@lists.linux.dev>; Wed,  2 Apr 2025 03:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743563424; cv=none; b=OASot2dgNd+SnxRJieloGatVyS2xyvV+VnQUtTbRiYp3mO7muGi4/lqCu4as0z1lxNDYX35uxviD4oY6e0I0DPhWy2NXnsY/tjxKl8lUEF1MWRvD3tpkBztJumkopCMHXNuK7ubpWpEbvFMJGWcl9iN/kUKVDNLwn0Bop/lPZaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743563424; c=relaxed/simple;
	bh=75JSVBxHpSQVDa/XROC96mZNfDQP9/YKybNn743+vOE=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject; b=ixvB/UCKPeUJMuB3fEb4dnGH2zeMM2i73OSqgw43MZYdyyYWx8cy7tqm7nbsgjgZN0eBB/5qCX9CZvYeQcYuZvm7u8zWaqY/JoFUEoP9EbO2CyoqgPygLjTI0sB39rSA8pWsJJ7N6Z1vIcVg6rRj1iTrP/p8z9tdH7oj2NB+hgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=adsUzMSW; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adsUzMSW"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476b89782c3so68661111cf.1
        for <linux-staging@lists.linux.dev>; Tue, 01 Apr 2025 20:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743563422; x=1744168222; darn=lists.linux.dev;
        h=subject:cc:to:from:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xSzTQ/0TpLC3197jpm26Y3dFldQ/EqZ/RckXCir2ipg=;
        b=adsUzMSWHibkhSGh+EBNLyngERTSDcOOcGV63rw9pkzfXMOMgVmkF8E5uZ7z7ClmCP
         NCvm9MhwKD+cMqAWWC6vbrRUNFpMo6WHnGCQCCKL4mY103sEPXaf6EE210gcnEmYzMMX
         M61/dcFb/vSh/shY/muGn5ckQZ85tF7saMQYJsFpzP11t/HD8xIRGTLEGeBx5FtW5L3U
         v2s4GwsjEgpDFeY9Km2NbcjBB1Rg8Hfkf714/mSKDZuwfTnCxeBNnE8Yqv+8XyD8Nb9P
         FGUe1rJE4RHG3SWBjn9J3qO/xVLKM5zZRXLawag8mlePDzdOMsWHJZIk1Z6qwEcvsjqg
         zAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743563422; x=1744168222;
        h=subject:cc:to:from:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xSzTQ/0TpLC3197jpm26Y3dFldQ/EqZ/RckXCir2ipg=;
        b=CrV3o5AMVq6XCPnJ0HvTe7YK/f3k483wvKebYP/H1gQaUQ8lg69xm845JEaF15ppdi
         80qS+dVDnm61qs28GrJf63jejjaNPLKExxpA9w9nR2d7JgLwkqSHs87Z/0xOM82CnIZ+
         jGRDaQT9HCYpiAej24+zp46OM+mwv6tN6P1vZhrglSgth8/K6Yiwul02pXPLtOTan+1q
         luC6DlEh/Pw29FRoRiJ92i62Nu//gM1drqpUV+rApE/Qjq8ar5T+gf/pMVc9dGf7Jq1W
         I2gqLoEjdOYRdJobgeJfVwlr7A62cbzxtQ9E8u4vkf4eCtgzSFr8JhYCSJB9sIzEDW9E
         QF6w==
X-Gm-Message-State: AOJu0YwxRJ5YyWX4qP+J3BQew9MsR9YzBD0ul+A8NEBlhJUcDUsnlkiF
	8XVnlvHSLXCvhoe39K7SbDxqzS1pnK8t2pRF9hlXpuw4TvXDHh9H
X-Gm-Gg: ASbGncsyuT77cKCtG8a98gqDr4OsDUfYfXsV+UWaWQArvFCY5IWWf3gcb9fxAcSTwVt
	fayr+udTtIRSzRFUxCApBjGVv3qU5ln9alaBkfsjR/59w2F9L97l6IyQQy30l6T7XLe733ifeHn
	m+Pne1ZfGSegiGNkP3HCSw9PxyjzrmW3BPZTD1JA53Qw2iVKI4tIRbUDB6lXMcVk4djWp+OK7G5
	kjnrrYKxX6TCCWGZGLwY8jxLLm8pEK5FQZqXU9oJYDz8xA+haxRcGFu93qyQG2Z+WNCdbenw7GN
	KscoMtyXcMbxDTRUJIbcx/Bfa92++kiHz+KSDzecHpC2SQ==
X-Google-Smtp-Source: AGHT+IHplFjrxjDMYagBcdC5wahRlljQSFTPb8RSmU6UlmQoJYFzdjRZxJfovtpXEnEuRvDLsVw4Pg==
X-Received: by 2002:a05:622a:148e:b0:477:1e66:7442 with SMTP id d75a77b69052e-478f6c421f5mr94200061cf.5.1743563421784;
        Tue, 01 Apr 2025 20:10:21 -0700 (PDT)
Received: from [127.0.1.1] ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a7faa9sm73951971cf.33.2025.04.01.20.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 20:10:21 -0700 (PDT)
Message-ID: <67ecaa9d.c80a0220.978d0.8852@mx.google.com>
Date: Tue, 01 Apr 2025 20:10:21 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============9012084329957985044=="
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: gshahrouzi@gmail.com
To: linux-media@vger.kernel.org
Cc: 
 linux-staging@lists.linux.dev,slongerbeam@gmail.com,p.zabel@pengutronix.de,mchehab@kernel.org,gregkh@linuxfoundation.org,skhan@linuxfoundation.org,kernelmentees@lists.linuxfoundation.org
Subject: [PATCH v2] staging: media: Remove unnecessary braces for single
 statement block

--===============9012084329957985044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

>From b1b00ec8defda73d871d02dd606286404e42ac00 Mon Sep 17 00:00:00 2001
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Tue, 1 Apr 2025 20:22:22 -0400
Subject: [PATCH v2] staging: media: Remove unnecessary braces for single
 statement block

Remove unnecessary braces in single statement block to comply with kernel
coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---

Changes since v2:
	* Add missing author
	* Fix title of email
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0


--===============9012084329957985044==--
