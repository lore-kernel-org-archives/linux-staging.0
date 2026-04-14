Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD4D35C19D
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 07:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776150611; cv=none; b=s/M3dpgNnOGxT6R39X066scTM/dnUbOjz4xqToQXLVue+/+UkvdJgap4Z0GOKf3q6cPot+s1EBXXYA5pIZ0ktgt7eHfIriP/X1p/w/QZo1Oibx8jQDmCyVhyNqfpA1DcNPuFvCkMk7lN+oKorUpT5xivBK7/n20mfYmsU8a0+Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776150611; c=relaxed/simple;
	bh=tDXUB/f+iwNnH9JSR+IN7EJ89hYkaXiImA23ASGPSEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEaUf0Iat5voGS0EgIX6nYax7GLzVp4GgAvIFOFjZRWVqVPd9ENKzr4gbgGsrQhLw59RdaXI5cDunKivRPeBvFyzd14X6LdqFIOwf9IKuEmz45ykwauNeRsNuWOJsZ9I9bet2ka6P+8GA1+ls5c5a+IV7vbPpfivn1rSm6EuYJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LY5+xBWx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LY5+xBWx"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so82350635e9.2
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 00:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776150608; x=1776755408; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/+E2/69O2+/fU04U0fzvqnZqh3kwzlnmTa71Xox0U58=;
        b=LY5+xBWxov8c0EuNaS8Ov0EFoIpTBkyZQ61hK6OtHzpMgvfacbPAsobkwaO8w05WHv
         yu/8UQgoRMfn5+HXOZ7AHtNF76p9qqu4TZnApneQpH8V16wfqtLoexi0irk6npotuJRa
         DCqV0bsW4nzLSrfPP7zUzsmdPgeUp0ubYZzS4I2O+kMr4iQpWK7MDbxDZAnI739xtZw+
         0k7H9Sthxa2t+I+yx9ly1paeRlTjmhhps/T8+/P6nhK9Cukk9OfaCQZh7bmEjmMz/N+N
         o0GQmfUMNzTOSvVRjHrLtR1S2rfhglxt78Gp3800bNtczcaQU39ow8WlldVTJAU2i63A
         A3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776150608; x=1776755408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+E2/69O2+/fU04U0fzvqnZqh3kwzlnmTa71Xox0U58=;
        b=ZMCOvlad7X6sy/NkDX22yK7fCzc8rRzmsYSuqZcmpCbjj/05UJSEBw0E+IQXSGhE7n
         C4uNLcvndv2XZ7oxqAHxo+LAk3qmz18bC/LtIzqS3ZsEmvtcNg5lSjEMvSKWaWm2zS2o
         m979ZrIYXVzgrBRdUghjHABYLbf5wqNPAv3GcRgDEj+yH8C+kOmMEGP4j+7Mo7haSlfH
         gK27meu4mhRj96GTYy8Ms8g3qs6oK2kYcgXyIciQhW45M2ZkMrJIPVlbAuc1biFuGcRy
         295+YIX1vmrYD2Z3sLoG/zCKKgtmEMkPf8hs2kIEleoF+hvtd13C/efep273RbY3Irff
         fsww==
X-Forwarded-Encrypted: i=1; AFNElJ91zzobbXvSi99dvJjwrhWv/NiE2FsX60qTxrR7pfBlTTnz+KAE/JgFSYlDW9h12R3CBClxUwkU08lUSE24@lists.linux.dev
X-Gm-Message-State: AOJu0YxMYwZhIdjK0XHnfWeUBCbCR3lf2Z6mS6l1yw0B3VNmCqY3MO/C
	gLwWzungGWM/qZr9YqPivybR92qN4rPr0SwFel9/hJ8DUf8K0hvisliC
X-Gm-Gg: AeBDiesQmBok9gfwfrEf2h3pfpqCs5hedpN97Wbt5zPV7TJrn9Zr8kDfpJBZ6wPyiOH
	PoTuqgjLlrY9tN69bLzm1EtAlSqCVAQaKUJNsZhmiE8VpTRszqbFIGIeiQZGxJ/rJFn153F5P5r
	OimPhox6NsDubT+RJYUXjj3KnV7OVZEewVlOfdJ1r9QQ65OwqqAHkDw92Lc3BuGgCkQYRZ7UXk9
	EBqtu7n1aj2kt/dsOfa6xnDcshJ7NTbAiAlR94974ETBrKxmf4wf0ACX+2sLDR2TWT2kRdyc2DB
	mk0Koojrh5J08brbk/ntrPM4XWIPUlCIjzdeDsh45VfWbuYdJ+YokelokG6MZQy3gc6E3L5Uoon
	P/MpT1bWpPo7X10eqtudTBc0hsCzX3N0t+QSHN0/A/s+gcKhtWVQ0dMDfzdGIV9YwELs/B3a1rN
	TicxMGItidfibiry2423kxodI2eVAdlRvrBMmk
X-Received: by 2002:a05:600c:1987:b0:485:5ba3:37d8 with SMTP id 5b1f17b1804b1-488d67bf736mr217231465e9.5.1776150608395;
        Tue, 14 Apr 2026 00:10:08 -0700 (PDT)
Received: from localhost (hf33.n1.ips.mtn.co.ug. [41.210.143.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d97c65sm115627825e9.6.2026.04.14.00.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 00:10:07 -0700 (PDT)
Date: Tue, 14 Apr 2026 10:10:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: Aadarsh Mandal <aadarshmandal9354@gmail.com>
Cc: gregkh@linuxfoundation.org, dan.carpenter@linaro.org,
	ethantidmore06@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, luka.gejak@linux.dev,
	straube.linux@gmail.com
Subject: Re: [PATCH v10] staging: rtl8723bs: remove commented-out code
Message-ID: <ad3oSfJnRAjSWrjN@stanley.mountain>
References: <20260318021005.6346-1-aadarshmandal9354@gmail.com>
 <20260414063534.16697-1-aadarshmandal9354@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414063534.16697-1-aadarshmandal9354@gmail.com>

On Tue, Apr 14, 2026 at 12:05:34PM +0530, Aadarsh Mandal wrote:
> Remove code that is not used anywhere in driver.
> 
> Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail.com>
> ---
> v10:
>  - Change in commit style.

Heh.

We really do want to know what changed between versions but this is
too vague to be useful.  The problem is that we are very lazy and
forgetful and we can't remember or be bothered to look it up.  If
we have a note, we easily check if you added a Signed-off-by line
we asked for or whatever.

So this should have been "The notes under the --- cut off line were
misnumbered.  Fix that."  It's not really fixed.  :P  But whatever
at this point I'm ready to just merge this.

Reviewed-by: Dan Carpenter <error27@gmail.com>

> v9:
>  - Change in commit style.

This should have been "Don't do unrelated white space changes".

> v8:
>  - Restore the formatting of non-commented code.

This one was probably intended to be the note for v9.  In v7 what
we complained about was that you said "no change" and we wondered
why you were resending patches with no change.  This message should
have been "Add better notes under the --- cut off line".

> v7:
>  - Change in commit style.

This one was "Add a Signed-off-by line."

regards,
dan carpenter

