Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A27215B0E1
	for <linux-staging@lists.linux.dev>; Wed, 25 Sep 2024 09:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727256241; cv=none; b=So8X12PUq1UVZr61+1TPIRKgtJ9gFlSLWelhsPJcFH7nURPCvU3vgjlXTqBQ4oe0/LXHeOfPpBx28313+LytuSV8ntzzMuwc4VatJ3IYajHLtWkF7kUHMm0QU4YWK92YEAh4QXrM6iqLOZMaSfsriXNTt/GpZLJ9/LTVxLRhUDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727256241; c=relaxed/simple;
	bh=kAyo2JpNhI6tY45kDDMshUFlPiOjDfTZ/WxQQAzoks0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5KimUiGt9dfBX/3OBdEI1rfYm/Zky0vgLV3hPx1xjppD8EGP+QD8f2h6xYuI282JRXm1E3pReJ+8dhS+YsKlBhKA68a21TN84FsxA1uMt5jmbdgBiT5kE0wCkFMjxUL3mHULZKL2+/GfIYyrdf0Aos3x504REXpe5VtcuU2e1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tjnou2Qg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tjnou2Qg"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cb1e623d1so62160355e9.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Sep 2024 02:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727256238; x=1727861038; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/5harUdMUkYHv3S3CeApCGPIZ01UQZtvlqOHYBc4mQY=;
        b=tjnou2QgpXqsxyYA9940fmtgUxx6xAXU9mi4zYx13fZem96IpwUiyRCqVcY2X1d5av
         2xAPRD+zlXRDxksZXDqTQvpyeMu7aDY+y10frexzvt5guAfhTZU1BVZaKfcBgtRZnLmS
         4Awh8Vn1G+W1YQxEJFHtXfqyOOQSlRQbrVTZvLXSQnuJt23U3Dyfw2PABKM1Wa8Is3DE
         6IFH3yp9mEBirdOWteiPzsM+ZCpIOtYtJmZhE+Kc4HCsDeWqmlMZfxYyK0asDjTnfEV7
         2DwMXdiJGIuXokQpnWbfadb7qBOhmABbhO0+IYC5ACSL/M9OEF1IHTRG7FPnDOv+DYm9
         xhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727256238; x=1727861038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5harUdMUkYHv3S3CeApCGPIZ01UQZtvlqOHYBc4mQY=;
        b=MrvmTVNzxTx6z29yetIwxDn37UHvuj4x9DUWX0lQQWGAvAZTAcF7J8CR/3lRLif6Jh
         5OMy4R0IQqkwAM5chnYFfQD6ODxQ7VyiLhBD14FKKnFDxMaIbwHLdtOkpXJUQDcL9YWl
         HM76aBLRfG+whVKM1LQoEMG01kPimxqOmLle4g75CeN65vfYURzbNM+lXz/9/CBv95IB
         tbf0CFbKo5JzBoPo410q9uK0lgqSPIRNC2WGIQm2rChCkngrpkWZL1DU8xqpjTfFCsyn
         eGXkrbtjFz2pMfl89B6z+iu7v7pFoC6aAl7yM81GZWjBDbvu7JbMQtHMXG0kFsT9AL/1
         VxwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU53Rb2OXARBwM/qx01uwNyhWob10koIpm5y2jbgISisBcIJz/Uo+NwZgC4hMypY1mrONR2z28CEPK9Ma39@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr9htKLzLLw2NJKqRNBsXmyruuy8De2yejn46bEtZFrovQ/l8D
	LW+MKJqiz4AlH04sCQyiwvexZx7Ev5IVgiir0bl2MpKXvsJiRRaSvs6/yFjhxPs=
X-Google-Smtp-Source: AGHT+IH76Pa8fJCQoDjA+iSkOMmtEE9IAbNSBuTosKzgLhAPo+74/va/yq/CBvMkCkqWCNLwm1hnrg==
X-Received: by 2002:a05:600c:45d0:b0:42c:e0da:f155 with SMTP id 5b1f17b1804b1-42e96109f23mr16269685e9.11.1727256238210;
        Wed, 25 Sep 2024 02:23:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969f90absm12239255e9.12.2024.09.25.02.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 02:23:57 -0700 (PDT)
Date: Wed, 25 Sep 2024 12:23:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH 0/3] staging: vchiq_core: Consolidate bulk xfer helper
Message-ID: <6661b2d5-b439-46e1-b240-9fe436db4e67@stanley.mountain>
References: <20240919142130.1331495-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919142130.1331495-1-umang.jain@ideasonboard.com>

On Thu, Sep 19, 2024 at 07:51:27PM +0530, Umang Jain wrote:
> Few functions were identified were their declaration, definition
> and usage were spread (incorrectly) across vchiq_core and vchiq_arm.
> 
> These are being consolidated into vchiq_core in this series.
> Please look at individual patches for details.
> 
> 2/3 is in particular a big one. The code is just a move, but
> seems big - as it was diffcult to split it into smaller, compilable
> hunks of individual patches.
> 
> Umang Jain (3):
>   staging: vchiq_core: Move remote_event_signal() vchiq_core
>   staging: vchiq_core: Move bulk data functions in vchiq_core
>   staging: vchiq_core: Drop vchiq_pagelist.h
> 

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

But next time, if you're just moving code around, just ignore checkpatch.  Do
the white space changes as a separate patch.

regards,
dan carpenter

+-                      memcpy_to_page(pages[0],
+-                              pagelist->offset,
+-                              fragments,
+-                              head_bytes);
++                      memcpy_to_page(pages[0], pagelist->offset,
++                                     fragments, head_bytes);
 }
+               if ((actual >= 0) && (head_bytes < actual) &&
+                   (tail_bytes != 0))
+                       memcpy_to_page(pages[num_pages - 1],
+-                              (pagelist->offset + actual) &
+-                              (PAGE_SIZE - 1) & ~(drv_mgmt->info->cache_line_size - 1),
+-                              fragments + drv_mgmt->info->cache_line_size,
+-                              tail_bytes);
++                                     (pagelist->offset + actual) &
++                                     (PAGE_SIZE - 1) & ~(drv_mgmt->info->cache_line_size - 1),
++                                     fragments + drv_mgmt->info->cache_line_size,
++                                     tail_bytes);

