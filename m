Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0F218FC97
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 10:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775904704; cv=none; b=j7RCXN3Y9jzjtxW62CwYEO7I8GRBtKpGNJBmYyM1o5yFYzZ3+L+cshHCrWe/ERmZhry2EHgztihIxP3BAOH+M0aZAYTi/fhMLW7PsLxM6kKXkXeg7eGOQafNb/2BsVZ6sLdzAcvO48nMx9bUEhWPn2Nhll+9nde31E8C9bLPfSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775904704; c=relaxed/simple;
	bh=ezhqd9sf2vBvqg4aMtnwxtu2Z09Vdce5h0Pr9eugotY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5wl4zvxYzZRa3G6EHtvsHP58GpNT56ZiVl7p8GbDdRQn4V3yZSdiLd4bJ/FLcVDgbnOpblz5KRCfIbfpJUrWXx+gH0TKucJYgGQXfambK72fIE5fsdGDs7j57bqgQGA7EPwITIzY+4yEFADHNDUrW54N8dBdZi6ZXVEJTo/Rxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7iAaG3H; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7iAaG3H"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so2502593eec.1
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 03:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775904702; x=1776509502; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4M5jn7C1lxcAJYyhs3VMbd2QV4JWlL8WEG2Ir7SPXS8=;
        b=f7iAaG3H66clWcUX55Fm844BdaO/hVCX6q3L/fkfkEDLL7tsVMwHI83hshZ859Kb0D
         xUDqZtpbx4SrdaDPXJIdi1ZETcQYH1kb7oVvxe+STV56Q/r8EpUly56M84N7ZzDdtj+M
         l49Qjfx+y5Tf4pLk7qtH5Q1X0kG97ZnIPFH2gjMgqeLWP//h/u3eU0U6nO+5YZlr9S6F
         g8ge96qzJ5jwLCQd66e8SZ4rEEEm/co2xLXcOpzra87kCe9u0AA31LsChJDgAlVJ5Rgj
         pD9i7eT7rUWa96SgGcMJQKTNcfGsEKsbM8tDmjbef+TPDe1DRvT+2ud15Hj/nAt8VhGg
         FR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775904702; x=1776509502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4M5jn7C1lxcAJYyhs3VMbd2QV4JWlL8WEG2Ir7SPXS8=;
        b=cpGlOiI/iwoLRml04oBXqf26mtk+h3Uoln2Ti8DWV0/JwgPFUtwLLGRZEOJpEfQyGZ
         QbiT7PZMPCYLAzkYrpQXjP9o0FZHhjLn90PU1WGBSM5S36yPdDXTzrs8xV6V3bh6UP0d
         2gwskqLNaeYO16i0tGjHm6plC9i3kvhJRMatQbOF11G1jhJp3FWAvGAo9/sQB2mGt9oj
         tPocr0/LXb0Lnd/FBj8p7Kkkbe78Bw0t7O+XbxTczUZDGuKf/UdjxvZNeURidkm+HBWA
         s7V+Jz4rLzWRixojx2CHWJRlsRdSuEU3JcvckH/GCKzU/5NLsMaUAZrC+17M0CFLoiIh
         Ak6A==
X-Forwarded-Encrypted: i=1; AJvYcCUgXV540WtSqsUpZQpEiuv+KKyrFljY21FKK3DMsKFXgpfOgAWNw9s4jOkDDPdSovQoBqBeqSNEc7Q/0d0u@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr+eZs9cRJqhKWDCJ6JRzsmPZXDn5e+/1UgQH6AW3Us5fiLWnk
	MXsLMoCngbMea6iXmHoH78EGC6aTYFYRzAS0UakARcTYNt57FFa3cQbf
X-Gm-Gg: AeBDiev5hzy7uHUL7gbskX+px40c5y9uI3oZLsrbGYpwmyoywK31ddVneFkc6OedR5T
	ZLEscqF3OwHtJ0Ze1h8xZudRc5fT5XFmZFFyBhVSdCLwVFQS0HOULnQtGTmZ/Dr/++iFcuzKzfQ
	+v4NLo520oqoMr8za1id3CVM9jqy/4VbO8eFtZBjUpnaV7CZjwNq8dAUNsjUI3N9baNFKCLgD8z
	G1m0DWFSw4pNDfjvs408cYxT9XR5RvTIeeJ6TC7guULwdClbW4Pz47Ww7907kCBKaalVjhcrGNz
	KwvTunsXrMzi66WZyP1BBbM/wO+/GdehwduLf0OgcCEkUITmtCOL25yyY+z84C/LiKSnjpAJNM2
	2asfffcXd0yIHX4CTQq+TN34QyUEc+SCOvOjrQrCggcYVis5vrVIhL50DB8iIM//tHWMLakv3kD
	mTAE/wB2IdKF8EqdY=
X-Received: by 2002:a05:7300:220d:b0:2be:1f56:ed21 with SMTP id 5a478bee46e88-2d5876a0820mr3675263eec.7.1775904701741;
        Sat, 11 Apr 2026 03:51:41 -0700 (PDT)
Received: from localhost ([45.86.211.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd2a4esm10532645eec.16.2026.04.11.03.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 03:51:40 -0700 (PDT)
Date: Sat, 11 Apr 2026 13:51:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Michael Ugrin <mugrinphoto@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: fix indentation to use tabs
 instead of spaces
Message-ID: <adont11Sr92pi0_N@stanley.mountain>
References: <20260411005512.46142-1-mugrinphoto@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411005512.46142-1-mugrinphoto@gmail.com>

On Fri, Apr 10, 2026 at 05:55:12PM -0700, Michael Ugrin wrote:
> Fix whitespace issue where a continuation line used spaces
> instead of tabs for indentation.
> 
> Signed-off-by: Michael Ugrin <mugrinphoto@gmail.com>
> ---
>  .../staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> index b411ca2f415e0..966d4efb200c5 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
> @@ -1257,7 +1257,7 @@ ia_css_debug_pipe_graph_dump_stage(
>  					p--;
>  				/* Last comma found, copy till that comma */
>  				strscpy(enable_info1, ei,
> -                                        p > sizeof(enable_info1) ? sizeof(enable_info1) : p);
> +					p > sizeof(enable_info1) ? sizeof(enable_info1) : p);

Better to use:

	strscpy(enable_info1, ei, umin(p, sizeof(enable_info1)));

Same for the other strscpy() calls as well.

regards,
dan carpenter

