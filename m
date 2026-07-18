Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63EA3769E5
	for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 11:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784375864; cv=none; b=UtMA1dMgS/U+a6Cpyq1CrFU37Y5/C2qZkbfBUbRssR1KkJbn5jWAqLj2UdP4oW3EXdHlwVVFA8T0PjhTZOtm3ZJchqFfAqEhjidEKtfJTudrxrwqZBFiB7k4mWVFN9FoCKO4JDkLMEfwgVLddciXebqUdsTZb28sQJK8e1Mw/4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784375864; c=relaxed/simple;
	bh=bRZ7r5ito+ISYPPpW3iV3q8jRne4kVIXg/UH5tYXNOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXRp6laGw248k3YDhA3GQAvTZ66jClnAu7b8jqfQrT23j3ZhSee0Bn92rivhtJcwCLSZluICSnSi583bBXbw2+/SQ+NlI0VZKpfqSLcFf+9QIzVNK+G+7z6biXNrjw4rXR3nG5h94/Q0hOgZ8/9FYEY+vhuwOYS+WW8ZW6XnZ90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSwpiijp; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSwpiijp"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso6602455a34.3
        for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 04:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784375860; x=1784980660; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3/gVjW7F0KtjB8QhqPU1YYK9NmfO70mkrphRQOGidpk=;
        b=WSwpiijpZFXP6UmFy58jnQ7ERPSmvl6qY5VfTVGYDO/h4lRubXGZV/DGY/Z0Bi3vQJ
         3Spg+zDLjQy7ygWfjvmtj9csswKln+apDZR0KpqQqz8J0Wgpv/Dmo6IvouDnQuWQKnWg
         29TpJFdxrXfxgoeUgww+LTJhI87NphNeYJPkr8J59uXV3eOKxCGFCotOXpnCLGptOPuz
         CR44k6xtTeLHY6KerMMGCI//YTMBhQVK8tBXrMtD6wut0QmMiqZx0YzUBN0BoerJiBic
         19XD50K5DSZmXNbvyp1xnj4XIPk0kTcDRramwV8EZ2MsqzTCS0NaCqbsRuaIutbzXctT
         9+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784375860; x=1784980660;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/gVjW7F0KtjB8QhqPU1YYK9NmfO70mkrphRQOGidpk=;
        b=M2ywsOm5w7zqUiYEuJjwwTHA7P5iodVbvabQLbAuOFfw5cKznuyEm3YrCADeEEewnd
         ih0ssuWf2z6IFG/zY5l9YXAxYrtTMLjWymDeXa4n7IRHK7nn0cyHPsvlaj+UQVNRBY9d
         6ujWYhG5zI/66o1abv5B2h7U67pHdrSQGEpr0/rXDnbUT8Z/6hENimvSe4N1Ku+vnIbn
         k/VEiIc+UoElucVh2McNNooqfEL55GvW0cmSGOHRZVfhR2xsfsS+ev9p0O2MdoA2eXNC
         k+62A3Prl8z8VhpbtJenzPqpBtEK4HX/8dOGBdmVwDTq+/exXqP3EB78YFfIrxc53uyU
         WIwg==
X-Forwarded-Encrypted: i=1; AHgh+RpiZKKl1zbX9o8dsTWTqvfsA8gZC++6PZzJJ7noXR8ySlKEo0d0vvnkxylnSoqLCp8X5QFNYbvqmAMfCQp8@lists.linux.dev
X-Gm-Message-State: AOJu0YwTzugIbBKdcH17rhVeKVrfY1fSIlnXmwclRZdN883+VS2uiu2s
	hg3slqml1rZNI81T68IzPjS0RNWdyLtRLqhiRREcXQLcBOoYI8fxopty
X-Gm-Gg: AfdE7cn2/TSf2hE/C54mnlTYrtTMo0IiNiKZw7pM5E6Ww4i5vShjNiCm0vt2+4LCcMP
	k3mo9IeE7U673TawdOLGhSnU3iRx8Ul3wYl0LDX3GdCsIunB9SVKJGWatlNyLlha9a6G4jpkbBE
	c8M3brza2ARfFteJG70KnLcxyvypLsAp2/Pa/wHLq78M0vzYKXyup1lmhvCE/ZvesO1HjWFljde
	T8kzm5GgCdFcx3Fn2Qi4oDPdT50SuSuu81M+CBLx97+cBo0dg1YvFCp601M3YoulGJZhPd5rlSD
	fU1nypdh/gdpNZTOWLZuCQ1QM9W/rVHqW/aJ6wctsy3brI1Z83wf+foseBVMU9pht6puo5x6hk+
	gJcM03wN5QMSviGEhtcy3VwgmQMrgQkM0ZbaP5HSy8lTnyLXyFJ2kBmQwtMgHurks6IvDcw==
X-Received: by 2002:a05:6820:151e:b0:6a4:cf9:9a69 with SMTP id 006d021491bc7-6a5366c922emr2917108eaf.20.1784375860437;
        Sat, 18 Jul 2026 04:57:40 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a516c03f36sm3343831eaf.7.2026.07.18.04.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 04:57:38 -0700 (PDT)
Date: Sat, 18 Jul 2026 14:57:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750fb: fix mono image source stride
 mismatch in lynxfb_ops_imageblit()
Message-ID: <altqLCKzCdGLaMzl@stanley.mountain>
References: <20260718103103.18082-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718103103.18082-1-meatuni001@gmail.com>

On Sat, Jul 18, 2026 at 03:31:03PM +0500, Muhammad Bilal wrote:
> sm750_hw_imageblit() advances its monochrome source pointer by
> src_delta per scanline, and computes the correct rounded-up stride
> internally as:
> 
> 	bytes_per_scan = (width + start_bit + 7) / 8;
> 
> Its only caller, lynxfb_ops_imageblit(), instead passed src_delta as
> image->width >> 3. For widths not a multiple of 8 this under-counted
> the stride, so the source pointer fell further behind the real
> per-scanline layout on every line, corrupting the rendered image.
> 
> Rather than just fixing the caller's calculation, remove src_delta
> as a parameter entirely and have sm750_hw_imageblit() advance by the
> bytes_per_scan it already computes for itself. There has only ever
> been one caller, and that caller was passing an out-of-sync
> derivative of the same width/start_bit values sm750_hw_imageblit()
> already has, so keeping stride as a separate parameter served no
> purpose beyond letting the two calculations drift apart, which is
> exactly what happened here.
> 
> Fixes: 81dee67e215b2 ("staging: sm750fb: add sm750 to staging")
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> ---

There is supposed to be a little note here:
---
v2: Added a Fixes tag.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Obviously there is an inconsistency between rounding up and down
but without testing it's less clear which one is correct...

regards,
dan carpenter

