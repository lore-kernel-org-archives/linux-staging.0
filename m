Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B472C028C
	for <linux-staging@lists.linux.dev>; Sun, 15 Feb 2026 08:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771142674; cv=none; b=vB4xY4MyVyI4NNa8TS4khjFlindBuye619a5vjJUQxEl39FGj8r9GHBSBS5i6BfRUgh4feHQ5ld3Z3K+wczu2jdGLK6KN8OrA7hlaXT3AvTHdDPPI65eQrW5yJ6QhA85tctv7N/j6FMhRoEBlgssiJBzohE84aECBNM/d2qYGpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771142674; c=relaxed/simple;
	bh=gia3U0NMi0eo9lNjIlFbqZyufBLX9qOX1Qtq24tord8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UzSv50ppUC42/lCpX9ihTjxvWy1H2Z2nfOW0lgjwxzbWRCU598AQMUr+xI3pNqQF1rOVSRl0UIKGxXb1LLG1RLp+Tctl+t3WKws5WZrzoojZyjJxdL6aDLOfIKWsKXctjFEED21Mp7OLPKcWMM4+mImivx6C1JcfqGCBGefAUFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPZS2MMX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPZS2MMX"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so9883105e9.0
        for <linux-staging@lists.linux.dev>; Sun, 15 Feb 2026 00:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771142672; x=1771747472; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r44RmfAkOHN1ghzwJGbO72qc0QPba/sx3DF2Yww1PYU=;
        b=DPZS2MMXyo+LQ81Mdn3LXIrWhMuZceuxN4Uxdb7GlLMP+G8lvnPwXOENltl1P2TtKl
         KlEL2vgA1+jIdkPhgGCWUGk9+qBW2O9uqCReMB5cTrzhcte3CG/zWQkoTukom/kE7mwY
         IpcV9QNRLTE36nc2tHPl6j/cwolJPNYxKXeDXeQ4H+xGg+GIumM1NtiuikF1pGpN/P1c
         g771+ZqOJaKHtQVaDojno0OmgbOXHYkCi/1ukK8BmdsZar4CwW7Gl7ZP2ZF9Jk9QxeIj
         z2Sg/LfUdfGLF4IRsYKvYVdKxK1BluuY/0KRcgtkENhZzgOfLres1/5e4bwBaV8noltb
         p5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771142672; x=1771747472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r44RmfAkOHN1ghzwJGbO72qc0QPba/sx3DF2Yww1PYU=;
        b=dekNBZEcrln2S8ibL7pSEFH2VVOGyysDROqxU22aEJlbu/JUmaSutI37bpVrslTO2k
         G8X73kI5MtczMYvpYttoFwi80YmVT4QNeYi54suZRaHiGCTm/J4CMokgVqEwv77irwfF
         vss9vhPbY+CvpvKd5Bq/arOpygo02XEUJA3HoQf0ka4ZAEQWqW54HGfav3aac/Ahz5cv
         zr3qEdr82JAjWKQSne0seAOmRrRlRN9NRSweb9s/YbtLx5rY19LbPLHqJnd9xgoN+F6W
         SuRh+I+L+RKCqV8/1iVIknv1fa8S3u9Qdg9EZQsldGg/3Ct52xPIqfzSFq9yb7GCscY6
         eFhw==
X-Gm-Message-State: AOJu0YzkgCw2ZqcNchBtjaYm91MEOmtKzKcSN6pC/DOrF6ASDesJ8Va8
	Rz/B0rTOFnL7SReMh8QWoQa6+i1KZTnb/lnjNfiVJJ75HQjnIwFM71fY
X-Gm-Gg: AZuq6aJ9GZkebQ9dZwdJZL5dRD4Ma6b0lSgexgw5OM7H77YCp3BdI4UJNoUibuFtEzt
	e5eXCgZ5wEs+DSwTfpzOSfy93kS0nRRMI6cnzI6val7MwQjG/LPcu3cwayDnMEUqXCpeZMemhsr
	xQpSaI6Nuc69RVnlderDoykyTeW87/Av5hD/XnIyNL/33lCsG9J1v6YI4JNiTvf1WqDXuxV09PR
	9j5uKO99tFTSB8ccHtm4c9dW4pP++16TFVjID8lJ3SkqA3LPabAlAopevfu82WUvjd7SJ+PBU+G
	7UDb0cmLyXBfcp+sNJGeijIcwG/rrm9BiPgH+GWnwPpt53qkHffPYgaSZGp3QWIAkhvYyQkPK2c
	YyIWRsGoANjocy2ZTdJ0w3GxeUyEqXtPUsOKpwoY7S6m0WhQ3td6h+EFUaZ6zPTS/YYP8vDUT8x
	zm10tecA4CrIdStxtjtVp/+Q==
X-Received: by 2002:a05:600c:198b:b0:475:dd9a:f791 with SMTP id 5b1f17b1804b1-48379be5cb8mr72744045e9.28.1771142671556;
        Sun, 15 Feb 2026 00:04:31 -0800 (PST)
Received: from archlinux ([93.186.111.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a4e149sm87519745e9.2.2026.02.15.00.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 00:04:31 -0800 (PST)
Date: Sun, 15 Feb 2026 11:04:28 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Rivka <rivkab300@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: rename camelCase variables
Message-ID: <aZF-DIvCHAHVtK2B@archlinux>
References: <20260206123013.15533-2-nikolayof23@gmail.com>
 <2026020733-blatancy-periscope-e425@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026020733-blatancy-periscope-e425@gregkh>

On Sat, Feb 07, 2026 at 02:43:16PM +0100, Greg KH wrote:
> Why did you pick these names?  You kept the "p" prefix for some reason,
> which is "Hungarian" notation, and is not a kernel coding style, so
> shouldn't you just use a name that reflects what this variable is doing,
> and not encode the type in it?

Hello, thanks for the feedback - you're absolurely right about the
"Hungarian" notation. I should have removed the 'p' prefix,

I see that Rivka has already fixed "pHT_info_ie" (with Reviewed-by from
Ethan Tidmore). To avoid duplication, i will send v2 that only fixes
"pHT_caps_ie"

Thanks for teaching,
Nikolay
