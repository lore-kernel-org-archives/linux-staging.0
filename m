Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F511094C
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S1SW+sjC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4075c58ac39so19343225e9.3
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 01:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697187464; x=1697792264; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BAC5kzitTDQn20v79RDexnUptsmfPFexGphHJBvI8cw=;
        b=S1SW+sjCV2QjJQitjNqlm+Pb3B43m7cEVxK9Ko3dSOS5fSNRZy7QZ0MJai8o0ji/dO
         paei9hGN6dWTa9cKjhdlY/CQ/IxllIqsYCslagI7E1NZd25PFQt22sk0d7aw1t3L1cfj
         CV9/tKgIRbx3+gV2I1zy6B08mYcUHC8WWhkGG+7R31/RZlYjolO8tu1w3PdzmreK0Vxw
         eSYTOwOF20dLDoAv4KAsQ7Kr1ql5F4IhxDfdqH8T2k4izosZOFeCvk03l7XNqBwqNZQJ
         aSo+VUX+Eel93mmJ7bNyM2C8qqMGsQ1gqnQt5ysVhDwiZZZEGb3e4WkdB606NCxj5yTW
         Pw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697187464; x=1697792264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAC5kzitTDQn20v79RDexnUptsmfPFexGphHJBvI8cw=;
        b=es/6aPyxJRPKIuqyYdmeIhAsVLRZdW2dWFbH24LYXEeFdWe850aROuWWXUPBrB2c19
         eJtrH1QpheCeYY4CmktxDWmN+ij81RmVOabRRw3fs4qy11dm7dAarxKehy9px//HcERW
         TZMQ7ifAUQg5/uJJLlbPjzqMs7lIMPP9RntQ7Oc7emR9NExPj/to1quPECPID9yzgULz
         5G85+oRZ+mRcFKBnLt/whxMC7++h6MbA3oY6WP8iERyEFkZm5zehIDerTJtfScIVcVo2
         450BREafNQLH872sxGzHSE9nzRpEKKue5iUlij200kUNEDLosgjenP3Uvk4lSy/YTMjB
         ZSuw==
X-Gm-Message-State: AOJu0Yz1o0Pxcv3REmcB6Pb0xti73gnxmDC/7/zS1L0s8aRUYuT9g2WP
	vdh7RVorT/ooCI3vEZBTW0+pwg==
X-Google-Smtp-Source: AGHT+IHFQ1Q33o5z565Sh4eE318TfBuHLEcrvdnZ/WFi/WGhfesLfCmWVGxQvtq7daaoXgXbidNCxg==
X-Received: by 2002:a05:600c:3786:b0:405:359a:c965 with SMTP id o6-20020a05600c378600b00405359ac965mr24219595wmr.4.1697187464002;
        Fri, 13 Oct 2023 01:57:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u8-20020a05600c00c800b004068495910csm1975273wmm.23.2023.10.13.01.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 01:57:43 -0700 (PDT)
Date: Fri, 13 Oct 2023 11:57:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Soumya Negi <soumya.negi97@gmail.com>
Cc: Jonathan Kim <jonathankim@gctsemi.com>, Dean ahn <deanahn@gctsemi.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] tty: gdm724x: Match alignment with open parenthesis
Message-ID: <a0a7274f-eba6-4f72-9569-ec4c4fff3a1a@kadam.mountain>
References: <cover.1697184167.git.soumya.negi97@gmail.com>
 <ff627fcbc9e450c2e8f4aa5810b94e56151efa2a.1697184167.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff627fcbc9e450c2e8f4aa5810b94e56151efa2a.1697184167.git.soumya.negi97@gmail.com>

On Fri, Oct 13, 2023 at 01:26:34AM -0700, Soumya Negi wrote:
> Fix CHECK: Alignment should match open parenthesis
> Issue found by checkpatch.pl
> 
> Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> ---
>  drivers/staging/gdm724x/gdm_tty.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
> index 32b2e817ff04..4e5cac76db58 100644
> --- a/drivers/staging/gdm724x/gdm_tty.c
> +++ b/drivers/staging/gdm724x/gdm_tty.c
> @@ -271,8 +271,8 @@ int register_lte_tty_driver(void)
>  	int ret;
>  
>  	for (i = 0; i < TTY_MAX_COUNT; i++) {
> -		tty_driver = tty_alloc_driver(GDM_TTY_MINOR,
> -				TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV);
> +		tty_driver = tty_alloc_driver(GDM_TTY_MINOR, TTY_DRIVER_REAL_RAW |
> +					      TTY_DRIVER_DYNAMIC_DEV);

I prefered the original code.  It was more readable.

regards,
dan carpenter

