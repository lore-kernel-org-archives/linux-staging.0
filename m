Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07912F12AE
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 07:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781509413; cv=none; b=fOxCJkSS/DAIiZvdmyrWZyc/xHNWHgabuW/KbkK5R3h0VJgsfbeW3STeEpdpOcw9R8/0VdCZMpxmwIf3Q7B9+v6osR7xmwhlTdYpCqxCp0PV79+lJCjsgarM07a/MPQXIO7Ix7/ZWtx8TyHtKfpkQqrafGYB2ALA3p43VBgUDYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781509413; c=relaxed/simple;
	bh=9m4ZYYBF0HAaVco7yIQJUeZ2zkdgdUYJFxX9i9XutvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEBreu+7ehbHFpfiRpoxWQ7klHGI9P5JhuEQMRZ37KSSLic1tCAoL6rjCwwuTmrtoZLlZ1SqMI7c8upQGt5RFA8OcEhY7fftDl6zsaIHgoEOXZJEBMpWpWKPsIBu0Yq5Q0Gn7mTKDuVH7WfEO9pFRJvo/0aqZIlnFKoB33mx4RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7mZ63XU; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7mZ63XU"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8cce22e029cso47149116d6.0
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 00:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781509411; x=1782114211; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oaRgS/uFb77TxuMeOW1cQwkMhqfMxgU2v3XEuTWv4wI=;
        b=B7mZ63XU8xS5LcoL+FRIGv4NxQscvsDbELjYiq4dTKKIm+UC88NxCUKiR8M0Epw32K
         t6hGS+SxuDHMn0x+JBjDIJCvh/UX2pvyntAOTrDvILsD5N8h8eSCv1K63tEYrWwVg+2d
         V16lG5geYmwpciJVShWcqoKJ1qtvWxaE+Uru8qVvU2VgNgRa1QaIqRogfhfgaVLVGxJq
         PYq2yOYnQM8IGxB62QSho3E5cO1udtTp36mLJhlGnh4QsR4mbILQ42o1bseYE60Igm4Y
         9yVYKsq+Pd8YhkAMfP2pb24byvIrKFeo75QTv2G5ILQtd1dBFULy6LZxDMJ+OaMYfr3e
         L/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781509411; x=1782114211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaRgS/uFb77TxuMeOW1cQwkMhqfMxgU2v3XEuTWv4wI=;
        b=T5TsJhF3ZjWk58TbLh2kVoJqg18aKFkp4LFYIu+2gmxuHUnHgxwsWBqImxK5UNIiim
         mzozS/XyqQWCbkNzDBOs3Ce06/j0U+oBk8CZp0k6cy08IZ4G2Frl87gKY/HQW68WuFwS
         oMlDeQyY7R4BWmRp52exJ/oRv7CTYXrpdI6/DeJPFq2qwbmVF5kDHni/sA6CAMNMrzyn
         WNydjsqDO51lVLlxUfDFmZCzhbkQty6T5JtsZHguBOBH/bPlK+9ujIeZWrBYoBDtZu2V
         4hkKET/HuxzG6KF21G3tT+DcvXbmOmZQyurMaHZ7T6ATJpEogSmGqDMgadQQGDjj302t
         njLg==
X-Forwarded-Encrypted: i=1; AFNElJ9gv1qF3IMrcZY5wWQ3biEMd/TF0KdDU5OLwrVGi+KczOTiGY0L/DeAxE6uyHZDvRrTnLjDoX/oob87yXSg@lists.linux.dev
X-Gm-Message-State: AOJu0Ywpt+f64oZ9BExDLixh9EiQdneUk9xYO+wRXYQP83JZadBLah6R
	r07wkpKHh+RLrYeTsSFLOx+GodAxDtSnY8dAv21nk1r/18hKcb08xOA2
X-Gm-Gg: Acq92OF5bzLRCoqFKoS2ff4XHbCIkUD4qpVl+ouPqM7d4Bfglc6PTjPYN4w4loLH0/R
	gG22ewCK9LeFJV2r3sr1BdF0EXGkFO11zAJO9j98897JifvkRxirEJVcVNCc//82eIXrn94OOh/
	qIR7BIoqaWyl2VeUA76HSwOrVC8mhZf5IpkhKzt5gX+Bh1hdFE8rUzoHvYZvujHvNx7RTA5qFu0
	utNOTjV6mm/vOhGfMotcN+jb5be2vL/RXHEYHju9KfqOykaZAkoYAngcumKSZ1PKLXAxvIpJY3F
	q3gj2KctaM+QE2zqpjgko9pRcPZEfrMeEzvdBoFhATedUMi7THmKQWa7yAQH/UaBU0uaWXGJcn6
	tbyZqYnzml1gNSyO9/BZ8AqgYS6/TZknMZvtcOR8g7QjuZTEsmXwK85DY4zCIZ+/9F5it+pWLNB
	ILu0RxchNlCVoQahSQ
X-Received: by 2002:a05:620a:f10:b0:915:6ac6:c0a8 with SMTP id af79cd13be357-91619f012bbmr1797683285a.28.1781509410914;
        Mon, 15 Jun 2026 00:43:30 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a0541d3sm1035385785a.39.2026.06.15.00.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:43:30 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:43:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] staging: rtl8723bs: convert update_attrib to return
 errno
Message-ID: <ai-tHKXGlArkHiAd@stanley.mountain>
References: <20260614182309.96110-1-dennylin0707@gmail.com>
 <20260614182309.96110-5-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614182309.96110-5-dennylin0707@gmail.com>

On Sun, Jun 14, 2026 at 06:23:09PM +0000, Hungyu Lin wrote:
> Convert update_attrib() to return 0 on success and a
> negative errno on failure. Update rtw_xmit() to handle
> the returned error code.
> 
> No functional change intended.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index b6d9332958f5..fb2fd3f5de77 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -741,17 +741,17 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p

Change this to int as well.

regards,
dan carpenter

