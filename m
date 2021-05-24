Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F05D17F
	for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 14:37:45 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id b15-20020a17090a550fb029015dad75163dso11269861pji.0
        for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 07:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=3Uq4oq7Ompa2kiUFdgBYSmuttV60/M5LDy9XENGK3do=;
        b=k+aKf2H8gnaq7huzoijV1mzwXt70AEwvC8SHlDkj3OH5AOfd6O37hhTd7rMStl5hYQ
         64xuvFd+kWMAQ0IJrGR3vZJENa2udBI3RgQksm2zvfgK7WQlbkVFf8cWihznwslj344h
         CelkfpM6o2UVg35rncrstBiAQjZBFkKQ8zc9nSYNBUREp4jcWVgqeBKLGHW0tNqUeAXP
         wxMe59Lh8ZKPWfmJY1T2M+OvlY7RINp7Dsv19HqEJrbm639Zy6wN7r0DaNMURnD6FQ7n
         KHilOFFcpr92/Cx9fVYJ8t2TPLxgikEpiH0fbg0L0vO6VGcCMomZHoQLmU5DHrTfctZP
         9k4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=3Uq4oq7Ompa2kiUFdgBYSmuttV60/M5LDy9XENGK3do=;
        b=PpeWeJ8KO+tFlr/9tJwC5ofRs5lpJNGGvq8rIjWwvKgTFW5nH2fXZkT41ZPoHkWFm7
         w2hVGDj8dT2MV3dlRaxqAxX3sY2EjJe5d50+i+lvW6tojBSV1eLNtycQRhj2lsyr19ov
         Ro4/hvnkiLiGXq9PMTuXhc6VZ/LkU+yIFsjGFADn4BzQMJ1myRQrFCc0UNUhk+eauqrt
         MEYaoKzuT9tyX0yqpTj0dr0aPCAAaVTmBn+yQ61hms1AkVlGVatfgE57pZZ9Ir/ux8Dj
         BOO31UxSPHFieSxWkTBdUAAUDHMjDcosYsbrKQwD6I/wqdNpK8u9qK6Q6B2icLuxI4us
         gYNg==
X-Gm-Message-State: AOAM531clOiBhgpZ8Q8hkmVADfvGOrMiFr8mWZ5VQsctYvNb2MWLTE12
	N2hXfJowdLh3zG9dbs2SPG0=
X-Google-Smtp-Source: ABdhPJweshDCbXtZRFtCR4Rs+ZXY/9ytLALf4IYhT+aW0M48GTy+GVqY75S8SaAMsTPY934Lnyr4Zw==
X-Received: by 2002:a17:902:c951:b029:ef:9dca:9943 with SMTP id i17-20020a170902c951b02900ef9dca9943mr25960614pla.62.1621867065091;
        Mon, 24 May 2021 07:37:45 -0700 (PDT)
Received: from cryptik ([2405:201:4018:90:22f7:c0a0:5144:ae09])
        by smtp.gmail.com with ESMTPSA id c3sm10996774pfi.213.2021.05.24.07.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 07:37:44 -0700 (PDT)
Date: Mon, 24 May 2021 20:07:41 +0530
From: Swapnil <swocp19@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] Fixed kernel code formatting
Message-ID: <20210524143741.GA529321@cryptik>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed lines ending with '(' by moving an actual function parameter from
the next line to the end of the current line.

Signed-off-by: Swapnil <swocp19@gmail.com>
---
 drivers/staging/emxx_udc/emxx_udc.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
index ecc5c9da9027..b6abd3770e81 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -1073,9 +1073,8 @@ static int _nbu2ss_epn_in_pio(struct nbu2ss_udc *udc, struct nbu2ss_ep *ep,
 		i_word_length = length / sizeof(u32);
 		if (i_word_length > 0) {
 			for (i = 0; i < i_word_length; i++) {
-				_nbu2ss_writel(
-					&preg->EP_REGS[ep->epnum - 1].EP_WRITE,
-					p_buf_32->dw);
+				_nbu2ss_writel(&preg->EP_REGS[ep->epnum - 1].EP_WRITE,
+					       p_buf_32->dw);
 
 				p_buf_32++;
 			}
@@ -1225,8 +1224,7 @@ static void _nbu2ss_restert_transfer(struct nbu2ss_ep *ep)
 		return;
 
 	if (ep->epnum > 0) {
-		length = _nbu2ss_readl(
-			&ep->udc->p_regs->EP_REGS[ep->epnum - 1].EP_LEN_DCNT);
+		length = _nbu2ss_readl(&ep->udc->p_regs->EP_REGS[ep->epnum - 1].EP_LEN_DCNT);
 
 		length &= EPN_LDATA;
 		if (length < ep->ep.maxpacket)
@@ -1462,8 +1460,7 @@ static void _nbu2ss_epn_set_stall(struct nbu2ss_udc *udc,
 		for (limit_cnt = 0
 			; limit_cnt < IN_DATA_EMPTY_COUNT
 			; limit_cnt++) {
-			regdata = _nbu2ss_readl(
-				&preg->EP_REGS[ep->epnum - 1].EP_STATUS);
+			regdata = _nbu2ss_readl(&preg->EP_REGS[ep->epnum - 1].EP_STATUS);
 
 			if ((regdata & EPN_IN_DATA) == 0)
 				break;
-- 
2.25.1

