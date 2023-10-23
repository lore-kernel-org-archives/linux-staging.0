Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4173C637
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 14:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OvLmOAYM"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-408002b5b9fso27782485e9.3
        for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 07:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698071175; x=1698675975; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ibdm669iv9OJcE/KkdIFiBrAQ0+k5qbSY1Q4FYfsL4s=;
        b=OvLmOAYMBQjo5HeW+5ShSBGhN/F7fDDrWd6TTuHuZesTIoa8a8E5cqjpx7q0PbLCLd
         68i8GCP3iGfg2hNwHMuFIVwfRaP8We6Ia7wkXOouEP+kx33+72RRkkpuJSleFEeigMH4
         JXx1WEvgexxlxbK3ualPZJcwc/eU+XZk+1RZ+T5PEm3mKxzcgCUX69GK0OjzH/5COkTp
         +nyoJaSHEbAAl8eduEbT2w+Vw0m0LsiG254dCOxfiZ0Cr1VtUJnvK9Rd9ePPnDafeXkt
         +OY52Ht8hRnT0+X6LiKk7YyYCMJRNp1bFOO8fZJyBdiDx/bfzcCGJXrk5cH4nYJd+rnB
         d/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698071175; x=1698675975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ibdm669iv9OJcE/KkdIFiBrAQ0+k5qbSY1Q4FYfsL4s=;
        b=FZQYbi5OLI7iWf6ylRnCSMYZy+XpC8o6BP9RHM/jxJBLRzcem+0V/qxqa9Si6lRxLl
         KmqVpsUPfjJ/AHsw4o5+Ez2JoHU0bjDlAX9ohVHe1TgAhgG29xtFCVP6o3isZPP5LRGU
         cd8yNPYWx+wWRpAfMbDb6yXcjeevsCmrkqLDLvqY6LtObIX9sPklF08lq6y/u1HY0OJC
         v1Y0HjHMQe73YmgkC6nx9mLwxC/X+dxyphpC/QeVeJ5331m6R7SeBm5dpOhJVd/HU+3+
         V1kinkuDVa1vkUpj+b2dryDCrEpWPz+oKayPsQdair2zDo4T29dvqVH78aADAfGh372u
         AdKg==
X-Gm-Message-State: AOJu0YyDGozkozzPxXMNfVTqS90epMxSFWlv5//KB64DXCF/oyphCC4g
	YCxgn2bZkxQJZsigNQKnQ0d7MA==
X-Google-Smtp-Source: AGHT+IETpcAooUqMOCjkLve2ojvd0kVcymHo1QQx78Fc+2Tm7dO7RE2+Z3X3F4g6UdNhGVSJC4hmDQ==
X-Received: by 2002:a05:600c:5493:b0:406:5463:3f51 with SMTP id iv19-20020a05600c549300b0040654633f51mr7197630wmb.25.1698071175401;
        Mon, 23 Oct 2023 07:26:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c228100b0040596352951sm14091003wmf.5.2023.10.23.07.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:26:15 -0700 (PDT)
Date: Mon, 23 Oct 2023 17:26:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jonathan Bergh <bergh.jonathan@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, error27@gmail.com,
	linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] staging: media: av7110: Fix various whitespace
 checkpatch errors
Message-ID: <b301c9a1-7536-46c5-878e-7cd79e3a4742@kadam.mountain>
References: <20231020232332.55024-1-bergh.jonathan@gmail.com>
 <20231020232332.55024-3-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020232332.55024-3-bergh.jonathan@gmail.com>

On Sat, Oct 21, 2023 at 01:23:29AM +0200, Jonathan Bergh wrote:
> Fixed the following checkpatch errors relating to whitespaces:
>  * extra whitespace after '~' symbol
>  * remove whitespace before/after parentheses for switch statement and
>    function parameters as well as after switch keyword
>  * ensure whitespace before '{' braces
>  * remove whitespace between function name and '(' parentheses
>  * ensure whitespace after ',' commas in parameter lists
> 
> Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
> ---
>  drivers/staging/media/av7110/av7110_av.c | 28 ++++++++++++------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
> index af3845406626..482dfc548b16 100644
> --- a/drivers/staging/media/av7110/av7110_av.c
> +++ b/drivers/staging/media/av7110/av7110_av.c
> @@ -241,8 +241,8 @@ int av7110_pes_play(void *dest, struct dvb_ringbuffer *buf, int dlen)
>  		sync |= DVB_RINGBUFFER_PEEK(buf, 2) << 8;
>  		sync |= DVB_RINGBUFFER_PEEK(buf, 3);
>  
> -		if (((sync &~ 0x0f) == 0x000001e0) ||
> -		    ((sync &~ 0x1f) == 0x000001c0) ||
> +		if (((sync &~0x0f) == 0x000001e0) ||
> +		    ((sync &~0x1f) == 0x000001c0) ||

These should be:

	if (((sync & ~0x0f) == 0x000001e0) ||
	    ((sync & ~0x1f) == 0x000001c0) ||


>  		    (sync == 0x000001bd))
>  			break;
>  		printk("resync\n");

regards,
dan carpenter

