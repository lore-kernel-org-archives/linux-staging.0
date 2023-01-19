Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122D023AE
	for <linux-staging@lists.linux.dev>; Thu, 19 Jan 2023 05:17:18 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id b5so759375wrn.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 21:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dX8+q180dHz7f4/ZBQ1ZuKBQ5gCr8mFRkjscfMvCgHE=;
        b=lv4pg37MEsNSTvonv7rhKIoTAy2ufB6Sgk/K9kMS2nrPIxG+x433eEG6r4cHBiA7F+
         GWnIwNur5ZQjaQndVCZUwAIusReE2G7wnyPk7EZKAaKzsJmWwJqlOkE08xnSiiBOiLP8
         GoziuiYzUBZAtd9WL4l3vbLOGmxtQJLsb0q2azKa6lX5YMqczplTuwk+R7ZjqAYkWlUj
         6YNfkwtlmbYXSbw14WA/xqgof4t/RiLmyk+aqkDvbEhAxRij/mQx3UEDeW4qVs9l/4QH
         v6OKq1nVmThpuwFXUJ8vXs2/tZIPFd17V9D0mFRNGdmauRFzFxeUTCxisHPdVaJ00Pji
         LelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dX8+q180dHz7f4/ZBQ1ZuKBQ5gCr8mFRkjscfMvCgHE=;
        b=hOgwls8h9WkTTmYkE1Ti84dx/hxyW+1OCKiKFZzxoMZrLUqKJF/elFrAwXdcWNKYHF
         srK2iY+XprN0vmiLccdwiOHWw/Y+XuIziFIrxTrTebq4CQ0Y+c92UVlBQVLSAbj4Nweo
         SR90SgrslSjVicBl/pSQF0Ds85Wwgz1E8LWcYpK00T3XCRu2jjm2SPXGTRxlM/g3qX2B
         FhcMnuw16uU0nKE4Sed9+KdSawHrurF2JqIjLRNlb/MMLJsx0v091yW6inEAFVFpfRvx
         pLAZYJ58BDD8ALyYSQ6zm4jkRyDnhJFOWY6FZ70roKvOliHoWWDG1vzusEzty+iv46OD
         O+QA==
X-Gm-Message-State: AFqh2kr6LfJjeGacfwg8IJNUtt+74uPw2Uka+wxcg+SQudX9voHw8Kuy
	QYOGG5Nba2uQkwjIgEaz+l8=
X-Google-Smtp-Source: AMrXdXvceIJRKHSvFhNROyJkTuC/lkr2+aSCUwMeFU13VOMXQt7b0GUcSxfv+Sek1h69SE7IKlr8Jg==
X-Received: by 2002:a5d:5224:0:b0:2bd:bbf7:1f87 with SMTP id i4-20020a5d5224000000b002bdbbf71f87mr9392905wra.60.1674105436204;
        Wed, 18 Jan 2023 21:17:16 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k2-20020a5d5182000000b00236545edc91sm33363447wrv.76.2023.01.18.21.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 21:17:15 -0800 (PST)
Date: Thu, 19 Jan 2023 08:17:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yuan Can <yuancan@huawei.com>
Cc: gregkh@linuxfoundation.org, drv@mailo.com, damm+renesas@opensource.se,
	horms+renesas@verge.net.au, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: emxx_udc: Add checks for dma_alloc_coherent()
Message-ID: <Y8jSWCCZjGR9reA8@kadam>
References: <20230119023430.95919-1-yuancan@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119023430.95919-1-yuancan@huawei.com>

On Thu, Jan 19, 2023 at 02:34:30AM +0000, Yuan Can wrote:
> As the dma_alloc_coherent may return NULL, the return value needs to be
> checked to avoid NULL poineter dereference.
> 
> Fixes: 33aa8d45a4fe ("staging: emxx_udc: Add Emma Mobile USB Gadget driver")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
> changes in v2:
> - do the null pointer check right before the memcpy().
> 

No. No.  This should be:

diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
index b4e19174bef2..f9765841c4aa 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -2587,10 +2587,15 @@ static int nbu2ss_ep_queue(struct usb_ep *_ep,
 		req->unaligned = false;
 
 	if (req->unaligned) {
-		if (!ep->virt_buf)
+		if (!ep->virt_buf) {
 			ep->virt_buf = dma_alloc_coherent(udc->dev, PAGE_SIZE,
 							  &ep->phys_buf,
 							  GFP_ATOMIC | GFP_DMA);
+			if (!ep->virt_buf) {
+				spin_unlock_irqrestore(&udc->lock, flags);
+				return -ENOMEM;
+			}
+		}
 		if (ep->epnum > 0)  {
 			if (ep->direct == USB_DIR_IN)
 				memcpy(ep->virt_buf, req->req.buf,
