Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DBF362
	for <linux-staging@lists.linux.dev>; Mon, 28 Nov 2022 04:40:13 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso12827770pjt.0
        for <linux-staging@lists.linux.dev>; Sun, 27 Nov 2022 20:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oregonstate-edu.20210112.gappssmtp.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G/9AzJYQfnGBFuJKCpS/EOwpF4BmCDb2G2Md0YyKoN8=;
        b=r/+ASjtBdyMIkIrVJYRjrKRI0h/rUHKiSZfn8eEro0QAEKW+TMKjMK+MbR33Mke743
         PHeYk5s1uinHTcHiXqPvC9RqNLF6GksEJa9a/U+mHF03Rln351l33u+smYV/aWa+rg+V
         LPz8yrEH9TC02uVjgVDGitAsLi/eYiHitLHQCBZR4c0+tjh4+Q6z5JTwCdR33bAe7Yj1
         45TXrUYS9IiemxQf2DRqnJvJ3MnpiKlGGHIu0wE+h6TnqpHftgQ+xYtxOYJwNwPqJman
         R/2hTnNh8yw4xlkTbBnsVRHqwvjsEQhW5CnOMlP2YiIzgUGZex/gRk6iJUqNVJFMQIrw
         F5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/9AzJYQfnGBFuJKCpS/EOwpF4BmCDb2G2Md0YyKoN8=;
        b=pNpFirvk3TEGhkZnG4BuXH4uhk8YQRnfVV4tjmo1HODDaEqTpgdJTy1v0GGp5gUtVJ
         vv/7IzmGrn3xRUyA6ohV5I7fecMzDjiGpq+AqRRKEy1Tdfa7PY6Es9XYymBPwEluyOMf
         K9EGy3W05/H6D9K8orPwLw81ekhnBJtz8ke4lfwl6OasY/lUw5oav/e3q5HvS8USrqOD
         lG7ggQJdpIT6/mYADt/c26w/s4uv2StT+jY3Y8gyQ5Bfm6b84wuoIxLJ0a6aznvmuRN1
         VKZxg195uDp/z3PA2ZwIvYMsjrl4ksGYe4z0OtGU9l5qYAfSM/IMdwflS56hDhpuMK4D
         mr4Q==
X-Gm-Message-State: ANoB5plmOJOjMu1R/uUPUcbAspe8GZD/Lrd4BXMkU3oaoIuTc+y1g7aB
	9uOdlqGkhqCc5ExU5SxR8J9azLB2P28r25VAvp0=
X-Google-Smtp-Source: AA0mqf5v10Ko3O6yyi4Ky8KDwcQdwVFHTKXAvTPwcuGagHrSnR96zCSsegjWmvbT2lP3KTRl7w9NqA==
X-Received: by 2002:a17:90a:b018:b0:214:247a:1932 with SMTP id x24-20020a17090ab01800b00214247a1932mr52659887pjq.187.1669610412939;
        Sun, 27 Nov 2022 20:40:12 -0800 (PST)
Received: from virt ([76.27.231.73])
        by smtp.gmail.com with ESMTPSA id j5-20020a170903024500b0017f9db0236asm7755180plh.82.2022.11.27.20.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 20:40:12 -0800 (PST)
Date: Sun, 27 Nov 2022 20:40:12 -0800
From: Jack Schofield <schofija@oregonstate.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: emxx_udc: Remove unneeded parentheses
Message-ID: <20221128044012.GA2028@virt>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Parentheses are not required around condition tests. Remove to follow
Linux Kernel coding style. Issue reported by checkpatch.

Signed-off-by: Jack Schofield <schofija@oregonstate.edu>
---
There are more instances of extra parens to cleanup. If this patch is
welcome I can continue to cleanup this file.

 drivers/staging/emxx_udc/emxx_udc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
index b4e19174bef2..1d4ac8374fe2 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -149,8 +149,8 @@ static void _nbu2ss_ep0_complete(struct usb_ep *_ep, struct usb_request *_req)
 			/* SET_FEATURE */
 			recipient = (u8)(p_ctrl->bRequestType & USB_RECIP_MASK);
 			selector  = le16_to_cpu(p_ctrl->wValue);
-			if ((recipient == USB_RECIP_DEVICE) &&
-			    (selector == USB_DEVICE_TEST_MODE)) {
+			if (recipient == USB_RECIP_DEVICE &&
+			    selector == USB_DEVICE_TEST_MODE) {
 				wIndex = le16_to_cpu(p_ctrl->wIndex);
 				test_mode = (u32)(wIndex >> 8);
 				_nbu2ss_set_test_mode(udc, test_mode);
@@ -287,7 +287,7 @@ static int _nbu2ss_epn_exit(struct nbu2ss_udc *udc, struct nbu2ss_ep *ep)
 	u32		num;
 	u32		data;
 
-	if ((ep->epnum == 0) || (udc->vbus_active == 0))
+	if (ep->epnum == 0 || udc->vbus_active == 0)
 		return	-EINVAL;
 
 	num = ep->epnum - 1;
-- 
2.25.1

