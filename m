Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4D63806AB
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 08:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649993; cv=none; b=lMni0pN3RGcE6wpjHj+SzZS8FWHsaZOjqtt7uQho9wS8GCeYqnCSJTaw0Y/kVER6GsKA0t1gORBejIyVG8jAtiCLEfwREMl1IDGNGeCZDDBaTg4ivcyhFGGt9QL9lJnC+9+UJ1f/ZNPdcbBEfLSbicba+GS7efhwS0r17NgOkUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649993; c=relaxed/simple;
	bh=ZVQQwcjim/5RyqsBqMX5qZb6ORpdMy1y4jO6E1KFIoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grzDFaeWXgOoQDOCwexo4Fyj0G0wGbWxxFFiGhuFdJLOz5qWXOVBPoWKKXJcIziIFi5fb8Me+v+90xwR9j+d9TTc6CXR8RDLXlB3hhiMdq747aOpUWzhNjB/d7McieRldWe8d7qmgMzs+3Zpr2sTkypd1+3OeI3HOH2u8hJ3Tus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=My+3EBD1; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="My+3EBD1"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso37696505e9.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 01:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773649990; x=1774254790; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MF8f4OpVOReg0WLpPAXIIDwAgflpzunWoXZkRVOIycA=;
        b=My+3EBD1KYZvh0Ia3t+TFXFmdeyC0Q3gghGyaQPTqtUw8cEemS7FwrbCSSoiRWYtgz
         up2yhVbPyAXZWtRA+XlCr9Mwdv17cHH+AJWkFek7FiKQx/oOpCKaBUorFLakewnxXkwu
         eKE9tYXJL4E6/3HMLuxIwW5DTXwSzg/qqd3BT6kvxeFTb0BqgFid1mcrjHUIQ3lc6O7X
         TPSHythmAd019y3sgqtwhldIz6CzhHN+1fAaWhjTQTffaVqYzrZ1G34rZZ6sbVNZNglX
         ShYYvY/HpACfSLL1gepq6uB8rS/5/mhYBhZahdZ/8OJTaCKY35YV6nx/x9RN9RNJ0S+2
         1/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649990; x=1774254790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MF8f4OpVOReg0WLpPAXIIDwAgflpzunWoXZkRVOIycA=;
        b=HM9lTaSHcNyGF9Hwf2+yF+yLSBHhWamrTpWyrcYYyFVPfUOrR9CnCtgvmc7iAwI8d7
         a6XCSo+Xx862PLALm1Wy1WcVX8deiT76pYnVcmu8RKJzYOj1sj+CJ9+kxzwxO8TSalam
         JrOZTK12yMIH8TY6oRkO61upKB63F+whTcCZ35ApmPOIStG9Sw37eUiqBM7XJ/rLN4RA
         chtfN0zD+VsOBhfIWmF25mldFr2E0itWnd3TCh1PyjTPv0IxoyjEXUTp9PK36LqaI+4X
         zScZXRyL5Z4X8q8jji1fi+OMTxKHMdGXEl8ZwV4sM2km/3faOvDTVEb+KcgLhtm9pr+S
         K3MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEc7HqiueURi1lFPKvLttwLn4mMjdBqby3BlHTHmWulAFE3BpxVjv7h6oPTMc35bsMJYGGKPc9/SW/r0X5@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0CSdJ2Tj7U3hlAmPJNZ+ZDRbwSxZov5s/Ds+6sRAzmxXViQtN
	Xd1LryGcvY2crBNfNeFzjawUO1N5EsLUW58LyGEChBHLqBf6iKNhrw4bbSEP9fOJPwE=
X-Gm-Gg: ATEYQzzURppNQv8TBdQfNntcO7X6tBcCCOB+znF11/FAhKiMuGcORCd/BURr8RImom0
	HtDFSmTSPHAawkgg1310yDuOJSDgWQTfKCR1El+OSShm0qRmExCeuP0EyihsrNQbe0o+NntGuRA
	wVI9kUEh9FSq5NFqNaJSAzc8xFbvmmBgWYgH0JpifBMlf6EQ6qWEj0fF79vpcl1tAv9jFT7tqq+
	9NcewUDVqfm9DtkrAXRuuzvm8tnVxWeh9CsifxsYtf2vZg/ub/ySlqZwD6Laf4CQeUbCmOAL5Qq
	yWmfDPiXOyqc1XN6G8r1hvlO4UnWpvQGv0vhx8e3ay5Y3fHRoZZ+yRLAeg9rz9el3xUN90MhH24
	2F2yh8fNJVlCVDwJxjMv8dgTxA1/DJrSBEkYNkzWQZ0sybDp+7Jeg0WkvZ+iSismrmslmeHGn8b
	0oNDjksSJSFXtwkrgfX0oGfIM57Z5w
X-Received: by 2002:a05:600c:1e8c:b0:485:41c4:e2e5 with SMTP id 5b1f17b1804b1-485567090cdmr186773105e9.27.1773649990047;
        Mon, 16 Mar 2026 01:33:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e92d5sm403411795e9.1.2026.03.16.01.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:33:09 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:33:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: av7110: fix error code in frontend_init()
Message-ID: <abfAQrNdn58M8Dzq@stanley.mountain>
References: <20260313-av7110-fix-enodev-v1-1-1788db19a58a.ref@yahoo.pl>
 <20260313-av7110-fix-enodev-v1-1-1788db19a58a@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-av7110-fix-enodev-v1-1-1788db19a58a@yahoo.pl>

On Fri, Mar 13, 2026 at 06:36:52PM +0100, Tomasz Unger wrote:
> Return -ENODEV instead of -ENOMEM when no frontend driver is found
> for the device. -ENODEV is semantically correct here as the failure
> is due to no matching frontend driver being found, not a memory
> allocation failure.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

Returning -ENOMEM is just as reasonable as -ENODEV.  We're looking at
if ves1820_attach(), ves1x93_attach() or stv0299_attach() etc fail.
Memory allocation failures seem like the most common cause to me.

The FIXME also seems reasonable...  Just leave it as-is until someone
can address it properly.

regards,
dan carpenter
