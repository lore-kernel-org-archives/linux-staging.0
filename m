Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808B13B531B
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776158985; cv=none; b=BP8Oo4z8iKQIO9AoIWTX8txvNk053ZrerSxoMLSA68aLo9TxICjiv7l7b/wfwqXZudx3l5dUM3InBsmtJa2/G6XHwE2p//WD9vvBPWi/svWHoTKZrOZvNzylXch9iDDfs1kO1F6DxkZC7GmRkgpqW6KIiyS5rkzXACmCZdmUzBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776158985; c=relaxed/simple;
	bh=6WrYkMkWX7cyrbQo3P9Jza58hYr53iV1mLC4z09wV2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5PW95SNr8WY53A0DdRznT/X4T5joFa/sDS8SMwBu5Da9DMHYv60zP+8h8ouONzFasHRnQ88WQGP/Liz3mF/2wDOM0OksK7EQPu6ZvZfqaIXhKeip0irjipNfLNq0gSIUOl33If4LC0wB+cYB8SvhhQf62wy5aeu916bjl1dToU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASmM2Qk9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASmM2Qk9"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b8efed61so52166325e9.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776158983; x=1776763783; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gl3Qvsd1K65hGxW/TqznDU9B0KdcLly7K4NHEh+ehGI=;
        b=ASmM2Qk9D02oHWACA0m40ugeAIy+7g6PZOoW6Bu0f583WN3XfpCJRrN9BFUmKaekP3
         HpmUrnvFIeDpnDE83BUiDeCGAIZ6tgSxTRMN4xu5GKyOemjKECxoLpq+AkevG0C7Kmim
         VBcTyNaleyJnELwwTterZX8L76c8XDFpQqffBrr3My9p/s4yAot+7NvkR8KVxgmoz4/S
         d3oPRM0Bj8f8YRNfmJTnnhSOeNG6lCn/s/u8jcIZQWP7j0UBq13dHD5lxvJwY9M/JLB9
         zJYIlC2eufqiNMY3I9nR+dLlfiDeKZJPU0NIxA3BFqOS6tM6sLMRuTJt3SHMLfXQYB0U
         +7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776158983; x=1776763783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gl3Qvsd1K65hGxW/TqznDU9B0KdcLly7K4NHEh+ehGI=;
        b=GZbCGpnpXCW8EmhElOut6dJmjdfCLrOPt9v36kyGCR6j1DmHuh8/s4MDs8uqo/SF1E
         OX7B8aAXJLueEZVugiadIX+F1Wu+ixZfUl0OjJTWK+7Rquq5/hbScmkkdwL6AMi9UGRX
         DUXO3pXzT0IK/7rZ1Btn6ZsI04toLUAgDbngt/YIZkgcKDZ1sWaUnkd8LFx+u4kpsBjP
         ENsKB/V3RDCyHVwlEaArOuiEWLIrAIzd8AzEIfQCqtbgLB3R9ZsajwEXkSRPD7pPVH2s
         khvR62qFRzWA+xYqsZVaG/XXxE4OzFVj7L5RMkrKMVM7Prle9o5ChlPdLZzsv2WKtpN3
         JBJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fZA4mHB0Adz9IkItBtoWKnupuXIJb24Y4+haVk4VV2VBCWwvz7yPTNs1ZfU6oOPjkvYQrWI+XXBTtN7kM@lists.linux.dev
X-Gm-Message-State: AOJu0YyegaqV9UwFz4l3dGp6taMms0dhmtc7tY0H6fyh3h2zhAd9voJQ
	WAZepIeMoUkfqrBtJLRUCi59O1XD446ilKM83aVMO1V2ypnxG94qngMs
X-Gm-Gg: AeBDievm3U1pMhGuw56lKA2dim8GIv6ZBmGEwpxKNY417f0XReTI8yA1stJ+D076pRu
	nSXrX9JUfWm0OVvBC88lDYjf/FEVoJsULPzYcpUqEeUE3Cy0BY2PvjCYdkcesn1Urb41Inpv+Wj
	PTU9+cfSZVhy6XkPQg0+nhHsL2LI2VdLMqdnsqWst8leISRuN/LDW36ymZQAVYE1gKzQe8hZ9mD
	PilkXMbu6sl+F9+WYuCQSFYQUP/tzwC2Xt7yXxNXejBbXVfgdWk3Nx33vtY7u+PWuiit1jrXLmz
	jF8BVY2JlZQo8AHBDjNiSFunYiuCIjcQkRQzACulfrGZlHyjaX3ZJqx5wNrT5XvvvqfeykEGU8h
	yYkCCtfMTQxApgvNIxc07pZhDQ0YT1ZYfr6GvWyzzzV9KRCjtQFDmYJBjn3MNH5vUtFo/HwIg8b
	5NwyrpdgMdacJFCcRtoYNDOldRSVU=
X-Received: by 2002:a05:600c:4847:b0:487:1ed:6bf4 with SMTP id 5b1f17b1804b1-488cd4f08a1mr186437495e9.3.1776158982838;
        Tue, 14 Apr 2026 02:29:42 -0700 (PDT)
Received: from localhost ([41.210.143.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d762decf6sm27762073f8f.8.2026.04.14.02.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:29:42 -0700 (PDT)
Date: Tue, 14 Apr 2026 12:09:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>,
	gregkh@linuxfoundation.org, ethantidmore06@gmail.com,
	nayana.mariyappa@gmail.com, s9430939@naver.com, kees@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: os_dep: avoid NULL pointer
 dereference in rtw_cbuf_alloc
Message-ID: <ad4EUpIInGHin71O@stanley.mountain>
References: <20260413224417.5674-2-shyamsunderreddypadira@gmail.com>
 <20260414071308.4781-2-shyamsunderreddypadira@gmail.com>
 <ad3wxbGGPxxm72_6@ashevche-desk.local>
 <ad3zDOhTjfwy_vj9@stanley.mountain>
 <ad30An8Oi_D-UTB2@stanley.mountain>
 <ad34vKH8FhDIWijv@ashevche-desk.local>
 <ad370g5G9eUWSX_E@stanley.mountain>
 <ad3-Yhh2kPsbYILC@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad3-Yhh2kPsbYILC@ashevche-desk.local>

On Tue, Apr 14, 2026 at 11:44:18AM +0300, Andy Shevchenko wrote:
> On Tue, Apr 14, 2026 at 11:33:22AM +0300, Dan Carpenter wrote:
> > Really _obj() can't be ZERO_SIZE_PTR either, or if they are then it's
> > very difficult to dereference them since they don't have any struct
> > members.
> > 
> > The main way that ZERO_SIZE_PTR bugs show up is with strings and NUL
> > terminators.
> 
> Wouldn't it be the problem for
> 
> struct foo {
> 	u32 baz[];
> };

There isn't really any difference between doing an out of bounds access
on an array with zero elements vs 10 elements.  That's the beauty of
the ZERO_SIZE_PTR is that it lets you treat zero as just another number
of elements.  But zero sizes can cause problems for code which does
things like "size - 1" but because of signedness that's ULONG_MAX.

regards,
dan carpenter
